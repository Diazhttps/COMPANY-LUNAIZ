<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();

// Preflight (CORS)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header('Access-Control-Allow-Origin: http://localhost:3000/#');
    header('Access-Control-Allow-Methods: POST, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type');
    header('Access-Control-Allow-Credentials: true');
    exit(0);
}

header('Access-Control-Allow-Origin: http://localhost:3000');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');

// Solo POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit;
}

// Validar sesión
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'Sesión no iniciada']);
    exit;
}

// Leer JSON
$data = json_decode(file_get_contents('php://input'), true);

// Validar campos obligatorios
if (
    !isset($data['id']) || !isset($data['titulo']) || !isset($data['director']) ||
    !isset($data['actores']) || !isset($data['presupuesto']) || !isset($data['productora'])
) {
    echo json_encode(['success' => false, 'message' => 'Faltan datos obligatorios']);
    exit;
}

$id = intval($data['id']);
$titulo = $data['titulo'];
$director = $data['director'];
$actores = $data['actores'];
$presupuesto = floatval($data['presupuesto']);
$productora = $data['productora'];

// Conexión DB
$conn = new mysqli("localhost", "root", "", "company");
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Error de conexión con la base de datos']);
    exit;
}

// Actualización — columnas ajustadas y bind_param corregido
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
