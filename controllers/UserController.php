<?php

namespace App\Controllers;

use App\Models\User;

class UserController
{
    private $user;

    public function __construct($conn)
    {
        $this->user = new User($conn);
    }

    public function registerUser($firebase_uid, $name, $last_name, $email, $phone)
    {
        return $this->user->createUser($firebase_uid, $name, $last_name, $email, $phone);
    }

    public function getUser($firebase_uid)
    {
        return $this->user->getUserByFirebaseUid($firebase_uid);
    }

    public function getUserById($user_id)
    {
        return $this->user->getUserById($user_id);
    }

    public function updateUser($name, $last_name, $phone, $firebase_uid)
    {
        return $this->user->updateUser($name, $last_name, $phone, $firebase_uid);
    }
}
