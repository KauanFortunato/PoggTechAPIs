<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\UserController;

if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    $firebase_uid = $_POST['firebase_uid'];
    $name = $_POST['name'] ?? '';
    $last_name = $_POST['last_name'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';

    $userController = new UserController($conn);
    $response = $userController->registerUser($firebase_uid, $name, $last_name, $email, $phone);

    echo json_encode($response);
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
