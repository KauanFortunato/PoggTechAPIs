<?php

use App\Controllers\FCMControler;
use App\Utils\Response;

global $router, $conn;

// POST /FCM → salvar token FCM
$router->post('/FCM/save', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    if (!isset($data['user_id']) || !isset($data['token'])) {
        Response::error("Parâmetros 'user_id' e 'token' são obrigatórios");
        return;
    }

    $user_id = intval($data['user_id']);
    $token = $data['token'];

    $controller = new FCMControler($conn);
    $result = $controller->saveToken($user_id, $token);

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// POST /FCM → remove token
$router->post('/FCM/remove', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    if (!isset($data['user_id']) || !isset($data['token'])) {
        Response::error("Parâmetros 'user_id' e 'token' são obrigatórios");
        return;
    }

    $user_id = intval($data['user_id']);
    $token = $data['token'];

    $controller = new FCMControler($conn);
    $result = $controller->removeToken($user_id, $token);

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /FCM → get token
$router->get('/FCM/(\d+)', function ($user_id) use ($conn) {
    if (!isset($user_id)) {
        Response::error("Parâmetros 'user_id' é obrigatório");
        return;
    }

    $controller = new FCMControler($conn);
    $result = $controller->getToken($user_id);

    if ($result['success']) {
        Response::success($result['tokens'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});
