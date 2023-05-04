<?php
class AccountModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $sql = "SELECT * FROM taikhoan";

    $searching = $_GET["searching"] ?? null;

    if ($searching) {
      $sql .= " AND (ten_dang_nhap LIKE '%$searching%'
                OR ma_nhom_quyen LIKE '%$searching%'
                OR ngay_cap LIKE '%%$searching%')";
    }

    $sortName = $_GET["sortName"] ?? "ten_dang_nhap";
    $sortAction = $_GET["sortAction"] ?? "";

    switch ($sortName) {
      case 'ten_dang_nhap':
        $sql .= " ORDER BY ten_dang_nhap " . "$sortAction;";
        break;

      case 'ma_nhom_quyen':
        $sql .= " ORDER BY ma_nhom_quyen " . "$sortAction;";
        break;

      case 'ngap_cap':
        $sql .= " ORDER BY created_at " . "$sortAction;";
        break;
    }

    $rows = mysqli_query($this->conn, $sql);

    if ($rows->num_rows <= 0) {
      return [];
    }

    $data = [];

    while ($row = mysqli_fetch_assoc($rows)) {
      $account = [];
      $account["ma_tai_khoan"] = (int) $row["ma_tai_khoan"];
      $account["ten_dang_nhap"] = $row["ten_dang_nhap"];
      $account["ma_nhom_quyen"] = (int) $row["ma_nhom_quyen"];
      $account["created_at"] = strtotime($row["created_at"]) * 1000;
      $data[] = $account;
    }


    return $data;
  }

  public function create($data): string
  {
    $ten_dang_nhap = $data["ten_dang_nhap"];
    $ma_nhom_quyen = (int) $data["ma_nhom_quyen"];
    $mat_khau = password_hash($data["mat_khau"], PASSWORD_DEFAULT);
    $created_at = date("Y-m-d H:i:s", intval($data["created_at"] / 1000));

    $sql = "INSERT INTO taikhoan (`ten_dang_nhap`, `ma_nhom_quyen`, `mat_khau`, `created_at`)
            VALUES ('$ten_dang_nhap', $ma_nhom_quyen, '$mat_khau', '$created_at');";

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
    $sql = "SELECT * FROM taikhoan WHERE ten_dang_nhap='$id'";

    $result = $this->conn->query($sql);

    if ($result->num_rows <= 0) {
      return false;
    }

    $data = mysqli_fetch_assoc($result);

    $account = [];
    $account["ma_tai_khoan"] = (int) $data["ma_tai_khoan"];
    $account["ten_dang_nhap"] = $data["ten_dang_nhap"];
    $account["ma_nhom_quyen"] = (int) $data["ma_nhom_quyen"];
    $account["mat_khau"] = $data["mat_khau"];
    $account["created_at"] = strtotime($data["created_at"]) * 1000;


    return $account;
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


    $ten_dang_nhap = $data["ten_dang_nhap"];
    $ma_nhom_quyen = (int) $data["ma_nhom_quyen"];
    $mat_khau = $data["mat_khau"];

    if (isset($new["mat_khau_cu"]) && isset($new["mat_khau_moi"])) {
      if (password_verify($new["mat_khau_cu"], $mat_khau)) {
        $mat_khau = password_hash($new["mat_khau_moi"], PASSWORD_DEFAULT);
      }
    }

    $sql = "UPDATE taikhoan SET `ma_nhom_quyen`=$ma_nhom_quyen, `mat_khau`='$mat_khau' WHERE ten_dang_nhap='$ten_dang_nhap';";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Successfully";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(string $id): string
  {
    $sql = "DELETE FROM taikhoan WHERE ten_dang_nhap='$id';";

    $result = mysqli_query($this->conn, $sql);


    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }
}
