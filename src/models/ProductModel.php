<?php
class ProductModel
{

  public function __construct(private mysqli $conn)
  {
  }

  public function getAll(): array
  {
    $search = $_GET["search"] ?? null;
    $searching = $_GET["searching"] ?? null;

    $sql = "SELECT * FROM sanpham WHERE hien_thi=1";

    if ($search) {
      $sql .= " AND `ten_san_pham` LIKE '%$search%'";
    }

    if ($searching) {
      $sql .= " AND ma_san_pham LIKE '%$searching%' OR ten_san_pham LIKE '%$searching%' OR thuong_hieu LIKE '%$searching%'";
    }

    $sortName = $_GET["sortName"] ?? "ma_san_pham";
    $sortAction = $_GET["sortAction"] ?? "";

    switch ($sortName) {
      case 'ma_san_pham':
        $sql .= " ORDER BY ma_san_pham " . "$sortAction;";
        break;

      case 'ten_san_pham':
        $sql .= " ORDER BY ten_san_pham " . "$sortAction;";
        break;
    }

    $result = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($result)) {
      $row["ma_san_pham"] = (int) $row["ma_san_pham"];
      $row["man_hinh_cam_ung"] = (bool) $row["man_hinh_cam_ung"];
      $row["hinh_anh"] = json_decode($row["hinh_anh"], true);
      $row["bao_hanh"] = (int) $row["bao_hanh"];
      $row["khoi_luong"] = (float) $row["khoi_luong"];
      $row["gia_goc"] = (float) $row["gia_goc"];
      $row["giam_gia"] = (int) $row["giam_gia"] ?? null;
      $row["created_at"] = strtotime($row["created_at"]);
      $row["updated_at"] = $row["updated_at"] ? strtotime($row["updated_at"]) : null;
      $row["dung_luong_ram"] = (int) $row["dung_luong_ram"];
      $row["so_luong_da_ban"] = (int) $row["so_luong_da_ban"];
      $row["noi_bat"] = (bool) $row["noi_bat"];
      $row["hien_thi"] = (bool) $row["hien_thi"];

      $id = $row["ma_san_pham"];
      $sql = "SELECT COUNT(ma_san_pham) AS so_luong FROM chitietsanpham
              WHERE ma_san_pham=$id GROUP BY ma_san_pham;";

      $result1 = mysqli_query($this->conn, $sql);

      if ($result1->num_rows <= 0) {
        $row["so_luong"] = 0;
      } else {
        $row1 = mysqli_fetch_assoc($result1);

        $row["so_luong"] = (int) $row1["so_luong"];
      }



      $data[] = $row;
    }


