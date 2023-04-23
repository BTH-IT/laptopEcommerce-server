<?php
class AuthGroupModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $sql = "SELECT * FROM nhomquyen";

    $searching = $_GET["searching"] ?? null;

    if ($searching) {
      $sql .= " WHERE ma_nhom_quyen LIKE '%$searching%' OR ten_nhom_quyen LIKE '%$searching%'";
    }

    $sortName = $_GET["sortName"] ?? "ma_nhom_quyen";
    $sortAction = $_GET["sortAction"] ?? "";

    switch ($sortName) {
      case 'ma_nhom_quyen':
        $sql .= " ORDER BY ma_nhom_quyen " . "$sortAction;";
        break;

      case 'ten_nhom_quyen':
        $sql .= " ORDER BY ten_nhom_quyen " . "$sortAction;";
        break;
    }

    $rows = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_nhom_quyen"] = (int) $row["ma_nhom_quyen"];
      $row["trang_thai"] = (bool) $row["trang_thai"];
      $row["mac_dinh"] = (bool) $row["mac_dinh"];
      $roleId = $row["ma_nhom_quyen"];

      $sqlRole = "SELECT quyenhang.ma_quyen_hang, quyenhang.ten_quyen_hang,
                chitietquyenhang.trang_thai as trang_thai_quyen_hang,
                chucnang.ma_chuc_nang, chucnang.ten_chuc_nang
                FROM chitietquyenhang, nhomquyen, quyenhang, chucnang
                WHERE nhomquyen.ma_nhom_quyen = chitietquyenhang.ma_nhom_quyen
                AND quyenhang.ma_quyen_hang = chitietquyenhang.ma_quyen_hang
                AND nhomquyen.ma_nhom_quyen = $roleId
                AND chucnang.ma_chuc_nang = chitietquyenhang.ma_chuc_nang;";

      $rowsRole = mysqli_query($this->conn, $sqlRole);

      $permission = [];

      while ($rowRole = mysqli_fetch_assoc($rowsRole)) {
        $rowRole["ma_quyen_hang"] = (int) $rowRole["ma_quyen_hang"];
        $rowRole["ma_chuc_nang"] = (int) $rowRole["ma_chuc_nang"];
        $rowRole["trang_thai_quyen_hang"] = (bool) $rowRole["trang_thai_quyen_hang"];
        $permission[] = $rowRole;
      }

      $row["quyen_hang"] = $permission;

      $data[] = $row;
    }

    return [
      "data" => $data
    ];
  }

  public function create($data): string
  {
    $ten_nhom_quyen = $data["ten_nhom_quyen"];
    $mo_ta = $data["mo_ta"];
    $trang_thai = (bool) $data["trang_thai"] ? 1 : 0;

    $sql = "INSERT INTO nhomquyen (`ten_nhom_quyen`, `mo_ta`, `trang_thai`)
    VALUES ('$ten_nhom_quyen', '$mo_ta', '$trang_thai');";

    $result = $this->conn->query($sql);

    if ($result === TRUE) {
      $roleId = $this->conn->insert_id;
      $ma_nhom_quyen = $roleId;

      $sqlPermission = "SELECT * FROM quyenhang";

      $rowsPermission = $this->conn->query($sqlPermission);

      while ($rowPermission = mysqli_fetch_assoc($rowsPermission)) {
        $ma_quyen_hang = (int) $rowPermission["ma_quyen_hang"];

        switch ($ma_quyen_hang) {
          case 1:
            $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, 1, 0);";

            $result = $this->conn->query($sql);
            break;
          case 2:
            $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, 1, 0);";

            $result = $this->conn->query($sql);

            $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, 3, 0);";

            $result = $this->conn->query($sql);
            break;
          case 11:
            $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, 1, 0);";

            $result = $this->conn->query($sql);

            $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, 2, 0);";

            $result = $this->conn->query($sql);

            $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, 4, 0);";

            $result = $this->conn->query($sql);
            break;
          default:
            $sqlAction = "SELECT * FROM chucnang";

            $rowsAction = $this->conn->query($sqlAction);

            while ($rowAction = mysqli_fetch_assoc($rowsAction)) {
              $ma_chuc_nang = (int) $rowAction["ma_chuc_nang"];

              $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`,
                  `ma_chuc_nang`, `trang_thai`)
                  VALUES ($ma_nhom_quyen, $ma_quyen_hang, $ma_chuc_nang, 0);";

              $result = $this->conn->query($sql);
            }
            break;
        }
      }

      return "New record created successfully. Last inserted ID is: " . $roleId;
    } else {
      return $this->conn->error;
    }
  }

  public function get(int $id): array | false
  {
    $sql = "SELECT * FROM nhomquyen WHERE ma_nhom_quyen=$id";

    $result = $this->conn->query($sql);

    $data = mysqli_fetch_assoc($result);

    $sqlRole = "SELECT quyenhang.ma_quyen_hang, quyenhang.ten_quyen_hang,
                chitietquyenhang.trang_thai as trang_thai_quyen_hang,
                chucnang.ma_chuc_nang, chucnang.ten_chuc_nang
                FROM chitietquyenhang, nhomquyen, quyenhang, chucnang
                WHERE nhomquyen.ma_nhom_quyen = chitietquyenhang.ma_nhom_quyen
                AND quyenhang.ma_quyen_hang = chitietquyenhang.ma_quyen_hang
                AND nhomquyen.ma_nhom_quyen = $id
                AND chucnang.ma_chuc_nang = chitietquyenhang.ma_chuc_nang;";

    $rowsRole = mysqli_query($this->conn, $sqlRole);

    $permission = [];

    while ($rowRole = mysqli_fetch_assoc($rowsRole)) {
      $rowRole["ma_quyen_hang"] = (int) $rowRole["ma_quyen_hang"];
      $rowRole["ma_chuc_nang"] = (int) $rowRole["ma_chuc_nang"];
      $rowRole["trang_thai_quyen_hang"] = (bool) $rowRole["trang_thai_quyen_hang"];
      $permission[] = $rowRole;
    }


    $data["ma_nhom_quyen"] = (int) $data["ma_nhom_quyen"];
    $data["trang_thai"] = (bool) $data["trang_thai"];
    $data["mac_dinh"] = (bool) $data["mac_dinh"];
    $data["quyen_hang"] = $permission;

    return $data;
  }

  public function update(array $current, array $new): string
  {
    $data = [];
    foreach ($current as $key => $value) {
      if (isset($new[$key])) {
        $data[$key] = $new[$key];
      } else {
        $data[$key] = $value;
      }
    }

    $ma_nhom_quyen = (int) $data["ma_nhom_quyen"];
    $ten_nhom_quyen = $data["ten_nhom_quyen"];
    $mo_ta = $data["mo_ta"];
    $trang_thai = (bool) $data["trang_thai"] ? 1 : 0;

    $sql = "UPDATE nhomquyen SET ten_nhom_quyen='$ten_nhom_quyen', mo_ta='$mo_ta',
            trang_thai=$trang_thai WHERE ma_nhom_quyen=$ma_nhom_quyen;";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(int $id): string
  {
    $sql = "DELETE FROM nhomquyen WHERE ma_nhom_quyen=$id";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Deleted Successfully";
    } else {
      return $this->conn->error;
    }
  }
}
