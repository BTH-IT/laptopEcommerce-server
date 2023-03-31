<?php

class DetailPermissionController
{
  public function __construct(private DetailPermissionModel $detailPermissionModel, private array $perArr)
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

  public function processRequest(string $method, ?string $roleId, ?string $perId, ?string $actionId): void
  {
    if ($roleId && $perId && $actionId) {
      $this->processResourceRequest($method, $roleId, $perId, $actionId);
    } else {
      $this->processCollectionRequest($method);
    }
  }

  private function processResourceRequest(string $method, string $roleId, string $perId, string $actionId): void
  {
    $roleId = (int) $roleId;
    $perId = (int) $perId;
    $actionId = (int) $actionId;

    $permission = $this->detailPermissionModel->get($roleId, $perId, $actionId);

    if (!$permission) {
      http_response_code(404);
      echo json_encode(["message" => "permis$permission not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($permission);
        break;
      case "PATCH":
        $isValid = $this->checkPermission("UPDATE");

        if (!$isValid) break;

        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rows = $this->detailPermissionModel->update($permission, $data);

        echo json_encode([
          "message" => "permission updated",
          "rows" => $rows
        ]);
        break;
      case 'DELETE':
        $isValid = $this->checkPermission("DELETE");

        if (!$isValid) break;

        $rows = $this->detailPermissionModel->delete($roleId, $perId, $actionId);

        echo json_encode([
          "message" => "permission deleted",
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
        echo json_encode($this->detailPermissionModel->getAll());
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

        $id = $this->detailPermissionModel->create($data);

        echo json_encode([
          "message" => "permission created",
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
    }

    return $errors;
  }
}
