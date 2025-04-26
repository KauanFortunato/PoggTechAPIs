<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\CategoryController;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $category_id = $_POST["category_id"];

    $categoryController = new CategoryController($conn);
    $response = $categoryController->getCategory($category_id);

    if ($response['success'] === true) {
        echo json_encode($response["category"]);
    } else {
        echo json_encode($response);
    }
} else {
    return json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
