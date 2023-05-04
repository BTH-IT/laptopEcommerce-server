<?php

require __DIR__ . '../../../vendor/autoload.php';

use Firebase\JWT\JWT;

class AuthModel
{
  public function __construct(private mysqli $conn)
  {
  }

  public function login(array $data)
  {
    $ten_dang_nhap = $data["ten_dang_nhap"];
    $mat_khau = $data["mat_khau"];

    $sql = "SELECT * FROM taikhoan WHERE ten_dang_nhap='$ten_dang_nhap';";

    $rows = mysqli_query($this->conn, $sql);

    $row = mysqli_fetch_assoc($rows);

    $id = $row["ten_dang_nhap"];
    $roleId = (int) $row["ma_nhom_quyen"];
    $pwd = $row["mat_khau"];
    $infor = [];
    $permission = [];

    if (!password_verify($mat_khau, $pwd)) {
      return [
        'status' => 400,
        'message' => 'Invalid Carditional'
      ];
    }

    $sql = "SELECT COUNT(*) AS num_rows FROM khachhang
            WHERE ma_khach_hang='$ten_dang_nhap' LIMIT 1;";

    $rows = mysqli_query($this->conn, $sql);

    $row = mysqli_fetch_array($rows);
    if ($row["num_rows"] > 0) {
      $sql = "SELECT * FROM khachhang WHERE ma_khach_hang='$ten_dang_nhap';";

      $rows = mysqli_query($this->conn, $sql);

      $row = mysqli_fetch_assoc($rows);

      $infor["ten_khach_hang"] = $row["ten_khach_hang"];
      $infor["ngay_sinh"] = strtotime($row["ngay_sinh"]);
      $infor["gioi_tinh"] = (bool) $row["gioi_tinh"] ? "Nam" : "Nữ";
      $infor["so_dien_thoai"] = $row["so_dien_thoai"];
      $infor["dia_chi"] = $row["dia_chi"];
      $infor["avatar"] = $row["avatar"];
    } else {
      $sql = "SELECT COUNT(*) AS num_rows FROM nhanvien
              WHERE ma_nhan_vien='$ten_dang_nhap' LIMIT 1;";

      $rows = mysqli_query($this->conn, $sql);

      $row = mysqli_fetch_array($rows);

      if ($row["num_rows"] > 0) {
        $sql = "SELECT * FROM nhanvien WHERE ma_nhan_vien='$ten_dang_nhap';";

        $rows = mysqli_query($this->conn, $sql);

        $row = mysqli_fetch_assoc($rows);

        $infor["ten_nhan_vien"] = $row["ten_nhan_vien"];
        $infor["so_dien_thoai"] = $row["so_dien_thoai"];
        $infor["ngay_sinh"] = strtotime($row["ngay_sinh"]);
        $infor["gioi_tinh"] = (bool) $row["gioi_tinh"] ? "Nam" : "Nữ";
        $infor["muc_luong"] = $row["muc_luong"];
      }
    }

    $sqlRoleGroup = "SELECT * FROM nhomquyen WHERE ma_nhom_quyen = $roleId AND trang_thai=1;";

    $rows = mysqli_query($this->conn, $sqlRoleGroup);

    if ($rows->num_rows <= 0) {
      return [
        'status' => 400,
        'access_token' => null,
        'message' => 'User login failure',
      ];
    }

    $row = mysqli_fetch_assoc($rows);

    $row["ma_nhom_quyen"] = (int) $row["ma_nhom_quyen"];
    $row["trang_thai"] = (bool) $row["trang_thai"];
    $role = $row;

    $sqlRole = "SELECT quyenhang.ma_quyen_hang, quyenhang.ten_quyen_hang,
                chitietquyenhang.trang_thai as trang_thai_quyen_hang,
                chucnang.ma_chuc_nang, chucnang.ten_chuc_nang
                FROM chitietquyenhang, nhomquyen, quyenhang, chucnang
                WHERE nhomquyen.ma_nhom_quyen = chitietquyenhang.ma_nhom_quyen
                AND quyenhang.ma_quyen_hang = chitietquyenhang.ma_quyen_hang
                AND nhomquyen.ma_nhom_quyen = $roleId
                AND chucnang.ma_chuc_nang = chitietquyenhang.ma_chuc_nang;";

    $rows = mysqli_query($this->conn, $sqlRole);

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_quyen_hang"] = (int) $row["ma_quyen_hang"];
      $row["ma_chuc_nang"] = (int) $row["ma_chuc_nang"];
      $row["trang_thai_quyen_hang"] = (bool) $row["trang_thai_quyen_hang"];
      $permission[] = $row;
    }

    $issuedAt = time();

    // jwt valid for 60 days (60 seconds * 60 minutes * 24 hours * 60 days)
    $expirationTime = $issuedAt + (60 * 60);

    $payload = [
      'iat' => $issuedAt,
      'exp' => $expirationTime,
      'data' => [
        'userId' => $id,
        'role' => $role,
        'permission' => $permission,
        'infor' => $infor,
      ]
    ];

    $secret_key = "laptop ecommerce";
    $jwt = JWT::encode($payload, $secret_key, 'HS256');

    return [
      'status' => 200,
      'access_token' => $jwt,
      'message' => 'User login successfully',
    ];
  }

  public function register($data): array | null
  {
    $ten_dang_nhap = $data["ten_dang_nhap"];

    $sql = "SELECT COUNT(*) AS num_rows FROM taikhoan
            WHERE ten_dang_nhap='$ten_dang_nhap' LIMIT 1;";

    $rows = mysqli_query($this->conn, $sql);

    $row = mysqli_fetch_array($rows);

    if ($row["num_rows"] > 0) {
      return [
        'status' => 500,
        'message' => 'Tên đăng nhập đã có trên hệ thống',
      ];
    }

    $ten_khach_hang = $data["ten_khach_hang"];
    $ngay_sinh = date("Y-m-d", $data["ngay_sinh"]);
    $gioi_tinh = (int) $data["gioi_tinh"];
    $so_dien_thoai = $data["so_dien_thoai"];
    $dia_chi = $data["dia_chi"];
    $mat_khau = password_hash($data["mat_khau"], PASSWORD_DEFAULT);
    $created_at = date("Y-m-d H:i:s", strtotime("now"));

    $sqlRole = "SELECT ma_nhom_quyen FROM nhomquyen WHERE `mac_dinh`=1";

    $row = $this->conn->query($sqlRole);

    $result = mysqli_fetch_assoc($row);

    $ma_nhom_quyen = $result["ma_nhom_quyen"];

    $sql = "INSERT INTO taikhoan (`ten_dang_nhap`, `ma_nhom_quyen`, `mat_khau`, `created_at`)
            VALUES ('$ten_dang_nhap', $ma_nhom_quyen, '$mat_khau', '$created_at');";

    $result = $this->conn->query($sql);

    $sql = "INSERT INTO khachhang (`ma_khach_hang`, `ten_khach_hang`, `ngay_sinh`, `gioi_tinh`,
            `so_dien_thoai`, `dia_chi`) VALUES ('$ten_dang_nhap', '$ten_khach_hang',
            '$ngay_sinh', $gioi_tinh, '$so_dien_thoai', '$dia_chi');";

    $result = $this->conn->query($sql);

    if ($result === TRUE) {
      return [
        'status' => 200,
        'message' => 'User register successfully',
      ];
    }

    return [
      'status' => 500,
      'message' => 'User register failure',
    ];
  }
}
