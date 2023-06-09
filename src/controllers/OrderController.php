<?php
class OrderController
{
  public function __construct(private OrderModel $orderModel, private array $perArr)
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

    $order = $this->orderModel->get($id);

    if (!$order) {
      http_response_code(404);
      echo json_encode(["message" => "order not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        // $isValid = $this->checkPermission("READ");

        // if (!$isValid) break;

        echo json_encode($order);
        break;
      case "PATCH":
        // $isValid = $this->checkPermission("UPDATE");

        // if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        if (isset($data["trang_thai"]) && $data["trang_thai"] == "đã huỷ") {
          $rows = $this->orderModel->cancel($data);

          echo json_encode([
            "message" => "order $id canceled",
            "rows" => $rows
          ]);
        } else {
          $rows = $this->orderModel->update($order, $data);
  
          echo json_encode([
            "message" => "order $id updated",
            "rows" => $rows
          ]);
        }

        break;
      case 'DELETE':
        // $isValid = $this->checkPermission("DELETE");

        // if (!$isValid) break;

        $rows = $this->orderModel->delete($id);

        echo json_encode([
          "message" => "order $id deleted",
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
        // $isValid = $this->checkPermission("READ");

        // if (!$isValid) break;
        $query = $_SERVER['QUERY_STRING'];

        echo json_encode($this->orderModel->getAll($query));

        break;
      case "POST":
        // $isValid = $this->checkPermission("CREATE");

        // if (!$isValid) break;

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

        $id = $this->orderModel->create($data);

        echo json_encode([
          "message" => "order created",
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
      if (empty($data["thoi_gian_dat_mua"])) {
        $errors[] = "thời gian đặt mua là bắt buộc";
      }

      if (empty($data["ma_khach_hang"])) {
        $errors[] = "mã khách hàng là bắt buộc";
      }

      if (empty($data["hinh_thuc_thanh_toan"])) {
        $errors[] = "hình thức thanh toán là bắt buộc";
      }

      if (empty($data["trang_thai"])) {
        $errors[] = "trạng thái là bắt buộc";
      }
    }

    return $errors;
  }
}
