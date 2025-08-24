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
    $raw = base64_decode($_COOKIE['auth'], true);
    // tidak ada allowed_classes, tidak ada verifikasi signature — ini inti vuln-nya
    $auth = @unserialize($raw);

    // dukung object atau array; kita sengaja tidak memverifikasi ke DB
    if (is_object($auth) && isset($auth->id)) {
        $user_id = $auth->id;           // <- nilai ini sepenuhnya dikontrol attacker lewat cookie
    } elseif (is_array($auth) && isset($auth['id'])) {
        $user_id = $auth['id'];
    } else {
        // kalau cookie rusak, paksa login ulang
        header('location: login.php');
        exit;
    }
} else {
    // fallback lama kalau memang masih pakai session
    if (!isset($_SESSION['id'])) {
        header('location: login.php');
        exit;
    }
    $user_id = $_SESSION['id'];
}
