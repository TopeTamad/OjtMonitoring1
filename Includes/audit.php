<?php
include_once __DIR__ . '/session.php';
include_once __DIR__ . '/dbcon.php';

// Ensure audit table exists (runs once per request, cheap no-op if it already exists)
$__audit_create_sql = "
CREATE TABLE IF NOT EXISTS tblaudit_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  admin_id VARCHAR(64) NULL,
  admin_name VARCHAR(255) NULL,
  action VARCHAR(64) NOT NULL,
  entity VARCHAR(64) NOT NULL,
  entity_id VARCHAR(128) NULL,
  details JSON NULL,
  ip_address VARCHAR(45) NULL,
  user_agent VARCHAR(512) NULL,
  request_uri VARCHAR(1024) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";
mysqli_query($conn, $__audit_create_sql);

function audit_log($conn, $action, $entity, $entity_id = null, $details = null) {
    $admin_id = isset($_SESSION['userId']) ? strval($_SESSION['userId']) : null;
    $admin_name = null;
    if (isset($_SESSION['firstName']) || isset($_SESSION['lastName'])) {
        $fn = isset($_SESSION['firstName']) ? $_SESSION['firstName'] : '';
        $ln = isset($_SESSION['lastName']) ? $_SESSION['lastName'] : '';
        $admin_name = trim($fn . ' ' . $ln);
    }

    // IP is no longer stored per request
    $ip = null;
    $ua = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : null;
    $uri = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : null;

    // Do not store entity_id and details anymore (insert NULLs), and do not store IP
    $stmt = mysqli_prepare($conn, "INSERT INTO tblaudit_log (admin_id, admin_name, action, entity, entity_id, details, ip_address, user_agent, request_uri) VALUES (?,?,?,? , NULL, NULL, NULL, ?, ?)");
    $stmt || die('Failed to prepare audit log statement');
    mysqli_stmt_bind_param($stmt, 'ssssss', $admin_id, $admin_name, $action, $entity, $ua, $uri);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
}
