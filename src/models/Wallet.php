<?php

namespace App\Models;

use PDO;
use PDOException;
use DateTime;
use IntlDateFormatter;

class Wallet
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function getWallet($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM wallet WHERE user_id = :user_id");
            $stmt->execute([':user_id' => $user_id]);
            $wallet = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($wallet) {
                return ["success" => true, "data" => $wallet];
            } else {
                return ["success" => false, "message" => "Carteira não foi encontrada"];
            }
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar carteira: " . $e->getMessage()];
        }
    }

    public function getAllWallets()
    {
        try {
            $stmt = $this->conn->query("SELECT * FROM wallet ORDER BY id DESC");
            $wallet = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($wallet) {
                return ["success" => true, "data" => $wallet];
            } else {
                return ["success" => false, "message" => "Carteira não foi encontrada"];
            }
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar carteira: " . $e->getMessage()];
        }
    }


    public function getPayments($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM payments WHERE user_id = :user_id ORDER BY created_at DESC");
            $stmt->execute([':user_id' => $user_id]);

            $payments = [];
            $formatter = new IntlDateFormatter(
                'pt_PT',
                IntlDateFormatter::LONG,
                IntlDateFormatter::NONE
            );

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $data = new DateTime($row['created_at']);
                $row['created_at_formatted'] = $formatter->format($data);
                $payments[] = $row;
            }

            if (!empty($payments)) {
                return ["success" => true, "data" => $payments];
            } else {
                return ["success" => false, "message" => "Nenhum pagamento foi encontrado"];
            }
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar pagamentos: " . $e->getMessage()];
        }
    }

    public function getAllPayments()
    {
        try {
            $stmt = $this->conn->query("SELECT * FROM payments ORDER BY created_at DESC");
            $payments = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $formatter = new IntlDateFormatter(
                'pt_PT',
                IntlDateFormatter::LONG,
                IntlDateFormatter::NONE
            );

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $data = new DateTime($row['created_at']);
                $row['created_at_formatted'] = $formatter->format($data);
                $payments[] = $row;
            }

            if (!empty($payments)) {
                return ["success" => true, "data" => $payments];
            } else {
                return ["success" => false, "message" => "Nenhum pagamento foi encontrado"];
            }
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao buscar pagamentos: " . $e->getMessage()];
        }
    }

    public function updateStatusPayment($payment_id, $data)
    {
        if (empty($data['status'])) {
            return ["success" => false, "message" => "Status inválido"];
        }

        try {
            $stmt = $this->conn->prepare("UPDATE payments SET status = :status WHERE id = :payment_id");
            $stmt->execute([
                ':payment_id' => $payment_id,
                ':status' => $data['status']
            ]);

            return ["success" => true, "message" => "Depósito realizado com sucesso", "data" => null];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao realizar depósito: " . $e->getMessage()];
        }
    }

    public function deposit($user_id, $data)
    {
        if (empty($data['amount']) || !is_numeric($data['amount']) || $data['amount'] <= 0) {
            return ["success" => false, "message" => "Valor inválido para depósito"];
        }

        try {
            $stmt = $this->conn->prepare("UPDATE wallet SET balance = balance + :amount WHERE user_id = :user_id");
            $stmt->execute([
                ':user_id' => $user_id,
                ':amount' => $data['amount']
            ]);

            return ["success" => true, "message" => "Depósito realizado com sucesso", "data" => null];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao realizar depósito: " . $e->getMessage()];
        }
    }

    public function updateBalance($user_id, $data)
    {
        if (empty($data['balance']) || !is_numeric($data['balance']) || $data['balance'] < 0) {
            return ["success" => false, "message" => "Valor inválido para carteira"];
        }

        try {
            $stmt = $this->conn->prepare("UPDATE wallet SET balance = :balance WHERE user_id = :user_id");
            $stmt->execute([
                ':user_id' => $user_id,
                ':balance' => $data['balance']
            ]);

            return ["success" => true, "message" => "Depósito realizado com sucesso", "data" => null];
        } catch (PDOException $e) {
            return ["success" => false, "message" => "Erro ao realizar depósito: " . $e->getMessage()];
        }
    }
}
