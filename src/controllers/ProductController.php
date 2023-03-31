<?php
class ProductController
{
  public function __construct(private ProductModel $productModel, private array $perArr)
  {
  }

  public function checkPermission(string $feature): bool
  {
    if (count($this->perArr) <= 0) {
      echo json_encode([
        "message" => "Do not have access"
      ]);
      return false;
    }

    $permission = array_filter($this->perArr, function ($per) use ($feature) {
      $per = json_decode(json_encode($per), true);
      return $per["ten_chuc_nang"] == $feature;
    });


    if (!array_values($permission)[0]["trang_thai_quyen_hang"]) {
      echo json_encode([
        "message" => "Do not have access"
      ]);
      return false;
    }

    return true;
  }

  public function processRequest(string $method, ?string $id): void
  {
    if ($id) {
      $this->processResourceRequest($method, $id);
    } else {
      $this->processCollectionRequest($method);
    }
  }

  private function processResourceRequest(string $method, string $id): void
  {
    $id = (int) $id;

    $product = $this->productModel->get($id);

    if (!$product) {
      http_response_code(404);
      echo json_encode(["message" => "Product not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($product);
        break;
      case "PATCH":
        $isValid = $this->checkPermission("UPDATE");

        if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rows = $this->productModel->update($product, $data);

        echo json_encode([
          "message" => "Product $id updated",
          "rows" => $rows
        ]);
        break;
      case 'DELETE':
        $isValid = $this->checkPermission("DELETE");

        if (!$isValid) break;

        $rows = $this->productModel->delete($id);

        echo json_encode([
          "message" => "Product $id deleted",
          "rows" => $rows
        ]);
        break;
      default:
        http_response_code(405);
        header("Allow: GET, PATCH, DELETE");
    }
  }

  private function processCollectionRequest(string $method): void
  {
    switch ($method) {
      case "GET":
        $query = $_SERVER["QUERY_STRING"];
        if ($query && !str_contains($query, "search")) {
          echo json_encode($this->productModel->getAllWithParams($query));
        } else {
          echo json_encode($this->productModel->getAll());
        }
        break;
      case "POST":
        $isValid = $this->checkPermission("CREATE");

        if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $errors = $this->getValidationErrors($data);

        if (!empty($errors)) {
          http_response_code(422);
          echo json_encode(["errors" => $errors]);
          break;
        }

        $id = $this->productModel->create($data);

        echo json_encode([
          "message" => "Product created",
          "id" => $id
        ]);
        break;
      default:
        http_response_code(405);
        header("Allow: GET, POST");
    }
  }

  private function getValidationErrors(array $data, bool $is_new = true): array
  {
    $errors = [];

    if ($is_new) {
      if (empty($data["ten_san_pham"])) {
        $errors[] = "tên sản phẩm là bắt buộc";
      }

      if (empty($data["hinh_anh"])) {
        $errors[] = "hình ảnh sản phẩm là bắt buộc";
      }

      if (empty($data["bao_hanh"])) {
        $errors[] = "bảo hành là bắt buộc";
      }

      if (empty($data["gia_goc"])) {
        $errors[] = "giá gốc là bắt buộc";
      }

      if (empty($data["thuong_hieu"])) {
        $errors[] = "Thương hiệu là bắt buộc";
      }

      if (empty($data["created_at"])) {
        $errors[] = "thời gian tạo là bắt buộc";
      }

      if (empty($data["the_he_cpu"])) {
        $errors[] = "thế hệ cpu là bắt buộc";
      }

      if (empty($data["cpu"])) {
        $errors[] = "cpu là bắt buộc";
      }

      if (empty($data["series_cpu"])) {
        $errors[] = "series cpu là bắt buộc";
      }

      if (empty($data["chip_do_hoa_roi"])) {
        $errors[] = "chip đồ họa rời là bắt buộc";
      }

      if (empty($data["ten_ram"])) {
        $errors[] = "tên ram là bắt buộc";
      }

      if (empty($data["man_hinh"])) {
        $errors[] = "màn hình là bắt buộc";
      }

      if (empty($data["luu_tru"])) {
        $errors[] = "lưu trữ là bắt buộc";
      }

      if (empty($data["so_cong_luu_tru_toi_da"])) {
        $errors[] = "số cổng lưu trữ tối đa là bắt buộc";
      }

      if (empty($data["kieu_khe_m2_ho_tro"])) {
        $errors[] = "kiểu khe M.2 hỗ trợ là bắt buộc";
      }

      if (empty($data["cong_xuat_hinh"])) {
        $errors[] = "cổng xuất hình là bắt buộc";
      }

      if (empty($data["cong_ket_noi"])) {
        $errors[] = "cổng kêt nối là bắt buộc";
      }

      if (empty($data["ket_noi_khong_day"])) {
        $errors[] = "kết nối không dây là bắt buộc";
      }

      if (empty($data["ban_phim"])) {
        $errors[] = "bàn phím là bắt buộc";
      }

      if (empty($data["he_dieu_hanh"])) {
        $errors[] = "hệ điều hành là bắt buộc";
      }

      if (empty($data["kich_thuoc"])) {
        $errors[] = "kích thước là bắt buộc";
      }

      if (empty($data["pin"])) {
        $errors[] = "pin là bắt buộc";
      }

      if (empty($data["khoi_luong"])) {
        $errors[] = "khối lượng là bắt buộc";
      }

      if (empty($data["series_laptop"])) {
        $errors[] = "series laptop là bắt buộc";
      }

      if (empty($data["part_number"])) {
        $errors[] = "part_number là bắt buộc";
      }

      if (empty($data["mau_sac"])) {
        $errors[] = "màu sắc là bắt buộc";
      }

      if (empty($data["so_luong"])) {
        $errors[] = "số lượng là bắt buộc";
      }

      if (empty($data["phu_kien_di_kem"])) {
        $errors[] = "phụ kiện đi kèm là bắt buộc";
      }

      if (empty($data["dung_luong_ram"])) {
        $errors[] = "dung lượng ram là bắt buộc";
      }
    }

    return $errors;
  }
}
