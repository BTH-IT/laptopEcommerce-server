<?php
class EmployeeModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll($query = null): array
  {
    $data = [];
    $q = null;
    if ($query != null) {
      parse_str($query, $q);
    }

    if ($q != null && isset($q["account"]) && $q["account"] == 0) {
      $sql = "SELECT * FROM nhanvien
              WHERE ma_nhan_vien NOT IN (SELECT ten_dang_nhap FROM taikhoan) AND hien_thi=1;";

      $rows = mysqli_query($this->conn, $sql);

      while ($row = mysqli_fetch_assoc($rows)) {
        $row["ngay_sinh"] = strtotime($row["ngay_sinh"]);
        $row["gioi_tinh"] = (bool) $row["gioi_tinh"] * 1000;
        $row["muc_luong"] = (float) $row["muc_luong"];
        $data[] = $row;
      }
    } else {
      $sql = "SELECT * FROM nhanvien WHERE hien_thi=1";

      if ($q != null && isset($q["searching"])) {
        $searching = $q["searching"];
        $sql .= " AND (ma_nhan_vien LIKE '%$searching%'
                  OR ten_nhan_vien LIKE '%$searching%'
                  OR ngay_sinh LIKE '%$searching%'
                  OR gioi_tinh LIKE '%$searching%'
                  OR so_dien_thoai LIKE '%$searching%'
                  OR muc_luong LIKE '%$searching%')
        ";
      }

      $sortName = $_GET["sortName"] ?? "ma_nhan_vien";
      $sortAction = $_GET["sortAction"] ?? "";

      switch ($sortName) {
        case 'ma_nhan_vien':
          $sql .= " ORDER BY ma_nhan_vien " . "$sortAction;";
          break;

        case 'ten_nhan_vien':
          $sql .= " ORDER BY ten_nhan_vien " . "$sortAction;";
          break;

        case 'ngay_sinh':
          $sql .= " ORDER BY ngay_sinh " . "$sortAction;";
          break;

        case 'gioi_tinh':
          $sql .= " ORDER BY gioi_tinh " . "$sortAction;";
          break;

        case 'so_dien_thoai':
          $sql .= " ORDER BY so_dien_thoai " . "$sortAction;";
          break;

        case 'muc_luong':
          $sql .= " ORDER BY muc_luong " . "$sortAction;";
          break;
      }

      $rows = mysqli_query($this->conn, $sql);

      while ($row = mysqli_fetch_assoc($rows)) {
        $row["ngay_sinh"] = strtotime($row["ngay_sinh"]);
        $row["gioi_tinh"] = (bool) $row["gioi_tinh"] * 1000;
        $row["muc_luong"] = (float) $row["muc_luong"];
        $data[] = $row;
      }
    }


    return [
      "data" => $data
    ];
  }

  public function create($data): string
  {
    $ma_nhan_vien = $data["ma_nhan_vien"];
    $ten_nhan_vien = $data["ten_nhan_vien"];
    $so_dien_thoai = $data["so_dien_thoai"];
    $ngay_sinh = date("Y-m-d H:i:s", $data["ngay_sinh"]);
    $gioi_tinh = (bool) $data["gioi_tinh"] ? 1 : 0;
    $muc_luong = (float) $data["muc_luong"];

    $sql = "INSERT INTO nhanvien (`ma_nhan_vien`, `ten_nhan_vien`, `so_dien_thoai`, `ngay_sinh`,
            `gioi_tinh`, `muc_luong`) VALUES ('$ma_nhan_vien', '$ten_nhan_vien',
            '$so_dien_thoai', '$ngay_sinh', $gioi_tinh, '$muc_luong');";

    $result = $this->conn->query($sql);

    if ($result === TRUE) {
      $last_id = $this->conn->insert_id;
      return "New record created successfully. Last inserted ID is: " . $last_id;
    } else {
      return $this->conn->error;
    }
  }

  public function get(string $id): array | false
  {
    $sql = "SELECT * FROM nhanvien WHERE ma_nhan_vien='$id' AND hien_thi=1;";

    $result = $this->conn->query($sql);

    $data = mysqli_fetch_assoc($result);

    $data["ngay_sinh"] = strtotime($data["ngay_sinh"]) * 1000;
    $data["gioi_tinh"] = (bool) $data["gioi_tinh"];
    $data["muc_luong"] = (float) $data["muc_luong"];

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

    $ma_nhan_vien = $data["ma_nhan_vien"];
    $ten_nhan_vien = $data["ten_nhan_vien"];
    $so_dien_thoai = $data["so_dien_thoai"];
    $ngay_sinh = date("Y-m-d H:i:s", $data["ngay_sinh"]);
    $gioi_tinh = (bool) $data["gioi_tinh"] ? 1 : 0;
    $muc_luong = $data["muc_luong"];

    $sql = "UPDATE nhanvien SET ten_nhan_vien='$ten_nhan_vien', so_dien_thoai='$so_dien_thoai',
            ngay_sinh='$ngay_sinh', gioi_tinh=$gioi_tinh, muc_luong=$muc_luong
            WHERE ma_nhan_vien='$ma_nhan_vien';";

    $result = mysqli_query($this->conn, $sql);


    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(string $id): string
  {
    $sql = "UPDATE nhanvien SET hien_thi=0 WHERE ma_nhan_vien='$id';";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Deleted Successfully";
    } else {
      return $this->conn->error;
    }
  }
}
