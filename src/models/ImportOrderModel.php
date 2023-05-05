<?php
class ImportOrderModel
{

    public function __construct(private mysqli $conn)
    {
    }

    public function getAll($query = null): array
    {
        $sql = "SELECT * FROM phieunhap";
        $arrQuery = [];

        if ($query != null) {
            parse_str($query, $q);

            if (isset($q["employeeId"])) {
                $id = $q["employeeId"];
                $arrQuery[] = "`ma_nhan_vien`='$id'";
            }

            if (isset($q["from"]) && isset($q["to"])) {
                $from = date("Y-m-d H:i:s", $q["from"]);
                $to = date("Y-m-d H:i:s", $q["to"]);
                $arrQuery[] = "(`ngay_lap` BETWEEN '$from' AND '$to')";
            }

            if (isset($q["searching"])) {
                $searching = $q["searching"];
                $arrQuery[] = "(ma_phieu_nhap LIKE '%$searching%'
                                OR ma_nhan_vien LIKE '%$searching%'
                                OR ma_nha_cung_cap LIKE '%$searching%')
        ";
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

        $sortName = $_GET["sortName"] ?? "ma_phieu_nhap";
        $sortAction = $_GET["sortAction"] ?? "";

        switch ($sortName) {
            case 'ma_phieu_nhap':
                $sql .= " ORDER BY ma_phieu_nhap " . "$sortAction;";
                break;

            case 'ma_nha_cung_cap':
                $sql .= " ORDER BY ma_nha_cung_cap " . "$sortAction;";
                break;

            case 'ma_nhan_vien':
                $sql .= " ORDER BY ma_nhan_vien " . "$sortAction;";
                break;

            case 'ngay_lap':
                $sql .= " ORDER BY ngay_lap " . "$sortAction;";
                break;
        }

        $result = mysqli_query($this->conn, $sql);

        if ($result->num_rows <= 0) {
            return [];
        }

        $data = [];

        while ($row = mysqli_fetch_assoc($result)) {
            $row["danh_sach_san_pham_nhap_hang"] = [];
            $row["tong_tien"] = 0;

            $row["ma_phieu_nhap"] = (int) $row["ma_phieu_nhap"];
            $row["ngay_lap"] = strtotime($row["ngay_lap"]) * 1000;

            $id = $row["ma_phieu_nhap"];

            $sql = "SELECT * FROM phieunhap, chitietphieunhap, sanpham
                    WHERE phieunhap.ma_phieu_nhap = chitietphieunhap.ma_phieu_nhap
                    AND chitietphieunhap.ma_san_pham = sanpham.ma_san_pham
                    AND phieunhap.ma_phieu_nhap = $id;";

            $rows1 = mysqli_query($this->conn, $sql);

            while ($row1 = mysqli_fetch_assoc($rows1)) {
                $product = [];
                $product["ma_san_pham"] = (int) $row1["ma_san_pham"];
                $product["ten_san_pham"] = $row1["ten_san_pham"];
                $product["hinh_anh"] = json_decode($row1["hinh_anh"], true)[0];
                $product["don_gia"] = (float) $row1["don_gia"];
                $product["thuong_hieu"] = $row1["thuong_hieu"];
                $product["so_luong_nhap_hang"] = (int) $row1["so_luong_nhap_hang"];
                $row["danh_sach_san_pham_nhap_hang"][] = $product;
                $row["tong_tien"] += $product["don_gia"] * $product["so_luong_nhap_hang"];
            }

            $data[] = $row;
        }

        return $data;
    }

    public function create($data): string
    {
        $ma_nha_cung_cap = (int) $data["ma_nha_cung_cap"];
        $ma_nhan_vien = $data["ma_nhan_vien"];
        $danh_sach_san_pham_nhap_hang = $data["danh_sach_san_pham_nhap_hang"];
        $ngay_lap = date("Y-m-d H:i:s", intval($data["ngay_lap"] / 1000));

        $sql = "INSERT INTO phieunhap (`ma_nha_cung_cap`, `ma_nhan_vien`, `ngay_lap`)
            VALUES ($ma_nha_cung_cap, '$ma_nhan_vien', '$ngay_lap');";

        $result = $this->conn->query($sql);


        if ($result === TRUE) {
            $last_id = $this->conn->insert_id;

            foreach ($danh_sach_san_pham_nhap_hang as $product) {
                $ma_san_pham =  (int) $product["ma_san_pham"];
                $so_luong_nhap_hang = (int) $product["so_luong"];
                $don_gia = (float) $product["gia_nhap"];

                $sql = "INSERT INTO chitietphieunhap (`ma_san_pham`, `ma_phieu_nhap`, `so_luong_nhap_hang`,
                        `don_gia`) VALUES ($ma_san_pham, $last_id, $so_luong_nhap_hang, $don_gia);";

                $result = $this->conn->query($sql);
            }

            return $last_id;
        } else {
            return $this->conn->error;
        }
    }

