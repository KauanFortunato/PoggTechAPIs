<?php

namespace App\Controllers;

use App\Models\Order;

class OrderController
{
    private $order;

    public function __construct($conn)
    {
        $this->order = new Order($conn);
    }

    public function registerOrder($user_id, $items)
    {
        return $this->order->registerOrder($user_id, $items);
    }
}
