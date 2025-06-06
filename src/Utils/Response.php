<?php

namespace App\Utils;

class Response
{
    public static function success($data = null, $message = 'Resposta da api com sucesso', $code = 200)
    {
        http_response_code($code);
        header('Content-Type: application/json');

        echo json_encode([
            'success' => true,
            'message' => $message,
            'data' => $data
        ]);
        exit;
    }

    public static function error($message = 'Ocorreu um erro', $code = 400, $data = null)
    {
        http_response_code($code);
        header('Content-Type: application/json');

        echo json_encode([
            'success' => false,
            'message' => $message,
            'data' => $data
        ]);
        exit;
    }

    public static function notFound($message = 'Recurso não encontrado')
    {
        self::error($message, 404);
    }

    public static function validation($message = 'Dados inválidos', $errors = [])
    {
        self::error($message, 422, $errors);
    }
}
