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
  case "guarantee":
    // $perAccounts = array_filter(
    //   $perArr,
    //   function ($per) {
    //     return $per["ten_quyen_hang"] == 'guarantee';
    //   }
    // );

    $perGuarantee = [];

    $id = $url[4] ?? null;

    $guaranteeModel = new GuaranteeModel($database->connect);

    $guaranteeController = new GuaranteeController($guaranteeModel, $perGuarantee);

    $guaranteeController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "products":
    $id = $url[4] ?? null;

    $perProducts = [];

    // $perProducts = array_filter(
    //   $perArr,
    //   function ($per) {
    //     return $per["ten_quyen_hang"] == 'products';
    //   }
    // );

    $productModel = new ProductModel($database->connect);

    $productController = new ProductController($productModel, $perProducts);

    $productController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "brands":

    $database->connect->close();
    break;

  case "accounts":

    $database->connect->close();
    break;

  case "customers":

    $database->connect->close();
    break;

  case "employees":

    $database->connect->close();
    break;

  case "orders":
    // $perAccounts = array_filter(
    //   $perArr,
    //   function ($per) {
    //     return $per["ten_quyen_hang"] == 'accounts';
    //   }
    // );

    $perOrders = [];

    $id = $url[4] ?? null;

    $orderModel = new OrderModel($database->connect);

    $orderController = new OrderController($orderModel, $perOrders);

    $orderController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "import-orders":
    // $perAccounts = array_filter(
    //   $perArr,
    //   function ($per) {
    //     return $per["ten_quyen_hang"] == 'accounts';
    //   }
    // );

    $perImportOrders = [];

    $id = $url[4] ?? null;

    $importOrderModel = new ImportOrderModel($database->connect);

    $importOrderController = new ImportOrderController($importOrderModel, $perImportOrders);

    $importOrderController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "images":
    // $perImages = array_filter(
    //   $perArr,
    //   function ($per) {
    //     return $per["ten_quyen_hang"] == 'images';
    //   }
    // );

    $id = $url[4] ?? null;

    $imageModel = new ImageModel($database->connect);

    $imageController = new ImageController($imageModel, $perImages);

    $imageController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "auth":
    $action = $url[4] ?? null;

    $authModel = new AuthModel($database->connect);

    $authController = new AuthController($authModel);

    $authController->processRequest($_SERVER["REQUEST_METHOD"], $action);

    $database->connect->close();
    break;

  case "auth-group":
    $perAuthGroups = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'auth-group';
      }
    );

    $id = $url[4] ?? null;

    $authGroupModel = new AuthGroupModel($database->connect);

    $authGroupController = new AuthGroupController($authGroupModel, $perAuthGroups);

    $authGroupController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "decentralization":
    $perDecentralization = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'decentralization';
      }
    );

    $roleId = $url[4] ?? null;
    $perId = $url[5] ?? null;
    $actionId = $url[6] ?? null;

    $detailPermissionModel = new DetailPermissionModel($database->connect);

    $detailPermissionController = new DetailPermissionController($detailPermissionModel, $perDecentralization);

    $detailPermissionController->processRequest($_SERVER["REQUEST_METHOD"], $roleId, $perId, $actionId);

    $database->connect->close();
    break;

  case "suppliers":
    // $perAccounts = array_filter(
    //   $perArr,
    //   function ($per) {
    //     return $per["ten_quyen_hang"] == 'suppliers';
    //   }
    // );

    $perSuppliers = [];

    $id = $url[4] ?? null;

    $supplierModel = new SupplierModel($database->connect);

    $supplierController = new SupplierController($supplierModel, $perSuppliers);

    $supplierController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  default:
    http_response_code(404);
    exit;
}
