<?php

namespace App\Controllers;

use App\Models\Order;

class OrderController
{
    private $order;

    public function __construct(\PDO $conn)
    {
        $this->order = new Order($conn);
    }

    public function registerOrder($user_id, $items)
    {
        return $this->order->registerOrder($user_id, $items);
    }

    public function getOrder($user_id)
    {
        return $this->order->getOrders($user_id);
    }
}
