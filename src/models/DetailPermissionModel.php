<?php
class DetailPermissionModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $sql = "SELECT quyenhang.ma_quyen_hang, quyenhang.ten_quyen_hang,
            chitietquyenhang.trang_thai as trang_thai_quyen_hang,
            chucnang.ma_chuc_nang, chucnang.ten_chuc_nang
            FROM chitietquyenhang, nhomquyen, quyenhang, chucnang
            WHERE nhomquyen.ma_nhom_quyen = chitietquyenhang.ma_nhom_quyen
            AND quyenhang.ma_quyen_hang = chitietquyenhang.ma_quyen_hang
            AND chucnang.ma_chuc_nang = chitietquyenhang.ma_chuc_nang;";

    $rows = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_nhom_quyen"] = (int) $row["ma_nhom_quyen"];
      $row["ma_quyen_hang"] = (int) $row["ma_quyen_hang"];
      $row["ma_chuc_nang"] = (int) $row["ma_chuc_nang"];
      $row["trang_thai_quyen_hang"] = (bool) $row["trang_thai_quyen_hang"];
      $data[] = $row;
    }

    return [
      "data" => $data
    ];
  }

  public function create($data): string
  {
    $ma_nhom_quyen = (int) $data["ma_nhom_quyen"];
    $ma_quyen_hang = (int) $data["ma_quyen_hang"];
    $ma_chuc_nang = (int) $data["ma_chuc_nang"];
    $trang_thai = (bool) $data["trang_thai"] ? 1 : 0;

    $sql = "INSERT INTO chitietquyenhang (`ma_nhom_quyen`, `ma_quyen_hang`, `ma_chuc_nang`, `trang_thai`)
            VALUES ($ma_nhom_quyen, $ma_quyen_hang, $ma_chuc_nang, $trang_thai);";

    $result = $this->conn->query($sql);

    if ($result === TRUE) {
      return "New record created successfully.";
    } else {
      return $this->conn->error;
    }
  }

  public function get(int $roleId, int $perId, int $actionId): array | false
  {
    $sql = "SELECT * FROM chitietquyenhang
            WHERE ma_nhom_quyen=$roleId AND ma_quyen_hang=$perId AND ma_chuc_nang=$actionId;";

    $result = $this->conn->query($sql);

    $data = mysqli_fetch_assoc($result);

    $data["ma_nhom_quyen"] = (int) $data["ma_nhom_quyen"];
    $data["ma_quyen_hang"] = (int) $data["ma_quyen_hang"];
    $data["ma_chuc_nang"] = (int) $data["ma_chuc_nang"];
    $data["trang_thai"] = (bool) $data["trang_thai"];

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
    $ma_quyen_hang = (int) $data["ma_quyen_hang"];
    $ma_chuc_nang = (int) $data["ma_chuc_nang"];
    $trang_thai = (bool) $data["trang_thai"] ? 1 : 0;

    $sql = "UPDATE chitietquyenhang SET trang_thai=$trang_thai
            WHERE ma_nhom_quyen=$ma_nhom_quyen AND ma_quyen_hang=$ma_quyen_hang
            AND ma_chuc_nang=$ma_chuc_nang;";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Successfully";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(int $roleId, int $perId, int $actionId): string
  {
    $sql = "DELETE FROM chitietquyenhang
            WHERE ma_nhom_quyen=$roleId AND ma_quyen_hang=$perId AND ma_chuc_nang=$actionId;";

    $result = mysqli_query($this->conn, $sql);


    if ($result) {
      return "Delete Successful";
    } else {
      return $this->conn->error;
    }
  }
}
