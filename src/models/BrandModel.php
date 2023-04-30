<?php
class BrandModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $sql = "SELECT * FROM thuonghieu WHERE hien_thi=1";

    $searching = $_GET["searching"] ?? null;

    if ($searching) {
      $sql .= " AND ten_thuong_hieu LIKE '%$searching%'";
    }

    $sortName = $_GET["sortName"] ?? "ten_thuong_hieu";
    $sortAction = $_GET["sortAction"] ?? "";

    switch ($sortName) {
      case 'ten_thuong_hieu':
        $sql .= " ORDER BY ten_thuong_hieu " . "$sortAction;";
        break;
    }

    $rows = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_thuong_hieu"] = (int) $row["ma_thuong_hieu"];
      $data[] = $row;
    }

    return [
      "data" => $data
    ];
  }

  public function create($data): string
  {
    $ten_thuong_hieu = $data["ten_thuong_hieu"];
    $icon = $data["icon"];
    $hinh_anh = $data["hinh_anh"];

    $sql = "INSERT INTO thuonghieu (`ten_thuong_hieu`, `icon`, `hinh_anh`)
    VALUES ('$ten_thuong_hieu', '$icon', '$hinh_anh');";

    $result = $this->conn->query($sql);


    if ($result === TRUE) {
      $last_id = $this->conn->insert_id;
      return "New record created successfully. Last inserted ID is: " . $last_id;
    } else {
      return $this->conn->error;
    }
  }

  public function get(int $id): array | false
  {
    $sql = "SELECT * FROM thuonghieu WHERE ma_thuong_hieu=$id";

    $result = $this->conn->query($sql);

    $data = mysqli_fetch_assoc($result);

    $data["ma_thuong_hieu"] = (int) $data["ma_thuong_hieu"];


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

    $ma_thuong_hieu = (int) $data["ma_thuong_hieu"];
    $ten_thuong_hieu = $data["ten_thuong_hieu"];
    $icon = $data["icon"];
    $hinh_anh = $data["hinh_anh"];

    $sql = "UPDATE thuonghieu SET ten_thuong_hieu='$ten_thuong_hieu', icon='$icon'
            , hinh_anh='$hinh_anh' WHERE ma_thuong_hieu=$ma_thuong_hieu";

    $result = mysqli_query($this->conn, $sql);


    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(int $id): string
  {
    $sql = "UPDATE thuonghieu SET hien_thi=0 WHERE ma_thuong_hieu=$id";

    $result = mysqli_query($this->conn, $sql);

    mysqli_close($this->conn);
    if ($result) {
      return "Deleted Successfully";
    } else {
      return $this->conn->error;
    }
  }
}
