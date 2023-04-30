<?php
class DetailOrderModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $data = [];
    $sql = "SELECT * FROM chitiethoadon;";

    $rows = mysqli_query($this->conn, $sql);

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_san_pham"] = (int) $row["ma_san_pham"];
      $row["ma_don_hang"] = (int) $row["ma_don_hang"];
      $row["don_gia"] = (float) $row["don_gia"];
      $row["giam_gia_san_pham"] = (int) $row["giam_gia_san_pham"];
      $row["thoi_gian_bao_hanh"] = (int) $row["thoi_gian_bao_hanh"];
      $data[] = $row;
    }

    return [
      "data" => $data
    ];
  }

  public function create($data): string
  {
    $ma_san_pham = (int) $data["ma_san_pham"];
    $ma_chi_tiet_san_pham = $data["ma_chi_tiet_san_pham"];
    $ma_don_hang = (int) $data["ma_don_hang"];
    $don_gia = (float) $data["don_gia"];
    $giam_gia_san_pham = (int) $data["giam_gia_san_pham"];
    $thoi_gian_bao_hanh = (int) $data["thoi_gian_bao_hanh"];

    $sql = "INSERT INTO chitietsanpham (`ma_san_pham`, `ma_chi_tiet_san_pham`,
            `ma_don_hang`, `don_gia`, `giam_gia_san_pham`, `thoi_gian_bao_hang`)
            VALUES ($ma_san_pham, '$ma_chi_tiet_san_pham', $ma_don_hang, $don_gia,
            $giam_gia_san_pham, $thoi_gian_bao_hanh);";

    $result = $this->conn->query($sql);

    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function get(int $orderId, int $productId): array | false
  {
    $sql = "SELECT * FROM chitiethoadon WHERE ma_don_hang=$orderId AND ma_san_pham=$productId;";

    $rows = $this->conn->query($sql);

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_san_pham"] = (int) $row["ma_san_pham"];
      $row["ma_don_hang"] = (int) $row["ma_don_hang"];
      $row["don_gia"] = (float) $row["don_gia"];
      $row["giam_gia_san_pham"] = (int) $row["giam_gia_san_pham"];
      $row["thoi_gian_bao_hanh"] = (int) $row["thoi_gian_bao_hanh"];
      $data[] = $row;
    }


    return [
      $data
    ];
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

    $ma_san_pham = (int) $data["ma_san_pham"];
    $ma_chi_tiet_san_pham = $data["ma_chi_tiet_san_pham"];
    $ma_don_hang = (int) $data["ma_don_hang"];
    $don_gia = (float) $data["don_gia"];
    $giam_gia_san_pham = (int) $data["giam_gia_san_pham"];
    $thoi_gian_bao_hanh = (int) $data["thoi_gian_bao_hanh"];

    $sql = "UPDATE chitiethoadon SET ma_chi_tiet_san_pham=$ma_chi_tiet_san_pham,
            don_gia=$don_gia, giam_gia_san_pham=$giam_gia_san_pham, thoi_gian_bao_hanh=$thoi_gian_bao_hanh
            WHERE ma_san_pham='$ma_san_pham' AND ma_don_hang=$ma_don_hang;";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(int $orderId, int $productId): string
  {
    $sql = "DELETE FROM chitiethoadon WHERE WHERE ma_san_pham='$productId' AND ma_don_hang=$orderId;";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Deleted Successfully";
    } else {
      return $this->conn->error;
    }
  }
}
