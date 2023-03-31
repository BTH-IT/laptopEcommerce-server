<?php
class ImageModel
{
  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $sql = "SELECT * FROM hinhanh";

    $rows = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($rows)) {
      $row["ma_hinh_anh"] = (int) $row["ma_hinh_anh"];
      $data[] = $row;
    }

    return $data;
  }

  public function create($data): string
  {
    $filename = $_FILES["uploadfile"]["name"];
    $tempname = $_FILES["uploadfile"]["tmp_name"];
    $folder = $_SERVER['DOCUMENT_ROOT'] . '/ecommerce-api/images/' . $filename;

    $sql = "INSERT INTO hinhanh (`filename`) VALUES ('$filename');";

    $result = $this->conn->query($sql);

    if (move_uploaded_file($tempname, $folder)) {
      echo "Image uploaded successfully!";
    } else {
      echo "Failed to upload image!";
    }

    if ($result === TRUE) {
      $last_id = $this->conn->insert_id;
      return "New record created successfully. Last inserted ID is: " . $last_id;
    } else {
      return $this->conn->error;
    }
  }

  public function get(int $id): array | false
  {
    $sql = "SELECT * FROM hinhanh WHERE ma_hinh_anh=$id";

    $result = $this->conn->query($sql);

    $data = mysqli_fetch_assoc($result);

    $data["ma_hinh_anh"] = (int) $data["ma_hinh_anh"];

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

    $ma_hinh_anh = (int) $data["ma_hinh_anh"];
    $filename = $data["filename"];

    $sql = "UPDATE hinhanh SET `filename`='$filename' WHERE ma_hinh_anh=$ma_hinh_anh";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(int $id): string
  {
    $sqlDel = "DELETE FROM hinhanh WHERE ma_hinh_anh=$id";
    $sqlGet = "SELECT `filename` FROM hinhanh WHERE ma_hinh_anh=$id";

    $resultGet = mysqli_query($this->conn, $sqlGet);
    $resultDel = mysqli_query($this->conn, $sqlDel);

    $row = mysqli_fetch_assoc($resultGet);

    unlink($_SERVER['DOCUMENT_ROOT'] . '/ecommerce-api/images/' . $row['filename']);

    if ($resultDel) {
      return "success";
    } else {
      return $this->conn->error;
    }
  }
}
