<?php
require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\UserController;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $firebase_uid = $_POST['firebase_uid'];

    $userController = new UserController($conn);
    $response = $userController->getUser($firebase_uid);

    if ($response['success'] === true) {
        echo json_encode(["success" => true, "message" => "Usuário encontrado", "data" => $response["user"]]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
