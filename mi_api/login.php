<?php
session_start();

header('Access-Control-Allow-Origin: http://localhost:3000');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "company");

if ($conexion->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Error de conexión a la base de datos']);
    exit;
}

// Recibir datos del cuerpo JSON
$input = json_decode(file_get_contents("php://input"), true);
$email = $conexion->real_escape_string($input['email'] ?? '');
$password = $conexion->real_escape_string($input['password'] ?? '');

// Validación
$sql = "SELECT id, username, password FROM usuarios WHERE email = '$email'";
$res = $conexion->query($sql);

if ($res && $res->num_rows === 1) {
    $user = $res->fetch_assoc();

    if ($password === $user['password']) {  // ⚠️ En producción usar password_verify con hash
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];

        // 🔥 Aquí devolvemos la estructura esperada por React
        echo json_encode([
            'success' => true,
            'message' => 'Login exitoso',
            'user' => [
                'id' => $user['id'],
                'username' => $user['username']
            ]
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Usuario no encontrado']);
}
