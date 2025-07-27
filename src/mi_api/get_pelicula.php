<?php
session_start();

// CORS preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header('Access-Control-Allow-Origin: http://localhost:3000');
    header('Access-Control-Allow-Methods: GET, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type');
    header('Access-Control-Allow-Credentials: true');
    exit(0);
}

header('Access-Control-Allow-Origin: http://localhost:3000');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');

// Solo método GET
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit;
}

// Validar sesión
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Sesión no iniciada']);
    exit;
}

// Validar parámetro id
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID inválido o faltante']);
    exit;
}

$id = intval($_GET['id']);

// Conexión a BD
$conn = new mysqli("localhost", "root", "", "company");
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Error de conexión a la base de datos']);
    exit;
}

// Consulta
$sql = "SELECT peliculas.id, peliculas.titulo, directores.nombre AS director, peliculas.actores, peliculas.presupuesto, peliculas.casa_productora 
        FROM peliculas 
        LEFT JOIN directores ON peliculas.director_id = directores.id 
        WHERE peliculas.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(['success' => false, 'message' => 'Película no encontrada']);
    $stmt->close();
    $conn->close();
    exit;
}

$pelicula = $result->fetch_assoc();

echo json_encode(['success' => true, 'data' => $pelicula]);

$stmt->close();
$conn->close();
exit;
?>
