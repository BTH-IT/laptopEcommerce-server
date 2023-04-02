<?php
class OrderModel
{

    public function __construct(private mysqli $conn)
    {
    }

    public function getAll(): array
    {
        $sql = "SELECT * FROM donhang";

        $rows = mysqli_query($this->conn, $sql);

        $data = [];

        while ($row = mysqli_fetch_assoc($rows)) {
            $order = [];
            $order["ma_don_hang"] = (int) $row["ma_don_hang"];
            $order["ma_khach_hang"] = $row["ma_khach_hang"];
            $order["ma_nhan_vien"] = $row["ma_nhan_vien"];
            $order["hinh_thuc_thanh_toan"] = $row["hinh_thuc_thanh_toan"];
            $order["thoi_gian_dat_mua"] = strtotime($row["thoi_gian_dat_mua"]) * 1000;
            $order["trang_thai"] = $row["trang_thai"];
            $order["hien_thi"] = (bool) $row["hien_thi"];

            $orderID = $order["ma_don_hang"];
            $sql = "SELECT * FROM chitiethoadon as cthd, sanpham as sp 
                    WHERE cthd.ma_san_pham = sp.ma_san_pham AND cthd.ma_don_hang = $orderID;";
            $rows2 = mysqli_query($this->conn, $sql);
            $order["danh_sach_san_pham_da_mua"] = [];

            while ($row2 = mysqli_fetch_assoc($rows2)) {
                $product = [];
                $product["ten_san_pham"] = $row2["ten_san_pham"];
                $product["hinh_anh"] = $row2["hinh_anh"];
                $product["don_gia"] = (double) $row2["don_gia"];
                $product["giam_gia_san_pham"] = (int) $row2["giam_gia_san_pham"];
                $product["so_luong_da_mua"] = $row2["so_luong_da_mua"];

                $order["danh_sach_san_pham_da_mua"][] = $product;
            }

            $data[] = $order;
        }

        return $data;
    }

    public function create($data): string
    {
        $ma_don_hang = (int) $data["ma_don_hang"];
        $ma_khach_hang = $data["ma_khach_hang"];
        $ma_nhan_vien = $data["ma_nhan_vien"];
        $hinh_thuc_thanh_toan = $data["hinh_thuc_thanh_toan"];
        $thoi_gian_dat_mua = date("Y-m-d H:i:s", $data["thoi_gian_dat_mua"] / 1000);
        $trang_thai = $data["trang_thai"];

        $sql = "INSERT INTO donhang (`ma_don_hang`, `ma_khach_hang`, `ma_nhan_vien`, `hinh_thuc_thanh_toan`, `thoi_gian_dat_mua`, `trang_thai`)
                VALUES ($ma_don_hang, '$ma_khach_hang', '$ma_nhan_vien', '$hinh_thuc_thanh_toan', '$thoi_gian_dat_mua', '$trang_thai');";

        $result = $this->conn->query($sql);

        if ($result === TRUE) {
            $ma_don_hang = $this->conn->insert_id;
            foreach ($data["danh_sach_san_pham_da_mua"] as $product) {
                $ma_san_pham = (int) $product["ma_san_pham"];
                $don_gia = (double) $product["don_gia"];
                $giam_gia_san_pham = (int) $product["giam_gia_san_pham"];
                $so_luong_da_mua = (int) $product["so_luong_da_mua"];

                $sql = "INSERT INTO chitiethoadon (`ma_san_pham`, `ma_don_hang`, `so_luong_da_mua`, `don_gia`, `giam_gia_san_pham`) 
                        VALUES ($ma_san_pham, $ma_don_hang, $don_gia, $giam_gia_san_pham, $so_luong_da_mua);";
                $result = $this->conn->query($sql);
            }
            return "New record created successfully. Last inserted ID is: " . $ma_don_hang;
        } else {
            return $this->conn->error;
        }
    }

    public function get(int $id): array|false
    {
        $sql = "SELECT * FROM donhang WHERE ma_don_hang = $id";

        $result = mysqli_query($this->conn, $sql);

        if ($result->num_rows <= 0) {
            return false;
        }

        $data = mysqli_fetch_assoc($result);

        $order = [];
        $order["ma_don_hang"] = (int) $data["ma_don_hang"];
        $order["ma_khach_hang"] = $data["ma_khach_hang"];
        $order["ma_nhan_vien"] = $data["ma_nhan_vien"];
        $order["hinh_thuc_thanh_toan"] = $data["hinh_thuc_thanh_toan"];
        $order["thoi_gian_dat_mua"] = strtotime($data["thoi_gian_dat_mua"]) * 1000;
        $order["trang_thai"] = $data["trang_thai"];
        $order["hien_thi"] = (bool) $data["hien_thi"];

        $orderID = $order["ma_don_hang"];
        $sql = "SELECT * FROM chitiethoadon as cthd, sanpham as sp 
                    WHERE cthd.ma_san_pham = sp.ma_san_pham AND cthd.ma_don_hang = $orderID;";
        $rows2 = mysqli_query($this->conn, $sql);
        $order["danh_sach_san_pham_da_mua"] = [];

        while ($row2 = mysqli_fetch_assoc($rows2)) {
            $product = [];
            $product["ten_san_pham"] = $row2["ten_san_pham"];
            $product["hinh_anh"] = $row2["hinh_anh"];
            $product["don_gia"] = (double) $row2["don_gia"];
            $product["giam_gia_san_pham"] = (int) $row2["giam_gia_san_pham"];
            $product["ten_san_pham"] = $row2["ten_san_pham"];
            $product["so_luong_da_mua"] = $row2["so_luong_da_mua"];

            $order["danh_sach_san_pham_da_mua"][] = $product;
        }

        $data = $order;

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

        $ma_don_hang = (int) $data["ma_don_hang"];
        $ma_khach_hang = $data["ma_khach_hang"];
        $ma_nhan_vien = $data["ma_nhan_vien"];
        $hinh_thuc_thanh_toan = $data["hinh_thuc_thanh_toan"];
        $thoi_gian_dat_mua = date("Y-m-d H:i:s", $data["thoi_gian_dat_mua"] / 1000);
        $trang_thai = $data["trang_thai"];
        $hien_thi = (bool) $data["hien_thi"] ? 1 : 0;
        $sql = "UPDATE donhang 
                SET ma_khach_hang='$ma_khach_hang', ma_nhan_vien='$ma_nhan_vien', hinh_thuc_thanh_toan='$hinh_thuc_thanh_toan'
                , thoi_gian_dat_mua='$thoi_gian_dat_mua', trang_thai='$trang_thai', hien_thi=$hien_thi
                WHERE ma_don_hang=$ma_don_hang;";
        $result = mysqli_query($this->conn, $sql);

        if ($result) {
            return "Successfully";
        } else {
            return $this->conn->error;
        }
    }

    public function delete(int $id): string
    {
        $sql = "UPDATE donhang SET hien_thi=0 WHERE ma_don_hang=$id;";

        $result = mysqli_query($this->conn, $sql);


        if ($result) {
            return "success";
        } else {
            return $this->conn->error;
        }
    }
}