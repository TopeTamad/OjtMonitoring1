<?php
ob_start();
error_reporting(0);
include '../Includes/session.php';
include '../Includes/dbcon.php';

$statusMsg = '';

// Fetch inactive announcements
$ann = [];
$q = "SELECT id, admin_id, adminName, content, date_created, image_path, is_active FROM tblannouncement WHERE is_active = 0 ORDER BY date_created DESC";
$rs = mysqli_query($conn, $q);
if ($rs) {
  while ($r = mysqli_fetch_assoc($rs)) { $ann[] = $r; }
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
            <h1 class="h3 mb-0 text-gray-800">Archived Announcements</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Archived Announcements</li>
            </ol>
          </div>

          <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
              <h6 class="m-0 font-weight-bold text-primary">Inactive Announcements</h6>
            </div>
            <div class="card-body">
              <?php if (count($ann) > 0): ?>
                <div class="table-responsive">
                  <table class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                      <tr>
                        <th>Admin ID</th>
                        <th>Admin Name</th>
                        <th>Content</th>
                        <th>Image</th>
                        <th>Date Created</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($ann as $row): ?>
                        <tr>
                          <td><?php echo htmlspecialchars($row['admin_id']); ?></td>
                          <td><?php echo htmlspecialchars($row['adminName']); ?></td>
                          <td><?php echo nl2br(htmlspecialchars($row['content'])); ?></td>
                          <td>
                            <?php if (!empty($row['image_path'])): ?>
                              <img src="../Student/uploads/<?php echo htmlspecialchars($row['image_path']); ?>" alt="Announcement Image" style="width: 100px; height: auto;">
                            <?php else: ?>
                              No Image
                            <?php endif; ?>
                          </td>
                          <td><?php echo date('F j, Y, g:i a', strtotime($row['date_created'])); ?></td>
                          <td>Inactive</td>
                        </tr>
                      <?php endforeach; ?>
                    </tbody>
                  </table>
                </div>
              <?php else: ?>
                <div class="alert alert-secondary">No archived (inactive) announcements found.</div>
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
