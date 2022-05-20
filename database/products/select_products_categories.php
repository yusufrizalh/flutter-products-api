<?php

include_once('./headers.php');
include_once('./db.php');

$stmt = $db->prepare("SELECT p.product_id, p.product_name, p.product_price, c.category_name FROM products p, categories c WHERE p.category_id = c.category_id ORDER BY p.product_id DESC");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
