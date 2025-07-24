<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');

$data = json_decode(file_get_contents('php://input'), true);

$username = $data['username'] ?? null;
$email = $data['email'] ?? null;
$password = $data['password'] ?? null;

$conn = new mysqli('localhost', 'root', '', 'company');
if ($conn->connect_error) {
    die(json_encode(['success' => false, 'message' => 'Error de conexión']));
}

// Guarda la contraseña como texto plano (luego mejoramos esto con hash)
$sql = "INSERT INTO usuarios (username, email, password) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $username, $email, $password);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Usuario registrado con éxito']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error al registrar']);
}