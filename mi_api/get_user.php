<?php
session_start();
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

if (isset($_SESSION['usuario'])) {
    echo json_encode([
        'success' => true,
        'user' => $_SESSION['usuario']
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'No hay sesión activa.'
    ]);
}
