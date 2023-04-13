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
                $product["ma_san_pham"] = $row2["ma_san_pham"];
                $product["ma_chi_tiet_san_pham"] = $row2["ma_chi_tiet_san_pham"];
                $product["ten_san_pham"] = $row2["ten_san_pham"];
                $product["hinh_anh"] = json_decode($row2["hinh_anh"], true);
                $product["don_gia"] = (double) $row2["don_gia"];
                $product["giam_gia_san_pham"] = (int) $row2["giam_gia_san_pham"];
                $product["thoi_gian_bao_hanh"] = (int) $row2["thoi_gian_bao_hanh"];

                $order["danh_sach_san_pham_da_mua"][] = $product;
            }

            $data[] = $order;
        }

        return $data;
    }

    public function getAllWithQuery($query): array
    {
        try {
            $order_type = $query["order_type"];
        } catch (Exception $e) {
            $order_type = "";
        }
        try {
            $start = $query["start"] == 0 ? 0 : date("Y-m-d H:i:s", (int) ($query["start"] / 1000));
        } catch (Exception $e) {
            $start = "";
        }
        try {
            $end = $query["end"] == 0 ? 0 : date("Y-m-d H:i:s", (int) ($query["end"] / 1000));
        } catch (Exception $e) {
            $end = "";
        }

        if (!empty($order_type)) {
            if ($order_type == "waiting") {
                $order_type = "Chờ xử lý";
            } else if ($order_type == "shipping") {
                $order_type = "Đang giao";
            } else if ($order_type == "completed") {
                $order_type = "Hoàn thành";
            } else if ($order_type == "canceled") {
                $order_type = "Đã huỷ";
            }
        }

        if (!empty($order_type)) {
            if (!empty($start) && !empty($end)) {
                $sql = "SELECT * FROM donhang as dh WHERE " . ($order_type == "all" ? "" : "dh.trang_thai='$order_type' AND ") . "DATE(dh.thoi_gian_dat_mua) BETWEEN '$start' AND '$end'";
            } else {
                $sql = "SELECT * FROM donhang as dh " . ($order_type == "all" ? "" : "WHERE dh.trang_thai='$order_type'");
            }
        } else if (!empty($start) && !empty($end)) {
            $sql = "SELECT * FROM donhang as dh WHERE DATE(dh.thoi_gian_dat_mua) BETWEEN '$start' AND '$end'";
        } else {
            return $this->getAll();
        }

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
                $product["ma_san_pham"] = $row2["ma_san_pham"];
                $product["ma_chi_tiet_san_pham"] = $row2["ma_chi_tiet_san_pham"];
                $product["ten_san_pham"] = $row2["ten_san_pham"];
                $product["hinh_anh"] = json_decode($row2["hinh_anh"], true);
                $product["don_gia"] = (double) $row2["don_gia"];
                $product["giam_gia_san_pham"] = (int) $row2["giam_gia_san_pham"];
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
                $so_luong = (int) $product["so_luong_da_mua"];
                for ($i = 1; $i <= $so_luong; $i++) {
                    $ma_san_pham = (int) $product["ma_san_pham"];

                    $query1 = "SELECT * FROM chitietsanpham WHERE ma_san_pham = $ma_san_pham LIMIT 1";
                    $row1 = mysqli_query($this->conn, $query1);
                    $data1 = mysqli_fetch_assoc($row1);
                    $ma_chi_tiet_san_pham = $data1["ma_chi_tiet_san_pham"];
                    $delQuery = "DELETE FROM chitietsanpham WHERE ma_chi_tiet_san_pham='$ma_chi_tiet_san_pham';";
                    $this->conn->query($delQuery);

                    $don_gia = (double) $product["don_gia"];
                    $giam_gia_san_pham = (int) $product["giam_gia_san_pham"];

                    $query2 = "SELECT * FROM sanpham WHERE ma_san_pham = $ma_san_pham";
                    $row2 = mysqli_query($this->conn, $query2);
                    $data2 = mysqli_fetch_assoc($row2);
                    $thoi_gian_bao_hanh = $data2["bao_hanh"];

                    $sql = "INSERT INTO chitiethoadon (`ma_san_pham`, `ma_chi_tiet_san_pham`, `ma_don_hang`, `don_gia`, `giam_gia_san_pham`, `thoi_gian_bao_hanh`) 
                            VALUES ($ma_san_pham, '$ma_chi_tiet_san_pham', $ma_don_hang, $don_gia, $giam_gia_san_pham, $thoi_gian_bao_hanh);";
                    $result = $this->conn->query($sql);
                }

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
            $product["ma_chi_tiet_san_pham"] = $row2["ma_chi_tiet_san_pham"];
            $product["ten_san_pham"] = $row2["ten_san_pham"];
            $product["hinh_anh"] = $row2["hinh_anh"];
            $product["don_gia"] = (double) $row2["don_gia"];
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

    public function delete($id): string
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