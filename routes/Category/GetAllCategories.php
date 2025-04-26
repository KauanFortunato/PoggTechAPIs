<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\CategoryController;

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $categoryController = new CategoryController($conn);
    $response = $categoryController->getAllCategories();


    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Sugestões encontradas", "data" => $response["categories"]]);
    } else {
        echo json_encode(["success" => false, "message" => $response]);
    }
} else {
    return json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
