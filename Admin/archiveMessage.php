<?php
ob_start();
error_reporting(0);
include '../Includes/session.php';
include '../Includes/dbcon.php';

$statusMsg = '';

// Determine inactive sessions
$inactiveSessions = [];
$sesRs = mysqli_query($conn, "SELECT Id, sessionName FROM tblsessionterm WHERE isActive='0' ORDER BY dateCreated DESC");
if ($sesRs) {
    while ($r = mysqli_fetch_assoc($sesRs)) { $inactiveSessions[] = $r; }
}
$inactiveIds = array_map(function($s){ return (int)$s['Id']; }, $inactiveSessions);
$inactiveIdsCsv = count($inactiveIds) ? implode(',', $inactiveIds) : '0';

// Check if tblreports has sessionId
$reportsHasSessionId = false;
$colRes = mysqli_query($conn, "SHOW COLUMNS FROM tblreports LIKE 'sessionId'");
if ($colRes && mysqli_num_rows($colRes) > 0) { $reportsHasSessionId = true; }

// Fetch archived (inactive-session) messages if supported
$messages = [];
if ($reportsHasSessionId && count($inactiveIds) > 0) {
    $sql = "SELECT r.*, st.sessionName
            FROM tblreports r 
            LEFT JOIN tblsessionterm st ON st.Id = r.sessionId
            WHERE r.sessionId IN ($inactiveIdsCsv)
            ORDER BY r.created_at DESC";
    $rs = mysqli_query($conn, $sql);
    if ($rs) { while ($row = mysqli_fetch_assoc($rs)) { $messages[] = $row; } }
} elseif (!$reportsHasSessionId) {
    $statusMsg = "<div class='alert alert-info'>Archiving by session is not enabled because tblreports.sessionId is missing.</div>";
} else {
    $statusMsg = "<div class='alert alert-info'>No inactive sessions found.</div>";
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
</head>
<body id="page-top">
  <div id="wrapper">
    <?php include "Includes/sidebar.php";?>
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <?php include "Includes/topbar.php"; ?>
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Archived Messages (Inactive Sessions)</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Archived Messages</li>
            </ol>
          </div>
          <?php echo $statusMsg; ?>

          <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">Messages from Inactive School Years</h6>
            </div>
            <div class="card-body">
              <?php if ($reportsHasSessionId && count($messages) > 0): ?>
                <?php foreach ($messages as $row): ?>
                  <div class="border rounded p-3 mb-2">
                    <div><strong>Name:</strong> <?php echo htmlspecialchars($row['fullname']); ?> <small class="text-muted">(<?php echo htmlspecialchars($row['course']); ?>)</small></div>
                    <div class="mt-2"><strong>Message:</strong><br><?php echo nl2br(htmlspecialchars($row['report'])); ?></div>
                    <?php if (!empty($row['reply'])): ?>
                      <div class="mt-2 text-primary"><strong>Reply:</strong><br><?php echo nl2br(htmlspecialchars($row['reply'])); ?></div>
                    <?php endif; ?>
                    <div class="mt-2 text-muted">
                      <small>Receive: <?php echo htmlspecialchars($row['created_at']); ?> | Reply: <?php echo htmlspecialchars($row['sent_at']); ?> | Status: <?php echo htmlspecialchars($row['status']); ?> | Session: <?php echo htmlspecialchars($row['sessionName']); ?></small>
                    </div>
                  </div>
                <?php endforeach; ?>
              <?php elseif ($reportsHasSessionId): ?>
                <div class="alert alert-secondary">No archived messages found for inactive sessions.</div>
              <?php endif; ?>
            </div>
          </div>

        </div>
      </div>
      <?php include "Includes/footer.php"; ?>
    </div>
  </div>
  <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
</body>
</html>
<?php ob_end_flush(); ?>
