<?php
header('Content-Type: application/json');
require_once '../config/config.php';

if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Erro ao conectar ao banco de dados: " . $conn->connect_error]);
} else {
    echo json_encode(["success" => true, "message" => "Conectado com sucesso"]);
}
