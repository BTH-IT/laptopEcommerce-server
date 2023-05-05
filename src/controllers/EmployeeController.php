<?php
class EmployeeController
{
  public function __construct(private EmployeeModel $employeeModel, private array $perArr)
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
    $employee = $this->employeeModel->get($id);

    if (!$employee) {
      http_response_code(404);
      echo json_encode(["message" => "employee not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($employee);
        break;
      case "PATCH":
        $isValid = $this->checkPermission("UPDATE");

        if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rows = $this->employeeModel->update($employee, $data);

        echo json_encode([
          "message" => "employee $id updated",
          "rows" => $rows
        ]);
        break;
      case 'DELETE':
        $isValid = $this->checkPermission("DELETE");

        if (!$isValid) break;

        $rows = $this->employeeModel->delete($id);

        echo json_encode([
          "message" => "employee $id deleted",
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
        if (isset($_SERVER["QUERY_STRING"])) {
          echo json_encode($this->employeeModel->getAll($_SERVER["QUERY_STRING"]));
          break;
        }
        echo json_encode($this->employeeModel->getAll());
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

        $id = $this->employeeModel->create($data);

        echo json_encode([
          "message" => "employee created",
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
      if (empty($data["ten_nhan_vien"])) {
        $errors[] = "tên nhân viên là bắt buộc";
      }

      if (empty($data["ngay_sinh"])) {
        $errors[] = "ngày sinh là bắt buộc";
      }

      if (empty($data["gioi_tinh"])) {
        $errors[] = "giới tính là bắt buộc";
      }

      if (empty($data["so_dien_thoai"])) {
        $errors[] = "số điện thoại là bắt buộc";
      } else {
        if (preg_match('/^[0-9]{10}+$/', $data["so_dien_thoai"])) {
          $errors[] = "số điện thoại không đúng";
        }
      }

      if (empty($data["muc_luong"])) {
        $errors[] = "mức lương là bắt buộc";
      } else {
        if ($data["muc_luong"] < 0) {
          $errors[] = "mức lương phải là một số và số đó lớn hơn hoặc bằng 0";
        }
      }
    }

    return $errors;
  }
}
