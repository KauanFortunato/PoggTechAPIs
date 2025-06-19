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

    public function registerOrder($user_id, $location, $user_name, $user_phone, $items)
    {
        return $this->order->registerOrder($user_id, $location, $user_name, $user_phone, $items);
    }

    public function getOrder($user_id)
    {
        return $this->order->getOrders($user_id);
    }

    public function getOrderItems($order_id)
    {
        return $this->order->getOrderItems($order_id);
    }
}
