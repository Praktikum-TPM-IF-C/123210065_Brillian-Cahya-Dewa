<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

$db = mysqli_connect('localhost', 'root', '', 'datauser');
if (!$db) {
    die(json_encode(["message" => "Database connection failed: " . mysqli_connect_error()]));
}

$response = [];

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM data_akun WHERE username = ?";
    $stmt = $db->prepare($sql);
    if ($stmt === false) {
        $response = ["message" => "Query preparation failed: " . $db->error];
        echo json_encode($response);
        exit();
    }

    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result === false) {
        $response = ["message" => "Query execution failed: " . $stmt->error];
        echo json_encode($response);
        exit();
    }

    $count = $result->num_rows;

    if ($count == 1) {
        $user = $result->fetch_assoc();
        $hashed_password = $user['password'];

        // Debugging: Log nilai input password dan hash password dari database
        error_log("Password input: " . $password);
        error_log("Hashed password: " . $hashed_password);

        // Menggunakan password_verify() untuk memeriksa kecocokan password
        if (password_verify($password, $hashed_password)) {
            $response = ["message" => "Success", "description" => "Login Berhasil"];
        } else {
            $response = ["message" => "Error", "description" => "Username atau Password Salah"];
        }
    } else {
        $response = ["message" => "Error", "description" => "Username atau Password Salah"];
    }
} else {
    $response = ["message" => "Error", "description" => "Missing username or password"];
}

echo json_encode($response);
?>
