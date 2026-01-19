<?php 
ob_start();
error_reporting(0);
include '../Includes/session.php';
include '../Includes/dbcon.php';

$statusMsg = '';
$selectedSessionId = isset($_POST['sessionId']) ? intval($_POST['sessionId']) : 0;

// Ensure archive table exists
$createArchiveTableSql = "CREATE TABLE IF NOT EXISTS tblstudents_archive (
  Id INT(10) NOT NULL,
  admissionNumber VARCHAR(255) DEFAULT NULL,
  firstName VARCHAR(255) DEFAULT NULL,
  lastName VARCHAR(255) DEFAULT NULL,
  classId VARCHAR(10) DEFAULT NULL,
  contact VARCHAR(50) DEFAULT NULL,
  comp_name VARCHAR(255) DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  password VARCHAR(50) DEFAULT NULL,
  dateCreated VARCHAR(50) DEFAULT NULL,
  render_time INT(255) DEFAULT NULL,
  remaining_time INT(255) DEFAULT NULL,
  comp_link VARCHAR(255) DEFAULT NULL,
  archive_sessionId INT(10) DEFAULT NULL,
  archived_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;";
mysqli_query($conn, $createArchiveTableSql);

// Handle archive action
if (isset($_POST['archive_selected']) && isset($_POST['student_ids']) && $selectedSessionId > 0) {
    $studentIds = array_map('intval', $_POST['student_ids']);
    if (count($studentIds) > 0) {
        $idsCsv = implode(',', $studentIds);
        // Copy to archive table
        $copySql = "INSERT INTO tblstudents_archive (Id, admissionNumber, firstName, lastName, classId, contact, comp_name, email, address, password, dateCreated, render_time, remaining_time, comp_link, archive_sessionId)
                    SELECT Id, admissionNumber, firstName, lastName, classId, contact, comp_name, email, address, password, dateCreated, render_time, remaining_time, comp_link, $selectedSessionId
                    FROM tblstudents WHERE Id IN ($idsCsv)";
        $copyOk = mysqli_query($conn, $copySql);

        if ($copyOk) {
            // Remove from active students
            $deleteSql = "DELETE FROM tblstudents WHERE Id IN ($idsCsv)";
            $delOk = mysqli_query($conn, $deleteSql);
            if ($delOk) {
                $statusMsg = "<div class='alert alert-success'>Selected students archived successfully.</div>";
            } else {
                $statusMsg = "<div class='alert alert-warning'>Copied to archive, but failed to delete from active.</div>";
            }
        } else {
            $statusMsg = "<div class='alert alert-danger'>Failed to archive selected students.</div>";
        }
    }
}

// Load inactive sessions
$sessions = [];
$sesRs = mysqli_query($conn, "SELECT Id, sessionName FROM tblsessionterm WHERE isActive='0' ORDER BY dateCreated DESC");
if ($sesRs) {
    while ($r = mysqli_fetch_assoc($sesRs)) { $sessions[] = $r; }
}

