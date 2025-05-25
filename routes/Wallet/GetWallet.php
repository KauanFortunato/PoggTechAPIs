<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\WalletController;

if ($_SERVER["REQUEST_METHOD"] === 'GET') {
    $user_id = $_GET["user_id"];

    $walletController = new WalletController($conn);
    $response = $walletController->getWallet($user_id);

    if ($response["success"] === true) {
        echo json_encode(["success" => true, "message" => "Carteira encontrada", "data" => $response["wallet"]]);
    } else {
        echo json_encode($response);
    }
} else {
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
