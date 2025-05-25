<?php

namespace App\Controllers;

use App\Models\Wallet;

class WalletController
{
    private $wallet;

    public function __construct($conn)
    {
        $this->wallet = new Wallet($conn);
    }

    public function getWallet($user_id)
    {
        return $this->wallet->getWallet($user_id);
    }

    public function getPayments($user_id)
    {
        return $this->wallet->getPayments($user_id);
    }
}
