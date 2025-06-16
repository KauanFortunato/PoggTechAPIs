<?php

use App\Controllers\UserController;
use App\Utils\Response;

global $router, $conn;

$controller = new UserController($conn);

// POST /user →  Cadastro de usuário (register)
$router->post('/user', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!$data) {
        $data = $_POST;
    }

    if (!isset($data['avatar']) || empty($data['avatar'])) {
        $data['avatar'] = "http://poggers.ddns.net/PoggTech-APIs/uploads/poggers-11645679-default-avatar.png";
    }

    $controller = new UserController($conn);
    $result = $controller->registerUser(
        $data['firebase_uid'],
        $data['name'],
        $data['email'],
        $data['avatar']
    );

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /user/{firebase_uid} → Buscar usuário pelo firebase_uid
$router->get('/user/([a-zA-Z0-9_]+)', function ($firebase_uid) use ($conn) {
    $controller = new UserController($conn);
    $result = $controller->getUser($firebase_uid);

    if ($result['success']) {
        Response::success($result['data']);
    } else {
        Response::error($result['message']);
    }
});

// PUT /user → Atualizar usuário (PUT)
$router->put('/user', function () use ($conn) {
    $data = json_decode(file_get_contents('php://input'), true);

    $controller = new UserController($conn);
    $result = $controller->updateUser(
        $data['name'],
        $data['last_name'],
        $data['phone'],
        $data['firebase_uid']
    );

    if ($result['success']) {
        Response::success(null, $result['message']);
    } else {
        Response::error($result['message']);
    }
});

$router->post('/user/avatar', function () use ($conn) {
    if (!isset($_POST['firebase_uid']) || !isset($_FILES['avatar'])) {
        Response::error('Dados incompletos para atualizar o avatar');
        return;
    }

    $firebaseUid = $_POST['firebase_uid'];
    $avatarFile = $_FILES['avatar'];

    require_once __DIR__ . '/../controllers/UserController.php';
    $controller = new UserController($conn);
    $result = $controller->updateUserAvatar($firebaseUid, $avatarFile);

    if ($result['success']) {
        Response::success($result['data'], $result['message']);
    } else {
        Response::error($result['message']);
    }
});

// GET /user/id/{user_id} → Buscar usuário pelo user_id
$router->get('/user/id/(\d+)', function ($user_id) use ($conn) {
    $controller = new UserController($conn);
    $result = $controller->getUserById($user_id);

    if ($result) {
        Response::success($result);
    } else {
        Response::error('Usuário não encontrado');
    }
});

$router->get('/health', function () use ($conn) {
    try {
        $stmt = $conn->query("SELECT 1");
        if ($stmt) {
            header('Content-Type: application/json');
            echo json_encode(['success' => true, 'message' => 'Conexão com banco de dados OK']);
        } else {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Conexão falhou']);
        }
    } catch (\PDOException $e) {
        header('Content-Type: application/json');
        echo json_encode(['success' => false, 'message' => 'Erro de conexão: ' . $e->getMessage()]);
    }
});

// DELETE /products/{id} → deletar produto
$router->delete('/user/delete/([^/]+)', function ($firebase_uid) use ($controller) {
    $result = $controller->deleteUser($firebase_uid);

    if ($result['success']) {
        Response::success(null, "Produto deletado");
    } else {
        Response::error($result['message']);
    }
});
