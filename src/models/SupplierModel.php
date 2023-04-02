<?php
class SupplierModel
{

    public function __construct(private mysqli $conn)
    {
    }

    public function getAll(): array
    {
        $sql = "SELECT * FROM nhacungcap";

        $rows = mysqli_query($this->conn, $sql);

        $data = [];

        while ($row = mysqli_fetch_assoc($rows)) {
            $supplier = [];
            $supplier["ma_nha_cung_cap"] = (int) $row["ma_nha_cung_cap"];
            $supplier["ten_nha_cung_cap"] = $row["ten_nha_cung_cap"];
            $supplier["so_dien_thoai"] = $row["so_dien_thoai"];
            $supplier["dia_chi"] = $row["dia_chi"];

            $data[] = $supplier;
        }

        return $data;
    }

    public function create($data): string
    {
        $ma_nha_cung_cap = (int) $data["ma_nha_cung_cap"];
        $ten_nha_cung_cap = $data["ten_nha_cung_cap"];
        $so_dien_thoai = $data["so_dien_thoai"];
        $dia_chi = $data["dia_chi"];

        $sql = "INSERT INTO `nhacungcap` (`ma_nha_cung_cap`, `ten_nha_cung_cap`, `so_dien_thoai`, `dia_chi`)
                VALUES ($ma_nha_cung_cap, '$ten_nha_cung_cap', '$so_dien_thoai', '$dia_chi');";

        $result = $this->conn->query($sql);

        if ($result === TRUE) {
            $ma_nha_cung_cap = $this->conn->insert_id;
            return "New record created successfully. Last inserted ID is: " . $ma_nha_cung_cap;
        } else {
            return $this->conn->error;
        }
    }

    public function get(int $id): array|false
    {
        $sql = "SELECT * FROM nhacungcap WHERE ma_nha_cung_cap = $id";

        $result = mysqli_query($this->conn, $sql);

        if ($result->num_rows <= 0) {
            return false;
        }

        $data = mysqli_fetch_assoc($result);

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

        $ma_nha_cung_cap = (int) $data["ma_nha_cung_cap"];
        $ten_nha_cung_cap = $data["ten_nha_cung_cap"];
        $so_dien_thoai = $data["so_dien_thoai"];
        $dia_chi = $data["dia_chi"];

        $sql = "UPDATE nhacungcap 
                SET ten_nha_cung_cap='$ten_nha_cung_cap'
                , so_dien_thoai='$so_dien_thoai', dia_chi='$dia_chi'
                WHERE ma_nha_cung_cap=$ma_nha_cung_cap;";
        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "Successfully";
        } else {
            return $this->conn->error;
        }
    }

    public function delete(int $id): string
    {
        $sql = "DELETE FROM nhacungcap WHERE ma_nha_cung_cap = $id;";

        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "success";
        } else {
            return $this->conn->error;
        }
    }
}