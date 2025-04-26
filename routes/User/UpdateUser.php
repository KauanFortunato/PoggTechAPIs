<?php
header('Content-Type: application/json');

require_once __DIR__ . '/../../bootstrap.php';

use App\Controllers\UserController;

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    $putData = json_decode(file_get_contents("php://input"), true);

    // Valida se os campos necessários foram enviados
    if (isset($putData['firebase_uid'])) {
        $name = $putData['name'] ?? '';
        $last_name = $putData['last_name'] ?? '';
        $phone = $putData['phone'] ?? '';
        $firebase_uid = $putData['firebase_uid'];

        // Instancia o controlador de usuários
        $userController = new UserController($conn);

        // Chama o método de atualização do usuário
        $response = $userController->updateUser($name, $last_name, $phone, $firebase_uid);

        // Retorna a resposta em JSON
        echo json_encode($response);
    } else {
        // Resposta de erro se o firebase_uid não for enviado
        http_response_code(400); // Código HTTP 400 - Bad Request
        echo json_encode(["success" => false, "message" => "O campo 'firebase_uid' é obrigatório"]);
    }
} else {
    // Resposta para métodos HTTP não permitidos
    http_response_code(405); // Código HTTP 405 - Method Not Allowed
    echo json_encode(["success" => false, "message" => "Método não permitido"]);
}
