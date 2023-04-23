<?php

class AuthController
{
  public function __construct(private AuthModel $authModel)
  {
  }

  public function processRequest(string $method, string $action): void
  {
    switch ($method) {
      case "POST":
        if (method_exists("AuthModel", $action)) {
          // lấy dữ liệu từ phía client gửi cho server (dạng json)
          $data = file_get_contents("php://input");

          // trả về array và nếu null thì array trở thành rỗng
          $data = (array) json_decode($data, true);

          if (!empty($errors)) {
            http_response_code(422);
            echo json_encode(["errors" => $errors]);
            break;
          }

          $rs = call_user_func_array([$this->authModel, $action], [$data]);

          http_response_code($rs["status"]);
          echo json_encode($rs);
        } else {
          echo json_encode(["message" => "just allow login or register action"]);
        }
        break;
      default:
        http_response_code(405);
        header("Allow: POST");
    }
  }
}
