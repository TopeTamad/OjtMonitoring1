<?php
ob_start();
include '../Includes/session.php';
include '../Includes/dbcon.php';
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
  <?php include 'Includes/title.php'; ?>
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
      <?php include "Includes/sidebar.php"; ?>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
       <?php include "Includes/topbar.php"; ?>
        <!-- Topbar -->

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Archive - Weekly Time Entries</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Archive - Weekly Time Entries</li>
            </ol>
          </div>

          <div class="row">
            <div class="col-lg-12">
              <!-- Display Archived Weekly Time -->
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Archived Weekly Time (Inactive Sessions)</h6>
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>#</th>
                        <th>Week Start Date</th>
                        <th>Admission Number</th>
                        <th>Student Full Name</th>
                        <th>Course</th>
                        <th>Session ID</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Total Hours</th>
                        <th>Remaining Time</th>
                        <th>Date Created</th>
                        <th>Status</th>
                        <th>Image Link</th>
                      </tr>
                    </thead>
                    <tbody>
                        <?php
                        $query = "SELECT w.* FROM tbl_weekly_time_entries w 
                                   INNER JOIN tblsessionterm s ON s.id = w.sessionId 
                                   WHERE s.isActive = '0'";
                        $rs = $conn->query($query);
                        $num = $rs ? $rs->num_rows : 0;
                        $sn = 0;
                        if ($num > 0) {
                            while ($rows = $rs->fetch_assoc()) {
                                $sn++;
                                echo "
                                <tr>
                                    <td>".$sn."</td>
                                    <td>".$rows['week_start_date']."</td>
                                    <td>".$rows['admissionNumber']."</td>
                                    <td>".$rows['student_fullname']."</td>
                                    <td>".$rows['course']."</td>
                                    <td>".$rows['sessionId']."</td>
                                    <td>".$rows['monday_time']."</td>
                                    <td>".$rows['tuesday_time']."</td>
                                    <td>".$rows['wednesday_time']."</td>
                                    <td>".$rows['thursday_time']."</td>
                                    <td>".$rows['friday_time']."</td>
                                    <td>".$rows['saturday_time']."</td>
                                    <td>".$rows['total_hours']."</td>
                                    <td>".$rows['remaining_time']."</td>
                                    <td>".$rows['date_created']."</td>
                                    <td>".$rows['status']."</td>
                                    <td><a href='".$rows['image_link']."' target='_blank'>View Image</a></td>
                                </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='16' class='text-center'>No archived records found.</td></tr>";
                        }
                        ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
       <?php include "Includes/footer.php";?>
      <!-- Footer -->
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
   <!-- Page level plugins -->
  <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script>
    $(document).ready(function () {
      $('#dataTableHover').DataTable();
    });
  </script>
</body>
</html>
<?php

ob_end_flush();

?>
