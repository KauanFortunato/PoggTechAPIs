<?php

use App\Controllers\OrderController;
use App\Utils\Response;

global $router, $conn;

// GET /Order {user_id} → get orders
$router->get('/order/(\d+)', function ($user_id) use ($conn) {
    $controller = new OrderController($conn);
    $result = $controller->getOrder($user_id);

    if ($result) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['data']);
    }
});

// POST /Order → register order
$router->post('/order/register', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    $controller = new OrderController($conn);
    $result = $controller->registerOrder($data['user_id'], $data['items']);

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});
