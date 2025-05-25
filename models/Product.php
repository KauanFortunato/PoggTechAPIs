<?php

namespace App\Models;

require_once __DIR__ . '/../config/constants.php';

class Product
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function createProduct($data, $imagens)
    {
        try {
            error_log("Dados recebidos: " . print_r($data, true));

            $this->conn->begin_transaction();

            // 1. Inserir produto
            $stmt = $this->conn->prepare("INSERT INTO products (title, description, location, price, user_id, category) 
                                        VALUES (?, ?, ?, ?, ?, ?)");
            if (!$stmt) throw new \Exception($this->conn->error);
            $data['price'] = floatval(str_replace(',', '.', $data['price']));

            $stmt->bind_param(
                "sssdis",
                $data['title'],
                $data['description'],
                $data['location'],
                $data['price'],
                $data['user_id'],
                $data['category']
            );

            if (!$stmt->execute()) throw new \Exception($stmt->error);
            $productId = $stmt->insert_id;
            $stmt->close();

            // 2. Obter galeria criada automaticamente pelo trigger
            $stmt = $this->conn->prepare("SELECT gallery_id	FROM gallery WHERE product_id = ?");
            if (!$stmt) throw new \Exception($this->conn->error);
            $stmt->bind_param("i", $productId);
            $stmt->execute();
            $galleryId = null;
            $stmt->bind_result($galleryId);
            $stmt->fetch();
            $stmt->close();

            if (!$galleryId) throw new \Exception("Falha ao obter a galeria.");

            // 3. Guardar imagens
            $uploadDir = '../../uploads/';
            if (!file_exists($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            $firstImagePath = null;

            foreach ($imagens['tmp_name'] as $index => $tmpName) {
                if ($imagens['error'][$index] !== UPLOAD_ERR_OK) continue;

                $ext = pathinfo($imagens['name'][$index], PATHINFO_EXTENSION);
                $uniqueName = uniqid('img_', true) . '.' . $ext;
                $relativePath = 'uploads/' . $uniqueName;
                $uploadPath = '../../' . $relativePath; // caminho físico

                if (move_uploaded_file($tmpName, $uploadPath)) {
                    $publicUrl = BASE_URL . $relativePath;

                    if ($firstImagePath === null) {
                        $firstImagePath = $publicUrl;
                    }

                    $stmt = $this->conn->prepare("INSERT INTO images (gallery_id, path) VALUES (?, ?)");
                    if (!$stmt) throw new \Exception($this->conn->error);
                    $stmt->bind_param("is", $galleryId, $publicUrl);
                    if (!$stmt->execute()) throw new \Exception($stmt->error);
                    $stmt->close();
                }
            }

            if ($firstImagePath != null) {
                $stmt = $this->conn->prepare("UPDATE products SET cover = ? WHERE product_id = ?");
                if (!$stmt) throw new \Exception($this->conn->error);
                $stmt->bind_param("si", $firstImagePath, $productId);
                if (!$stmt->execute()) throw new \Exception($stmt->error);
                $stmt->close();
            }

            $this->conn->commit();
            return ["success" => true, "product_id" => $productId];
        } catch (\Exception $e) {
            $this->conn->rollback();
            error_log("Erro ao criar produto: " . $e->getMessage());
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function deleteProduct($product_id)
    {
        try {
            $this->conn->begin_transaction();

            $stmt = $this->conn->prepare("SELECT images.path FROM images
            INNER JOIN gallery ON images.gallery_id = gallery.gallery_id
            WHERE gallery.product_id = ?");
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $result = $stmt->get_result();

            $imagesPaths = [];
            while ($row = $result->fetch_assoc()) {
                $imagesPaths[] = $row['path'];
            }
            $stmt->close();

            // Deleta produto e consequentemente a galeria e as imagens associadas
            $stmt = $this->conn->prepare("DELETE FROM products WHERE product_id = ?");
            $stmt->bind_param("i", $product_id);
            if (!$stmt->execute()) throw new \Exception($stmt->error);
            $stmt->close();

            // Deleta as imagens do servidor
            foreach ($imagesPaths as $imagePath) {
                $localPath = '../../' . str_replace(BASE_URL, '', $imagePath);
                if (file_exists($localPath)) {
                    unlink($localPath);
                } else {
                    error_log("Arquivo não encontrado: " . $localPath);
                }
            }

            $this->conn->commit();
            return ["success" => true, "message" => "Produto deletado com sucesso."];
        } catch (\Exception $e) {
            $this->conn->rollback();
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }
    }

    public function getProduct($product_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_product_details WHERE product_id = ? AND quantity > 0");
        $stmt->bind_param('i', $product_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $product = $result->fetch_assoc();
            $stmt->close();
            return ["success" => true, "product" => $product];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao cadastrar: $error"];
        }
    }

    public function getPopularProducts()
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_popular_products WHERE quantity > 0 ORDER BY view_count DESC LIMIT 6");

        if ($stmt === false) {
            die("Erro na preparação da consulta: " . $this->conn->error);
        }

        $stmt->execute();

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $products = $result->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return ["success" => true, "products" => $products];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function getRecommendedProducts($user_id)
    {
        $stmt = $this->conn->prepare("SELECT p.* FROM products p JOIN user_history uh ON p.product_id = uh.product_id WHERE uh.user_id = ? GROUP BY p.product_id ORDER BY MAX(uh.accessed_at) DESC LIMIT 5");

        if ($stmt === false) {
            die("Erro na preparação da consulta: " . $this->conn->error);
        }
        $stmt->bind_param('i', $user_id);
        $stmt->execute();

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $products = $result->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return ["success" => true, "products" => $products];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao pegar mensagens: $error"];
        }
    }

    public function getFavCategories($user_id)
    {
        // Primeira consulta: obter as categorias favoritas do utilizador
        $stmt = $this->conn->prepare("SELECT p.category, COUNT(*) as total 
                                  FROM user_history uh 
                                  JOIN products p ON uh.product_id = p.product_id 
                                  WHERE uh.user_id = ? 
                                  GROUP BY p.category 
                                  ORDER BY total DESC 
                                  LIMIT 3");

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro na preparação da consulta: " . $this->conn->error];
        }

        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $categories = [];
        while ($row = $result->fetch_assoc()) {
            $categories[] = $row['category'];
        }
        $stmt->close();

        // Se o utilizador não tiver categorias favoritas, buscar todas as categorias disponíveis
        if (empty($categories)) {
            $stmt = $this->conn->prepare("SELECT DISTINCT category FROM products");

            if ($stmt === false) {
                return ["success" => false, "message" => "Erro ao buscar todas as categorias: " . $this->conn->error];
            }

            $stmt->execute();
            $result = $stmt->get_result();

            while ($row = $result->fetch_assoc()) {
                $categories[] = $row['category'];
            }
            $stmt->close();
        }

        return ["success" => true, "categories" => $categories];
    }

    public function getProductByCategories($categories, $all = false, $quantity = 9)
    {
        if (empty($categories)) {
            return ["success" => false, "message" => "Nenhuma categoria informada"];
        }

        if (is_string($categories)) {
            $categories = array_map('trim', explode(',', $categories));
        }

        if (!is_array($categories) || count($categories) === 0) {
            return ["success" => false, "message" => "Categorias inválidas"];
        }

        $placeholders = implode(',', array_fill(0, count($categories), '?'));

        if ($all === true) {
            $sql = "SELECT * FROM products WHERE category IN ($placeholders) ORDER BY RAND()";
        } else {
            $sql = "SELECT * FROM products WHERE category IN ($placeholders) ORDER BY RAND() LIMIT ?";
        }

        $stmt = $this->conn->prepare($sql);

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }


        $types = str_repeat('s', count($categories)) . 'i';

        if ($all === true) {
            $params = array_merge($categories);
        } else {
            $params = array_merge($categories, [$quantity]);
        }

        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();

        $products = [];
        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }

        $stmt->close();

        if (!empty($products)) {
            return ["success" => true, "products" => $products];
        } else {
            return ["success" => false, "message" => "Nenhum produto encontrado"];
        }
    }

    public function getDistributedProductsByCategories($categories, $totalQuantity = 6)
    {
        if (empty($categories)) {
            return ["success" => false, "message" => "Nenhuma categoria informada"];
        }

        if (is_string($categories)) {
            $categories = array_map('trim', explode(',', $categories));
        }

        if (!is_array($categories) || count($categories) === 0) {
            return ["success" => false, "message" => "Categorias inválidas"];
        }

        $products = [];
        $quantityPerCategory = ceil($totalQuantity / count($categories));

        foreach ($categories as $category) {
            $stmt = $this->conn->prepare("SELECT * FROM products WHERE category = ? ORDER BY RAND() LIMIT ?");
            if ($stmt === false) {
                return ["success" => false, "message" => "Erro ao preparar: " . $this->conn->error];
            }

            $stmt->bind_param('si', $category, $quantityPerCategory);
            $stmt->execute();
            $result = $stmt->get_result();

            while ($row = $result->fetch_assoc()) {
                $products[] = $row;
            }

            $stmt->close();
        }

        shuffle($products);

        $products = array_slice($products, 0, $totalQuantity);

        return ["success" => true, "products" => $products];
    }

    public function getAllProducts()
    {
        $stmt = $this->conn->prepare("SELECT * FROM products ORDER BY product_id DESC");
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $products = [];

        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }

        $stmt->close();

        if (!empty($products)) {
            return ["success" => true, "products" => $products];
        } else {
            return ["success" => false, "message" => "Nenhum produto foi encontrado"];
        }
    }

    public function addProductOnCart($user_id, $product_id, $tipo)
    {
        if ($tipo == 0) {
            $stock = null;
            $currentQuantity = null;

            $stmt = $this->conn->prepare("SELECT quantity FROM products WHERE product_id = ?");
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $stmt->bind_result($stock);
            $stmt->fetch();
            $stmt->close();

            $stmt = $this->conn->prepare("SELECT quantity FROM saved WHERE user_id = ? AND product_id = ? AND tipo = ?");
            $stmt->bind_param("iii", $user_id, $product_id, $tipo);
            $stmt->execute();
            $stmt->bind_result($currentQuantity);
            $exists = $stmt->fetch();
            $stmt->close();

            if (!$exists) $currentQuantity = 0;

            if ($currentQuantity >= $stock) {
                return ["success" => false, "message" => "Não há mais stock disponível."];
            }
        }

        $stmt = $this->conn->prepare("INSERT INTO saved (user_id, product_id, tipo) VALUES (?, ?, ?) 
                                  ON DUPLICATE KEY UPDATE quantity = quantity + 1");
        $stmt->bind_param("iii", $user_id, $product_id, $tipo);

        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Adicionado com sucesso."];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao adicionar: $error"];
        }
    }

    public function removeOneFromCart($user_id, $product_id, $tipo)
    {
        $quantity = null;

        $stmt = $this->conn->prepare("SELECT quantity FROM saved WHERE user_id = ? AND product_id = ? AND tipo = ?");
        $stmt->bind_param("iii", $user_id, $product_id, $tipo);
        $stmt->execute();
        $stmt->bind_result($quantity);
        $exists = $stmt->fetch();
        $stmt->close();

        if (!$exists) {
            return ["success" => false, "message" => "Produto não encontrado no carrinho."];
        }

        if ($quantity <= 1) {
            $stmt = $this->conn->prepare("DELETE FROM saved WHERE user_id = ? AND product_id = ? AND tipo = ?");
            $stmt->bind_param("iii", $user_id, $product_id, $tipo);

            if ($stmt->execute()) {
                $stmt->close();
                return ["success" => true, "message" => "Produto removido do carrinho."];
            } else {
                $error = $stmt->error;
                $stmt->close();
                return ["success" => false, "message" => "Erro ao remover: $error"];
            }
        } else {
            $stmt = $this->conn->prepare("UPDATE saved SET quantity = quantity - 1 WHERE user_id = ? AND product_id = ? AND tipo = ?");
            $stmt->bind_param("iii", $user_id, $product_id, $tipo);

            if ($stmt->execute()) {
                $stmt->close();
                return ["success" => true, "message" => "Quantidade atualizada."];
            } else {
                $error = $stmt->error;
                $stmt->close();
                return ["success" => false, "message" => "Erro ao atualizar: $error"];
            }
        }
    }
    public function getAllProductsFromCart($user_id, $tipo)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_cart_fav WHERE user_id LIKE ? AND tipo LIKE ?");
        $stmt->bind_param('ii', $user_id, $tipo);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $products = [];

        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }

        $stmt->close();

        if (!empty($products)) {
            return ["success" => true, "products" => $products];
        } else {
            return ["success" => false, "message" => "Nenhum produto foi encontrado"];
        }
    }

    public function getUserFavOrCart($user_id, $tipo)
    {
        $stmt = $this->conn->prepare("SELECT product_id FROM v_cart_fav WHERE user_id LIKE ? AND tipo LIKE ?");
        $stmt->bind_param('ii', $user_id, $tipo);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $saved = [];

        while ($row = $result->fetch_assoc()) {
            $saved[] = $row['product_id'];
        }

        $stmt->close();

        if (!empty($saved)) {
            return ["success" => true, "products" => $saved];
        } else {
            return ["success" => false, "message" => "Nenhum produto foi encontrado"];
        }
    }

    public function verifyProductOnCart($user_id, $product_id, $tipo)
    {
        $stmt = $this->conn->prepare("SELECT * FROM saved WHERE user_id LIKE ? AND product_id LIKE ? AND tipo LIKE ?");
        $stmt->bind_param('iii', $user_id, $product_id, $tipo);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $product = $result->fetch_assoc();

        $stmt->close();

        if (!empty($product)) {
            return ["success" => true, "isSaved" => $product['tipo']];
        } else {
            return ["success" => false, "message" => "Nenhum produto foi encontrado"];
        }
    }

    public function removeProductOnCart($user_id, $product_id, $tipo)
    {
        $stmt = $this->conn->prepare("DELETE FROM saved WHERE user_id LIKE ? AND product_id LIKE ? AND tipo LIKE ?");
        $stmt->bind_param("iii", $user_id, $product_id, $tipo);
        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Removido com successo"];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao remover: $error"];
        }
    }

    public function attProductViews($product_id)
    {
        $stmt = $this->conn->prepare("INSERT INTO products_views (product_id, view_count) VALUES (?, 1) 
                                    ON DUPLICATE KEY UPDATE view_count = view_count + 1");

        if (!$stmt) {
            return ["success" => false, "message" => "SQL Prepare Error: " . $this->conn->error];
        }

        $stmt->bind_param("i", $product_id);

        if ($stmt->execute()) {
            $stmt->close();
            return ["success" => true, "message" => "Produto atualizado com sucesso."];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao atualizar produto."];
        }
    }

    public function searchProducts($search)
    {
        $cleanedSearch = $this->removeAccents($search);
        $terms = explode(' ', $cleanedSearch);

        $likeConditions = [];
        $soundexConditions = [];
        $types = '';
        $params = [];

        foreach ($terms as $term) {
            $likeConditions[] = "(SOUNDEX(title) = SOUNDEX(?) OR SOUNDEX(description) = SOUNDEX(?) OR SOUNDEX(category) = SOUNDEX(?))";
            $types .= 'sss';
            array_push($params, $term, $term, $term);
        }

        $likeQuery = implode(' OR ', $likeConditions);
        $sql = "
        SELECT *, 
            MATCH(title, description, category) AGAINST(?) AS relevance
        FROM v_product_details
        WHERE ($likeQuery)
        OR MATCH(title, description, category) AGAINST(? IN NATURAL LANGUAGE MODE)
        ORDER BY relevance DESC
    ";

        $types .= 'ss';
        array_push($params, $cleanedSearch, $cleanedSearch);

        $stmt = $this->conn->prepare($sql);
        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $stmt->bind_param($types, ...$params);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $products = $result->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return ["success" => true, "products" => $products];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao fazer a consulta: $error"];
        }
    }

    private function removeAccents($string)
    {
        $unwanted_array = [
            'Á' => 'A',
            'À' => 'A',
            'Â' => 'A',
            'Ã' => 'A',
            'Ä' => 'A',
            'á' => 'a',
            'à' => 'a',
            'â' => 'a',
            'ã' => 'a',
            'ä' => 'a',
            'É' => 'E',
            'È' => 'E',
            'Ê' => 'E',
            'Ë' => 'E',
            'é' => 'e',
            'è' => 'e',
            'ê' => 'e',
            'ë' => 'e',
            'Í' => 'I',
            'Ì' => 'I',
            'Î' => 'I',
            'Ï' => 'I',
            'í' => 'i',
            'ì' => 'i',
            'î' => 'i',
            'ï' => 'i',
            'Ó' => 'O',
            'Ò' => 'O',
            'Ô' => 'O',
            'Õ' => 'O',
            'Ö' => 'O',
            'ó' => 'o',
            'ò' => 'o',
            'ô' => 'o',
            'õ' => 'o',
            'ö' => 'o',
            'Ú' => 'U',
            'Ù' => 'U',
            'Û' => 'U',
            'Ü' => 'U',
            'ú' => 'u',
            'ù' => 'u',
            'û' => 'u',
            'ü' => 'u',
            'Ç' => 'C',
            'ç' => 'c'
        ];
        return strtr($string, $unwanted_array);
    }

    public function getSuggestions($query)
    {
        $query = "%" . $query . "%";
        $stmt = $this->conn->prepare("SELECT title FROM products WHERE products.title LIKE ? LIMIT 8");
        $stmt->bind_param('s', $query);

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        if ($stmt->execute()) {
            $result = $stmt->get_result();

            $products = [];

            while ($row = $result->fetch_assoc()) {
                $products[] = $row['title'];
            }

            $stmt->close();
            return ["success" => true, "products" => $products];
        } else {
            $error = $stmt->error;
            $stmt->close();
            return ["success" => false, "message" => "Erro ao fazer a consulta: $error"];
        }
    }

    public function getMyProducts($user_id)
    {
        $stmt = $this->conn->prepare("SELECT * FROM v_product_full_details WHERE user_id = ? ORDER BY product_id DESC");
        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($stmt === false) {
            return ["success" => false, "message" => "Erro ao preparar a consulta: " . $this->conn->error];
        }

        $products = [];

        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }

        $stmt->close();

        if (!empty($products)) {
            return ["success" => true, "products" => $products];
        } else {
            return ["success" => false, "message" => "Nenhum produto foi encontrado"];
        }
    }
}
