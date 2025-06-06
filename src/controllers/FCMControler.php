<?php

namespace App\Controllers;

use App\Models\FCM;

class FCMControler
{
    private $fcm;

    public function __construct(\PDO $conn)
    {
        $this->fcm = new FCM($conn);
    }

    public function saveToken($user_id, $token)
    {
        return $this->fcm->saveToken($user_id, $token);
    }

    public function removeToken($user_id, $token)
    {
        return $this->fcm->removeToken($user_id, $token);
    }

    public function getToken($user_id)
    {
        return $this->fcm->getToken($user_id);
    }
}
