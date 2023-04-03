<?php
class DetailProductModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $data = [];
    $sql = "SELECT * FROM chitietsanpham;";

    $rows = mysqli_query($this->conn, $sql);

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_san_pham"] = (int) $row["ma_san_pham"];
      $data[] = $row;
    }


    return [
      "data" => $data
    ];
  }

  public function create($data): string
  {
    $so_luong = (int) $data["so_luong_da_mua"];

    for ($i = 1; $i <= $so_luong; $i++) {
      $ma_chi_tiet_san_pham = '';
      $ma_chi_tiet_san_pham .= strtotime("now");
      $ma_san_pham = (int) $data["ma_san_pham"];

      $id = $data["ma_san_pham"];
      $sql = "SELECT COUNT(ma_san_pham) AS so_luong FROM chitietsanpham
              WHERE ma_san_pham=$id GROUP BY ma_san_pham;";

      $result = mysqli_query($this->conn, $sql);

      if ($result->num_rows <= 0) {
        $ma_chi_tiet_san_pham .= "1";
      } else {
        $row = mysqli_fetch_assoc($result);

        $so_luong_hien_tai = ((int) $row["so_luong"]) + 1;

        $ma_chi_tiet_san_pham .= (string) ($so_luong_hien_tai);
      }

      $sql = "INSERT INTO chitietsanpham (`ma_chi_tiet_san_pham`, `ma_san_pham`)
            VALUES ('$ma_chi_tiet_san_pham', $ma_san_pham);";

      $result = $this->conn->query($sql);

      if ($result) {
        return "success";
      } else {
        return $this->conn->error;
      }
    }
  }

  public function get(string $id): array | false
  {
    $sql = "SELECT * FROM chitietsanpham WHERE ma_chi_tiet_san_pham='$id';";

    $result = $this->conn->query($sql);

    $data = mysqli_fetch_assoc($result);

    $data["ma_san_pham"] = (int) $data["ma_san_pham"];

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

    $ma_chi_tiet_san_pham = $data["ma_chi_tiet_san_pham"];
    $ma_san_pham = (int) $data["ma_san_pham"];

    $sql = "UPDATE nhanvien SET ma_san_pham=$ma_san_pham WHERE ma_chi_tiet_san_pham='$ma_chi_tiet_san_pham';";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(string $id): string
  {
    $sql = "DELETE FROM chitietsanpham WHERE ma_chi_tiet_san_pham='$id';";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Deleted Successfully";
    } else {
      return $this->conn->error;
    }
  }
}
