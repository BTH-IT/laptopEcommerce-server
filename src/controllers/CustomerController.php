<?php
class CustomerController
{
  public function __construct(private CustomerModel $customerModel, private array $perArr)
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
    $customer = $this->customerModel->get($id);

    if (!$customer) {
      http_response_code(404);
      echo json_encode(["message" => "customer not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($customer);
        break;
      case "PATCH":
        $isValid = $this->checkPermission("UPDATE");

        if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rs = $this->customerModel->update($customer, $data);

        http_response_code($rs["status"]);
        echo json_encode($rs);
        break;
      case 'DELETE':
        $isValid = $this->checkPermission("DELETE");

        if (!$isValid) break;

        $rows = $this->customerModel->delete($id);

        echo json_encode([
          "message" => "customer $id deleted",
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
        echo json_encode($this->customerModel->getAll());
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

        $rs = $this->customerModel->create($data);

        http_response_code($rs["status"]);
        echo json_encode($rs);
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
      if (empty($data["ten_khach_hang"])) {
        $errors[] = "tên khách hàng là bắt buộc";
      }

      if (empty($data["ngay_sinh"])) {
        $errors[] = "ngày sinh là bắt buộc";
      }

      if (empty($data["so_dien_thoai"])) {
        $errors[] = "số điện thoại là bắt buộc";
      }

      if (empty($data["dia_chi"])) {
        $errors[] = "địa chỉ là bắt buộc";
      }
    }

    return $errors;
  }
}
