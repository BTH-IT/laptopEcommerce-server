<?php
class ImportOrderModel
{

    public function __construct(private mysqli $conn)
    {
    }

    public function getAll(): array
    {
        $sql = "SELECT * FROM phieunhap";

        $rows = mysqli_query($this->conn, $sql);

        $data = [];

        while ($row = mysqli_fetch_assoc($rows)) {
            $import = [];
            $import["ma_phieu_nhap"] = (int) $row["ma_phieu_nhap"];
            $import["ma_nha_cung_cap"] = (int) $row["ma_nha_cung_cap"];
            $import["ma_nhan_vien"] = $row["ma_nhan_vien"];
            $import["ngay_lap"] = strtotime($row["ngay_lap"]) * 1000;
            $import["hien_thi"] = (bool) $row["hien_thi"];

            $importID = $import["ma_phieu_nhap"];
            $sql = "SELECT * FROM chitietphieunhap as ctpn, sanpham as sp 
                    WHERE ctpn.ma_san_pham = sp.ma_san_pham AND ctpn.ma_phieu_nhap = $importID;";
            $rows2 = mysqli_query($this->conn, $sql);
            $import["danh_sach_san_pham_da_nhap"] = [];

            while ($row2 = mysqli_fetch_assoc($rows2)) {
                $product = [];
                $product["ten_san_pham"] = $row2["ten_san_pham"];
                $product["hinh_anh"] = $row2["hinh_anh"];
                $product["don_gia"] = (float) $row2["don_gia"];
                $product["so_luong_nhap_hang"] = $row2["so_luong_nhap_hang"];

                $import["danh_sach_san_pham_da_nhap"][] = $product;
            }

            $data[] = $import;
        }

        return $data;
    }

    public function create($data): string
    {
        $ma_phieu_nhap = (int) $data["ma_phieu_nhap"];
        $ma_nha_cung_cap = (int) $data["ma_nha_cung_cap"];
        $ma_nhan_vien = $data["ma_nhan_vien"];
        $ngay_lap = date("Y-m-d H:i:s", $data["ngay_lap"] / 1000);

        $sql = "INSERT INTO phieunhap (`ma_phieu_nhap`, `ma_nha_cung_cap`, `ma_nhan_vien`, `ngay_lap`)
                VALUES ($ma_phieu_nhap, $ma_nha_cung_cap, '$ma_nhan_vien', '$ngay_lap');";

        $result = $this->conn->query($sql);

        if ($result === TRUE) {
            $ma_phieu_nhap = $this->conn->insert_id;
            foreach ($data["danh_sach_san_pham_da_nhap"] as $product) {
                $ma_san_pham = (int) $product["ma_san_pham"];
                $so_luong_nhap_hang = $product["so_luong_nhap_hang"];
                $don_gia = (float) $product["don_gia"];

                $sql = "INSERT INTO chitietphieunhap (`ma_san_pham`, `ma_phieu_nhap`, `so_luong_nhap_hang`, `don_gia`) 
                        VALUES ($ma_san_pham, $ma_phieu_nhap, '$so_luong_nhap_hang', '$don_gia');";
                $result = $this->conn->query($sql);
            }
            return "New record created successfully. Last inserted ID is: " . $ma_phieu_nhap;
        } else {
            return $this->conn->error;
        }
    }

    public function get(int $id): array|false
    {
        $sql = "SELECT * FROM phieunhap WHERE ma_phieu_nhap = $id";

        $result = mysqli_query($this->conn, $sql);

        if ($result->num_rows <= 0) {
            return false;
        }

        $data = mysqli_fetch_assoc($result);

        $import = [];
        $import["ma_phieu_nhap"] = (int) $data["ma_phieu_nhap"];
        $import["ma_nha_cung_cap"] = (int) $data["ma_nha_cung_cap"];
        $import["ma_nhan_vien"] = $data["ma_nhan_vien"];
        $import["ngay_lap"] = strtotime($data["ngay_lap"]) * 1000;
        $import["hien_thi"] = (bool) $data["hien_thi"];

        $importID = $import["ma_phieu_nhap"];
        $sql = "SELECT * FROM chitietphieunhap as ctpn, sanpham as sp 
                WHERE ctpn.ma_san_pham = sp.ma_san_pham AND ctpn.ma_phieu_nhap = $importID;";
        $rows2 = mysqli_query($this->conn, $sql);
        $import["danh_sach_san_pham_da_nhap"] = [];

        while ($row2 = mysqli_fetch_assoc($rows2)) {
            $product = [];
            $product["ten_san_pham"] = $row2["ten_san_pham"];
            $product["hinh_anh"] = $row2["hinh_anh"];
            $product["don_gia"] = (float) $row2["don_gia"];
            $product["so_luong_nhap_hang"] = $row2["so_luong_nhap_hang"];

            $import["danh_sach_san_pham_da_nhap"][] = $product;
        }

        $data = $import;

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
        $ngay_lap = date("Y-m-d H:i:s", $data["ngay_lap"] / 1000);
        $hien_thi = (bool) $data["hien_thi"] ? 1 : 0;

        $sql = "UPDATE phieunhap 
                SET ma_nha_cung_cap='$ma_nha_cung_cap', ma_nhan_vien='$ma_nhan_vien'
                , ngay_lap='$ngay_lap', hien_thi=$hien_thi
                WHERE ma_phieu_nhap=$ma_phieu_nhap;";
        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "Successfully";
        } else {
            return $this->conn->error;
        }
    }

    public function delete(int $id): string
    {
        $sql = "UPDATE phieunhap SET hien_thi=0 WHERE ma_phieu_nhap=$id;";

        $result = mysqli_query($this->conn, $sql);


        if ($result) {
            return "success";
        } else {
            return $this->conn->error;
        }
    }
}
