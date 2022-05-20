<?php

include_once('./headers.php');
include_once('./db.php');

$id = (int) $_POST['product_id'];

$stmt = $db->prepare("DELETE FROM products WHERE product_id=?");
$result = $stmt->execute([$id]);

echo json_encode(['product_id' => $id, 'success' => $result]);
