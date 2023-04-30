<?php

class DetailOrderController
{
  public function __construct(private DetailOrderModel $detailOrderModel, private array $perArr)
  {
  }

  public function checkOrder(string $feature): bool
  {
    if (count($this->perArr) <= 0) {
      echo json_encode([
        "message" => "Do not have access"
      ]);
      return false;
    }

    $order = array_filter($this->perArr, function ($per) use ($feature) {
      $per = json_decode(json_encode($per), true);
      return $per["ten_chuc_nang"] == $feature;
    });


    if (!array_values($order)[0]["trang_thai_quyen_hang"]) {
      echo json_encode([
        "message" => "Do not have access"
      ]);
      return false;
    }

    return true;
  }

  public function processRequest(string $method, ?string $orderId, ?string $productId): void
  {
    if ($orderId && $productId) {
      $this->processResourceRequest($method, $orderId, $productId);
    } else {
      $this->processCollectionRequest($method);
    }
  }

  private function processResourceRequest(string $method, string $orderId, string $productId): void
  {
    $orderId = (int) $orderId;
    $productId = (int) $productId;

    $order = $this->detailOrderModel->get($orderId, $productId);

    if (!$order) {
      http_response_code(404);
      echo json_encode(["message" => "$order not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($order);
        break;
      case "PATCH":
        $isValid = $this->checkOrder("UPDATE");

        if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rows = $this->detailOrderModel->update($order, $data);

        echo json_encode([
          "message" => "Order updated",
          "rows" => $rows
        ]);
        break;
      case 'DELETE':
        $isValid = $this->checkOrder("DELETE");

        if (!$isValid) break;

        $rows = $this->detailOrderModel->delete($orderId, $productId);

        echo json_encode([
          "message" => "Order deleted",
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
        echo json_encode($this->detailOrderModel->getAll());
        break;
      case "POST":
        $isValid = $this->checkOrder("CREATE");

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

        $id = $this->detailOrderModel->create($data);

        echo json_encode([
          "message" => "Order created",
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
      // if (empty($data["ma_nhom_quyen"])) {
      //   $errors[] = "mã nhóm quyền là bắt buộc";
      // }

      // if (empty($data["ma_quyen_hang"])) {
      //   $errors[] = "mã quyền hạng là bắt buộc";
      // }

      // if (empty($data["ma_chuc_nang"])) {
      //   $errors[] = "mã chức năng là bắt buộc";
      // }
    }

    return $errors;
  }
}
