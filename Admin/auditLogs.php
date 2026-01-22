<?php
ob_start();
include '../Includes/session.php';
include '../Includes/dbcon.php';

$statusMsg = '';

// Fetch audit logs
$logs = [];
$q = mysqli_query($conn, "SELECT id, admin_id, admin_name, action, entity, entity_id, details, ip_address, user_agent, request_uri, created_at FROM tblaudit_log ORDER BY id DESC LIMIT 1000");
if ($q) {
    while ($row = mysqli_fetch_assoc($q)) {
        $logs[] = $row;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/attnlg.jpg" rel="icon">
  <?php include 'includes/title.php';?>
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">
  <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <style>
    .truncate { max-width: 420px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .ua-cell { max-width: 320px; }
    .uri-cell { max-width: 420px; }
  </style>
</head>
<body id="page-top">
  <div id="wrapper">
    <?php include "Includes/sidebar.php"; ?>
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <?php include "Includes/topbar.php"; ?>
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Audit Logs</h1>
            <?php echo $statusMsg; ?>
          </div>

          <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">Recent Audit Events</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="auditTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Timestamp</th>
                      <th>Admin</th>
                      <th>Action</th>
                      <th>Page</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if (!empty($logs)) { foreach ($logs as $log) { ?>
                      <tr>
                        <td><?php echo htmlspecialchars($log['created_at']); ?></td>
                        <td><?php echo htmlspecialchars(trim(($log['admin_name'] ?: '') . ' [' . ($log['admin_id'] ?: '-') . ']')); ?></td>
                        <td><?php echo htmlspecialchars($log['action']); ?></td>
                        <td><?php echo htmlspecialchars($log['entity']); ?></td>
                    <?php } } else { ?>
                      <tr><td colspan="9" class="text-center">No logs found.</td></tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
      </div>
      <?php include "Includes/footer.php"; ?>
    </div>
  </div>

  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
  <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <script>
    $(document).ready(function () {
      $('#auditTable').DataTable({
        paging: true,
        lengthChange: true,
        searching: true,
        ordering: false,
        info: true,
        autoWidth: false
      });
    });
  </script>
</body>
</html>
<?php ob_end_flush(); ?>
