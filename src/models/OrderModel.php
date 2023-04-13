<?php
class OrderModel
{

    public function __construct(private mysqli $conn)
    {
    }

    public function getAll($query = null): array
    {
        $sql = "SELECT * FROM donhang WHERE hien_thi=1";
        $arrQuery = [];

        if ($query != null) {
            parse_str($query, $q);

            if (isset($q["order_type"])) {
                switch ($q["order_type"]) {
                    case 'waiting':
                        $arrQuery[] = "`trang_thai`='chờ xử lý'";
                        break;
                    case 'shipping':
                        $arrQuery[] = "`trang_thai`='đang giao hàng'";
                        break;
                    case 'completed':
                        $arrQuery[] = "`trang_thai`='hoàn thành'";
                        break;
                    case 'canceled':
                        $arrQuery[] = "`trang_thai`='đã hủy'";
                        break;
                }
            }

            if (isset($q["userId"])) {
                $id = $q["userId"];
                $arrQuery[] = "`ma_khach_hang`='$id'";
            }

            if (isset($q["from"]) && isset($q["to"])) {
                $from = date("Y-m-d H:i:s", $q["from"]);
                $to = date("Y-m-d H:i:s", $q["to"]);
                $arrQuery[] = "`thoi_gian_dat_mua` BETWEEN '$from' AND '$to'";
            }
        }

        for ($i = 0; $i < count($arrQuery); $i++) {
            $value = $arrQuery[$i];
            $sql .= " AND $value";
        }

        $sql .= ";";

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
            $sql = "SELECT sanpham.ma_san_pham, sanpham.ten_san_pham, sanpham.hinh_anh,
                    chitiethoadon.don_gia, chitiethoadon.giam_gia_san_pham,
                    COUNT(chitiethoadon.ma_san_pham) as so_luong_da_mua, chitiethoadon.thoi_gian_bao_hanh,
                    sanpham.thuong_hieu
                    FROM donhang, chitiethoadon, sanpham
                    WHERE donhang.ma_don_hang = chitiethoadon.ma_don_hang
                    AND chitiethoadon.ma_san_pham = sanpham.ma_san_pham
                    AND donhang.ma_don_hang = $orderID
                    GROUP BY sanpham.ma_san_pham, sanpham.ten_san_pham, sanpham.hinh_anh,
                    chitiethoadon.don_gia, chitiethoadon.giam_gia_san_pham,
                    chitiethoadon.thoi_gian_bao_hanh, sanpham.thuong_hieu;";

            $rows2 = mysqli_query($this->conn, $sql);
            $order["danh_sach_san_pham_da_mua"] = [];

            while ($row2 = mysqli_fetch_assoc($rows2)) {
                $product = [];
                $product["ma_chi_tiet_san_pham"] = $row2["ma_chi_tiet_san_pham"];
                $product["ten_san_pham"] = $row2["ten_san_pham"];
                $product["hinh_anh"] = json_decode($row2["hinh_anh"], true)[0];
                $product["don_gia"] = (float) $row2["don_gia"];
                $product["giam_gia_san_pham"] = (int) $row2["giam_gia_san_pham"];
                $product["so_luong_da_mua"] = (int) $row2["so_luong_da_mua"];
                $product["thoi_gian_bao_hanh"] = (int) $row2["thoi_gian_bao_hanh"];

                $order["danh_sach_san_pham_da_mua"][] = $product;
            }

            $data[] = $order;
        }

