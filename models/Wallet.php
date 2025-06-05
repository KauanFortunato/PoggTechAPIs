<?php

namespace App\Models;

class Wallet
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getWallet($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM wallet WHERE user_id LIKE ?");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        if ($result->num_rows > 0) {
            $wallet = $result->fetch_assoc();
            $stmt->close();
            return ["success" => true, "wallet" => $wallet];
        } else {
            $stmt->close();
            return ["success" => false, "message" => "Carteira não foi encontrada"];
        }
    }

    public function getPayments($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM payments WHERE user_id = ? ORDER BY created_at DESC");

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $payments = [];

        $formatter = new \IntlDateFormatter(
            'pt_PT',
            \IntlDateFormatter::LONG,
            \IntlDateFormatter::NONE
        );

        while ($row = $result->fetch_assoc()) {
            $data = new \DateTime($row['created_at']);
            $row['created_at_formatted'] = $formatter->format($data);

            $payments[] = $row;
        }

        $stmt->close();

        if (!empty($payments)) {
            return ["success" => true, "payments" => $payments];
        } else {
            return ["success" => false, "message" => "Nenhum pagamento foi encontrado"];
        }
    }
}
