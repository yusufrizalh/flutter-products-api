<?php

include_once('./headers.php');
include_once('./db.php');

$id = (int) $_POST['product_id'];
$stmt = $db->prepare("SELECT product_name, product_price FROM products WHERE product_id = ?");
$stmt->execute([$id]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['result' => $result]);
