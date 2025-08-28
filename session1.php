<?php
session_start();

// logout tetap hapus cookie vulnerable
if (isset($_GET['logout'])) {
    setcookie('auth', '', time() - 3600, '/');
    session_destroy();
    header('location: login.php');
    exit;
}

// kalau ada cookie 'auth', PERCAYA SAJA lalu unserialize tanpa validasi
if (isset($_COOKIE['auth'])) {
    $decoded = base64_decode($_COOKIE['auth'], true);
    if ($decoded === false || strpos($decoded, '::') === false) {
        header('location: login.php');
        exit;
    }

    [$json, $sig] = explode('::', $decoded, 2);

    $secret = 'super_secret_key';
    $expectedSig = hash_hmac('sha256', $json, $secret);

    if (!hash_equals($expectedSig, $sig)) {
        header('location: login.php');
        exit;
    }

    $auth = json_decode($json, true);
    if (!is_array($auth) || !isset($auth['id'])) {
        header('location: login.php');
        exit;
    }

    $user_id = $auth['id'];
} else {
    if (!isset($_SESSION['id'])) {
        header('location: login.php');
        exit;
    }
    $user_id = $_SESSION['id'];
}

