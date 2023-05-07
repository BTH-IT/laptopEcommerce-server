<?php
class CustomerModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $sql = "SELECT * FROM khachhang WHERE hien_thi=1";

    $searching = $_GET["searching"] ?? null;

    if ($searching) {
      $sql .= " AND ma_khach_hang LIKE '%$searching%'
                OR ten_khach_hang LIKE '%$searching%'
                OR ngay_sinh LIKE '%$searching%'
                OR gioi_tinh LIKE '%$searching%'
                OR so_dien_thoai LIKE '%$searching%'
                OR dia_chi LIKE '%$searching%'
      ";
    }

    $sortName = $_GET["sortName"] ?? "ma_khach_hang";
    $sortAction = $_GET["sortAction"] ?? "";

    switch ($sortName) {
      case 'ma_khach_hang':
        $sql .= " ORDER BY ma_khach_hang " . "$sortAction;";
        break;

      case 'ten_khach_hang':
        $sql .= " ORDER BY ten_khach_hang " . "$sortAction;";
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

      case 'dia_chi':
        $sql .= " ORDER BY dia_chi " . "$sortAction;";
        break;
    }

    $rows = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ngay_sinh"] = strtotime($row["ngay_sinh"]) * 1000;
      $row["gioi_tinh"] = (bool) $row["gioi_tinh"];
      $row["hien_thi"] = (bool) $row["hien_thi"];
      $data[] = $row;
    }

    return [
      "data" => $data
    ];
  }

  public function create($data): array
  {
    $ma_khach_hang = $data["ma_khach_hang"];
    $ten_khach_hang = $data["ten_khach_hang"];
    $ngay_sinh = date("Y-m-d H:i:s", $data["ngay_sinh"]);
    $gioi_tinh = (bool) $data["gioi_tinh"] ? 1 : 0;
    $so_dien_thoai = $data["so_dien_thoai"];
    $dia_chi = $data["dia_chi"];
    $avatar = $data["avatar"];

    $sql = "SELECT * FROM khachhang WHERE ma_khach_hang='$ma_khach_hang' OR so_dien_thoai='$so_dien_thoai';";

    $rows = mysqli_query($this->conn, $sql);

    if ($rows->num_rows > 0) {
      return [
        "status" => 500,
        "message" => "Mã khách hàng hoặc số điện thoại đã tồn tại!!",
      ];
    }

    $sql = "INSERT INTO khachhang (`ma_khach_hang`, `ten_khach_hang`, `ngay_sinh`,
            `gioi_tinh`, `so_dien_thoai`, `dia_chi`, `avatar`) VALUES ('$ma_khach_hang',
            '$ten_khach_hang', '$ngay_sinh', $gioi_tinh, '$so_dien_thoai', '$dia_chi', '$avatar');";

    $result = $this->conn->query($sql);

    if ($result === TRUE) {
      $last_id = $this->conn->insert_id;
      return [
        "status" => 200,
        "message" => "New record created successfully. Last inserted ID is: " . $last_id,
      ];
    } else {
      return [
        "status" => 400,
        "message" => $this->conn->error,
      ];
    }
  }

  public function get(string $id): array | false
  {
    $sql = "SELECT * FROM khachhang WHERE ma_khach_hang='$id' AND hien_thi=1;";

    $result = $this->conn->query($sql);

    if ($result->num_rows <= 0) {
      return [];
    }

    $data = mysqli_fetch_assoc($result);

    $data["ngay_sinh"] = strtotime($data["ngay_sinh"]) * 1000;
    $data["gioi_tinh"] = (bool) $data["gioi_tinh"];
    $data["hien_thi"] = (bool) $data["hien_thi"];


    return $data;
  }

  public function update(array $current, array $new): array
  {
    $data = [];
    foreach ($current as $key => $value) {
      if (isset($new[$key])) {
        $data[$key] = $new[$key];
      } else {
        $data[$key] = $value;
      }
    }

    $ma_khach_hang = $data["ma_khach_hang"];
    $ten_khach_hang = $data["ten_khach_hang"];
    $ngay_sinh = date("Y-m-d H:i:s", $data["ngay_sinh"]);
    $gioi_tinh = (bool) $data["gioi_tinh"] ? 1 : 0;
    $so_dien_thoai = $data["so_dien_thoai"];
    $dia_chi = $data["dia_chi"];
    $avatar = $data["avatar"];

    $sql = "SELECT * FROM khachhang WHERE so_dien_thoai='$so_dien_thoai' AND ma_khach_hang!='$ma_khach_hang';";

    $rows = mysqli_query($this->conn, $sql);

    if ($rows->num_rows > 0) {
      return [
        "status" => 500,
        "message" => "Số điện thoại đã tồn tại!!",
      ];
    }

    $sql = "UPDATE khachhang SET ten_khach_hang='$ten_khach_hang', ngay_sinh='$ngay_sinh',
            gioi_tinh=$gioi_tinh, so_dien_thoai='$so_dien_thoai', dia_chi='$dia_chi', avatar='$avatar'
            WHERE ma_khach_hang='$ma_khach_hang';";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return [
        "status" => 200,
        "message" => "Cập nhật thành công",
      ];
    }

    return [
      "status" => 400,
      "message" => "Cập nhật thất bại: " . $this->conn->error,
    ];
  }

  public function delete(string $id): string
  {
    $sql = "UPDATE khachhang SET hien_thi=0 WHERE ma_khach_hang='$id';";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      $sql = "DELETE FROM taikhoan WHERE ten_dang_nhap='$id';";

      $result = mysqli_query($this->conn, $sql);
      if ($result) {
        return "Deleted Successfully";
      }
      return $this->conn->error;
    } else {
      return $this->conn->error;
    }
  }
}
