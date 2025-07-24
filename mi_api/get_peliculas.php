<?php
session_start();
header('Access-Control-Allow-Origin: http://localhost:3000');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');

// Validar sesión
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Sesión no iniciada. Por favor, inicie sesión.']);
    exit;
}

// Conexión a BD
$conn = new mysqli("localhost", "root", "", "company");
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Error de conexión']);
    exit;
}

// Consulta
$sql = "SELECT 
  peliculas.titulo,
  peliculas.actores,
  directores.nombre AS director,
  peliculas.presupuesto,
  peliculas.casa_productora
FROM peliculas
LEFT JOIN directores ON peliculas.director_id = directores.id";

$result = $conn->query($sql);
$peliculas = [];

while ($row = $result->fetch_assoc()) {
    $peliculas[] = $row;
}

echo json_encode(['success' => true, 'data' => $peliculas]);
