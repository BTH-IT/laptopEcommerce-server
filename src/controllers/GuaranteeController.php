<?php
class GuaranteeController
{
    public function __construct(private GuaranteeModel $guaranteeModel, private array $perArr)
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
        $id = (int) $id;

        $import = $this->guaranteeModel->get($id);

        if (!$import) {
            http_response_code(404);
            echo json_encode(["message" => "import not found"]);
            return;
        }

        switch ($method) {
            case "GET":
                // $isValid = $this->checkPermission("READ");

                // if (!$isValid) break;

                echo json_encode($import);
                break;
            case "PATCH":
                // $isValid = $this->checkPermission("UPDATE");

                // if (!$isValid) break;

                // lấy dữ liệu từ phía client gửi cho server (dạng json)
                $data = file_get_contents("php://input");

                // trả về array và nếu null thì array trở thành rỗng
                $data = (array) json_decode($data, true);

                $rows = $this->guaranteeModel->update($import, $data);

                echo json_encode([
                    "message" => "import $id updated",
                    "rows" => $rows
                ]);
                break;
            case 'DELETE':
                // $isValid = $this->checkPermission("DELETE");

                // if (!$isValid) break;

                $rows = $this->guaranteeModel->delete($id);

                echo json_encode([
                    "message" => "import $id deleted",
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
                // $isValid = $this->checkPermission("READ");

                // if (!$isValid) break;

                echo json_encode($this->guaranteeModel->getAll());
                break;
            case "POST":
                // $isValid = $this->checkPermission("CREATE");

                // if (!$isValid) break;

                // lấy dữ liệu từ phía client gửi cho server (dạng json)
                $data = file_get_contents("php://input");

                // trả về array và nếu null thì array trở thành rỗng
                $data = (array) json_decode($data, true);

                // $errors = $this->getValidationErrors($data);

                if (!empty($errors)) {
                    http_response_code(422);
                    echo json_encode(["errors" => $errors]);
                    break;
                }

                $id = $this->guaranteeModel->create($data);

                echo json_encode([
                    "message" => "import created",
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
            if (empty($data["ten_nguoi_dung"])) {
                $errors[] = "tên người dùng là bắt buộc";
            }

            if (empty($data["mat_khau"])) {
                $errors[] = "mật khẩu là bắt buộc";
            }
        }

        return $errors;
    }
}
