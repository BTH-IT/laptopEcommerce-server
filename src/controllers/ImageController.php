<?php
class ImageController
{
  public function __construct(private ImageModel $imageModel)
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
    $id = (int) $id;

    $image = $this->imageModel->get($id);

    if (!$image) {
      http_response_code(404);
      echo json_encode(["message" => "image not found"]);
      return;
    }

    switch ($method) {
      case "GET":
        echo json_encode($image);
        break;
      case "PATCH":
        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $rows = $this->imageModel->update($image, $data);

        echo json_encode([
          "message" => "image $id updated",
          "rows" => $rows
        ]);
        break;
      case 'DELETE':
        $rows = $this->imageModel->delete($id);

        echo json_encode([
          "message" => "image $id deleted",
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
        echo json_encode($this->imageModel->getAll());
        break;
      case "POST":
        // lấy dữ liệu từ phía client gửi cho server (dạng json)
        $data = file_get_contents("php://input");

        // trả về array và nếu null thì array trở thành rỗng
        $data = (array) json_decode($data, true);

        $id = $this->imageModel->create($data);

        echo json_encode([
          "message" => "image created",
          "id" => $id
        ]);
        break;
      default:
        http_response_code(405);
        header("Allow: GET, POST");
    }
  }
}
