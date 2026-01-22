<?php
include '../Includes/session.php';
include '../Includes/dbcon.php';
include '../Includes/audit.php';

$statusMsg = "";

// Determine selected session
$selectedSessionId = isset($_GET['sessionId']) ? $_GET['sessionId'] : '';

// Save settings
if (isset($_POST['save'])) {
    $sessionId = $_POST['sessionId'];
    // New separate columns for start/end day
    $submission_start_day = isset($_POST['submission_start_day']) ? $_POST['submission_start_day'] : '';
    $submission_end_day = isset($_POST['submission_end_day']) ? $_POST['submission_end_day'] : '';
    $start_time = $_POST['submission_start_time'];
    $end_time = $_POST['submission_end_time'];

    if ($sessionId !== '') {
        $q = mysqli_query($conn, "UPDATE tblsessionterm SET 
            Submission_Start_Day='" . mysqli_real_escape_string($conn, $submission_start_day) . "',
            Submission_End_Day='" . mysqli_real_escape_string($conn, $submission_end_day) . "',
            Start_Time=" . ($start_time !== '' ? "'" . mysqli_real_escape_string($conn, $start_time) . "'" : "NULL") . ",
            End_Time=" . ($end_time !== '' ? "'" . mysqli_real_escape_string($conn, $end_time) . "'" : "NULL") . "
            WHERE Id='" . mysqli_real_escape_string($conn, $sessionId) . "'");
        if ($q) {
            // Audit: submission window updated
            audit_log($conn, 'update_submission_window', 'session', (string)$sessionId, null);
            $statusMsg = "<div class='alert alert-success' style='margin-right:700px;'>Submission window saved.</div>";
            $selectedSessionId = $sessionId;
        } else {
            $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>Failed to save settings.</div>";
        }
    } else {
        $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>Please select a session.</div>";
    }
}

// Fetch sessions
$sessions = [];
$rs = mysqli_query($conn, "SELECT Id, sessionName, isActive FROM tblsessionterm ORDER BY isActive DESC, dateCreated DESC");
while ($row = mysqli_fetch_assoc($rs)) {
    $sessions[] = $row;
}

// Fetch selected session settings
$curSettings = [
    'Submission_Start_Day' => '',
    'Submission_End_Day' => '',
    'Start_Time' => '',
    'End_Time' => ''
];
if ($selectedSessionId !== '') {
    $ss = mysqli_query($conn, "SELECT Submission_Start_Day, Submission_End_Day, Start_Time, End_Time FROM tblsessionterm WHERE Id='" . mysqli_real_escape_string($conn, $selectedSessionId) . "'");
    if ($ss && mysqli_num_rows($ss) > 0) {
        $curSettings = mysqli_fetch_assoc($ss);
    }
}

// Fetch students for selected session
$students = [];
if ($selectedSessionId !== '') {
    $stu = mysqli_query($conn, "SELECT Id, admissionNumber, firstName, lastName, classId, email FROM tblstudents WHERE sessionTermId='" . mysqli_real_escape_string($conn, $selectedSessionId) . "' ORDER BY lastName, firstName");
    while ($r = mysqli_fetch_assoc($stu)) {
        $students[] = $r;
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
    .uniform-field .form-control { min-height: calc(1.5em + .75rem + 2px); width: 100%; }
  </style>
</head>
<body id="page-top">
<div id="wrapper">
  <?php include "Includes/sidebar.php";?>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <?php include "Includes/topbar.php";?>
      <div class="container-fluid" id="container-wrapper">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">Set Day of Submission</h1>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Set Day of Submission</li>
          </ol>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card mb-4">
              <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Submission Window per Session</h6>
                <?php echo $statusMsg; ?>
              </div>
              <div class="card-body">
                <form method="post">
                  <div class="form-group row mb-3 uniform-field">
                    <div class="col-md">
                      <label class="form-control-label">Session<span class="text-danger ml-2">*</span></label>
                      <select class="form-control" name="sessionId" onchange="location='setSubmissionDay.php?sessionId=' + this.value;">
                        <option value="">-- Select Session --</option>
                        <?php foreach ($sessions as $s) { $sel = ($selectedSessionId !== '' && $selectedSessionId == $s['Id']) ? 'selected' : ''; ?>
                          <option value="<?php echo $s['Id']; ?>" <?php echo $sel; ?>><?php echo $s['sessionName']; ?> <?php echo ($s['isActive']=='1'?'(Active)':''); ?></option>
                        <?php } ?>
                      </select>
                    </div>
                    <div class="col-md">
                      <label class="form-control-label">Submission Start Day</label>
                      <select class="form-control" name="submission_start_day">
                        <?php
                        $days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
                        $startDaySel = !empty($curSettings['Submission_Start_Day']) ? $curSettings['Submission_Start_Day'] : 'Thursday';
                        $endDaySel = !empty($curSettings['Submission_End_Day']) ? $curSettings['Submission_End_Day'] : 'Friday';
                        foreach ($days as $d) {
                            $sel = ($startDaySel === $d) ? 'selected' : '';
                            echo '<option value="'.$d.'" '.$sel.'>'.$d.'</option>';
                        }
                        ?>
                      </select>
                    </div>
                    <div class="col-md">
                      <label class="form-control-label">Submission End Day</label>
                      <select class="form-control" name="submission_end_day">
                        <?php
                        foreach ($days as $d) {
                            $sel = ($endDaySel === $d) ? 'selected' : '';
                            echo '<option value="'.$d.'" '.$sel.'>'.$d.'</option>';
                        }
                        ?>
                      </select>
                    </div>
                    <div class="col-md">
                      <label class="form-control-label">Start Time</label>
                      <input type="time" class="form-control" name="submission_start_time" value="<?php echo htmlspecialchars($curSettings['Start_Time']); ?>">
                    </div>
                    <div class="col-md">
                      <label class="form-control-label">End Time</label>
                      <input type="time" class="form-control" name="submission_end_time" value="<?php echo htmlspecialchars($curSettings['End_Time']); ?>">
                    </div>
                  </div>
                  <button type="submit" name="save" class="btn btn-primary">Save</button>
                </form>
              </div>
            </div>
          </div>
        </div>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
    <?php include "Includes/footer.php";?>
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
    $('#dataTableHover').DataTable();
  });
</script>
</body>
</html>
