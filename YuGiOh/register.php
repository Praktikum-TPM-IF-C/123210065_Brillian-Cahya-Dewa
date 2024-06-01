<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

$db = mysqli_connect('localhost', 'root', '', 'datauser');
if (!$db) {
    die(json_encode(["message" => "Database connection failed: " . mysqli_connect_error()]));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $hashed_password = password_hash($password, PASSWORD_BCRYPT); //enkripsi

        $sql = "SELECT username FROM data_akun WHERE username = '$username'";
        $result = mysqli_query($db, $sql);

        if (!$result) {
            die(json_encode(["message" => "Query failed: " . mysqli_error($db)]));
        }

        $count = mysqli_num_rows($result);

        if ($count == 1) {
            echo json_encode(["message" => "Error", "description" => "Akun Sudah Ada"]);
        } else {
            $insert = "INSERT INTO data_akun(username, password) VALUES('$username', '$hashed_password')";
            $query = mysqli_query($db, $insert);

            if (!$query) {
                die(json_encode(["message" => "Insert query failed: " . mysqli_error($db)]));
            } else {
                echo json_encode(["message" => "Success"]);
            }
        }
    } else {
        echo json_encode(["message" => "Error", "description" => "Missing username or password"]);
    }
} else {
    echo json_encode(["message" => "Error", "description" => "Invalid request method"]);
}
?>
