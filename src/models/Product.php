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
            $uploadDir = __DIR__ . '/../../uploads/';

            if (!file_exists($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            $firstImagePath = null;

            foreach ($imagens['tmp_name'] as $index => $tmpName) {
                if ($imagens['error'][$index] !== UPLOAD_ERR_OK) continue;

                $ext = pathinfo($imagens['name'][$index], PATHINFO_EXTENSION);
                $uniqueName = uniqid('img_', true) . '.' . $ext;
                $relativePath = 'uploads/' . $uniqueName;
                $uploadPath = $uploadDir . $uniqueName;

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

    public function updateProduct($productId, $data, $imagens)
    {
        try {
            error_log("Atualizando produto ID: $productId com dados: " . print_r($data, true));
            $this->conn->beginTransaction();

            // 1. Atualizar os dados principais
            $sql = "UPDATE products SET title = :title, description = :description, location = :location, 
            price = :price, category = :category 
            WHERE product_id = :product_id";

            $data['price'] = floatval(str_replace(',', '.', $data['price']));

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':title' => $data['title'],
                ':description' => $data['description'],
                ':location' => $data['location'],
                ':price' => $data['price'],
                ':category' => $data['category'],
                ':product_id' => $productId
            ]);

            // 2. Obter galeria
            $stmt = $this->conn->prepare("SELECT gallery_id FROM gallery WHERE product_id = :product_id");
            $stmt->execute([':product_id' => $productId]);
            $galleryId = $stmt->fetchColumn();

            if (!$galleryId) {
                throw new \Exception("Galeria não encontrada para o produto.");
            }

            // 3. Buscar todas imagens antigas do banco
            $stmt = $this->conn->prepare("SELECT path FROM images WHERE gallery_id = :gallery_id");
            $stmt->execute([':gallery_id' => $galleryId]);
            $oldImages = $stmt->fetchAll(PDO::FETCH_COLUMN);

            // 4. Pegar as imagens que o usuário quer manter
            $existingImages = isset($data['existing_images']) ? $data['existing_images'] : [];

            // 5. Determinar quais imagens remover
            $imagesToDelete = array_diff($oldImages, $existingImages);

            foreach ($imagesToDelete as $path) {
                $relativePath = str_replace(BASE_URL, '', $path);
                $filePath = realpath(__DIR__ . '/../../' . $relativePath);
                if ($filePath && file_exists($filePath)) {
                    unlink($filePath);
                }

                // Remover do banco
                $stmt = $this->conn->prepare("DELETE FROM images WHERE gallery_id = :gallery_id AND path = :path");
                $stmt->execute([
                    ':gallery_id' => $galleryId,
                    ':path' => $path
                ]);
            }

            // 6. Inserir novas imagens, se houver
            $newImagePaths = [];
            $firstImagePath = null;
            $uploadDir = __DIR__ . '/../../uploads/';
            if (!file_exists($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            if (!empty($imagens['tmp_name'])) {
                if (!is_array($imagens['tmp_name'])) {
                    foreach ($imagens as $key => $value) {
                        $imagens[$key] = [$value];
                    }
                }

                foreach ($imagens['tmp_name'] as $index => $tmpName) {
                    if ($imagens['error'][$index] !== UPLOAD_ERR_OK) continue;

                    $ext = pathinfo($imagens['name'][$index], PATHINFO_EXTENSION);
                    $uniqueName = uniqid('img_', true) . '.' . $ext;
                    $relativePath = 'uploads/' . $uniqueName;
                    $uploadPath = $uploadDir . $uniqueName;

                    if (move_uploaded_file($tmpName, $uploadPath)) {
                        $publicUrl = BASE_URL . $relativePath;
                        $newImagePaths[] = $publicUrl;

                        $stmt = $this->conn->prepare("INSERT INTO images (gallery_id, path) VALUES (:gallery_id, :path)");
                        $stmt->execute([
                            ':gallery_id' => $galleryId,
                            ':path' => $publicUrl
                        ]);
                    }
                }
            }

            // 7. Atualizar imagem de capa
            // prioridade: primeira imagem da nova lista total (existentes + novas)
            $finalImages = array_merge($existingImages, $newImagePaths);
            $firstImagePath = $finalImages[0] ?? null;

            $stmt = $this->conn->prepare("UPDATE products SET cover = :cover WHERE product_id = :product_id");
            $stmt->execute([
                ':cover' => $firstImagePath,
                ':product_id' => $productId
            ]);

            $this->conn->commit();
            return ["success" => true, "message" => "Produto atualizado com sucesso."];
        } catch (\Exception $e) {
            $this->conn->rollBack();
            error_log("Erro ao atualizar produto: " . $e->getMessage());
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
                $relativePath = str_replace(BASE_URL, '', $imagePath);
                $localPath = realpath(__DIR__ . '/../../' . $relativePath);

                if ($localPath && file_exists($localPath)) {
                    unlink($localPath);
                    error_log("🗑️ Imagem deletada com sucesso: $localPath");
                } else {
                    error_log("❌ Imagem não encontrada ou caminho inválido: $localPath");
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
            $stmt = $this->conn->prepare("
            SELECT 
                p.*, 
                u.user_id as user_id_user,
                u.name as user_name,
                u.avatar as user_avatar,
                u.phone as user_phone,
                u.type as user_type,
                u.created_at as user_created_at
            FROM v_product_details p
            LEFT JOIN users u ON p.user_id = u.user_id
            WHERE p.product_id = :product_id
        ");
            $stmt->execute([':product_id' => $product_id]);
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$row) {
                return ["success" => false, "message" => "Produto não encontrado"];
            }

            $product = [
                "product_id" => $row["product_id"],
                "user_id" => $row["user_id"],
                "title" => $row["title"],
                "description" => $row["description"],
                "price" => $row["price"],
                "price_before" => $row["price_before"],
                "category" => $row["category"],
                "rating" => $row["rating"],
                "cover" => $row["cover"],
                "quantity" => $row["quantity"],
                "location" => $row["location"],
                "created_at" => $row["created_at"],
                "updated_at" => $row["updated_at"],
                "seller_type" => $row["seller_type"],
                "status" => $row["status"]
            ];

            $user = null;
            if ($row["user_type"] === "user") {
                $user = [
                    "user_id" => $row["user_id_user"],
                    "name" => $row["user_name"],
                    "avatar" => $row["user_avatar"],
                    "phone" => $row["user_phone"],
                    "type" => $row["user_type"],
                    "created_at" => $row["user_created_at"]
                ];
            }

            return [
                "success" => true,
                "data" => [
                    "product" => $product,
                    "user" => $user // será null se não for type=user
                ]
            ];
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar produto: " . $e->getMessage()];
        }
    }

    public function getPopularProducts($all = false, $quantity = 6)
    {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM v_popular_products WHERE quantity > 0 AND status = 'available' ORDER BY view_count DESC LIMIT $quantity");
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
                $sql = "SELECT * FROM v_product_details 
                        WHERE category IN ($placeholders)
                        ORDER BY 
                            CASE 
                                WHEN status IN ('sold', 'nostock') THEN 1 
                                ELSE 0 
                            END,
                            created_at DESC";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute($categories);
            } else {
                $quantity = (int)$quantity;
                $sql = "SELECT * FROM v_product_details WHERE category IN ($placeholders) AND status = 'available' ORDER BY RAND() LIMIT $quantity";
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
                $stmt = $this->conn->prepare("SELECT * FROM v_product_details WHERE category = ? AND status = 'available' ORDER BY RAND() LIMIT ?");
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

    public function reduceQuantity($product_id, $quantity)
    {
        try {
            $sql = "UPDATE products SET quantity = quantity - :quantity WHERE product_id = :product_id";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':quantity', $quantity, PDO::PARAM_INT);
            $stmt->bindParam(':product_id', $product_id, PDO::PARAM_INT);

            if ($stmt->execute()) {
                return ["success" => true, "message" => "Quantidade atualizada com sucesso."];
            } else {
                return ["success" => false, "message" => "Erro ao atualizar quantidade."];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao atualizar quantidade."];
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
            SELECT p.*, 
                u.type as seller_type,
                MATCH(p.title, p.description, p.category) AGAINST(? IN NATURAL LANGUAGE MODE) AS relevance
            FROM products p
            JOIN users u ON u.user_id = p.user_id
            WHERE ($likeQuery)
            OR MATCH(p.title, p.description, p.category) AGAINST(? IN NATURAL LANGUAGE MODE)
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

            foreach ($products as &$product) {
                if (isset($product['price_before']) && isset($product['price']) && $product['price_before'] > 0) {
                    $discount = ($product['price_before'] - $product['price']) / $product['price_before'] * 100;
                    $product['discount_percentage'] = round($discount, 2);
                } else {
                    $product['discount_percentage'] = 0;
                }
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

    public function getPromotionProducts($minDiscountPercentage = 10, $maxDiscountPercentage = 100, $quantity = 10, $all = false)
    {
        try {
            if ($all) {
                $sql = "SELECT * FROM v_product_details
                    WHERE discount_percentage BETWEEN :min_discount AND :max_discount
                    AND status = 'available'
                    ORDER BY discount_percentage DESC";
                $stmt = $this->conn->prepare($sql);
                $stmt->bindValue(':min_discount', $minDiscountPercentage, PDO::PARAM_INT);
                $stmt->bindValue(':max_discount', $maxDiscountPercentage, PDO::PARAM_INT);
            } else {
                $sql = "SELECT * FROM v_product_details
                    WHERE discount_percentage BETWEEN :min_discount AND :max_discount
                    AND status = 'available'
                    ORDER BY discount_percentage DESC
                    LIMIT :quantity";
                $stmt = $this->conn->prepare($sql);
                $stmt->bindValue(':min_discount', $minDiscountPercentage, PDO::PARAM_INT);
                $stmt->bindValue(':max_discount', $maxDiscountPercentage, PDO::PARAM_INT);
                $stmt->bindValue(':quantity', $quantity, PDO::PARAM_INT);
            }

            $stmt->execute();

            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($products)) {
                return ["success" => true, "data" => $products];
            } else {
                return ["success" => false, "message" => "Nenhum produto em promoção foi encontrado"];
            }
        } catch (\Exception $e) {
            return ["success" => false, "message" => "Erro ao buscar promoções: " . $e->getMessage()];
        }
    }
}
