<?php
session_start();

if (isset($_POST['login'])) {
    require_once '../api/model/User.php';
    require_once '../api/config/Database.php';

    try {
        $database = new Database();
        $db = $database->connect();

        $user = new User($db);
        $user->email = $_POST['email'];

        // ambil user by email, lalu verifikasi password seperti biasa
        if ($user->setUser(true) && password_verify($_POST['password'], $user->password)) {
            // sesi lama tetap boleh, tapi kita tambahkan vuln berbasis cookie serialized
            $_SESSION['id'] = $user->id;

            // INTENTIONALLY INSECURE: simpan bukti login di cookie sebagai serialized string
            // sengaja tidak ditandatangani/di-hash agar bisa dimanipulasi attacker
            $authData = (object)[
                'id'    => (int)$user->id,
                'email' => $user->email,
            ];
            $serialized = serialize($authData);          // contoh: O:8:"stdClass":2:{s:2:"id";i:1;...}
            setcookie('auth', base64_encode($serialized), time() + 3600, '/');

            header('Location: index.php');
            exit;
        } else {
            echo "<h4>Wrong username or password</h4>";
        }
    } catch (Exception $e) {
        $err = htmlspecialchars($e->getMessage());
        echo "<h4>$err</h4>";
    }
}
