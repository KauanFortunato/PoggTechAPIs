<?php

use App\Controllers\MessageController;
use App\Utils\Response;

global $router, $conn;

// POST /messages/send → enviar mensagem
$router->post('/messages/send', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) $data = $_POST;

    $required = ['sender_id', 'receiver_id', 'chat_id', 'message'];

    foreach ($required as $field) {
        if (!isset($data[$field])) {
            Response::error("Parâmetro '$field' é obrigatório");
            return;
        }
    }

    $controller = new MessageController($conn);
    $result = $controller->sendMessage(
        intval($data['sender_id']),
        intval($data['receiver_id']),
        intval($data['chat_id']),
        $data['message']
    );

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /messages/{product_id}/{chat_id} → get messages
$router->get('/messages/(\d+)/(\d+)', function ($product_id, $chat_id) use ($conn) {
    $controller = new MessageController($conn);
    $result = $controller->getMessages($product_id, $chat_id);

    if ($result) {
        Response::success($result['messages'], "Mensagens encontradas");
    } else {
        Response::error("Nenhuma mensagem encontrada");
    }
});

// GET /messages/last/{product_id}/{receiver_id} → get last message
$router->get('/messages/last/(\d+)/(\d+)', function ($product_id, $receiver_id) use ($conn) {
    $controller = new MessageController($conn);
    $result = $controller->getLastMessage($product_id, $receiver_id);

    if ($result) {
        Response::success($result['messages'], "Última mensagem encontrada");
    } else {
        Response::error("Nenhuma mensagem encontrada");
    }
});
