<?php

namespace App\Models;

use PDO;
use PDOException;

class Statistics
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }


    public function getProductsSales()
    {
        try {
            $sql = "SELECT * FROM v_products_sales";
            $stmt = $this->conn->query($sql);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $data];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar vendas por produto: " . $e->getMessage()];
        }
    }


    public function getDailyMetrics()
    {
        try {
            $sql = "SELECT * FROM v_daily_metrics ORDER BY day DESC";
            $stmt = $this->conn->query($sql);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $data];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar métricas diárias: " . $e->getMessage()];
        }
    }

    public function getMonthlyActiveUsers()
    {
        try {
            $sql = "SELECT * FROM v_monthly_active_users ORDER BY month DESC";
            $stmt = $this->conn->query($sql);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $data];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar utilizadores ativos: " . $e->getMessage()];
        }
    }

    public function getTotalWallet()
    {
        try {
            $sql = "SELECT * FROM v_total_wallet";
            $stmt = $this->conn->query($sql);
            $data = $stmt->fetch(PDO::FETCH_ASSOC); // apenas uma linha

            return ["success" => true, "data" => $data];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar saldo total: " . $e->getMessage()];
        }
    }
}
