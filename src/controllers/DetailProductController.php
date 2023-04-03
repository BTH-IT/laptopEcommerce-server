<?php
class DetailProductController
{
  public function __construct(private DetailProductModel $detailProductModel)
  {
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
    $detailProduct = $this->detailProductModel->get($id);

    if (!$detailProduct) {
      http_response_code(404);
      echo json_encode(["message" => "detailProduct not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($detailProduct);
        break;
      case "PATCH":
        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rows = $this->detailProductModel->update($detailProduct, $data);

        echo json_encode([
          "message" => "detailProduct $id updated",
          "rows" => $rows
        ]);
        break;
      case 'DELETE':
        $rows = $this->detailProductModel->delete($id);

        echo json_encode([
          "message" => "detailProduct $id deleted",
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
        echo json_encode($this->detailProductModel->getAll());
        break;
      case "POST":
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

        $id = $this->detailProductModel->create($data);

        echo json_encode([
          "message" => "detailProduct created",
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
      // if (empty($data["ten_thuong_hieu"])) {
      //   $errors[] = "tên thương hiệu là bắt buộc";
      // }

      // if (empty($data["icon"])) {
      //   $errors[] = "icon thương hiệu là bắt buộc";
      // }

      // if (empty($data["hinh_anh"])) {
      //   $errors[] = "hình ảnh là bắt buộc";
      // }
    }

    return $errors;
  }
}
