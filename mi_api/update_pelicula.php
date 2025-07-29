<?php
// === CONFIGURACIÓN BASE ===
ini_set('display_errors', 1);
error_reporting(E_ALL);

// ⚠️ Soporte para sesiones con React (CORS + cookies)
ini_set('session.cookie_samesite', 'Lax'); // Usa 'None' si tienes HTTPS
ini_set('session.cookie_secure', 'Off');   // Usa 'On' si estás en HTTPS

session_start();

// === CORS ===
$frontend_origin = 'http://localhost:3000';

header("Access-Control-Allow-Origin: $frontend_origin");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Content-Type: application/json");

// Preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// === VALIDACIONES ===
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit;
}

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Sesión no iniciada']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

if (
    !isset($data['id']) || !isset($data['titulo']) || !isset($data['director']) ||
    !isset($data['actores']) || !isset($data['presupuesto']) || !isset($data['productora'])
) {
    echo json_encode(['success' => false, 'message' => 'Faltan datos obligatorios']);
    exit;
}

// === ASIGNAR VARIABLES ===
$id = intval($data['id']);
$titulo = $data['titulo'];
$director = $data['director'];
$actores = $data['actores'];
$presupuesto = floatval($data['presupuesto']);
$productora = $data['productora'];

// === CONEXIÓN ===
$conn = new mysqli("localhost", "root", "", "company");
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Error de conexión con la base de datos']);
    exit;
}

// === ACTUALIZAR ===
$sql = "UPDATE peliculas SET titulo = ?, director = ?, actores = ?, presupuesto = ?, casa_productora = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssdis", $titulo, $director, $actores, $presupuesto, $productora, $id);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Película actualizada correctamente']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error al actualizar']);
}

$stmt->close();
$conn->close();
exit;
?>
