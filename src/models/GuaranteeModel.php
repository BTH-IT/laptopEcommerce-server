<?php
class GuaranteeModel
{

    public function __construct(private mysqli $conn)
    {
    }

    public function getAll($query = null): array
    {
        $sql = "SELECT * FROM baohanh";

        $arrQuery = [];

        if ($query != null) {
            parse_str($query, $q);

            if (isset($q["from"]) && isset($q["to"])) {
                $from = date("Y-m-d H:i:s", $q["from"]);
                $to = date("Y-m-d H:i:s", $q["to"]);
                $arrQuery[] = "`ngay_lap` BETWEEN '$from' AND '$to'";
            }

            if (isset($q["searching"])) {
                $searching = $q["searching"];
                $arrQuery[] = "(ma_bao_hanh LIKE '%$searching%'
                        OR ma_chi_tiet_san_pham LIKE '%$searching%'
                        OR ma_khach_hang LIKE '%$searching%')";
            }
        }

        for ($i = 0; $i < count($arrQuery); $i++) {
            $value = $arrQuery[$i];
            if ($i == 0) {
                $sql .= " WHERE $value";
            } else {
                $sql .= " AND $value";
            }
        }

        $sortName = $_GET["sortName"] ?? "ma_bao_hanh";
        $sortAction = $_GET["sortAction"] ?? "";

        switch ($sortName) {
            case 'ma_bao_hanh':
                $sql .= " ORDER BY ma_bao_hanh " . "$sortAction;";
                break;

            case 'ma_chi_tiet_san_pham':
                $sql .= " ORDER BY ma_chi_tiet_san_pham " . "$sortAction;";
                break;

            case 'ma_khach_hang':
                $sql .= " ORDER BY ma_khach_hang " . "$sortAction;";
                break;
        }

        $rows = mysqli_query($this->conn, $sql);

        $data = [];

        while ($row = mysqli_fetch_assoc($rows)) {
            $guarantee = [];
            $guarantee["ma_bao_hanh"] = (int) $row["ma_bao_hanh"];
            $guarantee["ma_chi_tiet_san_pham"] = (int) $row["ma_chi_tiet_san_pham"];
            $guarantee["ma_khach_hang"] = $row["ma_khach_hang"];
            $guarantee["ngay_lap"] = strtotime($row["ngay_lap"]) * 1000;
            $guarantee["ngay_het_han"] = strtotime($row["ngay_het_han"]) * 1000;

            $data[] = $guarantee;
        }

        return $data;
    }

    public function create($data): string
    {
        $ma_bao_hanh = (int) $data["ma_bao_hanh"];
        $ma_chi_tiet_san_pham = (int) $data["ma_chi_tiet_san_pham"];
        $ma_khach_hang = $data["ma_khach_hang"];
        $ngay_lap = date("Y-m-d H:i:s", $data["ngay_lap"] / 1000);
        $ngay_het_han = date("Y-m-d H:i:s", $data["ngay_het_han"] / 1000);

        $sql = "INSERT INTO baohanh (`ma_bao_hanh`, `ma_chi_tiet_san_pham`, `ma_khach_hang`, `ngay_lap`, `ngay_het_han`)
                VALUES ($ma_bao_hanh, $ma_chi_tiet_san_pham, '$ma_khach_hang', '$ngay_lap', '$ngay_het_han');";

        $result = $this->conn->query($sql);

        if ($result === TRUE) {
            $ma_bao_hanh = $this->conn->insert_id;
            return "New record created successfully. Last inserted ID is: " . $ma_bao_hanh;
        } else {
            return $this->conn->error;
        }
    }

    public function get(int $id): array|false
    {
        $sql = "SELECT * FROM baohanh WHERE ma_bao_hanh = $id";

        $result = mysqli_query($this->conn, $sql);

        if ($result->num_rows <= 0) {
            return false;
        }

        $data = mysqli_fetch_assoc($result);

        $guarantee = [];
        $guarantee["ma_bao_hanh"] = (int) $data["ma_bao_hanh"];
        $guarantee["ma_chi_tiet_san_pham"] = (int) $data["ma_chi_tiet_san_pham"];
        $guarantee["ma_khach_hang"] = $data["ma_khach_hang"];
        $guarantee["ngay_lap"] = strtotime($data["ngay_lap"]) * 1000;
        $guarantee["ngay_het_han"] = strtotime($data["ngay_het_han"]) * 1000;

        $data = $guarantee;

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

        $ma_bao_hanh = (int) $data["ma_bao_hanh"];
        $ma_chi_tiet_san_pham = (int) $data["ma_chi_tiet_san_pham"];
        $ma_khach_hang = $data["ma_khach_hang"];
        $ngay_lap = date("Y-m-d H:i:s", $data["ngay_lap"] / 1000);
        $ngay_het_han = date("Y-m-d H:i:s", $data["ngay_het_han"] / 1000);

        $sql = "UPDATE baohanh SET ma_chi_tiet_san_pham='$ma_chi_tiet_san_pham',
                ma_khach_hang='$ma_khach_hang', ngay_lap='$ngay_lap',
                ngay_het_han='$ngay_het_han' WHERE ma_bao_hanh=$ma_bao_hanh;";
        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "Successfully";
        } else {
            return $this->conn->error;
        }
    }

    public function delete(int $id): string
    {
        $sql = "DELETE FROM baohanh WHERE ma_bao_hanh=$id;";

        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "success";
        } else {
            return $this->conn->error;
        }
    }
}