    public function get(int $id): array | false
    {
        $sql = "SELECT * FROM phieunhap WHERE ma_phieu_nhap=$id";

        $result = $this->conn->query($sql);

        if ($result->num_rows <= 0) {
            return [];
        }

        $data = mysqli_fetch_assoc($result);

        $data["danh_sach_san_pham_nhap_hang"] = [];
        $data["tong_tien"] = 0;

        $data["ma_phieu_nhap"] = (int) $data["ma_phieu_nhap"];
        $data["ngay_lap"] = strtotime($data["ngay_lap"]);

        $sql = "SELECT * FROM phieunhap, chitietphieunhap, sanpham
            WHERE phieunhap.ma_phieu_nhap = chitietphieunhap.ma_phieu_nhap
            AND chitietphieunhap.ma_san_pham = sanpham.ma_san_pham
            AND phieunhap.ma_phieu_nhap = $id;";

        $rows = mysqli_query($this->conn, $sql);

        while ($row = mysqli_fetch_assoc($rows)) {
            $product = [];
            $product["ma_san_pham"] = (int) $row["ma_san_pham"];
            $product["ten_san_pham"] = $row["ten_san_pham"];
            $product["hinh_anh"] = json_decode($row["hinh_anh"], true)[0];
            $product["don_gia"] = (float) $row["don_gia"];
            $product["so_luong_nhap_hang"] = (int) $row["so_luong_nhap_hang"];
            $product["thuong_hieu"] = $row["thuong_hieu"];
            $data["danh_sach_san_pham_nhap_hang"][] = $product;
            $data["tong_tien"] += $product["don_gia"] * $product["so_luong_nhap_hang"];
        }

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

        $ma_phieu_nhap = (int) $data["ma_phieu_nhap"];
        $ma_nha_cung_cap = (int) $data["ma_nha_cung_cap"];
        $ma_nhan_vien = $data["ma_nhan_vien"];
        $ngay_lap = date("Y-m-d H:i:s", intval($data["ngay_lap"] / 1000));

        $sql = "UPDATE phieunhap SET ma_nha_cung_cap=$ma_nha_cung_cap, ma_nhan_vien='$ma_nhan_vien',
            ngay_lap='$ngay_lap' WHERE ma_phieu_nhap=$ma_phieu_nhap;";

        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "success";
        } else {
            return $this->conn->error;
        }
    }

    public function delete(int $id): string
    {
        $sql = "DELETE FROM phieunhap WHERE ma_phieu_nhap=$id;";

        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            $sql = "SELECT * FROM phieunhap, chitietphieunhap, sanpham
            WHERE phieunhap.ma_phieu_nhap = chitietphieunhap.ma_phieu_nhap
            AND chitietphieunhap.ma_san_pham = sanpham.ma_san_pham
            AND phieunhap.ma_phieu_nhap = $id;";

            $rows = mysqli_query($this->conn, $sql);

            while ($row = mysqli_fetch_assoc($rows)) {
                $ma_san_pham = (int) $row["ma_san_pham"];
                $so_luong_nhap_hang = (int) $row["so_luong_nhap_hang"];

                for ($i = 1; $i <= $so_luong_nhap_hang; $i++) {
                    $sql = "SELECT * FROM chitietsanpham WHERE ma_san_pham=$ma_san_pham LIMIT 1;";

                    $result = mysqli_query($this->conn, $sql);

                    $row = mysqli_fetch_assoc($result);

                    $ma_chi_tiet_san_pham = $row["ma_chi_tiet_san_pham"];

                    if ($result == TRUE) {
                        $sql = "DELETE FROM chitietsanpham WHERE ma_chi_tiet_san_pham='$ma_chi_tiet_san_pham';";

                        $result = mysqli_query($this->conn, $sql);
                    }
                }
            }
            return "success";
        } else {
            return $this->conn->error;
        }
    }
}
