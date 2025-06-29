<?php

namespace App\Controllers;

use App\Models\Statistics;

class StatisticsController
{

    private $statistics;

    public function __construct(\PDO $conn)
    {
        $this->statistics = new Statistics($conn);
    }

    public function getProductsSales()
    {
        return $this->statistics->getProductsSales();
    }

    public function getDailyMetrics()
    {
        return $this->statistics->getDailyMetrics();
    }

    public function getMonthlyActiveUsers()
    {
        return $this->statistics->getMonthlyActiveUsers();
    }

    public function getTotalWallet()
    {
        return $this->statistics->getTotalWallet();
    }
}
