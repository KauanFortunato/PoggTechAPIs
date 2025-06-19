<?php

use App\Controllers\WalletController;
use App\Utils\Response;

global $router, $conn;

$controller = new WalletController($conn);

// GET /wallet/{user_id} → Buscar carteira do usuário
$router->get('/wallet/(\d+)', function ($user_id) use ($conn) {
    $controller = new WalletController($conn);
    $result = $controller->getWallet($user_id);

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});

// GET /wallet/{user_id}/payments → Buscar pagamentos do usuário
$router->get('/wallet/(\d+)/payments', function ($user_id) use ($conn) {
    $controller = new WalletController($conn);
    $result = $controller->getPayments($user_id);

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});


// POST /wallet/{user_id}/deposit → Depositar na carteira do usuário
$router->post('/wallet/(\d+)/deposit', function ($user_id) use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $data = $_POST;

    $controller = new WalletController($conn);
    $result = $controller->deposit($user_id, $data);

    if ($result['success']) {
        Response::success($result['data'], $result["message"]);
    } else {
        Response::error($result['message']);
    }
});
