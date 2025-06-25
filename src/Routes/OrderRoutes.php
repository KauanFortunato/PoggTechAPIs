<?php

use App\Controllers\OrderController;
use App\Utils\Response;

global $router, $conn;

// GET /Order -> get all orders
$router->get('/order', function () use ($conn) {
    $controller = new OrderController($conn);
    $result = $controller->getAllOrders();

    if ($result) {
        Response::success($result["data"], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /Order {user_id} → get orders
$router->get('/order/(\d+)', function ($user_id) use ($conn) {
    $controller = new OrderController($conn);
    $result = $controller->getOrder($user_id);

    if ($result) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// POST /Order → register order
$router->post('/order/register', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    $controller = new OrderController($conn);
    $result = $controller->registerOrder(
        $data['user_id'],
        $data['location'],
        $data['user_name'],
        $data['user_phone'],
        $data['items']
    );

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /Order/items/{order_id} -> get order items
$router->get('/order/items/(\d+)', function ($order_id) use ($conn) {
    if (!is_numeric($order_id) || $order_id <= 0) {
        Response::error("Parâmetro 'order_id' deve ser um número e ser maior que zero");
        return;
    }

    $controller = new OrderController($conn);
    $result = $controller->getOrderItems($order_id);

    if ($result) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['data']);
    }
});

// GET /Order/{order_id} -> update shipping status
$router->put('/order/(\d+)/([^/]+)', function ($order_id, $newStatus) use ($conn) {
    $controller = new OrderController($conn);
    $result = $controller->updateShipping($order_id, $newStatus);

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});
