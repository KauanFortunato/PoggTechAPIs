<?php
function sendNotification($token, $title, $body, $type)
{
    $url = 'https://fcm.googleapis.com/v1/projects/poggtech-mdk360/messages:send';
    $server_key = __DIR__ . '/../firebase/service-account.json';

    // Mensagem que vai ser enviada
    $message = [
        'message' => [
            'token' => $token,
            'notification' => [
                'title' => $title,
                'body' => $body
            ],
            'android' => [
                'notification' => [
                    'icon' => 'ic_notification',
                ],
            ],
            'data' => [
                'type' => $type,
                'title' => $title,
                'body' => $body
            ]
        ]
    ];

    // Cabeçalhos + token de acesso
    $headers = [
        'Authorization: Bearer ' . getAccessToken($server_key),
        'Content-Type: application/json; UTF-8',
    ];

    // Envio com cURL
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($message));
    $response = curl_exec($ch);
    curl_close($ch);

    return $response;
}

function getAccessToken($serviceAccountFile)
{
    $credentials = json_decode(file_get_contents($serviceAccountFile), true);

    $now = time();
    $header = ['alg' => 'RS256', 'typ' => 'JWT'];
    $payload = [
        'iss' => $credentials['client_email'],
        'scope' => 'https://www.googleapis.com/auth/firebase.messaging',
        'aud' => $credentials['token_uri'],
        'exp' => $now + 3600,
        'iat' => $now
    ];

    $jwtHeader = base64url_encode(json_encode($header));
    $jwtPayload = base64url_encode(json_encode($payload));
    $signatureInput = $jwtHeader . '.' . $jwtPayload;

    openssl_sign($signatureInput, $signature, $credentials['private_key'], 'sha256WithRSAEncryption');
    $jwtSignature = base64url_encode($signature);

    $jwt = $signatureInput . '.' . $jwtSignature;

    // Enviar para o token_uri e obter access_token
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $credentials['token_uri']);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query([
        'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        'assertion' => $jwt,
    ]));
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/x-www-form-urlencoded']);
    $result = curl_exec($ch);
    curl_close($ch);

    $response = json_decode($result, true);
    return $response['access_token'];
}

function base64url_encode($data)
{
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}