// Load eligible students for selected inactive session
$eligibleStudents = [];
if ($selectedSessionId > 0) {
    $sql = "SELECT DISTINCT s.* , c.className
            FROM tblstudents s
            LEFT JOIN tblclass c ON c.Id = s.classId
            INNER JOIN tbl_weekly_time_entries w ON w.admissionNumber = s.admissionNumber
            WHERE w.sessionId = $selectedSessionId";
    $rs = mysqli_query($conn, $sql);
    if ($rs) { while ($row = mysqli_fetch_assoc($rs)) { $eligibleStudents[] = $row; } }
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
</head>
<body id="page-top">
<div id="wrapper">
  <?php include "Includes/sidebar.php";?>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <?php include "Includes/topbar.php";?>
      <div class="container-fluid" id="container-wrapper">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">Archive Students</h1>
          <?php echo $statusMsg; ?>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Archive Students</li>
          </ol>
        </div>

        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">Select Inactive Session</h6>
          </div>
          <div class="card-body">
            <form method="post">
              <div class="form-row align-items-end">
                <div class="col-md-6">
                  <label>Inactive Session</label>
                  <select class="form-control" name="sessionId" required>
                    <option value="">-- Select Session --</option>
                    <?php foreach ($sessions as $s): ?>
                      <option value="<?php echo $s['Id']; ?>" <?php echo ($selectedSessionId==$s['Id']?'selected':''); ?>><?php echo htmlspecialchars($s['sessionName']); ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
                <div class="col-md-3">
                  <button type="submit" name="select_session" class="btn btn-primary">Load Students</button>
                </div>
              </div>
            </form>
          </div>
        </div>

        <?php if ($selectedSessionId > 0): ?>
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">Students linked to selected session</h6>
          </div>
          <div class="card-body">
            <form method="post">
              <input type="hidden" name="sessionId" value="<?php echo $selectedSessionId; ?>">
              <div class="table-responsive p-0">
                <table class="table table-striped table-hover" id="dataTableHover">
                  <thead class="thead-light">
                    <tr>
                      <th><input type="checkbox" id="chkAll"></th>
                      <th>Student ID</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Course</th>
                      <th>Contact</th>
                      <th>Email</th>
                      <th>Company</th>
                      <th>Date Created</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php if (count($eligibleStudents) > 0): $sn=0; foreach ($eligibleStudents as $st): $sn++; ?>
                    <tr>
                      <td><input type="checkbox" name="student_ids[]" value="<?php echo intval($st['Id']); ?>"></td>
                      <td><?php echo htmlspecialchars($st['admissionNumber']); ?></td>
                      <td><?php echo htmlspecialchars($st['firstName']); ?></td>
                      <td><?php echo htmlspecialchars($st['lastName']); ?></td>
                      <td><?php echo htmlspecialchars($st['className']); ?></td>
                      <td><?php echo htmlspecialchars($st['contact']); ?></td>
                      <td><?php echo htmlspecialchars($st['email']); ?></td>
                      <td><?php echo htmlspecialchars($st['comp_name']); ?></td>
                      <td><?php echo htmlspecialchars($st['dateCreated']); ?></td>
                    </tr>
                  <?php endforeach; else: ?>
                    <tr><td colspan="9" class="text-center">No students found for this session.</td></tr>
                  <?php endif; ?>
                  </tbody>
                </table>
              </div>
              <button type="submit" name="archive_selected" class="btn btn-danger" onclick="return confirm('Archive selected students? This will move them to archive and remove from active list.');">Archive Selected</button>
            </form>
          </div>
        </div>
        <?php endif; ?>

        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">Archived Students</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive p-0">
              <table class="table table-striped table-hover" id="dataTableHover2">
                <thead class="thead-light">
                  <tr>
                    <th>Student ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Course</th>
                    <th>Company</th>
                    <th>Archived Session</th>
                    <th>Archived At</th>
                  </tr>
                </thead>
                <tbody>
                <?php 
                $arcSql = "SELECT a.*, c.className, st.sessionName FROM tblstudents_archive a 
                           LEFT JOIN tblclass c ON c.Id = a.classId
                           LEFT JOIN tblsessionterm st ON st.Id = a.archive_sessionId
                           ORDER BY a.archived_at DESC";
                $arcRs = mysqli_query($conn, $arcSql);
                if ($arcRs && mysqli_num_rows($arcRs) > 0):
                  while ($ar = mysqli_fetch_assoc($arcRs)):
                ?>
                  <tr>
                    <td><?php echo htmlspecialchars($ar['admissionNumber']); ?></td>
                    <td><?php echo htmlspecialchars($ar['firstName']); ?></td>
                    <td><?php echo htmlspecialchars($ar['lastName']); ?></td>
                    <td><?php echo htmlspecialchars($ar['className']); ?></td>
                    <td><?php echo htmlspecialchars($ar['comp_name']); ?></td>
                    <td><?php echo htmlspecialchars($ar['sessionName']); ?></td>
                    <td><?php echo htmlspecialchars($ar['archived_at']); ?></td>
                  </tr>
                <?php endwhile; else: ?>
                  <tr><td colspan="7" class="text-center">No archived students yet.</td></tr>
                <?php endif; ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
    </div>
    <?php include "Includes/footer.php";?>
  </div>
</div>
<a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/ruang-admin.min.js"></script>
<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function(){
    $('#dataTableHover').DataTable();
    $('#dataTableHover2').DataTable();
    $('#chkAll').on('change', function(){
      const checked = $(this).is(':checked');
      $("input[name='student_ids[]']").prop('checked', checked);
    });
  });
</script>
</body>
</html>
<?php ob_end_flush(); ?>