        return $data;
    }

    public function create($data): string
    {
        $ma_khach_hang = $data["ma_khach_hang"];
        $ma_nhan_vien = $data["ma_nhan_vien"];
        $hinh_thuc_thanh_toan = $data["hinh_thuc_thanh_toan"];
        $thoi_gian_dat_mua = date("Y-m-d H:i:s", (int) ($data["thoi_gian_dat_mua"] / 1000));
        $trang_thai = $data["trang_thai"];

        $sql = "INSERT INTO donhang (`ma_khach_hang`, `ma_nhan_vien`, `hinh_thuc_thanh_toan`, `thoi_gian_dat_mua`, `trang_thai`)
                VALUES ('$ma_khach_hang'," . ($ma_nhan_vien ? "'$ma_nhan_vien'" : "DEFAULT") . ", '$hinh_thuc_thanh_toan', '$thoi_gian_dat_mua'," . ($trang_thai ? "'$trang_thai'" : "DEFAULT") . ");";

        $result = $this->conn->query($sql);

        if ($result === TRUE) {
            $ma_don_hang = $this->conn->insert_id;
            foreach ($data["danh_sach_san_pham_da_mua"] as $product) {
                $ma_san_pham = (int) $product["ma_san_pham"];

                $query1 = "SELECT * FROM chitietsanpham WHERE ma_san_pham = $ma_san_pham LIMIT 1";
                $row1 = mysqli_query($this->conn, $query1);
                $data1 = mysqli_fetch_assoc($row1);
                $ma_chi_tiet_san_pham = $data1["ma_chi_tiet_san_pham"];

                $don_gia = (float) $product["don_gia"];
                $giam_gia_san_pham = (int) $product["giam_gia_san_pham"];
                $so_luong_da_mua = (int) $product["so_luong_da_mua"];

                $query2 = "SELECT * FROM sanpham WHERE ma_san_pham = $ma_san_pham";
                $row2 = mysqli_query($this->conn, $query2);
                $data2 = mysqli_fetch_assoc($row2);
                $thoi_gian_bao_hanh = $data2["bao_hanh"];

                $sql = "INSERT INTO chitiethoadon (`ma_san_pham`, `ma_chi_tiet_san_pham`, `ma_don_hang`, `so_luong_da_mua`, `don_gia`, `giam_gia_san_pham`, `thoi_gian_bao_hanh`) 
                        VALUES ($ma_san_pham, '$ma_chi_tiet_san_pham', $ma_don_hang, $so_luong_da_mua, $don_gia, $giam_gia_san_pham, $thoi_gian_bao_hanh);";
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
        $sql = "SELECT sanpham.ma_san_pham, sanpham.ten_san_pham, sanpham.hinh_anh,
                chitiethoadon.don_gia, chitiethoadon.giam_gia_san_pham,
                COUNT(chitiethoadon.ma_san_pham) as so_luong_da_mua, chitiethoadon.thoi_gian_bao_hanh
                FROM donhang, chitiethoadon, sanpham
                WHERE donhang.ma_don_hang = chitiethoadon.ma_don_hang
                AND chitiethoadon.ma_san_pham = sanpham.ma_san_pham
                AND donhang.ma_don_hang = $orderID
                GROUP BY sanpham.ma_san_pham, sanpham.ten_san_pham, sanpham.hinh_anh,
                chitiethoadon.don_gia, chitiethoadon.giam_gia_san_pham,
                chitiethoadon.thoi_gian_bao_hanh;";

        $rows2 = mysqli_query($this->conn, $sql);
        $order["danh_sach_san_pham_da_mua"] = [];

        while ($row2 = mysqli_fetch_assoc($rows2)) {
            $product = [];
            $product["ten_san_pham"] = $row2["ten_san_pham"];
            $product["hinh_anh"] = json_decode($row2["hinh_anh"], true)[0];
            $product["don_gia"] = (float) $row2["don_gia"];
            $product["giam_gia_san_pham"] = (int) $row2["giam_gia_san_pham"];
            $product["ten_san_pham"] = $row2["ten_san_pham"];
            $product["so_luong_da_mua"] = (int) $row2["so_luong_da_mua"];
            $product["thoi_gian_bao_hanh"] = (int) $row2["thoi_gian_bao_hanh"];

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
        $thoi_gian_dat_mua = date("Y-m-d H:i:s", (int) ($data["thoi_gian_dat_mua"] / 1000));
        $trang_thai = $data["trang_thai"];
        $hien_thi = (bool) $data["hien_thi"] ? 1 : 0;
        $sql = "UPDATE donhang 
                SET ma_khach_hang='$ma_khach_hang', ma_nhan_vien=" . ($ma_nhan_vien ? "'$ma_nhan_vien'" : "DEFAULT") . ", hinh_thuc_thanh_toan='$hinh_thuc_thanh_toan'
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
