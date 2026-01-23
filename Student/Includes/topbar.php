<?php 
error_reporting(0);

// Fetch student information
$query = "SELECT * FROM tblstudents WHERE Id = ".$_SESSION['userId']."";
$rs = $conn->query($query);
$num = $rs->num_rows;
$rows = $rs->fetch_assoc();
$fullName = $rows['firstName']." ".$rows['lastName'];
$photoPath = isset($rows['photo_path']) && $rows['photo_path'] ? '../uploads/'.htmlspecialchars($rows['photo_path']) : 'img/user-icn.png';

// Fetch the count of replied reports
$notificationQuery = "SELECT COUNT(*) as count FROM tblreports WHERE status = 'replied' AND admissionNumber = ?";
$notificationStmt = $conn->prepare($notificationQuery);
$notificationStmt->bind_param("s", $_SESSION['admissionNumber']); // Assuming admissionNumber is stored in session
$notificationStmt->execute();
$notificationResult = $notificationStmt->get_result();
$notificationRow = $notificationResult->fetch_assoc();
$repliedCount = $notificationRow['count'];
?>

<head>
<meta name="theme-color" content="#4169E1"> 
<style>
  /* Mobile-only tweaks for student topbar */
  @media (max-width: 767.98px) {
    .student-topbar .img-profile { width: 44px !important; height: 44px !important; }
    .student-topbar .navbar-nav { padding-right: 1.25rem !important; }
    .student-topbar #userDropdown { padding-right: 0 !important; }
  }
</style>
</head>

<nav class="navbar navbar-expand navbar-light bg-gradient-primary topbar mb-2 mb-md-4 static-top pr-0 pr-md-3 student-topbar">
<a href="index.php" class="nav-link text-white">
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M12 2L2 7h20L12 2z" />
        <path stroke-linecap="round" stroke-linejoin="round" d="M2 7v10l10 5 10-5V7H2z" />
    </svg>
    Home
</a>
    <div class="text-white big" style="margin-left:100px;"></div>
    <ul class="navbar-nav ml-auto pr-0">
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="notificationDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i> <!-- Bell Icon -->
                <span class="badge badge-danger badge-counter"><?php echo $repliedCount; ?></span> <!-- Notification count -->
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="notificationDropdown">
                <h6 class="dropdown-header">
                    Notifications
                </h6>
                <div class="dropdown-divider"></div>
                <?php if ($repliedCount > 0): ?>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-exclamation-circle fa-sm fa-fw mr-2 text-gray-400"></i>
                        You have <?php echo $repliedCount; ?> new replies.
                    </a>
                <?php else: ?>
                    <a class="dropdown-item text-center" href="#">
                        No new notifications.
                    </a>
                <?php endif; ?>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item text-center" href="inbox.php">Show All Notifications</a>
            </div>
        </li>

        <div class="topbar-divider d-none d-sm-block"></div>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle pr-0 pr-md-2 mr-0 mr-md-0" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <img class="img-profile" src="<?php echo $photoPath; ?>" style="width:60px; height:60px; border-radius:50%; object-fit:cover; aspect-ratio:1/1;">
                <span class="ml-2 d-none d-lg-inline text-white small"><b>Welcome <?php echo $fullName;?></b></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout.php">
                    <i class="fas fa-power-off fa-fw mr-2 text-danger"></i>
                    Logout
                </a>
            </div>
        </li>
    </ul>
</nav>

<?php
// Close the notification statement
$notificationStmt->close();
?>