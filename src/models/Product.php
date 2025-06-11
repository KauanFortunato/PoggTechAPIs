<?php

namespace App\Models;

require_once __DIR__ . '/../config/constants.php';

use PDO;

class Product
{
    private $conn;

    public function __construct(PDO $conn)
    {
        $this->conn = $conn;
    }

    public function createProduct($data, $imagens)
    {
        try {
            error_log("Dados recebidos: " . print_r($data, true));
            $this->conn->beginTransaction();

            // 1. Inserir produto
            $sql = "INSERT INTO products (title, description, location, price, user_id, category) 
                VALUES (:title, :description, :location, :price, :user_id, :category)";
            $stmt = $this->conn->prepare($sql);

            $data['price'] = floatval(str_replace(',', '.', $data['price']));

            $stmt->execute([
                ':title' => $data['title'],
                ':description' => $data['description'],
                ':location' => $data['location'],
                ':price' => $data['price'],
                ':user_id' => $data['user_id'],
                ':category' => $data['category']
            ]);

            $productId = $this->conn->lastInsertId();

            // 2. Obter galeria criada automaticamente pelo trigger
            $stmt = $this->conn->prepare("SELECT gallery_id FROM gallery WHERE product_id = :product_id");
            $stmt->execute([':product_id' => $productId]);
            $galleryId = $stmt->fetchColumn();

            if (!$galleryId) {
                throw new \Exception("Falha ao obter a galeria.");
            }

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
                $uploadPath = '../../' . $relativePath;

                if (move_uploaded_file($tmpName, $uploadPath)) {
                    $publicUrl = BASE_URL . $relativePath;

                    if ($firstImagePath === null) {
                        $firstImagePath = $publicUrl;
                    }

                    $stmt = $this->conn->prepare("INSERT INTO images (gallery_id, path) VALUES (:gallery_id, :path)");
                    $stmt->execute([
                        ':gallery_id' => $galleryId,
                        ':path' => $publicUrl
                    ]);
                }
            }

            if ($firstImagePath !== null) {
                $stmt = $this->conn->prepare("UPDATE products SET cover = :cover WHERE product_id = :product_id");
                $stmt->execute([
                    ':cover' => $firstImagePath,
                    ':product_id' => $productId
                ]);
            }

            $this->conn->commit();

            return ["success" => true, "data" => $productId];
        } catch (\Exception $e) {
            $this->conn->rollBack();
            error_log("Erro ao criar produto: " . $e->getMessage());
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function deleteProduct($product_id)
    {
        try {
            $this->conn->beginTransaction();

            // 1. Obter caminhos das imagens
            $stmt = $this->conn->prepare("SELECT images.path FROM images
                                      INNER JOIN gallery ON images.gallery_id = gallery.gallery_id
                                      WHERE gallery.product_id = :product_id");
            $stmt->execute([':product_id' => $product_id]);
            $imagesPaths = $stmt->fetchAll(PDO::FETCH_COLUMN);

            // 2. Deletar o produto
            $stmt = $this->conn->prepare("DELETE FROM products WHERE product_id = :product_id");
            $stmt->execute([':product_id' => $product_id]);

            // 3. Deletar imagens do servidor
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
            $this->conn->rollBack();
            error_log("Erro ao deletar produto: " . $e->getMessage());
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function getProduct($product_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_product_details WHERE product_id = :product_id AND quantity > 0");
            $stmt->execute([':product_id' => $product_id]);
            $product = $stmt->fetch(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $product];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar produto: " . $e->getMessage()];
        }
    }

    public function getPopularProducts($all = false, $quantity = 6)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_popular_products WHERE quantity > 0 ORDER BY view_count DESC LIMIT $quantity");
            if ($all) {
                $stmt = $this->conn->prepare("SELECT * FROM v_popular_products WHERE quantity > 0 ORDER BY view_count DESC");
            }
            $stmt->execute();
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $products];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar produtos populares: " . $e->getMessage()];
        }
    }

