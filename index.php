<?php
// gần giống strict mode bên JS
declare(strict_types=1);

require_once "./src/utils/cors.php";
require_once "./src/config/Database.php";
require_once "./src/config/Middleware.php";
require_once "./src/config/ErrorHandler.php";

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

$dataToken = decodeToken();

$perProducts = [];
$perArr = [];

if ($dataToken) {
  $data = $dataToken["data"];
  $perArr = json_decode(json_encode($data["permission"]), true);
}

switch ($urlTarget[0]) {
  case "guarantee":
    $id = $url[4] ?? null;

    $perGuarantee = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'guarantee';
      }
    );

    $guaranteeModel = new GuaranteeModel($database->connect);

    $guaranteeController = new GuaranteeController($guaranteeModel, $perGuarantee);

    $guaranteeController->processRequest($_SERVER["REQUEST_METHOD"], $id);


    $database->connect->close();
    break;
  case "products":
    $id = $url[4] ?? null;

    $perProducts = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'products';
      }
    );

    $productModel = new ProductModel($database->connect);

    $productController = new ProductController($productModel, $perProducts);

    $productController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "brands":
    $perBrands = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'brands';
      }
    );

    $id = $url[4] ?? null;

    $brandModel = new BrandModel($database->connect);

    $brandController = new BrandController($brandModel, $perBrands);

    $brandController->processRequest($_SERVER["REQUEST_METHOD"], $id);


    $database->connect->close();
    break;

  case "accounts":
    $perAccounts = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'accounts';
      }
    );

    $id = $url[4] ?? null;

    $accountModel = new AccountModel($database->connect);

    $accountController = new AccountController($accountModel, $perAccounts);

    $accountController->processRequest($_SERVER["REQUEST_METHOD"], $id);


    $database->connect->close();
    break;

  case "customers":
    $perCustomer = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'customers';
      }
    );

    $id = $url[4] ?? null;

    $customerModel = new CustomerModel($database->connect);

    $customerController = new CustomerController($customerModel, $perCustomer);

    $customerController->processRequest($_SERVER["REQUEST_METHOD"], $id);


    $database->connect->close();
    break;

  case "employees":
    $perEmployee = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'employees';
      }
    );

    $id = $url[4] ?? null;

    $employeeModel = new EmployeeModel($database->connect);

    $employeeController = new EmployeeController($employeeModel, $perEmployee);

    $employeeController->processRequest($_SERVER["REQUEST_METHOD"], $id);


    $database->connect->close();
    break;

  case "orders":
    $perOrders = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'orders';
      }
    );

    $id = $url[4] ?? null;

    $orderModel = new OrderModel($database->connect);

    $orderController = new OrderController($orderModel, $perOrders);

    $orderController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "detail-orders":
    $perOrders = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'orders';
      }
    );

    $orderId = $url[4] ?? null;
    $productId = $url[5] ?? null;

    $detailOrderModel = new DetailOrderModel($database->connect);

    $detailOrderController = new DetailOrderController($detailOrderModel, $perOrders);

    $detailOrderController->processRequest($_SERVER["REQUEST_METHOD"], $orderId, $productId);

    $database->connect->close();
    break;

  case "import-orders":
    $perImportOrders = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'import-orders';
      }
    );

    $id = $url[4] ?? null;

    $importOrderModel = new ImportOrderModel($database->connect);

    $importOrderController = new ImportOrderController($importOrderModel, $perImportOrders);

    $importOrderController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "images":
    $id = $url[4] ?? null;

    $imageModel = new ImageModel($database->connect);

    $imageController = new ImageController($imageModel);

    $imageController->processRequest($_SERVER["REQUEST_METHOD"], $id);

    $database->connect->close();
    break;

  case "detail-products":
    $id = $url[4] ?? null;

    $detailProductModel = new DetailProductModel($database->connect);

    $detailProductController = new DetailProductController($detailProductModel);

    $detailProductController->processRequest($_SERVER["REQUEST_METHOD"], $id);

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
        return $per["ten_quyen_hang"] == 'auth-groups';
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
    $perSuppliers = array_filter(
      $perArr,
      function ($per) {
        return $per["ten_quyen_hang"] == 'suppliers';
      }
    );

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
