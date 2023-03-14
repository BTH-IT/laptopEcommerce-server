<?php

// gần giống strict mode bên JS
declare(strict_types=1);

require_once "./src/utils/cors.php";
require_once "./src/config/Database.php";
require_once "./src/config/ErrorHandler.php";
require_once "./src/config/Middleware.php";

cors();

// hàm tự động require các file cần thiết vào file index.php
spl_autoload_register(function ($class) {
  if (file_exists(__DIR__ . "/src/controllers/$class.php")) {
    require_once __DIR__ . "/src/controllers/$class.php";
  };

  if (file_exists(__DIR__ . "/src/models/$class.php")) {
    require_once __DIR__ . "/src/models/$class.php";
  };
});

// hàm văng ra lỗi và dừng chương trình khi có lỗi + thực hiện hàm handleError trong ErrorHandler
set_error_handler("ErrorHandler::handleError");

// hàm văng ra ngoại lệ và dừng chương trình khi có ngoại lệ + thực hiện hàm handleException trong ErrorHandler
set_exception_handler("ErrorHandler::handleException");

// Cắt chuỗi theo kí tự slash
$url = explode("/", $_SERVER["REQUEST_URI"]);
$urlTarget = explode("?", $url[3]);

$database = new Database();

switch ($urlTarget[0]) {
  case "products":

    break;

  case "brands":

    break;

  case "users":

    break;

  case "orders":

    break;

  case "images":

    break;

  case "auth":

    break;
  default:
    http_response_code(404);
    exit;
}
