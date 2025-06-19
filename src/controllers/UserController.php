<?php

namespace App\Controllers;

use App\Models\User;

class UserController
{
    private $user;

    public function __construct(\PDO $conn)
    {
        $this->user = new User($conn);
    }

    public function registerUser($firebase_uid, $name, $email, $avatar)
    {
        return $this->user->createUser($firebase_uid, $name, $email, $avatar);
    }

    public function deleteUser($firebase_uid)
    {
        return $this->user->deleteUser($firebase_uid);
    }

    public function getUser($firebase_uid)
    {
        return $this->user->getUserByFirebaseUid($firebase_uid);
    }

    public function getUserById($user_id)
    {
        return $this->user->getUserById($user_id);
    }

    public function updateUser($name, $phone, $firebase_uid)
    {
        return $this->user->updateUser($name, $phone, $firebase_uid);
    }

    public function updateUserAvatar($firebase_uid, $avatar)
    {
        return $this->user->updateUserAvatar($firebase_uid, $avatar);
    }
}
