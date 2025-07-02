<?php

use App\Controllers\MessageController;
use App\Utils\Response;

global $router, $conn;

$controller = new MessageController($conn);

// GET /chat/{user_id}/{product_id} → obter chat
$router->get('/chat/(\d+)/(\d+)', function ($user_id, $product_id) use ($controller) {
    $result = $controller->getChat($user_id, $product_id);

    if ($result['success']) {
        Response::success($result['chat']);
    } else {
        Response::error($result['message']);
    }
});

// POST /chat → criar chat (recebe JSON com product_id)
$router->post('/chat/create', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    if (empty($data['product_id']) || empty($data['seller_id']) || empty($data['buyer_id'])) {
        Response::error("Parâmetro 'product_id' é obrigatório");
        return;
    }

    $result = $controller->createChat($data['product_id'], $data['seller_id'], $data['buyer_id']);

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /chat/buying/{user_id} → chats de compra
$router->get('/chat/buying/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getBuyingChats($user_id);

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});

// GET /chat/selling/{user_id} → chats de venda
$router->get('/chat/selling/(\d+)', function ($user_id) use ($controller) {
    $result = $controller->getSellingChats($user_id);

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});

// GET /chat/unread/{chat_id}/{receiver_id} → contar mensagens não lidas
$router->get('/chat/unread/(\d+)/(\d+)', function ($chat_id, $receiver_id) use ($controller) {
    $result = $controller->getUnreadCount($chat_id, $receiver_id);

    if ($result['success']) {
        Response::success(['unread_count' => $result['unread_count']]);
    } else {
        Response::error($result['message']);
    }
});

// POST /chat/read → marcar mensagens como lidas (recebe JSON com chat_id e receiver_id)
$router->post('/chat/read', function () use ($controller) {
    $data = json_decode(file_get_contents('php://input'), true) ?: $_POST;

    if (!$data) {
        $data = $_POST;
    }

    if (empty($data['chat_id']) || empty($data['receiver_id'])) {
        Response::error("Parâmetros 'chat_id' e 'receiver_id' são obrigatórios");
        return;
    }

    $result = $controller->readMessages($data['chat_id'], $data['receiver_id']);

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});