    return [
      "data" => $data,
    ];
  }

  private function handleValueLikeSameParam($key, $param)
  {
    $str = "";
    if (str_contains($param, '%')) {
      $paramArr = explode("%", $param);
      $value = $paramArr[0];
      $str .= "(`$key` LIKE '%$value%'";

      for ($i = 1; $i < count($paramArr); $i++) {
        $value = $paramArr[$i];
        $str .= " OR `$key` LIKE '%$value%'";
      }

      $str .= ")";
    } else {
      $str .= "`$key` LIKE '%$param%'";
    }

    return $str;
  }

  private function handleValueEqualSameParam($key, $param)
  {
    $str = "";
    if (str_contains($param, '%')) {
      $paramArr = explode("%", $param);
      $value = $paramArr[0];
      $str .= "(`$key` = '$value'";

      for ($i = 1; $i < count($paramArr); $i++) {
        $value = $paramArr[$i];
        $str .= " OR `$key` = '$value'";
      }

      $str .= ")";
    } else {
      $str .= "`$key` = '$param'";
    }

    return $str;
  }

  private function handleParams($sql)
  {
    $name = $_GET["name"] ?? null;
    $brand = $_GET["thuong_hieu"] ?? null;
    $seriesLaptop = $_GET["series_laptop"] ?? null;
    $color = $_GET["mau_sac"] ?? null;
    $seriesCPU = $_GET["series_cpu"] ?? null;
    $chip = $_GET["chip_do_hoa_roi"] ?? null;
    $sizeRam = isset($_GET["dung_luong_ram"]) ? (int) $_GET["dung_luong_ram"] : null;
    $weight = isset($_GET["khoi_luong"]) ? (float) $_GET["khoi_luong"] : null;
    $sort = $_GET["sort"] ?? null;
    $minPrice = isset($_GET["min_price"]) ? (float) $_GET["min_price"] : null;
    $maxPrice = isset($_GET["max_price"]) ? (float) $_GET["max_price"] : null;
    $outstanding = isset($_GET["noi_bat"]) ? 1 : null;

    $whereArr = [];

    if ($outstanding) {
      $whereArr[] = "noi_bat=1";
    }

    if (($minPrice == 0 || $minPrice) && $maxPrice) {
      $whereArr[] = "(`gia_goc` >= $minPrice AND `gia_goc` <= $maxPrice)";
    }

    if ($brand) {
      $whereArr[] = $this->handleValueEqualSameParam('thuong_hieu', $brand);
    }

    if ($seriesLaptop) {
      $whereArr[] = $this->handleValueEqualSameParam('series_laptop', $seriesLaptop);
    }

    if ($chip) {
      $whereArr[] = $this->handleValueEqualSameParam('chip_do_hoa_roi', $chip);
    }

    if ($color) {
      $whereArr[] = $this->handleValueEqualSameParam('mau_sac', $color);
    }

    if ($seriesCPU) {
      $whereArr[] = $this->handleValueEqualSameParam('series_cpu', $seriesCPU);
    }

    if ($sizeRam) {
      $whereArr[] = $this->handleValueEqualSameParam('dung_luong_ram', $sizeRam);
    }

    if ($weight) {
      $whereArr[] = $this->handleValueEqualSameParam('khoi_luong', $weight);
    }

    if ($name) {
      $whereArr[] = $this->handleValueLikeSameParam('ten_san_pham', $name);
    }

    for ($i = 0; $i < count($whereArr); $i++) {
      $value = $whereArr[$i];
      $sql .= " AND $value";
    }

    switch ($sort) {
      case 'sale':
        $sql .= " ORDER BY `giam_gia` DESC";
        break;
      case 'bestseller':
        $sql .= " ORDER BY `so_luong_da_ban` DESC";
        break;
      case 'new':
        $sql .= " ORDER BY `created_at` DESC";
        break;
      case 'desc':
        $sql .= " ORDER BY `gia_goc` DESC";
        break;
      case 'asc':
        $sql .= " ORDER BY `gia_goc` ASC";
        break;
    }

    return $sql;
  }

  public function getAllWithParams(): array
  {

    $limit = isset($_GET["_limit"]) ? (int) $_GET["_limit"] : 16;
    $page = isset($_GET["_page"]) ? (int) $_GET["_page"] - 1 : 0;

    $sql = "SELECT * FROM sanpham WHERE hien_thi=1";

    $sql = $this->handleParams($sql);

    $amount = $page * $limit;

    $sql .= " LIMIT $limit OFFSET $amount;";

    $result = mysqli_query($this->conn, $sql);

    $data = [];

    while ($row = mysqli_fetch_assoc($result)) {
      $row["ma_san_pham"] = (int) $row["ma_san_pham"];
      $row["man_hinh_cam_ung"] = (bool) $row["man_hinh_cam_ung"];
      $row["hinh_anh"] = json_decode($row["hinh_anh"]);
      $row["bao_hanh"] = (int) $row["bao_hanh"];
      $row["khoi_luong"] = (float) $row["khoi_luong"];
      $row["gia_goc"] = (float) $row["gia_goc"];
      $row["giam_gia"] = (int) $row["giam_gia"] ?? null;
      $row["created_at"] = strtotime($row["created_at"]);
      $row["updated_at"] = $row["updated_at"] ? strtotime($row["updated_at"]) : null;
      $row["dung_luong_ram"] = (int) $row["dung_luong_ram"];
      $row["so_luong_da_ban"] = (int) $row["so_luong_da_ban"];
      $row["noi_bat"] = (bool) $row["noi_bat"];
      $row["hien_thi"] = (bool) $row["hien_thi"];

      $id = $row["ma_san_pham"];
      $sql = "SELECT COUNT(ma_san_pham) AS so_luong FROM chitietsanpham
              WHERE ma_san_pham=$id GROUP BY ma_san_pham;";

      $result1 = mysqli_query($this->conn, $sql);

      if ($result1->num_rows <= 0) {
        $row["so_luong"] = 0;
      } else {
        $row1 = mysqli_fetch_assoc($result1);

        $row["so_luong"] = (int) $row1["so_luong"];
      }

      $data[] = $row;
    }

    $sql = "SELECT * FROM sanpham WHERE hien_thi=1";

    $sql = $this->handleParams($sql);

    $result = mysqli_query($this->conn, $sql);

    $rowCount = mysqli_num_rows($result);


    return [
      "data" => $data,
      "pagination" => [
        "_page" => $page + 1,
        "_limit" => $limit,
        "_totalRows" => $rowCount,
      ]
    ];
  }

  public function create($data): string
  {
    $ten_san_pham = $data["ten_san_pham"];
    $hinh_anh = json_encode($data["hinh_anh"]);
    $bao_hanh = (int) $data["bao_hanh"];
    $gia_goc = (float) $data["gia_goc"];
    $giam_gia = (int) $data["giam_gia"];
    $mo_ta_san_pham = $data["mo_ta_san_pham"];
    $thuong_hieu = $data["thuong_hieu"];
    $created_at = date("Y-m-d H:i:s", intval($data["created_at"] / 1000));
    $the_he_cpu = $data["the_he_cpu"];
    $cpu = $data["cpu"];
    $series_cpu = $data["series_cpu"];
    $chip_do_hoa_roi = $data["chip_do_hoa_roi"];
    $ten_ram = $data["ten_ram"];
    $man_hinh = $data["man_hinh"];
    $luu_tru = $data["luu_tru"];
    $so_cong_luu_tru_toi_da = $data["so_cong_luu_tru_toi_da"];
    $kieu_khe_m2_ho_tro = $data["kieu_khe_m2_ho_tro"];
    $cong_xuat_hinh = $data["cong_xuat_hinh"];
    $cong_ket_noi = $data["cong_ket_noi"];
    $ket_noi_khong_day = $data["ket_noi_khong_day"];
    $ban_phim = $data["ban_phim"];
    $he_dieu_hanh = $data["he_dieu_hanh"];
    $kich_thuoc = $data["kich_thuoc"];
    $pin = $data["pin"];
    $khoi_luong = (int) $data["khoi_luong"];
    $series_laptop = $data["series_laptop"];
    $part_number = $data["part_number"];
    $mau_sac = $data["mau_sac"];
    $phu_kien_di_kem = $data["phu_kien_di_kem"];
    $den_led = $data["den_led"];
    $man_hinh_cam_ung = (bool) $data["man_hinh_cam_ung"] ? 1 : 0;
    $dung_luong_ram = (int) $data["dung_luong_ram"];
    $so_luong_da_ban = 0;
    $noi_bat = 0;

    $sql = "INSERT INTO sanpham (`ten_san_pham`, `hinh_anh`, `bao_hanh`, `gia_goc`, `giam_gia`,
            `mo_ta_san_pham`, `thuong_hieu`, `created_at`, `the_he_cpu`, `cpu`, `series_cpu`,
            `chip_do_hoa_roi`, `ten_ram`, `man_hinh`, `luu_tru`, `so_cong_luu_tru_toi_da`,
            `kieu_khe_m2_ho_tro`, `cong_xuat_hinh`, `cong_ket_noi`, `ket_noi_khong_day`,
            `ban_phim`, `he_dieu_hanh`, `kich_thuoc`, `pin`, `khoi_luong`, `series_laptop`,
            `part_number`, `mau_sac`, `phu_kien_di_kem`, `den_led`, `man_hinh_cam_ung`,
            `dung_luong_ram`, `so_luong_da_ban`, `noi_bat`)
            VALUES ('$ten_san_pham', '$hinh_anh', $bao_hanh, $gia_goc, $giam_gia, '$mo_ta_san_pham',
            '$thuong_hieu', '$created_at', '$the_he_cpu', '$cpu', '$series_cpu', '$chip_do_hoa_roi',
            '$ten_ram', '$man_hinh', '$luu_tru', '$so_cong_luu_tru_toi_da', '$kieu_khe_m2_ho_tro',
            '$cong_xuat_hinh', '$cong_ket_noi', '$ket_noi_khong_day', '$ban_phim', '$he_dieu_hanh',
            '$kich_thuoc', '$pin', $khoi_luong, '$series_laptop', '$part_number', '$mau_sac',
            '$phu_kien_di_kem', '$den_led', $man_hinh_cam_ung, $dung_luong_ram,
            $so_luong_da_ban, $noi_bat);";

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
    $sql = "SELECT * FROM sanpham WHERE ma_san_pham=$id AND hien_thi=1";

    $result = $this->conn->query($sql);

    if ($result->num_rows <= 0) return false;

    $data = mysqli_fetch_assoc($result);

    $data["ma_san_pham"] = (int) $data["ma_san_pham"];
    $data["hinh_anh"] = json_decode($data["hinh_anh"]);
    $data["bao_hanh"] = (int) $data["bao_hanh"];
    $data["gia_goc"] = (float) $data["gia_goc"];
    $data["giam_gia"] = (int) $data["giam_gia"];
    $data["created_at"] = strtotime($data["created_at"]);
    $data["khoi_luong"] = (int) $data["khoi_luong"];
    $data["man_hinh_cam_ung"] = (bool) $data["man_hinh_cam_ung"] ? 1 : 0;
    $data["dung_luong_ram"] = (int) $data["dung_luong_ram"];
    $data["so_luong_da_ban"] = (int) $data["so_luong_da_ban"];
    $data["noi_bat"] = (bool) $data["noi_bat"];
    $data["hien_thi"] = (bool) $data["hien_thi"];

    $id = $data["ma_san_pham"];
    $sql = "SELECT COUNT(ma_san_pham) AS so_luong FROM chitietsanpham
              WHERE ma_san_pham=$id GROUP BY ma_san_pham;";

    $result = mysqli_query($this->conn, $sql);

    if ($result->num_rows <= 0) {
      $data["so_luong"] = 0;
    } else {
      $row = mysqli_fetch_assoc($result);

      $data["so_luong"] = (int) $row["so_luong"];
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

    $ma_san_pham = (int) $data["ma_san_pham"];
    $ten_san_pham = $data["ten_san_pham"];
    $hinh_anh = json_encode($data["hinh_anh"]);
    $bao_hanh = (int) $data["bao_hanh"];
    $gia_goc = (float) $data["gia_goc"];
    $giam_gia = (int) $data["giam_gia"];
    $mo_ta_san_pham = $data["mo_ta_san_pham"];
    $thuong_hieu = $data["thuong_hieu"];
    $updated_at = date("Y-m-d H:i:s", strtotime("now"));
    $the_he_cpu = $data["the_he_cpu"];
    $cpu = $data["cpu"];
    $series_cpu = $data["series_cpu"];
    $chip_do_hoa_roi = $data["chip_do_hoa_roi"];
    $ten_ram = $data["ten_ram"];
    $man_hinh = $data["man_hinh"];
    $luu_tru = $data["luu_tru"];
    $so_cong_luu_tru_toi_da = $data["so_cong_luu_tru_toi_da"];
    $kieu_khe_m2_ho_tro = $data["kieu_khe_m2_ho_tro"];
    $cong_xuat_hinh = $data["cong_xuat_hinh"];
    $cong_ket_noi = $data["cong_ket_noi"];
    $ket_noi_khong_day = $data["ket_noi_khong_day"];
    $ban_phim = $data["ban_phim"];
    $he_dieu_hanh = $data["he_dieu_hanh"];
    $kich_thuoc = $data["kich_thuoc"];
    $pin = $data["pin"];
    $khoi_luong = (int) $data["khoi_luong"];
    $series_laptop = $data["series_laptop"];
    $part_number = $data["part_number"];
    $mau_sac = $data["mau_sac"];
    $phu_kien_di_kem = $data["phu_kien_di_kem"];
    $den_led = $data["den_led"];
    $man_hinh_cam_ung = (bool) $data["man_hinh_cam_ung"] ? 1 : 0;
    $dung_luong_ram = (int) $data["dung_luong_ram"];
    $so_luong_da_ban = (int) $data["so_luong_da_ban"];
    $noi_bat = (bool) $data["noi_bat"] ? 1 : 0;

    $sql = "UPDATE sanpham SET ten_san_pham='$ten_san_pham', hinh_anh='$hinh_anh',
            bao_hanh=$bao_hanh, gia_goc=$gia_goc, giam_gia=$giam_gia, mo_ta_san_pham='$mo_ta_san_pham',
            thuong_hieu='$thuong_hieu', updated_at='$updated_at', the_he_cpu='$the_he_cpu', cpu='$cpu',
            series_cpu='$series_cpu', chip_do_hoa_roi='$chip_do_hoa_roi', ten_ram='$ten_ram',
            man_hinh='$man_hinh', luu_tru='$luu_tru', so_cong_luu_tru_toi_da='$so_cong_luu_tru_toi_da',
            kieu_khe_m2_ho_tro='$kieu_khe_m2_ho_tro', cong_xuat_hinh='$cong_xuat_hinh', cong_ket_noi='$cong_ket_noi',
            ket_noi_khong_day='$ket_noi_khong_day', ban_phim='$ban_phim', he_dieu_hanh='$he_dieu_hanh',
            kich_thuoc='$kich_thuoc', pin='$pin', khoi_luong=$khoi_luong, series_laptop='$series_laptop',
            part_number='$part_number', mau_sac='$mau_sac', phu_kien_di_kem='$phu_kien_di_kem',
            den_led='$den_led', man_hinh_cam_ung=$man_hinh_cam_ung, dung_luong_ram=$dung_luong_ram,
            so_luong_da_ban=$so_luong_da_ban, noi_bat=$noi_bat WHERE ma_san_pham=$ma_san_pham;";

    $result = mysqli_query($this->conn, $sql);

    if ($result) {
      return "Update Successful";
    } else {
      return $this->conn->error;
    }
  }

  public function delete(int $id): string
  {
    $sql = "UPDATE sanpham SET hien_thi=0 WHERE ma_san_pham=$id;";

    $result = mysqli_query($this->conn, $sql);


    if ($result) {
      return "Delete successfull";
    } else {
      return $this->conn->error;
    }
  }
}