    public function getRecommendedProducts($user_id)
    {
        try {
            $sql = "SELECT p.* 
                FROM products p 
                JOIN user_history uh ON p.product_id = uh.product_id 
                WHERE uh.user_id = :user_id 
                GROUP BY p.product_id 
                ORDER BY MAX(uh.accessed_at) DESC 
                LIMIT 5";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':user_id' => $user_id]);
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $products];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar recomendações: " . $e->getMessage()];
        }
    }

    public function getFavCategories($user_id)
    {
        try {
            // 1. Buscar categorias favoritas do usuário
            $sql = "SELECT p.category, COUNT(*) as total 
                FROM user_history uh 
                JOIN products p ON uh.product_id = p.product_id 
                WHERE uh.user_id = :user_id 
                GROUP BY p.category 
                ORDER BY total DESC 
                LIMIT 3";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([':user_id' => $user_id]);

            $categories = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $categories[] = $row['category'];
            }

            // 2. Caso não haja categorias favoritas, pegar todas as categorias
            if (empty($categories)) {
                $stmt = $this->conn->prepare("SELECT DISTINCT category FROM products");
                $stmt->execute();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $categories[] = $row['category'];
                }
            }

            return ["success" => true, "data" => $categories];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar categorias: " . $e->getMessage()];
        }
    }

    public function getProductByCategories($categories, $all = false, $quantity = 9)
    {
        try {
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
                $sql = "SELECT * FROM v_product_details WHERE category IN ($placeholders) ORDER BY RAND()";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($categories);
            } else {
                $quantity = (int)$quantity;
                $sql = "SELECT * FROM v_product_details WHERE category IN ($placeholders) ORDER BY RAND() LIMIT $quantity";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($categories);
            }

            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($products)) {
                return ["success" => true, "data" => $products];
            } else {
                return ["success" => false, "message" => "Nenhum produto encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function getDistributedProductsByCategories($categories, $totalQuantity = 6)
    {
        try {
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
                $stmt = $this->conn->prepare("SELECT * FROM v_product_details WHERE category = ? ORDER BY RAND() LIMIT ?");
                $stmt->bindValue(1, $category);
                $stmt->bindValue(2, $quantityPerCategory, PDO::PARAM_INT);
                $stmt->execute();

                $products = array_merge($products, $stmt->fetchAll(PDO::FETCH_ASSOC));
            }

            shuffle($products);
            $products = array_slice($products, 0, $totalQuantity);

            return ["success" => true, "data" => $products];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function getAllProducts()
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM products ORDER BY product_id DESC");
            $stmt->execute();
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($products)) {
                return ["success" => true, "data" => $products];
            } else {
                return ["success" => false, "message" => "Nenhum produto foi encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function addProductOnCart($user_id, $product_id, $quantity)
    {
        try {
            // Buscar estoque
            $stmt = $this->conn->prepare("SELECT quantity FROM products WHERE product_id = :product_id");
            $stmt->execute([':product_id' => $product_id]);
            $stock = $stmt->fetchColumn();

            if ($stock === false) {
                return ["success" => false, "message" => "Produto não encontrado."];
            }

            // Verificar se já existe no carrinho
            $stmt = $this->conn->prepare("SELECT quantity FROM saved WHERE user_id = :user_id AND product_id = :product_id AND tipo = 0");
            $stmt->execute([
                ':user_id' => $user_id,
                ':product_id' => $product_id
            ]);

            $currentQuantity = $stmt->fetchColumn();
            if ($currentQuantity === false) $currentQuantity = 0;

            if ($currentQuantity >= $stock) {
                return ["success" => false, "message" => "Não há mais stock disponível."];
            }

            if ($stock >= $quantity + $currentQuantity) {
                $stmt = $this->conn->prepare("INSERT INTO saved (user_id, product_id, tipo, quantity) 
                                          VALUES (:user_id, :product_id, 0, :quantity) 
                                          ON DUPLICATE KEY UPDATE quantity = quantity + :quantity_upd");
                $stmt->execute([
                    ':user_id' => $user_id,
                    ':product_id' => $product_id,
                    ':quantity' => $quantity,
                    ':quantity_upd' => $quantity
                ]);
                return ["success" => true, "message" => "Adicionado ao carrinho com sucesso."];
            } else {
                return ["success" => false, "message" => "Não há essa quantidade em stock."];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function saveProduct($user_id, $product_id)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO saved (user_id, product_id, tipo, quantity) 
                                      VALUES (:user_id, :product_id, 1, 1) 
                                      ON DUPLICATE KEY UPDATE quantity = quantity + 1");
            $stmt->execute([
                ':user_id' => $user_id,
                ':product_id' => $product_id,
            ]);

            return ["success" => true, "message" => "Adicionado aos salvos com sucesso."];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao adicionar: " . $e->getMessage()];
        }
    }

    public function removeOneFromCart($user_id, $product_id, $tipo)
    {
        try {
            $stmt = $this->conn->prepare("SELECT quantity FROM saved WHERE user_id = :user_id AND product_id = :product_id AND tipo = :tipo");
            $stmt->execute([':user_id' => $user_id, ':product_id' => $product_id, ':tipo' => $tipo]);
            $quantity = $stmt->fetchColumn();

            if ($quantity === false) {
                return ["success" => false, "message" => "Produto não encontrado no carrinho."];
            }

            if ($quantity <= 1) {
                $stmt = $this->conn->prepare("DELETE FROM saved WHERE user_id = :user_id AND product_id = :product_id AND tipo = :tipo");
                $stmt->execute([':user_id' => $user_id, ':product_id' => $product_id, ':tipo' => $tipo]);
                return ["success" => true, "message" => "Produto removido do carrinho."];
            } else {
                $stmt = $this->conn->prepare("UPDATE saved SET quantity = quantity - 1 WHERE user_id = :user_id AND product_id = :product_id AND tipo = :tipo");
                $stmt->execute([':user_id' => $user_id, ':product_id' => $product_id, ':tipo' => $tipo]);
                return ["success" => true, "message" => "Quantidade atualizada."];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function getAllProductsFromCart($user_id, $tipo)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_cart_fav WHERE user_id = :user_id AND tipo = :tipo");
            $stmt->execute([':user_id' => $user_id, ':tipo' => $tipo]);
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($products)) {
                return ["success" => true, "data" => $products];
            } else {
                return ["success" => false, "message" => "Nenhum produto foi encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function getUserFavOrCart($user_id, $tipo)
    {
        try {
            $stmt = $this->conn->prepare("SELECT product_id FROM v_cart_fav WHERE user_id = :user_id AND tipo = :tipo");
            $stmt->execute([':user_id' => $user_id, ':tipo' => $tipo]);
            $saved = $stmt->fetchAll(PDO::FETCH_COLUMN);

            if (!empty($saved)) {
                return ["success" => true, "data" => $saved];
            } else {
                return ["success" => false, "message" => "Nenhum produto foi encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function verifyProductOnCart($user_id, $product_id, $tipo)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM saved WHERE user_id = :user_id AND product_id = :product_id AND tipo = :tipo");
            $stmt->execute([':user_id' => $user_id, ':product_id' => $product_id, ':tipo' => $tipo]);
            $product = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!empty($product)) {
                return ["success" => true, "data" => $product['tipo']];
            } else {
                return ["success" => false, "message" => "Nenhum produto foi encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function removeProductOnCart($user_id, $product_id, $tipo)
    {
        try {
            $stmt = $this->conn->prepare("DELETE FROM saved WHERE user_id = :user_id AND product_id = :product_id AND tipo = :tipo");
            $stmt->execute([':user_id' => $user_id, ':product_id' => $product_id, ':tipo' => $tipo]);
            return ["success" => true, "message" => "Removido com sucesso"];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro: " . $e->getMessage()];
        }
    }

    public function attProductViews($product_id)
    {
        try {
            $stmt = $this->conn->prepare("INSERT INTO products_views (product_id, view_count) VALUES (:product_id, 1) 
                ON DUPLICATE KEY UPDATE view_count = view_count + 1");
            $stmt->execute([':product_id' => $product_id]);
            return ["success" => true, "message" => "Produto atualizado com sucesso."];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao atualizar produto: " . $e->getMessage()];
        }
    }

    public function searchProducts($search)
    {
        try {
            $cleanedSearch = $this->removeAccents($search);
            $terms = explode(' ', $cleanedSearch);

            $likeConditions = [];
            $params = [];

            foreach ($terms as $term) {
                $likeConditions[] = "(title LIKE ? OR description LIKE ? OR category LIKE ? OR SOUNDEX(title) = SOUNDEX(?) OR SOUNDEX(description) = SOUNDEX(?) OR SOUNDEX(category) = SOUNDEX(?))";
                $likeTerm = "%$term%";
                array_push($params, $likeTerm, $likeTerm, $likeTerm, $term, $term, $term);
            }

            $likeQuery = implode(' OR ', $likeConditions);

            $sql = "
            SELECT *, 
                MATCH(title, description, category) AGAINST(? IN NATURAL LANGUAGE MODE) AS relevance
            FROM products
            WHERE ($likeQuery)
            OR MATCH(title, description, category) AGAINST(? IN NATURAL LANGUAGE MODE)
            ORDER BY relevance DESC
            ";

            $params[] = $cleanedSearch;
            $params[] = $cleanedSearch;

            $stmt = $this->conn->prepare($sql);
            $stmt->execute($params);
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (empty($products)) {
                return $this->fallbackSearch($terms);
            }

            return ["success" => true, "data" => $products];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro na busca: " . $e->getMessage()];
        }
    }

    private function fallbackSearch($terms)
    {
        try {
            $likeConditions = [];
            $params = [];

            foreach ($terms as $term) {
                $likeConditions[] = "(title LIKE ? OR description LIKE ? OR category LIKE ?)";
                $likeTerm = "%$term%";
                array_push($params, $likeTerm, $likeTerm, $likeTerm);
            }

            $likeQuery = implode(' OR ', $likeConditions);
            $sql = "SELECT * FROM products WHERE $likeQuery ORDER BY title ASC";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute($params);
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            return ["success" => true, "data" => $products];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro no fallback: " . $e->getMessage()];
        }
    }

    private function removeAccents($string)
    {
        return preg_replace(
            ['/á|à|ã|â|ä/', '/é|è|ê|ë/', '/í|ì|î|ï/', '/ó|ò|õ|ô|ö/', '/ú|ù|û|ü/', '/ç/', '/ñ/'],
            ['a', 'e', 'i', 'o', 'u', 'c', 'n'],
            mb_strtolower($string)
        );
    }

    public function getSuggestions($query, $limit = 8)
    {
        try {
            // Normalização: remove acentos e converte para minúsculas
            $normalizedQuery = mb_strtolower($this->removeAccents($query));
            $terms = preg_split('/\s+/', $normalizedQuery); // quebra em palavras

            // Montagem dinâmica da cláusula WHERE
            $likeClauses = [];
            $params = [];
            foreach ($terms as $i => $term) {
                $likeClauses[] = "LOWER(products.title) LIKE :term$i";
                $params[":term$i"] = '%' . $term . '%';
            }

            // Consulta com relevância e sugestão sonora (SOUNDEX)
            $sql = "
            SELECT DISTINCT title 
            FROM products 
            WHERE (" . implode(' OR ', $likeClauses) . ")
               OR SOUNDEX(title) = SOUNDEX(:soundexQuery)
            ORDER BY rating DESC
            LIMIT :limit
        ";

            $stmt = $this->conn->prepare($sql);

            foreach ($params as $key => $val) {
                $stmt->bindValue($key, $val);
            }

            $stmt->bindValue(':soundexQuery', $query, PDO::PARAM_STR);
            $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);

            $stmt->execute();

            $products = [];
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $products[] = $row['title'];
            }

            return ["success" => true, "data" => $products];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar sugestões: " . $e->getMessage()];
        }
    }

    public function getMyProducts($user_id)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_product_full_details WHERE user_id = :user_id ORDER BY product_id DESC");
            $stmt->execute([':user_id' => $user_id]);
            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($products)) {
                return ["success" => true, "data" => $products];
            } else {
                return ["success" => false, "message" => "Nenhum produto foi encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar produtos do usuário: " . $e->getMessage()];
        }
    }
}
