<?php
require_once "./src/config/Database.php";
require_once "./src/controllers/AccountController.php";
require_once "./src/models/AccountModel.php";

class PHPUnitTest extends \PHPUnit\Framework\TestCase {
	public function testCheckPermission() {
		$database = new Database();

		$perAccounts = array_filter(
				[],
				function ($per) {
						return $per["ten_quyen_hang"] == 'accounts';
				}
		);

		$accountModel = new AccountModel($database->connect);

		$accountController = new AccountController($accountModel, $perAccounts);

		$result = $accountController->checkPermission("accounts");

		$this->assertEquals(false, $result);
	}

	public function testGetAllAccounts() {
		$database = new Database();

		$accountModel = new AccountModel($database->connect);

		$result = $accountModel->getAll();

		$this->assertIsArray($result);
		$this->assertNotEmpty($result);
	}

	public function testGetAnAccount() {
		$database = new Database();

		$accountModel = new AccountModel($database->connect);

		$result = $accountModel->get("bttan");

		$this->assertIsArray($result);
		$this->assertNotEmpty($result);
	}

	public function testDeleteAnAccount() {
		$database = new Database();

		$accountModel = new AccountModel($database->connect);

		$result = $accountModel->delete("123123");

		$this->assertSame("success", $result);
	}

	public function testUpdateAnAccount() {
		$database = new Database();

		
		$accountModel = new AccountModel($database->connect);
		
		$account = $accountModel->get("bttan");

		$data=[];

		$data["ten_dang_nhap"] = "bttan";
    $data["ma_nhom_quyen"] = 0;
    $data["mat_khau"] = $account["mat_khau"];

		$rs = $accountModel->update($account, $data);

		$this->assertSame(200, $rs["status"]);
	}
}