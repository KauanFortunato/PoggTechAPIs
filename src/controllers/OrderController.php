<?php

namespace App\Controllers;

use App\Controllers\FCMControler;
use function App\Utils\sendNotification;

use App\Models\Order;

class OrderController
{
    private $order;
    private \PDO $conn;

    public function __construct(\PDO $conn)
    {
        $this->conn = $conn;
        $this->order = new Order($conn);
    }

    public function getAllOrders()
    {
        return $this->order->getAllOrders();
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

    public function updateShipping($user_id, $newStatus)
    {
        $result = $this->order->updateShipping($user_id, $newStatus);
        if ($result["success"]) {
            $user_id = $result["data"]["user_id"];
            $fcmController = new FCMControler($this->conn);
            $tokenResult = $fcmController->getToken($user_id);

            $message = "Seu pedido foi $newStatus";

            if ($tokenResult["success"]) {
                foreach ($tokenResult["tokens"] as $token) {
                    sendNotification($token, "Atualização no pedido", $message, "order");
                }
            }
        }

        return $result;
    }

    public function setRefundRequest($order_id, $user_id, $reason, $status)
    {
        return $this->order->setRefundRequest($order_id, $user_id, $reason, $status);
    }

    public function getAllRefundRequests()
    {
        return $this->order->getAllRefundRequests();
    }

    public function getRefundRequest($order_id)
    {
        return $this->order->getRefundRequest($order_id);
    }
}
