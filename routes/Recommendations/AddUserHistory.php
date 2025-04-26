<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\RecommendationsController;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user_id = $_POST["user_id"];
    $product_id = $_POST["product_id"];
    $action = $_POST["action"];

    $recommendationsController = new RecommendationsController($conn);
    $response = $recommendationsController->addUserHistory($user_id, $product_id, $action);

    if ($response["success"] === true) {
        echo json_encode($response);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Metódo não permitido"]);
}
