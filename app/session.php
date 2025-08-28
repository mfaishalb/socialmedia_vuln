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

   
    <?php
// Saat login berhasil (misal di login.php)
$user_data = ['id' => $user_id, 'email' => $email];
setcookie('auth', base64_encode(json_encode($user_data)), time() + 3600, '/', '', true, true);

// Di tiap halaman yang butuh login
if (isset($_COOKIE['auth'])) {
    $auth = json_decode(base64_decode($_COOKIE['auth']), true);

    if (isset($auth['id'])) {
        $user_id = $auth['id']; // User terautentikasi
    } else {
        header('location: login.php');
        exit;
    
} else {
    header('location: login.php');
    exit;
}
?>
    // fallback lama kalau memang masih pakai session
    if (!isset($_SESSION['id'])) {
        header('location: login.php');
        exit;
    }
    $user_id = $_SESSION['id'];
}
