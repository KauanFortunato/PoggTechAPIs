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

// GET /wallet/ → Buscar todas as carteiras
$router->get('/wallet', function () use ($conn) {
    $controller = new WalletController($conn);
    $result = $controller->getAllWallets();

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

// PUT /wallet/payments/{payment_id} -> Mudar status do pagamento
$router->put('/wallet/payments/(\d+)', function ($payment_id) use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    $controller = new WalletController($conn);
    $result = $controller->updateStatusPayment($payment_id, $data);

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});

// GET /wallet/payments → pegar todos os pagamentos
$router->get('/wallet/payments', function () use ($conn) {
    $controller = new WalletController($conn);
    $result = $controller->getAllPayments();

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});

// POST /wallet/{user_id}/balance → Atualizar valor da carteira
$router->post('/wallet/(\d+)/balance', function ($user_id) use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $data = $_POST;

    $controller = new WalletController($conn);
    $result = $controller->updateBalance($user_id, $data);

    if ($result['success']) {
        Response::success($result['data'], $result["message"]);
    } else {
        Response::error($result['message']);
    }
});


// POST /wallet/{user_id}/balance → Depositar na carteira do usuário
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
