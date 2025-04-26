<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\FCMControler;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user_id = $_POST["user_id"];
    $token = $_POST["token"];

    $fcmControler = new FCMControler($conn);
    $response = $fcmControler->removeToken($user_id, $token);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => $response['message']]);
    } else {
        echo json_encode(["success" => false, "message" => $response['message']]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
