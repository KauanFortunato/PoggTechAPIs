<?php

namespace App\Controllers;

use App\Models\Wallet;

class WalletController
{
    private $wallet;

    public function __construct(\PDO $conn)
    {
        $this->wallet = new Wallet($conn);
    }

    public function getWallet($user_id)
    {
        return $this->wallet->getWallet($user_id);
    }

    public function getAllWallets()
    {
        return $this->wallet->getAllWallets();
    }

    public function getPayments($user_id)
    {
        return $this->wallet->getPayments($user_id);
    }

    public function updateStatusPayment($payment_id, $data)
    {
        return $this->wallet->updateStatusPayment($payment_id, $data);
    }


    public function getAllPayments()
    {
        return $this->wallet->getAllPayments();
    }

    public function deposit($user_id, $data)
    {
        return $this->wallet->deposit($user_id, $data);
    }

    public function updateBalance($user_id, $data)
    {
        return $this->wallet->updateBalance($user_id, $data);
    }
}
