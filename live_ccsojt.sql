-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 23, 2026 at 08:58 AM
-- Server version: 5.7.44-cll-lve
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srceduph_ojt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dateCreated` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `dateCreated`) VALUES
(1, 'src', 'admin', 'srcadmin@gmail.com', 'ALTIORApeto0949', NULL),
(5, 'Fernand', 'Layug', 'f.layug@src.edu.ph', 'ALTIORAPETOCCS', '2025-02-27'),
(6, '', '', 'admin', '123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblannouncement`
--

CREATE TABLE `tblannouncement` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `adminName` varchar(255) DEFAULT NULL,
  `content` text,
  `image_path` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblannouncement`
--

INSERT INTO `tblannouncement` (`id`, `admin_id`, `adminName`, `content`, `image_path`, `date_created`, `is_active`) VALUES
(12, 5, 'Fernand Layug', 'For all those who have submitted DTR twice, the computations are ongoing', '', '2025-03-28 03:25:07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `Id` int(10) NOT NULL,
  `admissionNo` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `sessionTermId` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`Id`, `admissionNo`, `classId`, `classArmId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(214, '2018-0239', '7', '9', '4', '1', '2024-09-12');

-- --------------------------------------------------------

--
-- Table structure for table `tblaudit_log`
--

CREATE TABLE `tblaudit_log` (
  `id` int(11) NOT NULL,
  `admin_id` varchar(64) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `action` varchar(64) NOT NULL,
  `entity` varchar(64) NOT NULL,
  `entity_id` varchar(128) DEFAULT NULL,
  `details` json DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(512) DEFAULT NULL,
  `request_uri` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblaudit_log`
--

INSERT INTO `tblaudit_log` (`id`, `admin_id`, `admin_name`, `action`, `entity`, `entity_id`, `details`, `ip_address`, `user_agent`, `request_uri`, `created_at`) VALUES
(1, '5', 'Fernand Layug', 'create', 'announcement', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/createAn.php', '2026-01-23 00:11:52'),
(2, '5', 'Fernand Layug', 'deactivate', 'announcement', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/createAn.php?action=deactivate&id=13', '2026-01-23 00:12:10'),
(3, '5', 'Fernand Layug', 'delete', 'announcement', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/createAn.php?delete_id=13', '2026-01-23 00:12:11'),
(4, '5', 'Fernand Layug', 'update_submission_window', 'session', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/setSubmissionDay.php?sessionId=2', '2026-01-23 00:22:05'),
(5, '5', 'Fernand Layug', 'update_submission_window', 'session', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/setSubmissionDay.php?sessionId=2', '2026-01-23 00:22:42'),
(6, '5', 'Fernand Layug', 'deny_submission', 'weekly_time_entry', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/approval.php', '2026-01-23 00:27:00'),
(7, '5', 'Fernand Layug', 'deny_submission', 'weekly_time_entry', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', '/ccsojt/Admin/approval.php', '2026-01-23 00:28:39'),
(8, '5', 'Fernand Layug', 'deny_submission', 'weekly_time_entry', NULL, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '/ccsojt/Admin/approval.php', '2026-01-23 00:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblclass`
--

CREATE TABLE `tblclass` (
  `Id` int(10) NOT NULL,
  `className` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclass`
--

INSERT INTO `tblclass` (`Id`, `className`) VALUES
(1, 'BSIS 4A'),
(2, 'BSIS 4B');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassarms`
--

CREATE TABLE `tblclassarms` (
  `Id` int(10) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmName` varchar(255) NOT NULL,
  `isAssigned` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassarms`
--

INSERT INTO `tblclassarms` (`Id`, `classId`, `classArmName`, `isAssigned`) VALUES
(8, '7', 'Section A', '1'),
(9, '7', 'Section B', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher`
--

CREATE TABLE `tblclassteacher` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(50) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `Id` int(11) NOT NULL,
  `comp_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_num` varchar(255) NOT NULL,
  `comp_address` varchar(255) NOT NULL,
  `comp_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`Id`, `comp_name`, `contact_person`, `contact_num`, `comp_address`, `comp_link`) VALUES
(1, 'Santa Rita College of Pampanga', 'Fernand Layug', '09255697045', 'Carlos Mariano St. , San Jose, Santa Rita, Pampanga', 'https://src.edu.ph'),
(2, 'Rigourtech Calibrating Services', 'Kevin S. Cervantes', '09363121978', 'Zone 5 Dila -Dila Sta. Rita Pampanga', ''),
(3, 'SF Oil Incorporated', 'Anna Jamille Pasion', '09514204522', 'San Matias, Sta. Ritya Pampanga', ''),
(4, 'Municipality of Lubao Pampanga (Department of Health)', 'Ricky K. Rosillo', '09630863321', 'Sta. Catalina Lubao Pampanga', '09630863321'),
(5, 'Municipality of Porac (Agricultural Office)', 'Joceline Buan', '09817391994', 'Porac Pampanga', '09817391994'),
(6, 'RL Resort and Leisure Park', 'John Paul Tanineco', '09613035763', 'Barangay Mancatian, Porac Pampanga', ''),
(7, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', 'Cedric Salalila', '09089872030', 'Zone 7 Dila- Dila Sta. Rita Pampanga', ''),
(8, 'Power Scan Computer System & Gen. Merchandises', 'Dennis Rivera', '09631841', 'Plaza Burgos, Guagua Pampanga', ''),
(9, 'Sta. Rita Police Station', 'Cecilia M. Orane', '09493407842', 'Barangay San Jose, Sta. Rita Pampanga', ''),
(10, 'Santa Rita College of Pampanga (Security and Maintenance Unit)', 'Carlito D. Nicdao', '09632525318', 'Carlos Mariano St., San Jose, Sta. Rita Pampanga', ''),
(11, 'Municipality of Porac ( Lydo Local Youth Development Office)', 'Sarah Mae A. Salvador', '09359229175', 'Municipal Annex Building, Cangatba, Porac Pampanga', ''),
(12, 'Golden Green Enterprise ', 'Mark Sherwin Santos', '09989992785', 'Saup Project Road Cangatba, Porac, Pampanga', ''),
(13, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', 'Evangeline B. Panlilo', '', 'San Jose, Sta. Rita Pampanga', ''),
(14, 'MDGC Bills Payment Center', 'Ma. Dule G. Castro', '09272273541', 'Zone 1, San Matias, Sta. Rita Pampanga', ''),
(15, 'Becuran National High School', 'Lilia G. Valdez', '09330336818', 'Becuran Sta. Rita Pampanga', ''),
(16, 'Sta. Rita (Commision of Elections)', 'Ardith S. Comin', '09338105332', 'Diosdado Macapagal Building, San Jose, Sta. Rita Pampanga', ''),
(17, 'Office of the Municipal Engineer', 'Rosette C. Buan', '09162167965', 'San Jose, Sta. Rita Pampanga', ''),
(18, 'Municipality of Porac (Human Resource Management Office)', 'Crystral Joy C. Pineda', '09333244490', 'Gen. Luna Street, Barangay, Poblacion, Porac Pampanga', ''),
(19, 'Municipality Of Porac (Office of DTI negosyo Center)', 'Amelia F. Latag', '09461256577', 'Poblacion, Porac Pampanga', ''),
(20, 'Municipality of Porac (Office of the Vice Mayor)', 'Catalina Cayanan', '0933442581', 'Porac Pampanga', ''),
(21, 'Porac (Commision on Election)', 'Lizette S. Mallari', '09356653854', 'Municipal Bldg. Poblacion, Porac Pampanga', '09356653854'),
(22, 'Municipality of Sta. Rita Pampanga (MDRRMC)', 'Bryan O. Lumba', '09603412399', 'San Jose, Sta. Rita Pampanga', '09603412399'),
(23, 'LGU Sta. Rita Pampanga', 'Myla N. Capulong', '09208285178', 'San Jose Sta. Rita Pampanga', ''),
(24, 'Sasmuan Police Station', 'Richard M. Rosario', '09088132481', 'Sta. Lucia Sasmuan Pampanga', ''),
(25, 'Xaviery Computer Center', 'Julifer Tuazon', '09269839043', 'Plaza Cristina Building Xaviery Computer (Mcarthur Highway San Fernando, Pampanga)', ''),
(26, 'RDF feed, Livestock and Foods, Inc.', 'Victoria Jehan F. Quiambao', '09566674048', 'Purok 6, Brgy Lara, San Fernando Pampanga', ''),
(27, 'Porac Municipal Police Station ', 'Pems Jennyfer A. Mercado', '09176575083', 'Porac Pampanga', ''),
(28, 'Pampanga Medical Specialist Hospital Inc.', 'Mari B. Macabulos', '0457674 ', 'Jasa San Antonio Guagua Pampanga', '0457674 '),
(29, 'Ronmark Construction ', 'Danise Iana C. David ', '09657796359', 'San Matias, Dalan Bayu, Guagua Pampanga', ''),
(30, 'Porac Fire Station BFP R3', 'Moises O. Pineda', '', 'Command Center Compound Jalung Highway, Jalung Porac, Pampanga', ''),
(31, 'Sta. Rita Elementary School', 'Vilma H. Villanueva', '09328633200', 'San Vicente, Sta. Rita Pampanga', ''),
(32, 'Santa Rita College of Pampanga (MIS Office)', 'Emmanuel Mesina', '09472791448', 'Carlos Mariano St., San Jose, Sta. Rita Pampanga', ''),
(33, 'Royce Hotel & Casino', 'Allain Patrick Ramos', '09972589414', 'Manuel A. Roxas Highway, Corner Ninoy Aquino Avenue Zone Clark Freeport Mabalacat, Pampanga', ''),
(34, 'Municipality of Sta. Rita Pampanga (HRMO)', 'Rosario Mangune', '09208285178', 'San Jose, Sta. Rita Pampanga', ''),
(35, 'Municipality of Sta. Rita Pampanga (Department of Agriculture)', 'Emelita L. Hernandez', '09325031379', 'San Jose, Sta. Rita Pampanga', ''),
(38, 'jordan', 'Karen Jole Dizon', '09301306851', 'Poblacion, Porac, Pampanga', ''),
(39, 'Saint Catherines Academy', 'Karen Jole Dizon', '09301306851', 'Poblacion, Porac, Pampanga', ''),
(40, 'Municipality of Sta. Rita Pampanga (RHU)', 'Vince Bryan B. Viscayno', '09208285178', 'San Jose, Sta. Rita Pampanga', ''),
(41, 'Santa Rita College of Pampanga (Medical and Dental Clinic)', 'Mary Grace Q. David', '09434505488', 'Carlos Mariano St., San Jose, Sta. Rita Pampanga', ''),
(42, 'Animal Bite Center', 'Timothy Carlo Lacson', '09392064696', 'Babo Sacan Porac Pampanga', ''),
(43, 'Santa Rita College of Pampanga (Registrar Office)', 'Monette L. Galang', '0912345689', 'San Jose Sta.Rita Pampanga', ''),
(44, 'Santa Rita College of Pampanga (Library Office)', 'Marita G. Valerio', '0912345689', 'San Jose Sta.Rita Pampanga', ''),
(45, 'Municipality of Porac Pampanga(MASO)', 'Crystal Joy B. Pineda', '09123456789', 'Porac Pampanga', ''),
(46, 'Best Geo Carrier Corporation', 'Darlyn Llantada Santos', '09068496145', 'Jasa Road San Matias Guagua Pampanga', ''),
(47, 'Sattlink', 'Xena Pring', '09655122361', 'San Roque Guagua Pampanga', ''),
(48, 'Department of Public Works and Highway(DPWH)', 'Jennifer B. Gonzales', '09177196923', 'San Antonio Guagua Pampanga', ''),
(49, 'EMPOWERED-POS POINT-OF-SALE-MARKETING', 'Matt Mendoza', '09458896464', '0364 Purok 3 San Vicente(Ebus) Guagua Pampanga', ''),
(50, 'RDF FEED, LIVESTOCK & FOODS INC.', 'Millie M. Mandocdoc', '0912345689', 'Purok 6, Barangay Lara San Fernando Pampanga', '09566674048'),
(52, 'Land Transportation Office Guagua District(LTO)', 'Hans Christian P. Sinsay', '09490535533', 'San Matias Guagua Pampanga', ''),
(53, 'Municipality of Porac Pampanga(BPLO)', 'Crystal Joy C. Pineda', '09123456789', 'Babo Sacan Porac Pampanga', ''),
(54, 'San Juan Elementary School', 'Grace Z. Salonga', '09338543138', 'San Juan Macaba Santa Rita Pampanga', ''),
(55, 'Empowered Zone for Excellent Education', 'John Mark M. Navarro', '09239356477', 'San Matias Guagua Pampanga', ''),
(56, 'Rosario Medical Center of Guagua, INC', '', '045 649 5870', 'San Roque Guagua Pampanga', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblenroll`
--

CREATE TABLE `tblenroll` (
  `Id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `coor_name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblreports`
--

CREATE TABLE `tblreports` (
  `id` int(11) NOT NULL,
  `admissionNumber` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `report` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply` text,
  `adminName` varchar(255) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','resolved','replied','seen') DEFAULT 'pending',
  `sessionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblreports`
--

INSERT INTO `tblreports` (`id`, `admissionNumber`, `fullname`, `course`, `report`, `created_at`, `reply`, `adminName`, `sent_at`, `status`, `sessionId`) VALUES
(43, '210001253', 'Paul Ivan  Pineda', 'BSIS 4A', 'Good morning pu Sir/Doc, sabyan kupu sana kulang yapung -80 hrs ing time kupu, dapat pu 236 namu pu ing remaining hrs ku pero keni pung system 316 yapa pu, Thank you pu', '2025-03-13 03:04:39', 'Meron kang problem sa DTR mo na Cycle 3, Not Allowed one Signature in a 2 Weeks.\r\n', 'src admin', '2025-03-13 07:12:10', 'replied', 1),
(44, '210000894', 'Mangiliman Shanchai', 'BSIS 4A', 'hello po nag pass po ako ng dtr :) ', '2025-03-13 03:21:30', 'Okay na.', 'src admin', '2025-03-13 07:09:30', 'seen', 1),
(45, '210000870', 'Jonel Lansang', 'BSIS 4B', 'San ko po e pa pass yung dtr?\r\nYung mga naka raang week ba na dtr namin  dba sa Google classroom pina pass e pa pass ba ulit dito?', '2025-03-13 03:22:19', NULL, NULL, NULL, 'seen', 1),
(47, '210000859', 'Jordan  Zapanta', 'BSIS 4A', 'test1', '2025-03-13 06:53:12', 'hello jordan', 'src admin', '2025-03-13 06:57:51', 'seen', 1),
(48, '210001125', 'Gerald Guanlao', 'BSIS 4A', 'bakit ayaw po mag submit ng aking  dtr', '2025-03-13 07:30:51', 'friday to sunday po open yung submission', 'src admin', '2025-03-13 09:14:30', 'replied', 1),
(49, '210001254', 'Roger Ocampo', 'BSIS 4B', 'Hello po good afternoon, ask lang po kung paano po yung mga dtr since jan-feb? Ipapass pa po ba dito yung mga dtr since jan-feb', '2025-03-13 07:33:04', NULL, NULL, NULL, 'pending', 1),
(50, '210000845', 'Rowie Pascual', 'BSIS 4A', 'Mag papass poba ulit nyan ng dtr nung  last march 3-7 kase pi akala ko every 2 weeks mag papass. Thankyou ', '2025-03-13 08:35:08', NULL, NULL, NULL, 'seen', 1),
(51, '210000836', 'Nicole Lobo', 'BSIS 4A', 'mag pa pass pa pu ba Ako ng dtr for march 3-7 Kase Yung pinass ko wala pang signature ng supervisor pero Ngayon Meron na. Mag pass kupa puba ulit or bukas namu para saktung 2weeks la. Thank you doccc â¤ï¸', '2025-03-13 08:39:03', NULL, NULL, NULL, 'pending', 1),
(52, '210001253', 'Paul Ivan  Pineda', 'BSIS 4A', 'Pwede ko naman po pa pirma lahat tapos po pass ko nalang po ulit dito?', '2025-03-14 00:01:49', NULL, NULL, NULL, 'seen', 1),
(53, '210000883', 'Ashley Jude Santos', 'BSIS 4B', 'Good pm po, nag pass po ako ng DTR nalagay ko pong file name sa GDRIVE march 3-7 pero laman po kasama na yung 10-14, counted na po ba nun first at second week DTR? di po nakapag pass nung first week di po kasi agad na papirma DTR. Salamat po.', '2025-03-14 10:42:35', NULL, NULL, NULL, 'seen', 1),
(54, '210000870', 'Jonel Lansang', 'BSIS 4B', 'Pano palitang ng date yung sa pag sa submit ', '2025-03-15 03:56:50', NULL, NULL, NULL, 'seen', 1),
(55, '210000852', 'Amberlene  Gamboa', 'BSIS 4A', 'Bkt naka remain 500hrs paden kht nag upload na??', '2025-03-15 05:25:21', 'Wait for Approval ', 'Fernand Layug', '2025-03-18 03:08:52', 'seen', 1),
(56, '210001125', 'Gerald Guanlao', 'BSIS 4A', 'pwedi papo bang mag pass dun sa march 3 to 7 salamat po ', '2025-03-15 05:59:31', NULL, NULL, NULL, 'pending', 1),
(57, '210000844', 'Guanlao Carl Owen', 'BSIS 4A', 'Pwede papo magpass ng 3 to 7?', '2025-03-15 10:25:47', NULL, NULL, NULL, 'pending', 1),
(58, '210000888', 'Candice Cuenco', 'BSIS 4B', 'Concern Regarding DTR Submission\r\n\r\nDear Sir,\r\n\r\nI am trying to submit my DTR, but I am unable to input 10 hours because the system displays an error stating, â€œValue must be less than or equal to 8.â€ The system only allows a maximum of 8 hours, so I was unable to input my full 10 hours. As a result, 12 hours were not counted.\r\n\r\nThank you!\r\n', '2025-03-15 12:33:01', NULL, NULL, NULL, 'pending', 1),
(60, '210001019', 'Wilson Ello', 'BSIS 4B', 'yan pu yung link ng dtr ku nung 10-15, namali po ako ng pasa na link Sir, thanks po.\r\n\r\n\r\nhttps://drive.google.com/file/d/1CXE4GZTEVWwP6aiCSW9TPdzgu7pviSnx/view?usp=drivesdk', '2025-03-16 12:36:35', NULL, NULL, NULL, 'resolved', 1),
(61, '200000722', 'Gabriel Santos', 'BSIS 4A', 'Di po ako nakapag submit nung Cycle 3, pasensya po napagod at nakatulog. May night shift duty pa po kasi ako, security guard. Nagawa ko na po, di ko lang na submit. Sabay ko nalang po isubmit this friday. ', '2025-03-17 05:37:10', 'Wala pang Cycle 4 sa Google classroom sa DTR dito esusubmit every week \r\n', 'Fernand Layug', '2025-03-18 03:03:29', 'replied', 1),
(62, '210000888', 'Candice Cuenco', 'BSIS 4B', 'Request for Overtime Activation\r\n\r\nDear Sir,\r\n\r\nGood day!\r\n\r\nI would like to request the activation of my overtime. I am allowed to render overtime since I started late here at Royce Hotel & Casino.\r\n\r\nThank you for your consideration. I appreciate your approval.', '2025-03-19 05:12:40', NULL, NULL, NULL, 'seen', 1),
(64, '210001206', 'Joshua Marjef Deleon', 'BSIS 4B', 'pa update po ng remaining time thankyouuu\r\n', '2025-03-20 12:06:21', NULL, NULL, NULL, 'pending', 1),
(65, '210000894', 'Mangiliman Shanchai', 'BSIS 4A', 'hindi ko makita yung time record kopo nag susubmit ako pero walang lumalabas ', '2025-03-21 09:08:37', NULL, NULL, NULL, 'seen', 1),
(66, '210000870', 'Jonel Lansang', 'BSIS 4B', 'Ma ka count po ba yung mga unang dtr na pinas ko sa Google classroom kasi po late nagawa acc ko ask ko lang po kung ma ka count yun salamat.', '2025-03-22 12:06:14', NULL, NULL, NULL, 'seen', 1),
(67, '210000903', 'Mykel Roi Mangiliman', 'BSIS 4B', 'Doc Fernand Meron napo pirma ang aming February and march Salamat po', '2025-03-24 01:41:53', NULL, NULL, NULL, 'pending', 1),
(68, '210000905', 'Cristopher James Angeles', 'BSIS 4B', 'Hi napalitan ko na po yung picture ng dtr at napapirmahan ko na po ', '2025-03-25 10:37:17', NULL, NULL, NULL, 'pending', 1),
(69, '210001206', 'Joshua Marjef Deleon', 'BSIS 4B', 'Pa update po ung time as of now 90hours nalang po ako sa aming computation, thankyou', '2025-03-26 01:38:17', NULL, NULL, NULL, 'pending', 1),
(70, '210000876', 'Kim Elaiza Delos Santos', 'BSIS 4B', 'Mali ya ata itang apasa kung link ', '2025-03-28 11:16:57', NULL, NULL, NULL, 'pending', 1),
(71, '', '', 'BSIS 4B', 'Pa update po ung time as of now 90hours nalang po ako sa aming computation, thankyou', '2025-03-29 02:51:34', NULL, NULL, NULL, 'pending', 5),
(72, '210000879', 'Arnold Ronquillo', 'BSIS 4B', 'https://drive.google.com/file/d/1VYnF1c7P5SYeNeJyN5dp_e5QkfXV0hmk/view?usp=drivesdk sir pahabol ko yung march 3-14', '2025-03-29 04:50:10', NULL, NULL, NULL, 'pending', 1),
(73, '210001211', 'Justine Sotto', 'BSIS 4A', 'Sir ita pu march 17 to 21 ku sebe ke keng march 24 to 28 eke pu a pass last week alayu pu boss mi eke apa pirma. Thankyou pu', '2025-03-29 07:15:40', NULL, NULL, NULL, 'pending', 1),
(74, '210000890', 'Christian Anthony  Cuare', 'BSIS 4B', 'Good afternoon sir bat po denied po lahat ng sinubmit kopo thank you', '2025-03-29 08:24:58', NULL, NULL, NULL, 'seen', 1),
(75, '210000905', 'Cristopher James Angeles', 'BSIS 4B', 'Pacheck na lang po kung okay na pinapirmahan ko na po kay sir ronnie thanks', '2025-03-29 11:37:00', NULL, NULL, NULL, 'pending', 1),
(76, '210000841', 'Jake David', 'BSIS 4B', 'week 1-4 and week10 lahat ng na-pass ko ngayon.\r\nsalamat\r\n', '2025-03-29 14:19:54', NULL, NULL, NULL, 'pending', 1),
(77, '210001206', 'Joshua Marjef Deleon', 'BSIS 4B', 'GOOD PM \r\nPa compute po ulit ung hour, thankyou ', '2025-03-30 08:04:06', NULL, NULL, NULL, 'pending', 1),
(78, '210000902', 'Janine Salta', 'BSIS 4B', 'Hi Admin! Baka pwede pong pacompute ng time ko from January to March. Yung dtr ko from January to February is pinass ko siya through google classroom and yung dtr ko naman from the month of March is pinass ko siya through google drive and then i copied the link. Yung dtr ko from March 3-15 sadly hindi ko siya napass kasi naubusan ako ng oras then yung dtr ko naman from March 17-21 is nadenied kasi hindi ko siya napapirmahan sa gilid sa supervisor ko then yung from March 24-28 naman is kakapass ko lang then yung folder yung kinopy ko na link hindi yung mismong link ng dtr ko so if pwede po sana pacompute ng remaining hours ko kasi in my dashboard 500 hours parin nakalagay. Thank you in advance! :)', '2025-03-30 08:30:28', NULL, NULL, NULL, 'pending', 1),
(79, '210000890', 'Christian Anthony  Cuare', 'BSIS 4B', 'Good evening sir bat wala pong edit d kopo mapalitan yung link thank you', '2025-03-30 12:45:48', NULL, NULL, NULL, 'pending', 1),
(80, '210000870', 'Jonel Lansang', 'BSIS 4B', 'Pwede paba mag pass dpo ako naka pag pass nawala po kasi dtr ko ngayon ko lang na kita', '2025-03-30 23:42:43', NULL, NULL, NULL, 'pending', 1),
(82, '210000532', 'Joel  Paguio', 'BSIS 4B', 'Pwede po mag pass last week dtr dipo Kasi ako nakapag pass', '2025-04-06 03:39:28', NULL, NULL, NULL, 'pending', 1),
(83, '210001066', 'John Dexter Garcia', 'BSIS 4A', 'Hello po doc', '2025-04-11 03:17:23', NULL, NULL, NULL, 'pending', 1),
(84, '210001206', 'Joshua Marjef Deleon', 'BSIS 4B', 'paki count po ulit, done napo kasi ako at na double check konapo naka 512hours napo ako\r\n', '2025-04-12 11:57:59', NULL, NULL, NULL, 'pending', 1),
(87, '22-0002148', 'Mark Glen Guevarra', 'BSIS 4A', 'hello po', '2026-01-16 06:27:40', NULL, NULL, NULL, 'resolved', 2),
(88, '22-0002200', 'Mark Anthony Villafuerte', 'BSIS 4B', 'ask ko lang po nag start na po kami kanina Tuesday, Jan. 20, 2026... ngayon po ilalagay ko pu yung 8 hours sa Tuesday and submit na pu ba nun or i-susubmit nalang po nun kung napuno na hanggang friday... and lastly po confirm lang po kung kami puba gagawa ng template para sa DTR or bibili nalang po kami? thank you po and good evening...', '2026-01-20 10:32:40', NULL, NULL, NULL, 'seen', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblsessionterm`
--

CREATE TABLE `tblsessionterm` (
  `Id` int(10) NOT NULL,
  `sessionName` varchar(50) NOT NULL,
  `isActive` varchar(10) NOT NULL,
  `submission_start_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `submission_end_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsessionterm`
--

INSERT INTO `tblsessionterm` (`Id`, `sessionName`, `isActive`, `submission_start_day`, `submission_end_day`, `start_time`, `end_time`, `dateCreated`) VALUES
(1, '2024-2025', '0', 'Monday', 'Monday', NULL, NULL, '2025-03-03'),
(2, '2025-2026', '1', 'Friday', 'Monday', '08:00:00', '06:00:00', '2026-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudent`
--

CREATE TABLE `tblstudent` (
  `id` int(11) NOT NULL,
  `school_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `Id` int(10) NOT NULL,
  `admissionNumber` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `classId` varchar(10) DEFAULT NULL,
  `sessionTermId` int(10) DEFAULT NULL,
  `sessionId` int(255) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `comp_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `dateCreated` varchar(50) DEFAULT NULL,
  `render_time` int(255) DEFAULT NULL,
  `remaining_time` int(255) DEFAULT NULL,
  `comp_link` varchar(255) DEFAULT NULL,
  `ot_isactive` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`Id`, `admissionNumber`, `firstName`, `lastName`, `classId`, `sessionTermId`, `sessionId`, `contact`, `comp_name`, `email`, `address`, `password`, `dateCreated`, `render_time`, `remaining_time`, `comp_link`, `ot_isactive`) VALUES
(1, '210001257', 'Mary Jane', 'Devibar', '2', NULL, NULL, '09858265319', 'Santa Rita College of Pampanga (MIS Office)', 'mj.devibar@src.edu.ph', 'Natividad Guagua Pampanga', '2429devibar', '2025-03-04', 500, 321, '', 0),
(2, '210000876', 'Kim Elaiza', 'Delos Santos', '2', NULL, NULL, '09387838242', 'Municipality of Lubao Pampanga (Department of Health)', 'kim.delossantos@src.edu.ph', 'Zone 6 San Matias Sta. Rita Pampanga', 'dKIM232003', '2025-03-04', 500, 108, '', 0),
(3, '210000902', 'Janine', 'Salta', '2', NULL, NULL, '09556037962', 'Porac (Commision on Election)', 'j.salta@src.edu.ph', 'Purok 1 Hacienda Dolores Porac, Pampanga', '12345678', '2025-03-04', 500, 500, '', 0),
(4, '210000880', 'Kyla Charina Joy', 'Mercado', '2', NULL, NULL, '09557513599', 'Santa Rita College of Pampanga', 'kc.mercado@src.edu.ph', 'Dila-Dila Sta. Rita', 'charinajoy', '2025-03-04', 500, 468, '', 0),
(5, '21001248', 'Renjoy Marie', 'David', '2', NULL, NULL, '09489874843', 'Santa Rita College of Pampanga', 'rm.david@src.edu.ph', 'Betis Guagua Pampanga', '87654321', '2025-03-04', 500, 196, '', 0),
(6, '210001237', 'Renalyn ', 'Balagtas', '2', NULL, NULL, '091693029774', 'Santa Rita College of Pampanga', 'r.balagtas@src.edu.ph', 'Natividad Guagua Pampanga', 'Rena04', '2025-03-04', 500, 69, '', 0),
(7, '  210000878', 'Darvin Lhoyd', 'Galang', '2', NULL, NULL, '09473537335', 'Santa Rita College of Pampanga (MIS Office)', 'd.galang@src.edu.ph', 'San Jose (Dayat) Guagua Pampanga', '12345', '2025-03-04', 500, 74, '', 0),
(8, '210000856', 'Edward ', 'Salalila', '2', NULL, NULL, '09055971072', 'Santa Rita College of Pampanga (Security and Maintenance Unit)', 'e.salalila@src.edu.ph', 'Zone 7 dila dila sta Rita pampanga', 'edward30', '2025-03-04', 500, 436, '', 0),
(9, '210000843', 'Dennielle Nikko ', 'Calma', '2', NULL, NULL, '09159636033', 'Municipality of Porac (Human Resource Management Office)', 'nikko.calma@src.edu.ph', ' Purok 1 Babo Pangulo, Porac Pampanga', 'perzivalnikko142501', '2025-03-04', 500, 292, '', 0),
(10, '210000532', 'Joel ', 'Paguio', '2', NULL, NULL, '09461243596', 'SF Oil Incorporated', 'j.paguio@src.edu.ph', 'Zone 2 San Agustin Sta Rita Pampanga', '12345678', '2025-03-04', 500, 435, '', 0),
(11, '210000886', 'Aljon Dave', 'MaÃ±alac', '2', NULL, NULL, '09107296859', 'Sta. Rita Police Station', 'a.manalac@src.edu.ph', 'Zone 3 sta.Monica Sta.Rita Pampanga', 'aljondave2513', '2025-03-04', 500, 64, '', 0),
(12, '210000854', 'Charles ', 'Lagman', '2', NULL, NULL, '09384175577', 'Sta. Rita Police Station', 'c.lagman@src.edu.ph', 'San Basilio Sta Rita Pampanga', 'Chay021203', '2025-03-04', 500, 60, '', 0),
(13, '210001233', 'Aerolle Jeremy', 'Salonga', '2', NULL, NULL, '09512115832', 'Ronmark Construction ', 'aj.salonga@src.edu.ph', 'Zone 2, Becuran Sta. Rita, Pampanga', 'Aerollejeremy120302', '2025-03-04', 500, 352, '', 0),
(14, '210000893', 'Zander ', 'Banquerico', '2', NULL, NULL, '09772539485', 'Sta. Rita Police Station', 'z.banquerico@src.edu.ph', 'Zone7 Pipitik Dila-Dila Sta. Rita Pampanga', '12345678', '2025-03-04', 500, 60, '', 0),
(15, '210001251', 'Michael Bon ', 'Lapid', '2', NULL, NULL, '09126806710', 'Sta. Rita (Commision of Elections)', 'mb.lapid@src.edu.ph', 'Zone 2, San Agustin Sta Rita Pampanga', 'Michaelbon19', '2025-03-04', 500, -60, '', 0),
(16, '210001254', 'Roger', 'Ocampo', '2', NULL, NULL, '09515905590', 'Sta. Rita Elementary School', 'r.ocampo.@src.edu.ph', 'Zone 1 San Agustin Sta. Rita Pampanga', '87654321', '2025-03-04', 500, 404, '', 0),
(17, '210001239', 'Jerson', 'Balagtas', '2', NULL, NULL, '09701894915', 'Sta. Rita Elementary School', 'j.balagtas@src.edu.ph', 'Natividad Guagua Pampanga', 'jersonB', '2025-03-04', 500, 324, '', 0),
(112, '22-0002145', 'Aira ', 'Fernandez', '2', NULL, NULL, '09613358031', 'EMPOWERED-POS POINT-OF-SALE-MARKETING', 'airafernandez@src.edu.ph', 'Pias Porac Pampanga', '22-0002145', '2026-01-20', 500, 500, '', 0),
(19, '210001273', 'Gervin ', 'Quinsay', '2', NULL, NULL, '09707397979', 'MDGC Bills Payment Center', 'g.quinsay@src.edu.ph', 'Zone 3, Becuran Sta. Rita, Pampanga', 'bulungsaging12@', '2025-03-04', 500, 0, '', 0),
(20, '210001206', 'Joshua Marjef', 'Deleon', '2', NULL, NULL, '09285120122', 'Xaviery Computer Center', 'marjef.deleon@src.edu.ph', ' Morning Sun Village, San Juan Macaba, Sta. Rita Pampanga', '031820', '2025-03-04', 500, 308, '', 0),
(21, '210001217', 'Denzen', 'Ocampo', '2', NULL, NULL, '09942064476', 'Xaviery Computer Center', 'd.ocampo@src.edu.ph', 'Zone 3, 494 San Isidro Santa Rita Pampanga', 'ocampo29', '2025-03-04', 500, 132, '', 0),
(22, '210000883', 'Ashley Jude', 'Santos', '2', NULL, NULL, '09283847364', 'Municipality of Porac ( Lydo Local Youth Development Office)', 'jude.santos@src.edu.ph', 'Purok 1, Pias, Porac, Pampanga', 'ojtajsantos', '2025-03-04', 500, 356, '', 0),
(23, '210000932', 'Xertxlle', 'Prestoza', '2', NULL, NULL, '09958115626', 'RL Resort and Leisure Park', 'x.prestoza@src.edu.ph', 'San Vicente Ebus Guagua Pampanga', '12345678', '2025-03-04', 500, 132, '', 0),
(24, '210001019', 'Wilson', 'Ello', '2', NULL, NULL, '09776224405', 'RL Resort and Leisure Park', 'w.ello@src.edu.ph', 'Zone 6 Dila-Dila Sta. Rita. Pampanga', '12345678', '2025-03-04', 500, 4, '', 0),
(25, '210000865', 'Lice Junet', 'Ramos', '2', NULL, NULL, '09154748776', 'Porac Municipal Police Station ', 'lj.ramos@src.edu.ph', '214 Bonifacio Street Babo Sacan Porac Pampanga', '12345678', '2025-03-04', 500, 460, '', 0),
(26, '210000903', 'Mykel Roi', 'Mangiliman', '2', NULL, NULL, '09317886538', 'Porac (Commision on Election)', 'm.mangiliman@src.edu.ph', 'Purok 1 Pulung Santol Porac Pampanga', 'pororoi14', '2025-03-04', 500, 500, '', 0),
(27, '210000842', 'Genesis Harran', 'Tadeo', '2', NULL, NULL, '0981577879', 'Municipality of Porac (Human Resource Management Office)', 'g.tadeo@src.edu.ph', 'Purok 1 Babo Pangulo, Porac Pampanga', 'kemoy123', '2025-03-04', 500, 292, '', 0),
(28, '210000841', 'Jake', 'David', '2', NULL, NULL, '09972349871', 'Golden Green Enterprise ', 'jake.david@src.edu.ph', 'Purok 2 Babo Pangulo, Porac, Pampanga', 'Kean1725', '2025-03-04', 500, 184, '', 0),
(29, '210001252', 'Nico ', 'Prado', '2', NULL, NULL, '09649079320', 'Porac (Commision on Election)', 'n.prado@src.edu.ph', 'Zone 6 dila dila sta Rita pampanga', 'Weakzed2002', '2025-03-04', 500, 476, '', 0),
(30, '210000814', 'Manuel', 'Liscano', '2', NULL, NULL, '09196431145', 'Sta. Rita Police Station', 'm.liscano@src.edu.ph', 'Dila-dila, Sta.Rita, Pampanga', '1234567890', '2025-03-04', 500, 56, '', 0),
(31, '210000891', 'Jayver', 'Buan', '2', NULL, NULL, '09649095324', 'Rigourtech Calibrating Services', 'j.buan@src.edu.ph', 'Zone 5 Dila-Dila Sta. Rita Pampanga', 'hakdog123', '2025-03-04', 500, 308, '', 0),
(32, '210000860', 'Kyle Aldrin ', 'Amio', '2', NULL, NULL, '09695719423', 'Power Scan Computer System & Gen. Merchandises', 'k.amio@src.edu.ph', 'Zone 7, Dila-Dila Sta Rita Pampanga', 'kyle29', '2025-03-04', 500, 280, '', 0),
(33, '210000890', 'Christian Anthony ', 'Cuare', '2', NULL, NULL, '09272553065', 'Power Scan Computer System & Gen. Merchandises', 'c.cuare@src.edu.ph', 'Zone 5 Dila-Dila Sta Rita Pampanga', '12345678', '2025-03-05', 500, 404, '', 0),
(34, '200000767', 'John Marlou ', 'Taglorin', '2', NULL, NULL, '09050940010', 'Power Scan Computer System & Gen. Merchandises', 'jm.taglorin@src.edu.ph', 'San Nicolas 1st Lubao, Pampanga', 'blackhat123@', '2025-03-05', 500, 412, '', 0),
(35, '210000881', 'Jerald', 'Muli', '2', NULL, NULL, '09184510536', 'RL Resort and Leisure Park', 'j.muli@src.edu.ph', 'Purok 1, Pias, Porac, Pampanga', 'jeraldmuli112902', '2025-03-05', 500, 188, '', 0),
(36, '210000875', 'Gerlyn', 'Espada', '1', NULL, NULL, '09499459551', 'Santa Rita College of Pampanga (MIS Office)', 'g.espada@src.edu.ph', 'Dampul Santa Monica, Sta. Rita Pampanga', '031502', '2025-03-05', 500, 87, '', 0),
(37, '210000866', 'Bernadette', 'Garcia', '1', NULL, NULL, '09510958747', 'Santa Rita College of Pampanga (MIS Office)', 'b.garcia@src.edu.ph', 'San Vicente Ebus Guagua Pampanga', 'ojtmis23', '2025-03-05', 500, 134, '', 0),
(38, '210001268', 'Heart Kate', 'Sarmiento', '1', NULL, NULL, '09124062844', 'Porac Fire Station BFP R3', 'hk.sarmiento@src.edu.ph', 'Salu, Porac, Pampanga', '@Heart23', '2025-03-05', 500, 356, '', 0),
(39, '210001256', 'Allyssa', 'Manalang', '1', NULL, NULL, '09664086979', 'Porac Fire Station BFP R3', 'a.manalang@src.edu.ph', 'Sitio Baidbid Sepung Bulaon, Porac, Pampanga', 'sangsang', '2025-03-05', 500, 348, '', 0),
(40, '21000837', 'Claire', 'Macaspac', '1', NULL, NULL, '09853592545', 'Porac Fire Station BFP R3', 'c.macaspac@src.edu.ph', 'Rizal Guagua Pampanga', 'claire142002', '2025-03-05', 500, 396, '', 0),
(41, '210001276', 'Kathlene', 'Tesoro', '1', NULL, NULL, '09708242243', 'Municipality of Porac (Office of the Vice Mayor)', 'k.tesoro@src.edu.ph', 'San Basilio Sta Rita Pampanga', 'Kathlene0101', '2025-03-05', 500, 356, '', 0),
(42, '210000894', 'Mangiliman', 'Shanchai', '1', NULL, NULL, '09701418215', 'Municipality of Porac (Office of the Vice Mayor)', 's.mangiliman@src.edu.ph', 'Sitio Baidbid Sepung Bulaon Porac Pampanga', 'shanchai03', '2025-03-05', 500, 108, '', 0),
(43, '210000857', 'Jamel Roseth', 'Sanchez', '1', NULL, NULL, '09271483528', 'Municipality Of Porac (Office of DTI negosyo Center)', 'jr.sanchez@src.edu.ph', 'Cangatba, Porac Pampanga', 'Sophisticated3528', '2025-03-05', 500, 20, '', 0),
(44, '210001255', 'Nicole', 'Garcia', '1', NULL, NULL, '09471945358', 'Pampanga Medical Specialist Hospital Inc.', 'n.garcia@src.edu.ph', 'Natividad Guagua Pampanga ', '299312', '2025-03-05', 500, 337, '', 1),
(45, '210000852', 'Amberlene ', 'Gamboa', '1', NULL, NULL, '09649898315', 'Office of the Municipal Engineer', 'a.gamboa@src.edu.ph', 'Zone 5 Dila-Dila Santa Rita Pampanga', '092403', '2025-03-05', 500, 380, '', 0),
(46, '210000850', 'Franchesca', 'Masa', '1', NULL, NULL, '09813322088', 'RDF feed, Livestock and Foods, Inc.', 'f.masa@src.edu.ph', 'Sto Domingo, Lubao, Pampanga', '727Chesca', '2025-03-05', 500, 160, '', 0),
(47, '210000892', 'Karen Cristine', 'Lugue', '1', NULL, NULL, '09271705044', 'Santa Rita College of Pampanga', 'kc.lugue@src.edu.ph', 'San Vicente Ebus, Guagua, Pampanga', 'Magabi2.0', '2025-03-05', 500, 234, '', 0),
(48, '210000889', 'Hazel', 'Santos', '1', NULL, NULL, '09360714466', 'Santa Rita College of Pampanga', 'h.santos@src.edu.ph', 'Purok 2 Natividad, Guagua, Pampanga', 'Hazelsnts015', '2025-03-05', 500, 67, '', 0),
(49, '210000836', 'Nicole', 'Lobo', '1', NULL, NULL, '09637450897', 'Municipality of Lubao Pampanga (Department of Health)', 'n.lobo@src.edu.ph', 'San Basilio, Sta Rita, Pampanga', '987654321', '2025-03-05', 500, 344, '', 0),
(50, '210000884', 'Ivan', 'Garcia', '1', NULL, NULL, '09284340080', 'Santa Rita College of Pampanga (MIS Office)', 'ivan.garcia@src.edu.ph', 'Becuran, Sta. Rita, Pampanga', 'Demonslayer040521', '2025-03-05', 500, 116, '', 0),
(51, '210001066', 'John Dexter', 'Garcia', '1', NULL, NULL, '09368864171', 'Santa Rita College of Pampanga (MIS Office)', 'dexter.garcia@src.edu.ph', 'San Jose (Dayat), Guagua Pampanga', 'june102003', '2025-03-05', 500, 83, '', 0),
(52, '210001212', 'Ian Carlo', 'Garcia', '1', NULL, NULL, '09612961794', 'Santa Rita College of Pampanga (MIS Office)', 'ian.garcia@src.edu.ph', 'San Agustin, Sta. Rita, Pampanga', 'henmarian02', '2025-03-05', 500, 150, '', 0),
(53, '210001277', 'Bryan Joseph', 'Ronquillo', '1', NULL, NULL, '09108247966', 'Santa Rita College of Pampanga (MIS Office)', 'b.ronquillo@src.edu.ph', 'Zone 2 Dila-Dila Sta. Rita, Pampanga', 'Agii_11', '2025-03-05', 500, 72, '', 0),
(54, '210000859', 'Jordan ', 'Zapanta', '1', NULL, NULL, '09612708718', 'Santa Rita College of Pampanga (MIS Office)', 'jordan.zapanta@src.edu.ph', 'Becuran Sta. Rita Pampanga', 'jordskie0949', '2025-03-05', 500, 95, '', 0),
(55, '210000861', 'Kevin', 'TaÃ±edo', '1', NULL, NULL, '09977009482', 'Becuran National High School', 'kevin.tanedo@src.edu.ph', 'Zone 6 Pamana Street Dila Dila Santa Rita Pampanga', 'ke4vinpogi20', '2025-03-05', 500, 132, '', 0),
(56, '210000844', 'Guanlao', 'Carl Owen', '1', NULL, NULL, '09109012288', 'Becuran National High School', 'owen.guanlao@src.edu.ph', 'San Juan Macaba Santa Rita Pampanga', 'owenguanlao1105', '2025-03-05', 500, 160, '', 0),
(57, '210001125', 'Gerald', 'Guanlao', '1', NULL, NULL, '09510650050', 'Sta. Rita Elementary School', 'gerald.guanlao@src.edu.ph', 'San Juan Macaba Santa Rita Pampanga', '2003gerald', '2025-03-05', 500, 436, '', 0),
(58, '210001253', 'Paul Ivan ', 'Pineda', '1', NULL, NULL, '09301288452', 'Sta. Rita Elementary School', 'p.pineda@src.edu.ph', 'Zone 4, Sta Monica, Sta Rita, Pampanga', 'november17', '2025-03-05', 500, 252, '', 0),
(59, '210001211', 'Justine', 'Sotto', '1', NULL, NULL, '09101538993', 'Municipality of Porac (Agricultural Office)', 'j.sotto@src.edu.ph', '115 Sitio Baidbid Sepung Bulaon Porac Pampanga', 'Tinopogi11', '2025-03-05', 500, 330, '', 0),
(60, '210000887', 'Sherwin', 'Manuel', '1', NULL, NULL, '09973705216', 'RL Resort and Leisure Park', 's.manuel@src.edu.ph', 'Pias, Porac, Pampanga', 'sherwinmnl_0326', '2025-03-05', 500, 63, '', 0),
(61, '21000', 'Ian Carlo', 'Infante', '1', NULL, NULL, '09107491177', 'Golden Green Enterprise ', 'ian.infante@src.edu.ph', 'Bonifacio, Babo Sacan Porac Pampanga', '123', '2025-03-05', 500, 284, '', 0),
(62, '210001204', 'Russel', 'Valencia', '1', NULL, NULL, '09925366289', 'LGU Sta. Rita Pampanga', 'r.valencia@src.edu.ph', 'Zone 5 San Matias Santa Rita Pampanga', 'Update1234567890', '2025-03-05', 500, 320, '', 0),
(63, '210001215', 'Noah', 'Isip', '1', NULL, NULL, '09632524565', 'Municipality of Porac ( Lydo Local Youth Development Office)', 'noah.isip@src.edu.ph', 'Pias, Porac, Pampanga', 'nowie200217', '2025-03-05', 500, 60, '', 0),
(64, '200000668', 'David Jr.', 'Romeo', '1', NULL, NULL, '09559222602', 'Municipality of Sta. Rita Pampanga (MDRRMC)', 'romeo.david@src.edu.ph', 'Zone 2, San Matias Sta Rita Pampanga', '040220', '2025-03-05', 500, 132, '', 0),
(65, '210000845', 'Rowie', 'Pascual', '1', NULL, NULL, '09922018596', 'Municipality of Sta. Rita Pampanga (MDRRMC)', 'r.pascual@src.edu.ph', 'San Jose, Santa Rita Pampanga', 'mdrrmo2025', '2025-03-05', 500, 356, '', 0),
(66, '210000849', 'John Michael', 'Gabito', '1', NULL, NULL, '09461243730', 'Municipality of Sta. Rita Pampanga (MDRRMC)', 'jm.gabito@src.edu.ph', 'Zone 4  Burayda San Basilio Santa Rita pampanga', 'JMSGABITO0116', '2025-03-05', 500, 76, '', 0),
(67, '200000722', 'Gabriel', 'Santos', '1', NULL, NULL, '09707700452', 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', 'g.santos@src.edu.ph', '401 Zone 4, San Basilio, Sta. Rita Pampanga', 'blue091002', '2025-03-05', 500, 138, '', 0),
(68, '210000848', 'Adrian', 'Layug', '1', NULL, NULL, '0932565145', 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', 'a.layug@src.edu.ph', 'Cacutud Sta Rita Pampanga', '299312', '2025-03-05', 500, 367, '', 1),
(69, '2100001264', 'Aldwin', 'PeÃ±a', '1', NULL, NULL, '09', 'Sasmuan Police Station', 'aldwin.pena@src.edu.ph', 'Pampanga', '12345678', '2025-03-05', 500, 452, '', 0),
(70, '210001260', 'Justine', 'Saylo', '1', NULL, NULL, '09269864406', 'MDGC Bills Payment Center', 'j.saylo@src.edu.ph', 'Zone 7 San Matias Sta Rita Pampanga', '09269864406', '2025-03-05', 500, 0, '', 0),
(71, '210001271', 'John Paul ', 'Nacu', '1', NULL, NULL, '09604282358', 'MDGC Bills Payment Center', 'jp.nacu@src.edu.ph', 'Zone 7 San Matias Sta Rita Pampanga', 'nacu123', '2025-03-05', 500, 0, '', 0),
(72, '210001249', 'Arvie', 'De Mesa', '1', NULL, NULL, '09125623512', 'RL Resort and Leisure Park', 'a.demesa@src.edu.ph', 'Sepung Bulaon, Porac Pampanga', '12345678', '2025-03-05', 500, 404, '', 0),
(73, '210001235', 'Shekinah Katerielle', 'Cruz ', '2', NULL, NULL, '09630825464', 'Royce Hotel & Casino', 'sk.cruz@src.edu.ph', '028 San Jose Sta. Rita Enumenadores  Street  Pampanga', 'sololeveling_0222', '2025-03-05', 500, 88, '', 1),
(74, '210000888', 'Candice', 'Cuenco', '2', NULL, NULL, '09707700607', 'Royce Hotel & Casino', 'c.cuenco@src.edu.ph', 'Purok 1 Lambac, Guagua, Pampanga', 'p@ssw0rd!', '2025-03-05', 500, 136, '', 1),
(75, '210001234', 'Ronel', 'Roque', '2', NULL, NULL, '09207716505', 'Santa Rita College of Pampanga', 'r.roque@src.edu.ph', 'Becuran Sta. Rita Pampanga.', 'Neltzy12', '2025-03-06', 500, 380, '', 0),
(76, '210000846', 'Dexter', 'Marcellano', '2', NULL, NULL, '09166641569', 'Porac Municipal Police Station ', 'd.marcellano@src.edu.ph', '255 ,Zone 3 Diladila Sta Rita Pampanga', 'Dugs@2001', '2025-03-06', 500, 342, '', 0),
(77, '210000879', 'Arnold', 'Ronquillo', '2', NULL, NULL, '09272414866', 'Santa Rita College of Pampanga', 'a.ronquillo@src.edu.ph', 'Zone 6, Becuran Sta. Rita, Pampanga', 'Ariela417', '2025-03-06', 500, 436, '', 0),
(78, '210000872', 'Adrian', 'Zapanta', '1', NULL, NULL, '09936774191', 'Santa Rita College of Pampanga', 'a.zapanta@src.edu.ph', 'Becuran Sta Rita Pampanga', 'adrian02', '2025-03-06', 500, 136, '', 0),
(79, '210001205', 'Teofilo', 'Pineda', '1', NULL, NULL, '09815445181', 'Municipality of Sta. Rita Pampanga (HRMO)', 'teofilo.pineda@src.edu.ph', 'Dila-dila, Sta.Rita, Pampanga', 'teofilo12', '2025-03-07', 500, 420, '', 0),
(80, '210000864', 'Mark Rhyan ', 'Popatco', '1', NULL, NULL, '09667341777', 'Municipality of Sta. Rita Pampanga (Department of Agriculture)', 'mr.popatco@src.edu.ph', 'Zone 7 Dila Dila Santa rita  Pampanga', 'macmac22', '2025-03-07', 500, 500, '', 0),
(81, '210000885', 'Mark Darelle', 'Serrano', '1', NULL, NULL, '09186901082', 'Saint Catherines Academy', 'md.serrano@src.edu.ph', 'Model Community Pio Porac Pampanga', 'markdarellep192001', '2025-03-07', 500, 476, '', 0),
(82, '210002143', 'Victor Val ', 'David', '1', NULL, NULL, '09556903259', 'Saint Catherines Academy', 'val.david@src.edu.ph', '412 Saup Project Cangatba Porac Pampanga', 'Victorpogi', '2025-03-07', 500, 404, '', 0),
(83, '210000869', 'Angelo Carlo', 'Carreon', '1', NULL, NULL, '09612777750', 'Saint Catherines Academy', 'ac.carreon@src.edu.ph', 'Sitio Baidbid Sepung Bulaon Porac Pampanga', 'Eboyyod26', '2025-03-07', 500, 404, '', 0),
(84, '210000895', 'Fille', 'Anusencion', '1', NULL, NULL, '09164571728', 'Municipality of Sta. Rita Pampanga (RHU)', 'fille.anusencion@src.edu.ph', 'Zone7 Dila-Dila Sta. Rita, Pampanga', 'fille1106', '2025-03-07', 500, 332, '', 0),
(85, '210000905', 'Cristopher James', 'Angeles', '2', NULL, NULL, '09566932011', 'Santa Rita College of Pampanga', 'cj.angeles@src.edu.ph', 'San Juan Macaba Santa Rita Pampanga', 'Nikesb2020', '2025-03-07', 500, 372, '', 0),
(86, '210000870', 'Jonel', 'Lansang', '2', NULL, NULL, '09271541906', 'Municipality of Sta. Rita Pampanga (RHU)', 'jonel.lansang@src.edu.ph', 'San Agustin, Sta. Rita, Pampanga', '042202jonel', '2025-03-07', 500, 428, '', 0),
(111, '22-0002365', 'John Arley ', 'Dabu', '1', NULL, NULL, '09123456789', 'Department of Public Works and Highway(DPWH)', 'arleydabu@src.edu.ph', 'San Isidro Guagua Pampanga', '22-0002365', '2026-01-20', 500, 500, '', 0),
(88, '190000454', 'Aerol Jann', 'Isip', '1', NULL, NULL, '09', 'Municipality of Porac (Agricultural Office)', 'aerol.isip@src.edu.ph', 'Pias, Porac, Pampanga', 'q1234567', '2025-03-24', 500, 398, '', 0),
(89, '22-0002155', 'Roy', 'Juntilla', '1', NULL, NULL, '09264882133', 'Santa Rita College of Pampanga', 'juntillaroy@src.edu.ph', 'Zone 2 Dila-Dila, Sta.Rita Pampanga', 'Juntillaroy20*', '2026-01-15', 500, 500, '', 0),
(90, '22-0002148', 'Mark Glen', 'Guevarra', '1', NULL, NULL, '09187334929', 'Santa Rita College of Pampanga', 'markguevarra@src.edu.ph', 'Zone 1 San-Basilio Sta.Rita Pampanga', '22-0002148guevarra', '2026-01-15', 500, 500, '', 1),
(91, '22-0002152', 'Micaella', 'Millos', '1', NULL, NULL, '09503126278', 'Santa Rita College of Pampanga', 'micaellamillos@src.edu.ph', 'Purok 1 Sepung Bulaon Porac Pampanga', 'Micaypineda31', '2026-01-15', 500, 500, '', 0),
(92, '22-0002141', 'Princess', 'Calma', '1', NULL, NULL, '09762111276', 'Santa Rita College of Pampanga', 'princesscalma@src.edu.ph', 'Zone 3 San Isidro Santa Pampanga', 'taneydamobugok', '2026-01-15', 500, 500, '', 0),
(93, '22-0002394', 'Leonel', 'Popatco', '1', NULL, NULL, '09069329185', 'Animal Bite Center', 'leonelpopatco@src.edu.ph', 'Purok 1 Andres Bonifacio Balubad,Porac, Pampanga', 'nel103003', '2026-01-19', 500, 500, '', 0),
(94, '22-0002158', 'Roman', 'Mercado', '1', NULL, NULL, '09488521846', 'Animal Bite Center', 'romanmercado@src.edu.ph', 'Zone 7 San-Basilio, Sta.Rita Pampanga', '22-0002158', '2026-01-19', 500, 500, '', 0),
(95, '22-0002414', 'Raph Justine', 'Butial', '1', NULL, NULL, '09913314607', 'Santa Rita College of Pampanga', 'raphbutial@src.edu.ph', 'Zone 2, Becuran, Sta. Rita, Pampanga', 'Karlaraph2926', '2026-01-19', 500, 500, '', 0),
(96, '22-0002409', 'Val Nerie', 'Espeleta', '1', NULL, NULL, '09270860470', 'Santa Rita College of Pampanga', 'valespeleta@src.edu.ph', 'Zone 7 Dila-Dila, Sta.RIta, Pampanga', 'val123', '2026-01-19', 500, 500, '', 0),
(97, '22-0002154', 'Clarence', 'Dula', '2', NULL, NULL, '09264623974', 'Santa Rita College of Pampanga (Registrar Office)', 'clarencedula@src.edu.ph', 'Zone 7 Dila-Dila Sta Rita Pampanga', '22-0002154', '2026-01-19', 500, 500, '', 0),
(98, '22-0002294', 'Jerome', 'Ocampo', '2', NULL, NULL, '09702066827', 'Santa Rita College of Pampanga (Registrar Office)', 'jeromeocampo@src.edu.ph', 'Natividad Guagua Pampanga', '22-0002294', '2026-01-19', 500, 500, '', 0),
(99, '22-0002224', 'Janessa', 'Santos', '2', NULL, NULL, '09308813890', 'Santa Rita College of Pampanga (Library Office)', 'janessasantos@src.edu.ph', 'Zone 7 San-Basilio, Sta.Rita Pampanga', '22-0002224', '2026-01-19', 500, 500, '', 0),
(100, '22-0002401', 'Richard', 'Guevarra', '2', NULL, NULL, '09', 'Municipality of Porac Pampanga(MASO)', 'richardguevarra@src.edu.ph', 'Zone 4 San-Basilio Sta.Rita', '22-0002401', '2026-01-19', 500, 500, '', 0),
(101, '22-0002453', 'Dexter', 'Villegas', '2', NULL, NULL, '09157996274', 'Municipality of Porac Pampanga(MASO)', 'dextervillegas@src.edu.ph', 'Babo Pangulo Porac Pampanga', '22-0002453', '2026-01-19', 500, 500, '', 0),
(102, '22-0002200', 'Mark Anthony', 'Villafuerte', '2', NULL, NULL, '09517573774', 'Santa Rita College of Pampanga (Registrar Office)', 'markvillafuerte@src.edu.ph', 'Dalan Betis San Jose Sta.Rita Pampanga', 'mxxk!@#$%29', '2026-01-19', 500, 500, '', 0),
(103, '22-0002153', 'Elaine', 'Montemayor', '2', NULL, NULL, '09942386400', 'Best Geo Carrier Corporation', 'elainemontemayor@src.edu.ph', 'Zone 2 Dila-dila Sta.Rita Pampanga', '22-0002153', '2026-01-19', 500, 500, '', 0),
(104, '22-0002389', 'Jessa', 'Guanlao', '2', NULL, NULL, '09600965966', 'Best Geo Carrier Corporation', 'jessaguanlao@src.edu.ph', 'Dalan Betis San Jose Sta.Rita Pampanga', '22-0002389', '2026-01-19', 500, 500, '', 0),
(110, '22-0002403', 'Christopher', 'Panoy', '1', NULL, NULL, '09309971418', 'Santa Rita College of Pampanga', 'c.panoy@src.edu.ph', 'Zone 1 San Basilio Santa Rita Pampanga', '22-0002403tope', '2026-01-19', 500, 500, '', 0),
(106, '22-0002199', 'Janiro', 'Serrano', '2', NULL, NULL, '09395453809', 'Sattlink', 'janiroserrano@src.edu.ph', 'San Jose Sta Rita Pampanga', '22-0002199', '2026-01-19', 500, 500, '', 0),
(107, '22-000897', 'Eris', 'Ponio', '2', NULL, NULL, '09128380806', 'Sattlink', 'erisponio@src.edu.ph', 'Lambac Guagua Pampanga', '22-000897', '2026-01-19', 500, 500, '', 0),
(108, '22-0002201', 'Frencer ', 'Romero ', '2', NULL, NULL, '09307561748', 'Sattlink', 'frencerromero@src.edu.ph', 'San Jose Sta Rita Pampanga', '22-0002201', '2026-01-19', 500, 500, '', 0),
(109, '22-0002382', 'Vincent', 'Tiatco', '2', NULL, NULL, '09285352519', 'Sattlink', 'vincenttiatco@src.edu.ph', 'San Jose Sta Rita Pampanga', '22-0002382', '2026-01-19', 500, 500, '', 0),
(113, '22-0002142', 'Kyle', 'Fernandez', '2', NULL, NULL, '09394387941', 'EMPOWERED-POS POINT-OF-SALE-MARKETING', 'kylefernandez@src.edu.ph', 'Pias Porac Pampanga', '22-0002142', '2026-01-20', 500, 500, '', 0),
(114, '22-0002407', 'Jhay-R ', 'Mercado', '2', NULL, NULL, '09458878720', 'Santa Rita College of Pampanga (MIS Office)', 'jhayrmercado@src.edu.ph', 'Zone 5 Dila-dila Sta.Rita Pampanga', '22-0002407', '2026-01-20', 500, 500, '', 0),
(115, '22-0002420', 'Yvez Andrei', 'Santos', '2', NULL, NULL, '09765044500', 'Santa Rita College of Pampanga (MIS Office)', 'yvezsantos@src.edu.ph', 'Becuran Sta.Rita Pampanga', '22-0002420', '2026-01-20', 500, 500, '', 0),
(116, '22-0002372', 'Tricia Ann', 'Nepomuceno', '2', NULL, NULL, '09632850822', 'RDF FEED, LIVESTOCK & FOODS INC.', 'tricianepomuceno@src.edu.ph', 'Purok 1 Pulong Santol Porac Pampanga', '22-0002372', '2026-01-21', 500, 500, '', 0),
(117, '22-0002390', 'Neil Tristan', 'Mangiliman', '2', NULL, NULL, '09216718868', 'RDF FEED, LIVESTOCK & FOODS INC.', 'neilmangiliman@src.edu.ph', 'Purok 1 Pulong Santol Porac Pampanga', '22-0002390', '2026-01-21', 500, 500, '', 0),
(118, '22-0002120', 'Patrick', 'Alipio', '2', NULL, NULL, '09285330422', 'Santa Rita College of Pampanga (Library Office)', 'patrickalipio@src.edu.ph', 'Lambac Guagua Pampanga', '22-0002120', '2026-01-22', 500, 500, '', 0),
(119, '22-0002458', 'Veronica', 'Mercado', '1', NULL, NULL, '09753732175', 'Sta. Rita (Commision of Elections)', 'veronicamercado@src.edu.ph', 'San Vicente Santa Rita Pampanga', '22-0002458', '2026-01-22', 500, 500, '', 0),
(120, '22-0002146', 'Rimarch', 'Dizon', '1', NULL, NULL, '09463781517', 'Sta. Rita (Commision of Elections)', 'rimarchdizon@src.edu.ph', 'San Matias Santa Rita Pampanga', '22-0002146', '2026-01-22', 499, 499, '', 0),
(121, '22-0002460', 'John Michael ', 'Elilio', '1', NULL, NULL, '09817484791', 'Land Transportation Office Guagua District(LTO)', 'johnelilio@src.edu.ph', 'Babo Pangulo Porac Pampanga', '22-0002460', '2026-01-22', 500, 500, '', 0),
(122, '22-0002400', 'Steven', 'Gonzales', '2', NULL, NULL, '09663994912', 'Municipality of Porac Pampanga(BPLO)', 'stevengonzales@src.edu.ph', 'San Vicente (Ebus) Guagua Pampanga', '22-0002400', '2026-01-22', 500, 500, '', 0),
(123, '22-0002167', 'Gener ', 'Manlapaz jr.', '2', NULL, NULL, '09632302162', 'Municipality of Porac Pampanga(BPLO)', 'genermanlapaz@src.edu.ph', 'Sepung Bulaon Porac Pampanga', '22-0002167', '2026-01-22', 500, 500, '', 0),
(124, '22-0002191', 'John Emil', 'Tupas', '2', NULL, NULL, '09761212303', 'Municipality of Porac Pampanga(BPLO)', 'johnemiltupas@src.edu.ph', 'San Agustin Santa Rita Pampanga', '22-0002191', '2026-01-22', 500, 500, '', 0),
(125, '22-0002202', 'Limuel', 'Miranda', '1', NULL, NULL, '09454033298', 'San Juan Elementary School', 'limuelmiranda@src.edu.ph', 'San Isidro(Gasak) Santa Rita Pampanga', '22-0002202', '2026-01-22', 500, 500, '', 0),
(126, '22-0002439', 'Joanna', 'Julian', '2', NULL, NULL, '09534212104', 'Empowered Zone for Excellent Education', 'joannajulian@src.edu.ph', 'Dila-dila Sta.Rita Pampanga', '22-0002439', '2026-01-22', 500, 500, '', 0),
(127, '22-0002442', 'Prince Alvier ', 'Nunez', '2', NULL, NULL, '09915504294', 'Empowered Zone for Excellent Education', 'princenunez@src.edu.ph', 'San Agustin Santa Rita Pampanga', '22-0002442', '2026-01-22', 500, 500, '', 0),
(128, '21-0001062', 'John Michael', 'Dizon', '1', NULL, NULL, '09388514969', 'Rosario Medical Center of Guagua, INC', 'johnmichaeldizon@src.edu.ph', 'San Juan Cacutud Santa Rita Pampanga', '21-0001062', '2026-01-22', 500, 500, '', 0),
(129, '22-0002156', 'Ashlie John', 'Gatchallan', '1', NULL, NULL, '09930091745', 'Rosario Medical Center of Guagua, INC', 'ashliegatchallan@src.edu.ph', 'Zone 7 San Basilio Santa Rita Pampanga', '22-0002156', '2026-01-22', 500, 500, '', 0),
(130, '22-0002370', 'Aljon', 'Cruz', '1', NULL, NULL, '09070940506', 'Rosario Medical Center of Guagua, INC', 'aljoncruz@src.edu.ph', 'Magsasay, Guagua, Pampanga', '22-0002370', '2026-01-22', 500, 500, '', 0),
(131, '22-0002398', 'King Weshley', 'Mutuc', '1', NULL, NULL, '09929869375', 'Rosario Medical Center of Guagua, INC', 'kingmutuc@src.edu.ph', 'Zone 1 San Agustin Sta.Rita Pampanga', '22-0002370', '2026-01-22', 500, 500, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents_archive`
--

CREATE TABLE `tblstudents_archive` (
  `Id` int(10) NOT NULL,
  `admissionNumber` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `classId` varchar(10) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `comp_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `dateCreated` varchar(50) DEFAULT NULL,
  `render_time` int(255) DEFAULT NULL,
  `remaining_time` int(255) DEFAULT NULL,
  `comp_link` varchar(255) DEFAULT NULL,
  `archive_sessionId` int(10) DEFAULT NULL,
  `archived_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubmit`
--

CREATE TABLE `tblsubmit` (
  `Id` int(11) NOT NULL,
  `Task_Code` varchar(200) NOT NULL,
  `Student_id` varchar(255) NOT NULL,
  `Uploaded_File` varchar(255) NOT NULL,
  `Date_of_Submission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbltask`
--

CREATE TABLE `tbltask` (
  `Id` int(11) NOT NULL,
  `Task_Code` varchar(255) NOT NULL,
  `Task_Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Deadline` varchar(255) NOT NULL,
  `Student_ID` varchar(200) NOT NULL,
  `Files` varchar(255) NOT NULL,
  `Date_Submit` varchar(50) NOT NULL,
  `Stat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltask`
--

INSERT INTO `tbltask` (`Id`, `Task_Code`, `Task_Name`, `Description`, `Deadline`, `Student_ID`, `Files`, `Date_Submit`, `Stat`) VALUES
(4, 'TSK-001', '1st Week', '1st week of weekly report', '2024-09-30', '2018-0239', 'Capstone_Resibo_Final.pdf', '2024-09-19', 'Submitted');

-- --------------------------------------------------------

--
-- Table structure for table `tblterm`
--

CREATE TABLE `tblterm` (
  `Id` int(10) NOT NULL,
  `termName` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblterm`
--

INSERT INTO `tblterm` (`Id`, `termName`) VALUES
(1, 'First'),
(2, 'Second'),
(3, 'Third');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `Id` int(11) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`Id`, `emailAddress`, `password`, `user_type`) VALUES
(3, 'srcadmin@gmail.com', 'ALTIORApeto0949', 'Admin'),
(6, 'f.layug@src.edu.ph', 'ALTIORAPETOCCS', 'Admin'),
(7, 'devibarjane2@gmail.com', '12345678', 'Student'),
(8, 'kim.delossantos@src.edu.ph', 'dKIM232003', 'Student'),
(9, 'j.salta@src.edu.ph', '12345678', 'Student'),
(10, 'k.mercado@src.edu.ph', '12345678', 'Student'),
(11, 'r.david@src.edu.ph', '12345678', 'Student'),
(12, 'r.balagtas@src.edu.ph', 'Rena04', 'Student'),
(13, 'd.galang@src.edu.ph', '12345', 'Student'),
(14, 'e.salalila@src.edu.ph', 'edward30', 'Student'),
(15, 'nikko.calma@src.edu.ph', 'perzivalnikko142501', 'Student'),
(16, 'j.paguio@src.edu.ph', '12345678', 'Student'),
(17, 'a.manalac@src.edu.ph', 'aljondave2513', 'Student'),
(18, 'c.lagman@src.edu.ph', 'Chay021203', 'Student'),
(19, 'aj.salonga@src.edu.ph', 'Aerollejeremy120302', 'Student'),
(20, 'z.banquerico@src.edu.ph', '12345678', 'Student'),
(21, 'm.lapid@src.edu.ph', '12345678', 'Student'),
(22, 'r.ocampo.@src.edu.ph', '87654321', 'Student'),
(23, 'j.balagtas@src.edu.ph', 'jersonB', 'Student'),
(24, 'mike.santos@src.edu.ph', 'DikoAlam1*', 'Student'),
(25, 'g.quinsay@src.edu.ph', 'bulungsaging12@', 'Student'),
(26, 'marjef.deleon@src.edu.ph', '031820', 'Student'),
(27, 'd.ocampo@src.edu.ph', 'ocampo29', 'Student'),
(28, 'jude.santos@src.edu.ph', 'ojtajsantos', 'Student'),
(29, 'x.prestoza@src.edu.ph', '12345678', 'Student'),
(30, 'w.ello@src.edu.ph', '12345678', 'Student'),
(31, 'lj.ramos@src.edu.ph', '12345678', 'Student'),
(32, 'm.mangiliman@src.edu.ph', 'pororoi14', 'Student'),
(33, 'g.tadeo@src.edu.ph', 'kemoy123', 'Student'),
(34, 'j.david@src.edu.ph', '12345678', 'Student'),
(35, 'n.prado@src.edu.ph', 'Weakzed2002', 'Student'),
(36, 'm.liscano@src.edu.ph', '1234567890', 'Student'),
(37, 'j.buan@src.edu.ph', 'hakdog123', 'Student'),
(38, 'k.amio@src.edu.ph', 'kyle29', 'Student'),
(39, 'c.cuare@src.edu.ph', '12345678', 'Student'),
(40, 'jm.taglorin@src.edu.ph', 'blackhat123@', 'Student'),
(41, 'j.muli@src.edu.ph', 'jeraldmuli112902', 'Student'),
(42, 'g.espada@src.edu.ph', '031502', 'Student'),
(43, 'b.garcia@src.edu.ph', 'ojtmis23', 'Student'),
(44, 'hk.sarmiento@src.edu.ph', '@Heart23', 'Student'),
(45, 'a.manalang@src.edu.ph', 'sangsang', 'Student'),
(46, 'c.macaspac@src.edu.ph', 'claire142002', 'Student'),
(47, 'k.tesoro@src.edu.ph', 'Kathlene0101', 'Student'),
(48, 's.mangiliman@src.edu.ph', 'shanchai03', 'Student'),
(49, 'jr.sanchez@src.edu.ph', 'Sophisticated3528', 'Student'),
(50, 'n.garcia@src.edu.ph', '299312', 'Student'),
(51, 'a.gamboa@src.edu.ph', '092403', 'Student'),
(52, 'f.masa@src.edu.ph', '727Chesca', 'Student'),
(53, 'kc.lugue@src.edu.ph', 'Magabi2.0', 'Student'),
(54, 'h.santos@src.edu.ph', 'Hazelsnts015', 'Student'),
(55, 'n.lobo@src.edu.ph', '987654321', 'Student'),
(56, 'ivan.garcia@src.edu.ph', 'Demonslayer040521', 'Student'),
(57, 'dexter.garcia@src.edu.ph', 'june102003', 'Student'),
(58, 'ian.garcia@src.edu.ph', 'henmarian02', 'Student'),
(59, 'b.ronquillo@src.edu.ph', 'Agii_11', 'Student'),
(60, 'jordan.zapanta@src.edu.ph', 'jordskie0949', 'Student'),
(61, 'kevin.tanedo@src.edu.ph', 'ke4vinpogi20', 'Student'),
(62, 'owen.guanlao@src.edu.ph', 'owenguanlao1105', 'Student'),
(63, 'gerald.guanlao@src.edu.ph', '2003gerald', 'Student'),
(64, 'j.saylo@src.edu.ph', '09269864406', 'Student'),
(65, 'j.sotto@src.edu.ph', 'Tinopogi11', 'Student'),
(66, 's.manuel@src.edu.ph', 'sherwinmnl_0326', 'Student'),
(67, 'ian.infante@src.edu.ph', '123', 'Student'),
(68, 'r.valencia@src.edu.ph', 'Update1234567890', 'Student'),
(69, 'noah.isip@src.edu.ph', 'nowie200217', 'Student'),
(70, 'romeo.david@src.edu.ph', '040220', 'Student'),
(71, 'r.pascual@src.edu.ph', 'mdrrmo2025', 'Student'),
(72, 'jm.gabito@src.edu.ph', 'JMSGABITO0116', 'Student'),
(73, 'g.santos@src.edu.ph', 'blue091002', 'Student'),
(74, 'a.layug@src.edu.ph', '299312', 'Student'),
(75, 'aldwin.pena@src.edu.ph', '12345678', 'Student'),
(76, 'j.saylo@src.edu.ph', '09269864406', 'Student'),
(77, 'jp.nacu@src.edu.ph', 'nacu123', 'Student'),
(78, 'a.demesa@src.edu.ph', '12345678', 'Student'),
(79, 'sk.cruz@src.edu.ph', 'sololeveling_0222', 'Student'),
(80, 'candice.cuenco@src.edu.ph', '12345678', 'Student'),
(81, 'r.roque@src.edu.ph', 'Neltzy12', 'Student'),
(82, 'd.marcellano@src.edu.ph', 'Dugs@2001', 'Student'),
(83, 'a.ronquillo@src.edu.ph', 'Ariela417', 'Student'),
(84, 'a.zapanta@src.edu.ph', 'adrian02', 'Student'),
(85, 'teofilo.pineda@src.edu.ph', 'teofilo12', 'Student'),
(86, 'mr.popatco@src.edu.ph', 'macmac22', 'Student'),
(87, 'md.serrano@src.edu.ph', 'markdarellep192001', 'Student'),
(88, 'val.david@src.edu.ph', 'Victorpogi', 'Student'),
(89, 'ac.carreon@src.edu.ph', 'Eboyyod26', 'Student'),
(90, 'file.anusencion@src.edu.ph', '12345678', 'Student'),
(91, 'cj.angeles@src.edu.ph', 'Nikesb2020', 'Student'),
(92, 'jonel.lansang@src.edu.ph', '042202jonel', 'Student'),
(93, 'rea.hilario@src.edu.ph', '12345678', 'Student'),
(94, 'aerol.isip@src.edu.ph', 'q1234567', 'Student'),
(95, 'juntillaroy@src.edu.ph', 'Juntillaroy20*', 'Student'),
(96, 'markguevarra@src.edu.ph', '22-0002148guevarra', 'Student'),
(97, 'micaellamillos@src.edu.ph', 'Micaypineda31', 'Student'),
(98, 'princesscalma@src.edu.ph', 'taneydamobugok', 'Student'),
(99, 'leonalpopatco@src.edu.ph', '22-0002394', 'Student'),
(100, 'romanmercado@src.edu.ph', '22-0002158', 'Student'),
(101, 'raphbutial@src.edu.ph', 'Karlaraph2926', 'Student'),
(102, 'valespeleta@src.edu.ph', 'val123', 'Student'),
(103, 'clarencedula@src.edu.ph', '22-0002154', 'Student'),
(104, 'jeromeocampo@src.edu.ph', '22-0002294', 'Student'),
(105, 'janessasantos@src.edu.ph', '22-0002224', 'Student'),
(106, 'richardguevarra@src.edu.ph', '22-0002401', 'Student'),
(107, 'dextervillegas@src.edu.ph', '22-0002453', 'Student'),
(108, 'markvillafuerte@src.edu.ph', 'mxxk!@#$%29', 'Student'),
(109, 'elainemontemayor@src.edu.ph', '22-0002153', 'Student'),
(110, 'jessaguanlao@src.edu.ph', '22-0002389', 'Student'),
(111, 'christopher@src.edu.ph', '22-0002403cmp', 'Student'),
(112, 'janiroserrano@src.edu.ph', '22-0002199', 'Student'),
(113, 'erisponio@src.edu.ph', '22-000897', 'Student'),
(114, 'frencerromero@src.edu.ph', '22-0002201', 'Student'),
(115, 'vincenttiatco@src.edu.ph', '22-0002382', 'Student'),
(116, 'c.panoy@src.edu.ph', '22-0002403tope', 'Student'),
(117, 'arleydabu@src.edu.ph', '22-0002365', 'Student'),
(118, 'airafernandez@src.edu.ph', '22-0002145', 'Student'),
(119, 'kylefernandez@src.edu.ph', '22-0002142', 'Student'),
(120, 'jhayrmercado@src.edu.ph', '22-0002407', 'Student'),
(121, 'yvezsantos@src.edu.ph', '22-0002420', 'Student'),
(122, 'tricianepomuceno@src.edu.ph', '22-0002372', 'Student'),
(123, 'neilmangiliman@src.edu.ph', '22-0002390', 'Student'),
(124, 'patrickalipio@src.edu.ph', '22-0002120', 'Student'),
(125, 'veronicamercado@src.edu.ph', '22-0002458', 'Student'),
(126, 'rimarchdizon@src.edu.ph', '22-0002146', 'Student'),
(127, 'johnelilio@src.edu.ph', '22-0002460', 'Student'),
(128, 'stevengonzales@src.edu.ph', '22-0002400', 'Student'),
(129, 'genermanlapaz@src.edu.ph', '22-0002167', 'Student'),
(130, 'johnemiltupas@src.edu.ph', '22-0002191', 'Student'),
(131, 'limuelmiranda@src.edu.ph', '22-0002202', 'Student'),
(132, 'joannajulian@src.edu.ph', '22-0002439', 'Student'),
(133, 'princenunez@src.edu.ph', '22-0002442', 'Student'),
(134, 'johnmichaeldizon@src.edu.ph', '21-0001062', 'Student'),
(135, 'ashliegatchallan@src.edu.ph', '22-0002156', 'Student'),
(136, 'aljoncruz@src.edu.ph', '22-0002370', 'Student'),
(137, 'kingmutuc@src.edu.ph', '22-0002370', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_weekly_time_entries`
--

CREATE TABLE `tbl_weekly_time_entries` (
  `id` int(255) NOT NULL,
  `week_start_date` date NOT NULL,
  `monday_time` float DEFAULT '0',
  `tuesday_time` float DEFAULT '0',
  `wednesday_time` float DEFAULT '0',
  `thursday_time` float DEFAULT '0',
  `friday_time` float DEFAULT '0',
  `saturday_time` float DEFAULT '0',
  `remaining_time` int(255) DEFAULT NULL,
  `total_hours` int(255) DEFAULT NULL,
  `bon_time` int(255) DEFAULT '0',
  `over_time` int(11) NOT NULL DEFAULT '0',
  `student_fullname` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `sessionId` int(255) DEFAULT NULL,
  `comp_name` varchar(255) DEFAULT NULL,
  `comp_link` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `admissionNumber` varchar(255) NOT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `remarks` text,
  `status` enum('submitted','not submitted','pending','denied') DEFAULT 'not submitted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_weekly_time_entries`
--

INSERT INTO `tbl_weekly_time_entries` (`id`, `week_start_date`, `monday_time`, `tuesday_time`, `wednesday_time`, `thursday_time`, `friday_time`, `saturday_time`, `remaining_time`, `total_hours`, `bon_time`, `over_time`, `student_fullname`, `course`, `sessionId`, `comp_name`, `comp_link`, `date_created`, `admissionNumber`, `image_link`, `remarks`, `status`) VALUES
(5, '2025-02-24', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Ian Carlo Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-07 13:56:08', '210001212', 'https://drive.google.com/file/d/1cvrCIgz1y1IjIzHzf4a9weBL4WTe7coR/view?usp=drive_link', NULL, 'submitted'),
(6, '2025-03-03', 0, 0, 0, 0, 8, 0, 388, 8, 104, 0, 'Mykel Roi Mangiliman', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-08 11:43:22', '210000903', 'https://drive.google.com/drive/folders/1S8ChjhfZMn6xfSacE3YFa2fRYeOwl_i6', NULL, 'submitted'),
(7, '2025-03-03', 8, 8, 8, 8, 8, 8, 292, 48, 160, 0, 'Gervin  Quinsay', 'BSIS 4B', 1, 'MDGC Bills Payment Center', '', '2025-03-08 11:48:45', '210001273', 'https://drive.google.com/drive/folders/1GyMUmEx7zV15lYlADC_wAtLL_vEUKjg4?usp=sharing', NULL, 'submitted'),
(9, '2025-03-03', 8, 8, 8, 8, 8, 8, -196, 48, 184, 0, 'Justine Saylo', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-08 11:53:51', '210001260', 'https://drive.google.com/drive/folders/17hL9FVsi4awmrqt8V6m5AH6dQNSUPKps?usp=drive_link', NULL, 'submitted'),
(12, '2025-03-03', 8, 8, 8, 8, 8, 8, 372, 48, 80, 0, 'John Paul  Nacu', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-08 11:59:59', '210001271', 'https://drive.google.com/drive/folders/1WX5CvZdSHP0rZ6OUAl6WWzToGIK1v288?usp=drive_link', NULL, 'submitted'),
(13, '2025-03-03', 8, 8, 8, 8, 4, 0, 304, 36, 160, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-03-08 12:08:58', '210000850', 'https://drive.google.com/file/d/1-2J1k6FyUqGgLIC-QC9mMLomhcK02qw7/view?usp=drivesdk', NULL, 'submitted'),
(14, '2025-02-17', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Mary Jane Devibar', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-08 12:49:38', '210001257', 'https://drive.google.com/drive/folders/13v1GzrDhaWZTnHXfpqBwN8WDliKN7EK3', NULL, 'submitted'),
(15, '2025-03-03', 8, 8, 8, 8, 8, 0, 316, 40, 144, 0, 'Paul Ivan  Pineda', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-08 13:00:03', '210001253', 'https://drive.google.com/drive/folders/1enlBE3tDEU6cBq2TzSZ5Za261QwSc0uf', NULL, 'submitted'),
(16, '2025-03-03', 8, 8, 8, 8, 8, 8, 196, 48, 256, 0, 'Charles  Lagman', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-08 13:01:15', '210000854', 'https://drive.google.com/file/d/1GB2Mr93eDkwSsRTkUnAff7oSQkUoiXWC/view?usp=sharing', NULL, 'submitted'),
(17, '2025-03-03', 8, 8, 8, 8, 8, 0, 316, 40, 144, 0, 'David Jr. Romeo', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-08 13:32:03', '200000668', 'https://drive.google.com/file/d/1AmjOIZK6U1-Y_YSHv5NcYfxOdJxqqHzS/view?usp=drivesdk', NULL, 'submitted'),
(18, '2025-03-03', 8, 8, 8, 8, 8, 0, 220, 40, 240, 0, 'Jamel Roseth Sanschez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-03-08 13:47:03', '210000857', 'https://drive.google.com/file/d/1n9nhoHcFLMefrfSpAdKZP2xITPdDIgaD/view?usp=sharing', NULL, 'submitted'),
(19, '2025-03-03', 8, 8, 4, 8, 8, 0, 322, 36, 142, 0, 'Gabriel Santos', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', '', '2025-03-08 14:13:31', '200000722', 'https://drive.google.com/drive/folders/199xX_4emq4vkx_mKy_HRmI7oAK7Ovniw', NULL, 'submitted'),
(20, '2025-03-03', 8, 8, 8, 8, 8, 0, 404, 40, 56, 0, 'Roger Ocampo', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-08 18:30:21', '210001254', 'https://drive.google.com/file/d/1BuIYShkNHCSkiwa_EDoiIDsLS3hox8Hk/view?usp=drivesdk', NULL, 'submitted'),
(21, '2025-03-03', 8, 8, 8, 8, 8, 0, 236, 40, 224, 0, 'Jerson Balagtas', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-08 20:39:43', '210001239', 'https://drive.google.com/file/d/1MDbV2Q4-rSG3d2-5b4hTz5ltk8mU0iUg/view?usp=drivesdk', NULL, 'submitted'),
(22, '2025-03-03', 8, 8, 8, 8, 8, 8, 268, 48, 184, 0, 'Denzen Ocampo', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-08 20:40:21', '210001217', 'https://drive.google.com/file/d/1nqKebeSPT1yYnxcHkPhoMFt1GL34Tmbl/view?usp=sharing', NULL, 'submitted'),
(23, '2025-03-03', 8, 2, 8, 2, 8, 2, 500, 30, 0, 0, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-03-08 21:20:48', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'denied'),
(24, '2025-03-03', 8, 2, 8, 2, 8, 2, 500, 30, 0, 0, 'Adrian Layug', 'BSIS 4A', 1, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', '', '2025-03-08 21:22:44', '210000848', 'https://drive.google.com/drive/folders/12WrqsN02Zp_NiEhhdDKWpQtRHsCT1zST', NULL, 'denied'),
(25, '2025-03-03', 8, 8, 8, 8, 8, 0, 292, 40, 168, 0, 'Renjoy Marie David', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-08 22:07:06', '21001248', 'https://drive.google.com/drive/folders/1Zu5iCn7pOSguF7J00UHMivDf-PiXOKLz', NULL, 'submitted'),
(26, '2025-03-03', 8, 8, 8, 8, 8, 8, 284, 48, 168, 0, 'Sherwin Manuel', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-03-08 23:18:02', '210000887', 'https://drive.google.com/drive/folders/1t8XbFHNJoKUHQZL20HZMP0dcc9f37tbv', NULL, 'submitted'),
(27, '2025-03-03', 8, 0, 4, 8, 8, 8, 208, 36, 256, 0, 'Aljon Dave MaÃ±alac', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-08 23:20:41', '210000886', 'https://drive.google.com/file/d/1Qwdrf5tzdDyQVAXx4Bub7EaAdfv_1xA8/view?usp=drivesdk', NULL, 'submitted'),
(28, '2025-03-03', 8, 8, 8, 8, 8, 0, 356, 40, 104, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-09 11:20:24', '210000836', 'https://drive.google.com/file/d/18WEpXg2gfKFdq4gu_1RsYI-d3_LdBDQh/view?usp=drivesdk', NULL, 'submitted'),
(29, '2025-03-03', 8, 8, 8, 8, 8, 0, 292, 40, 168, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-09 11:38:43', '210000894', 'https://drive.google.com/file/d/1GV3OdzQyLyaJanCygMxaf_cRPbReEL-o/view?usp=drivesdk', NULL, 'submitted'),
(30, '2025-03-03', 8, 8, 8, 8, 8, 8, 196, 48, 256, 0, 'Manuel Liscano', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-09 13:32:54', '210000814', 'https://drive.google.com/drive/folders/1IVQvTWJsuvM3Ln2pJ1QHc3EH_I8GANnK?usp=drive_link ', NULL, 'submitted'),
(31, '2025-03-03', 8, 8, 0, 8, 8, 8, 204, 40, 256, 0, 'Zander  Banquerico', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-09 15:23:40', '210000893', 'https://drive.google.com/file/d/18cYqQ51DeDoRux_nee-tddk91Ioqzidf/view?usp=drivesdk', NULL, 'submitted'),
(32, '2025-03-03', 8, 8, 8, 8, 8, 8, 228, 48, 224, 0, 'Xertxlle Prestoza', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-09 15:50:02', '210000932', 'https://drive.google.com/file/d/1ZBbYC5-ZTgxV6NASERrr_tu-lPTHxy1G/view?usp=drivesdk', NULL, 'submitted'),
(33, '2025-03-03', 8, 8, 8, 8, 8, 8, 228, 48, 224, 0, 'Jerald Muli', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-09 17:34:36', '210000881', 'https://drive.google.com/drive/folders/1WPTF1rKjh6zUFICp6PZ2DdiwSUXmhhFP', NULL, 'submitted'),
(34, '2025-03-03', 8, 8, 8, 8, 8, 8, 228, 48, 224, 0, 'Wilson Ello', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-09 17:38:08', '210001019', 'https://drive.google.com/file/d/1ZBbYC5-ZTgxV6NASERrr_tu-lPTHxy1G/view?usp=drivesdk', NULL, 'submitted'),
(35, '2025-03-03', 8, 8, 8, 8, 8, 8, 180, 48, 272, 0, 'Michael Bon  Lapid', 'BSIS 4B', 1, 'Sta. Rita (Commision of Elections)', '', '2025-03-09 18:49:32', '210001251', 'https://drive.google.com/file/d/1Wn2DWB5pFMd1aYnCVRZ-nkUh2MqvGoTk/view?usp=drivesdk', NULL, 'submitted'),
(36, '2025-03-03', 8, 8, 8, 8, 8, 0, 388, 40, 72, 0, 'Aerolle Jeremy Salonga', 'BSIS 4B', 1, 'Ronmark Construction ', '', '2025-03-09 22:39:53', '210001233', 'https://drive.google.com/file/d/1fyt4qLHannTLx7nBzG0yHuA3zSPCGgCw/view?usp=drivesdk', NULL, 'submitted'),
(37, '2025-03-03', 8, 8, 8, 8, 8, 0, 300, 40, 160, 0, 'John Michael Gabito', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-09 23:13:12', '210000849', 'https://drive.google.com/file/d/1pN62roJ35sdvUv-ytNymGXsbnhi75MAD/view?usp=sharing', NULL, 'submitted'),
(39, '2025-03-03', 8, 8, 8, 8, 8, 0, 233, 40, 227, 0, 'Darvin Lhoyd Galang', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 14:43:30', '  210000878', 'https://drive.google.com/file/d/12NRZ3i59TsSOQ_61vZVrSJ5WCOYljxqB/view?usp=drive_link', NULL, 'submitted'),
(40, '2025-03-03', 8, 8, 8, 8, 8, 0, 310, 40, 150, 0, 'Ian Carlo Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 14:48:51', '210001212', 'https://drive.google.com/file/d/11RFc_IOntJdV1LQu9f4pFC9Kn4na96RL/view?usp=drive_link', NULL, 'submitted'),
(41, '2025-03-03', 8, 8, 8, 8, 6.4, 0, 362, 38, 100, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 14:53:16', '210000859', 'https://drive.google.com/file/d/1rXDwbmp6ilxx31xxvCtT94ulqlHc-kFL/view?usp=drive_link', NULL, 'submitted'),
(42, '2025-03-03', 8, 8, 8, 8, 8, 0, 231, 40, 229, 0, 'John Dexter Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 14:53:41', '210001066', 'https://drive.google.com/file/d/1nkQHGsv_sziU5ZWMVMOdeYpNq29lHXrw/view?usp=sharing', NULL, 'submitted'),
(43, '2025-03-03', 8, 8, 8, 8, 8, 0, 238, 40, 222, 0, 'Bernadette Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 15:03:16', '210000866', 'https://drive.google.com/drive/folders/1EKCvmIskDxXXaVTFI_wV_LwUJNd2ljA6', NULL, 'submitted'),
(44, '2025-03-03', 8, 8, 8, 8, 8, 0, 224, 40, 236, 0, 'Bryan Joseph Ronquillo', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 15:09:36', '210001277', 'https://drive.google.com/drive/folders/1-82QvU4c-FngPiDBoigEd373DjlSgs8r', NULL, 'submitted'),
(45, '2025-03-03', 8, 8, 7.1, 8, 8, 0, 238, 39, 223, 0, 'Gerlyn Espada', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 15:13:42', '210000875', 'https://drive.google.com/drive/folders/1riIKDHHR6H4CNMr-DsMYzmOgNsvqZqtQ', NULL, 'submitted'),
(46, '2025-03-03', 8, 8, 8, 8, 8, 0, 231, 40, 229, 0, 'Hazel Santos', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-10 15:28:03', '210000889', 'https://drive.google.com/drive/folders/1aTPk9P7WyHQ1p2bjfbsOIKzpJjL-aT2Y', NULL, 'submitted'),
(47, '2025-03-03', 8, 8, 7.2, 8, 8, 0, 461, 39, 0, 0, 'Mary Jane Devibar', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 15:31:06', '210001257', 'https://drive.google.com/file/d/1Qsl-2xJbfJDIh_dgBpCw6LOFvmQa3rcT/view?usp=drive_link', NULL, 'submitted'),
(48, '2025-03-03', 8, 8, 8, 8, 8, 0, 232, 40, 228, 0, 'Ivan Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-10 15:32:32', '210000884', 'https://drive.google.com/file/d/1-ZhfRLxwdeIm9wv4djW9xJVQyxozx6cD/view?usp=drivesdk', NULL, 'submitted'),
(49, '2025-03-10', 8, 8, 8, 8, 8, 0, 239, 40, 221, 0, 'Karen Cristine Lugue', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-10 15:35:40', '210000892', 'https://drive.google.com/drive/folders/14o8XwBiePJJP9eyi1xezU8l_necjBAHK?usp=sharing', NULL, 'submitted'),
(50, '2025-03-03', 8, 8, 8, 8, 8, 0, 252, 40, 208, 0, 'Renalyn  Balagtas', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-10 15:37:07', '210001237', 'https://drive.google.com/drive/folders/1aWAEo8PO5GZ4_qhJFE5_J9eQhfnLpsCG', NULL, 'submitted'),
(51, '2025-03-10', 6, 8, 8, 8, 8, 0, 350, 38, 112, 0, 'Edward  Salalila', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (Security and Maintenance Unit)', '', '2025-03-10 15:41:10', '210000856', 'https://drive.google.com/file/d/1_lZy6L15OO2XNkAqXRLT_5WNip4TEiwS/view?usp=drivesdk', NULL, 'submitted'),
(52, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Gerald Guanlao', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-14 09:24:40', '210001125', 'https://drive.google.com/file/d/1v1BzUvz77TGCGOqwJrgj0ibr8NxvCtBU/view?usp=drive_link', NULL, 'denied'),
(53, '2025-03-10', 8, 8, 8, 8, 8, 0, 316, 40, 0, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-14 12:37:32', '210000836', 'https://drive.google.com/file/d/1A6jKj43BOVUfLQ5jjWUy7z4hAP-oWXVv/view?usp=drivesdk', NULL, 'submitted'),
(54, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-03-14 16:59:39', '210001204', 'https://drive.google.com/drive/folders/1aPyiL5p1v9UrpDOe4bFQ5AWjD951WqCe?usp=drive_link', NULL, 'submitted'),
(55, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Fille Anusencion', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-03-14 17:04:47', '210000895', 'https://drive.google.com/drive/folders/1-Uh8ZckNELpdMadDZUuIiZGV0jS7NHz2', NULL, 'denied'),
(56, '2025-03-10', 8, 8, 8, 8, 8, 0, 388, 40, 0, 0, 'Mykel Roi Mangiliman', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-14 18:07:16', '210000903', 'https://drive.google.com/drive/folders/1U754u_7tQsC503lTQAYXOpKF3rSj7iQd', 'No signature of your supervisor.', 'denied'),
(57, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Ashley Jude Santos', 'BSIS 4B', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-03-14 18:27:58', '210000883', 'https://drive.google.com/drive/folders/1mqmUszzy0PTbbG7a425kH7eFaGCzCI0O', NULL, 'submitted'),
(58, '2025-03-10', 8, 8, 8, 8, 8, 0, 276, 40, 0, 0, 'David Jr. Romeo', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-14 21:04:17', '200000668', 'https://drive.google.com/file/d/1D6SzkdU2kFnzhIFsFgDsGkDKHs6gElXw/view?usp=drivesdk', NULL, 'submitted'),
(59, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Rowie Pascual', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-14 21:11:55', '210000845', 'https://drive.google.com/drive/folders/17Go3ASL-wsf34LOXBbjWnj8QgCgo8tsC', NULL, 'submitted'),
(60, '2025-03-10', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-14 22:03:30', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', NULL, 'submitted'),
(61, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Heart Kate Sarmiento', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-14 23:59:33', '210001268', 'https://drive.google.com/drive/folders/1-Og2jpa2iFxZYrLUubzbDH6FPmT6dR3Q', NULL, 'submitted'),
(62, '2025-03-10', 8, 8, 8, 8, 8, 0, 381, 40, 0, 0, 'Mary Jane Devibar', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-15 10:34:24', '210001257', 'https://drive.google.com/drive/folders/13v1GzrDhaWZTnHXfpqBwN8WDliKN7EK3', NULL, 'submitted'),
(63, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Noah Isip', 'BSIS 4A', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-03-15 10:44:53', '210001215', 'https://drive.google.com/file/d/14Wly8TQ4kae2E-bHIW7M--uk67uj8CE2/view?usp=sharing', NULL, 'submitted'),
(65, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Amberlene  Gamboa', 'BSIS 4A', 1, 'Office of the Municipal Engineer', '', '2025-03-15 11:21:53', '210000852', 'https://drive.google.com/drive/folders/1xNF8bfT3TAoVBkZ0KvMMWGKAMFTVdvfh', NULL, 'denied'),
(66, '2025-03-10', 8, 8, 0, 8, 8, 0, 270, 32, 0, 0, 'Ian Carlo Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-15 11:27:48', '210001212', 'https://drive.google.com/file/d/1uyd3wZKbBd7P1F-ZOKqqoo8luoOi4eRl/view?usp=drive_link', NULL, 'denied'),
(67, '2025-03-10', 8, 8, 8, 8, 8, 0, 198, 40, 0, 0, 'Gerlyn Espada', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-15 11:30:37', '210000875', 'https://drive.google.com/drive/folders/1riIKDHHR6H4CNMr-DsMYzmOgNsvqZqtQ', NULL, 'submitted'),
(68, '2025-03-10', 0, 8, 8, 8, 8, 0, 468, 32, 0, 0, 'Jonel Lansang', 'BSIS 4B', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-03-15 11:46:00', '210000870', 'https://drive.google.com/drive/folders/19Ji4ME4YkdRb0LGafhstp6zDHX5N8Jq4', NULL, 'submitted'),
(69, '2025-03-10', 8, 8, 8, 8, 8, 0, 292, 40, 0, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-15 11:55:49', '210000894', 'https://drive.google.com/file/d/1QuNDyb3gNi8obxCHgizFywS6sqiQ7hKE/view?usp=drivesdk', NULL, 'denied'),
(70, '2025-03-10', 0, 0, 0, 8, 8, 0, 500, 16, 0, 0, 'Ronel Roque', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-15 12:59:41', '210001234', 'https://drive.google.com/drive/folders/1calaEX8gSmcC4lGP84fuVLiIRzV8NefO', 'I can\'t access your DTR', 'denied'),
(71, '2025-03-10', 8, 8, 8, 7, 8, 0, 194, 39, 0, 0, 'Darvin Lhoyd Galang', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-15 13:35:56', '  210000878', 'https://drive.google.com/file/d/18lgaJNNRXrAO6af-xjUqPS67Za6fvB5-/view?usp=drivesdk', NULL, 'submitted'),
(72, '2025-03-10', 8, 8, 8, 0, 8, 0, 272, 32, 0, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-03-15 13:41:18', '210000850', 'https://drive.google.com/file/d/16yL1b-XucHqQg8kUvQhDbOMEgX2yazXL/view?usp=drivesdk', NULL, 'submitted'),
(73, '2025-03-10', 8, 8, 5, 8, 8, 0, 194, 37, 0, 0, 'Hazel Santos', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-15 13:44:49', '210000889', 'https://drive.google.com/drive/folders/1aTPk9P7WyHQ1p2bjfbsOIKzpJjL-aT2Y', NULL, 'submitted'),
(75, '2025-03-10', 8, 8, 0, 8, 8, 0, 500, 32, 0, 0, 'Kevin TaÃ±edo', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-15 14:46:28', '210000861', 'https://drive.google.com/drive/folders/1F0ALCj2dif3rj0Ho9Oe4Ku3L_2KsUDfd', NULL, 'denied'),
(76, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Genesis Harran Tadeo', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-03-15 15:14:20', '210000842', 'https://drive.google.com/drive/folders/1jDhHzt4fy5VEC109hYY4_tQJlfsVova0?usp=drive_link', NULL, 'submitted'),
(77, '2025-03-10', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Ian Carlo Infante', 'BSIS 4A', 1, 'Golden Green Enterprise ', '', '2025-03-15 15:18:21', '21000', 'https://drive.google.com/drive/folders/1vjwXfcy3E3NYlaUxkNtXdPe-l36ni_X0?usp=sharing', NULL, 'submitted'),
(78, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Teofilo Pineda', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (HRMO)', '', '2025-03-15 16:30:32', '210001205', 'https://drive.google.com/file/d/1AhJcILeY48GYUDbwF8BnYpSBg2YyLGgp/view?usp=drivesdk', NULL, 'denied'),
(79, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-15 16:58:07', '210001256', 'https://drive.google.com/drive/folders/1-9w6O-ozsCAwKDiPz6ykjUBy236C5XSh', NULL, 'submitted'),
(80, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Claire Macaspac', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-15 17:05:50', '21000837', 'https://drive.google.com/drive/folders/1-1wOgzqn8e5ofIEV09edEtHQKOigGgMq', NULL, 'submitted'),
(81, '2025-03-10', 8, 8, 8, 8, 8, 8, 160, 48, 0, 0, 'Aljon Dave MaÃ±alac', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-15 17:08:31', '210000886', 'https://drive.google.com/file/d/1N6wLFxKKk7_uCVprxP8Cw9ZslMTWLnNm/view?usp=drivesdk', NULL, 'submitted'),
(82, '2025-03-10', 8, 8, 8, 8, 8, 8, 268, 48, 0, 0, 'Justine Saylo', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-15 17:32:51', '210001260', 'https://drive.google.com/drive/folders/17hL9FVsi4awmrqt8V6m5AH6dQNSUPKps?usp=drive_link', NULL, 'denied'),
(83, '2025-03-10', 8, 8, 8, 8, 8, 8, 292, 48, 0, 0, 'Gervin  Quinsay', 'BSIS 4B', 1, 'MDGC Bills Payment Center', '', '2025-03-15 17:33:08', '210001273', 'https://drive.google.com/drive/folders/1GyMUmEx7zV15lYlADC_wAtLL_vEUKjg4?usp=sharing', NULL, 'denied'),
(84, '2025-03-10', 8, 8, 8, 8, 8, 8, 372, 48, 0, 0, 'John Paul  Nacu', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-15 17:36:32', '210001271', 'https://drive.google.com/drive/folders/1WX5CvZdSHP0rZ6OUAl6WWzToGIK1v288?usp=drive_link', NULL, 'denied'),
(85, '2025-03-10', 8, 8, 0, 8, 8, 0, 284, 32, 0, 0, 'Paul Ivan  Pineda', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-15 17:58:09', '210001253', 'https://drive.google.com/drive/folders/1WaU17aC2adX1O9SFrfgYzzHbdtT1OUcW', NULL, 'submitted'),
(86, '2025-03-10', 8, 8, 0, 8, 8, 0, 236, 32, 0, 0, 'Jerson Balagtas', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-15 18:02:52', '210001239', 'https://drive.google.com/drive/folders/1uTBmmRMJM3mnx4ruxfF6BEgAhUyhw28C', 'I can\'t access your google drive', 'denied'),
(87, '2025-03-10', 8, 8, 8, 8, 5, 0, 500, 37, 0, 0, 'Guanlao Carl Owen', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-15 18:25:06', '210000844', 'https://drive.google.com/drive/folders/1KoHQ6twErUmkraHC_5S5J5qaj5BXZP5k', NULL, 'denied'),
(88, '2025-03-10', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Joel  Paguio', 'BSIS 4B', 1, 'SF Oil Incorporated', '', '2025-03-15 18:27:19', '210000532', 'https://drive.google.com/drive/folders/1-07HfcV_8rlaOyTdyET-rRY5Dum45125', NULL, 'submitted'),
(89, '2025-03-10', 8, 8, 8, 8, 8, 0, 228, 40, 0, 0, 'Denzen Ocampo', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-15 19:15:35', '210001217', 'https://drive.google.com/file/d/1bvA3V-9nruwBgrqGR1OwW1viuKx2HwCJ/view?usp=sharing', NULL, 'submitted'),
(90, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mark Rhyan  Popatco', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Department of Agriculture)', '', '2025-03-15 19:33:37', '210000864', 'https://drive.google.com/file/d/1Ta7P31gTZBT6JRwDuYUVli2rzLON-8dH/view?usp=drivesdk', NULL, 'denied'),
(91, '2025-03-10', 8, 8, 4, 8, 8, 8, 152, 44, 0, 0, 'Charles  Lagman', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-15 19:35:03', '210000854', 'https://drive.google.com/drive/folders/1bRf8h3zIxfL5zRwyZfyZhTj7D9t4OcDD?usp=sharing', NULL, 'submitted'),
(92, '2025-03-10', 0, 8, 8, 8, 8, 0, 468, 32, 0, 0, 'Jake David', 'BSIS 4B', 1, 'Golden Green Enterprise ', '', '2025-03-15 19:39:06', '210000841', 'https://drive.google.com/drive/folders/1SmkO4tv42YW-Q_MKBSSjyAGRaUOhE1IU?usp=sharing', NULL, 'submitted'),
(93, '2025-03-10', 8, 8, 8, 8, 8, 8, 180, 48, 0, 0, 'Michael Bon  Lapid', 'BSIS 4B', 1, 'Sta. Rita (Commision of Elections)', '', '2025-03-15 19:53:46', '210001251', 'https://drive.google.com/file/d/1ZFGh7D9XszMUISEr86lG5LKn4yVun9kF/view?usp=drivesdk', 'I can\'t access your google drive', 'denied'),
(95, '2025-03-03', 0, 8, 8, 8, 0, 8, 468, 32, 0, 0, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-03-15 20:20:27', '210000888', 'https://drive.google.com/drive/folders/1--w40j78TWbt7BxO4WvFTeE6qf-iUUxf', NULL, 'submitted'),
(96, '2025-03-10', 8, 0, 8, 8, 0, 0, 476, 24, 0, 0, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-03-15 20:23:05', '210000888', 'https://drive.google.com/drive/folders/1--w40j78TWbt7BxO4WvFTeE6qf-iUUxf', NULL, 'submitted'),
(97, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Kim Elaiza Delos Santos', 'BSIS 4B', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-15 20:41:57', '210000876', 'https://drive.google.com/drive/folders/1QJGzwaNdvWB9grUZXOng2Jn3vjXiJ6VZ', NULL, 'denied'),
(98, '2025-03-10', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Joshua Marjef Deleon', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-15 21:43:18', '210001206', 'https://drive.google.com/drive/folders/101Bz6kSiCh0WDKcis9a-AxZpITBVeTwW?usp=drive_link', NULL, 'submitted'),
(99, '2025-03-10', 8, 8, 8, 8, 8, 0, 292, 40, 0, 0, 'Renjoy Marie David', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-15 22:45:02', '21001248', 'https://drive.google.com/drive/folders/1Zu5iCn7pOSguF7J00UHMivDf-PiXOKLz', 'I can\'t access your DTR', 'denied'),
(100, '2025-03-10', 8, 8, 4, 8, 8, 8, 152, 44, 0, 0, 'Manuel Liscano', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-15 22:57:54', '210000814', 'https://drive.google.com/file/d/1c8A89x-Bx00FqdMfO4-51p2tmzejkwgq/view?usp=drive_link ', NULL, 'submitted'),
(101, '2025-03-10', 8, 8, 8, 8, 0, 0, 468, 32, 0, 0, 'Angelo Carlo Carreon', 'BSIS 4A', 1, 'Saint Catherines Academy', '', '2025-03-15 23:30:12', '210000869', 'https://drive.google.com/drive/folders/1knxdKQyeEZU_8RmT4fY1ktQchKKhyxKA?usp=sharing', NULL, 'submitted'),
(102, '2025-03-10', 8, 8, 8, 8, 0, 0, 468, 32, 0, 0, 'Victor Val  David', 'BSIS 4A', 1, 'Saint Catherines Academy', '', '2025-03-15 23:34:04', '210002143', 'https://drive.google.com/drive/folders/1QApUux1HY0_eGpXMgUs5MtBu9d0ijD6A?usp=sharing', NULL, 'submitted'),
(103, '2025-03-10', 8, 8, 8, 8, 8, 0, 212, 40, 0, 0, 'Renalyn  Balagtas', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-16 00:00:16', '210001237', 'https://drive.google.com/drive/folders/1aWAEo8PO5GZ4_qhJFE5_J9eQhfnLpsCG', NULL, 'submitted'),
(104, '2025-03-10', 8, 8, 8, 8, 8, 0, 184, 40, 0, 0, 'Bryan Joseph Ronquillo', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-16 00:01:00', '210001277', 'https://drive.google.com/drive/folders/1-82QvU4c-FngPiDBoigEd373DjlSgs8r?usp=sharing', NULL, 'submitted'),
(105, '2025-03-10', 8, 8, 8, 8, 0, 0, 500, 32, 0, 0, 'Mark Darelle Serrano', 'BSIS 4A', 1, 'Saint Catherines Academy', '', '2025-03-16 08:30:11', '210000885', 'https://drive.google.com/file/d/1g14GRbz1o_5Ny5Bk__-Vspw3swPJH1HS/view?usp=drivesdk', NULL, 'denied'),
(106, '2025-03-10', 8, 8, 8, 8, 8, 0, 282, 40, 0, 0, 'Gabriel Santos', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', '', '2025-03-16 08:41:51', '200000722', 'https://drive.google.com/drive/folders/199xX_4emq4vkx_mKy_HRmI7oAK7Ovniw', NULL, 'submitted'),
(107, '2025-03-10', 8, 8, 8, 8, 0, 0, 252, 32, 0, 0, 'Sherwin Manuel', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-03-16 08:43:36', '210000887', 'https://drive.google.com/drive/folders/1t8XbFHNJoKUHQZL20HZMP0dcc9f37tbv', NULL, 'submitted'),
(108, '2025-03-10', 8, 8, 8, 8, 8, 8, 156, 48, 0, 0, 'Zander  Banquerico', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-16 12:31:40', '210000893', 'https://drive.google.com/file/d/19LNy_oI5wME-1vgd6vX9j-seudobNiiq/view?usp=drivesdk', NULL, 'submitted'),
(109, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Cristopher James Angeles', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-16 13:32:49', '210000905', 'https://drive.google.com/drive/folders/1TMD4OVh5hDUUOwX33h8hItSJGmghrR2u', 'No signature of your supervisor', 'denied'),
(110, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Dennielle Nikko  Calma', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-03-16 15:49:42', '210000843', 'https://drive.google.com/drive/folders/1i0h3i1oTaQ9ntCIfbLWuMixPvJ7r5r_P?usp=sharing', NULL, 'submitted'),
(111, '2025-03-10', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Justine Sotto', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-03-16 17:06:52', '210001211', 'https://acrobat.adobe.com/id/urn:aaid:sc:AP:b92f6bc0-cd7c-422c-a120-76482fd7ffa0', NULL, 'submitted'),
(112, '2025-03-10', 8, 8, 8, 8, 8, 0, 180, 40, 0, 0, 'Jamel Roseth Sanschez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-03-16 18:07:58', '210000857', 'https://drive.google.com/file/d/1-0rz5nFyG0nUzUKuE6R5hUNqNzNas6e9/view?usp=drivesdk', NULL, 'submitted'),
(113, '2025-03-10', 8, 8, 8, 8, 8, 0, 260, 40, 0, 0, 'John Michael Gabito', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-16 18:20:42', '210000849', 'https://drive.google.com/file/d/1LZjL7UQKCk73DB3iekIN4jrO6I465Ajl/view?usp=sharing', NULL, 'submitted'),
(114, '2025-03-10', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Jayver Buan', 'BSIS 4B', 1, 'Rigourtech Calibrating Services', '', '2025-03-16 19:53:00', '210000891', 'https://drive.google.com/file/d/1EBy8OY4ft3DGY63bhzZaVFGlqnP-T1I7/view?usp=drivesdk', NULL, 'submitted'),
(115, '2025-03-10', 8, 8, 8, 8, 8, 0, 188, 40, 0, 0, 'Wilson Ello', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-16 20:07:40', '210001019', 'https://drive.google.com/file/d/1CRMXLSJelnl6EBLiEUz4ZgWmRo-hoals/view?usp=drivesdk', NULL, 'submitted'),
(116, '2025-03-10', 8, 2, 8, 2, 8, 2, 500, 30, 0, 0, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-03-16 21:47:23', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'denied'),
(117, '2025-03-10', 8, 2, 8, 2, 8, 2, 500, 30, 0, 0, 'Adrian Layug', 'BSIS 4A', 1, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', '', '2025-03-16 21:59:53', '210000848', 'https://drive.google.com/drive/folders/12WrqsN02Zp_NiEhhdDKWpQtRHsCT1zST', NULL, 'denied'),
(118, '2025-03-10', 0, 8, 8, 8, 0, 0, 500, 24, 0, 0, 'Kyla Charina Joy Mercado', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-16 22:23:22', '210000880', 'https://drive.google.com/file/d/1bpqo4CKi9fS97RVE5IPOmlq31jIEJd8C/view?usp=drivesdk', 'I can\'t access your DTR', 'denied'),
(119, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Dexter Marcellano', 'BSIS 4B', 1, 'Porac Municipal Police Station ', '', '2025-03-16 23:24:19', '210000846', 'https://drive.google.com/file/d/1dg-MtaCHvMsOMuu01u0RGADN5UJ2y30R/view?usp=drivesdk', 'Wrong DTR', 'denied'),
(120, '2025-03-10', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Kathlene Tesoro', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-16 23:39:52', '210001276', 'https://drive.google.com/drive/folders/1K-8ZWajn8xOuHHUxDB5zQmWb_K_IM5C5', NULL, 'denied'),
(125, '2025-03-10', 8, 8, 8, 8, 8, 0, 180, 40, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-17 15:05:21', '210000859', 'https://drive.google.com/file/d/1rXDwbmp6ilxx31xxvCtT94ulqlHc-kFL/view?usp=drivesdk', NULL, 'submitted'),
(126, '2025-03-10', 8, 8, 8, 8, 8, 0, 192, 40, 0, 0, 'Ivan Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-17 15:05:41', '210000884', 'https://drive.google.com/file/d/11VfRWzkVE9lFV2DNUyZRu0fBfnrrVdjs/view?usp=drivesdk', NULL, 'submitted'),
(127, '2025-03-10', 8, 8, 8, 8, 8, 0, 198, 40, 0, 0, 'Bernadette Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-17 15:06:18', '210000866', 'https://drive.google.com/file/d/1Jeam4gqpEG0akbFx50dSgaS2AbhM4AlO/view?usp=drivesdk', NULL, 'submitted'),
(128, '2025-03-10', 8, 8, 8, 8, 8, 0, 191, 40, 0, 0, 'John Dexter Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-17 15:10:54', '210001066', 'https://drive.google.com/file/d/1F-pfvkQV-x6BbZFLpfwK4WzxNJKlmbMj/view?usp=drivesdk', NULL, 'submitted'),
(134, '2025-03-17', 8, 8, 8, 8, 8, 0, 140, 40, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-21 20:50:12', '210000859', 'https://src.edu.ph/', NULL, 'submitted'),
(135, '2025-03-17', 8, 8, 8, 8, 8, 0, 236, 40, 0, 0, 'David Jr. Romeo', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-21 20:53:33', '200000668', 'https://drive.google.com/file/d/1Hj5mWII-XKBd81TNOZIV1edFt7u558Sz/view?usp=drivesdk', NULL, 'submitted'),
(136, '2025-03-17', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Teofilo Pineda', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (HRMO)', '', '2025-03-21 20:54:18', '210001205', 'https://drive.google.com/file/d/1Ks6nxcWGjetJSh14El6k_IrbNkt5UiMY/view?usp=drivesdk', 'No Access in google drive', 'denied'),
(137, '2025-03-17', 0, 8, 8, 8, 8, 0, 162, 32, 0, 0, 'Hazel Santos', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-21 20:54:20', '210000889', 'https://drive.google.com/drive/folders/1aTPk9P7WyHQ1p2bjfbsOIKzpJjL-aT2Y', NULL, 'submitted'),
(138, '2025-03-17', 8, 8, 8, 8, 8, 0, 172, 40, 0, 0, 'Renalyn  Balagtas', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-21 20:54:37', '210001237', 'https://drive.google.com/drive/folders/1aWAEo8PO5GZ4_qhJFE5_J9eQhfnLpsCG', NULL, 'submitted'),
(139, '2025-03-17', 8, 8, 8, 8, 8, 0, 252, 40, 0, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-21 20:55:41', '210000894', 'https://drive.google.com/file/d/12Vcy3R31c-1lDDdQpvy7p6Qf1aAg3bUw/view?usp=drivesdk', NULL, 'submitted'),
(140, '2025-03-17', 8, 8, 8, 8, 8, 0, 266, 40, 0, 0, 'Karen Cristine Lugue', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-21 20:56:33', '210000892', 'https://drive.google.com/file/d/1L4zVS5Ufd-V41Mwhqgrz7qOrNm1exi0X/view?usp=drivesdk', 'No Access in google drive', 'denied'),
(141, '2025-03-17', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Rowie Pascual', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-21 20:58:33', '210000845', 'https://drive.google.com/drive/folders/1BJTtpmf43CBvcFA46gU9Uxt9kzI_qw2D', NULL, 'submitted'),
(142, '2025-03-17', 0, 8, 8, 8, 8, 0, 292, 32, 0, 0, 'Renjoy Marie David', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-21 20:59:36', '21001248', 'https://drive.google.com/file/d/1fFgECDfYEylpBH6n_4IXkG2KWkAK7UfW/view?usp=drivesdk', 'Wrong Submitted DTR', 'denied'),
(143, '2025-03-17', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-21 21:08:40', '210000836', 'https://drive.google.com/file/d/1DAyVd1TlXbw-llNXy1MOH_D4z8eN1j0C/view?usp=drivesdk', 'wrong DTR Submitted ', 'denied'),
(144, '2025-03-17', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Kevin TaÃ±edo', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-21 21:09:45', '210000861', 'https://drive.google.com/drive/folders/1F0ALCj2dif3rj0Ho9Oe4Ku3L_2KsUDfd', 'No Signature of Supervisor', 'denied'),
(145, '2025-03-17', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Amberlene  Gamboa', 'BSIS 4A', 1, 'Office of the Municipal Engineer', '', '2025-03-21 21:10:14', '210000852', 'https://drive.google.com/drive/folders/1xNF8bfT3TAoVBkZ0KvMMWGKAMFTVdvfh', NULL, 'submitted'),
(146, '2025-03-17', 8, 8, 8, 8, 8, 8, 416, 48, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-21 21:49:35', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', 'NO DTR MARCH 17-21', 'denied'),
(147, '2025-03-17', 8, 8, 8, 8, 8, 0, 158, 40, 0, 0, 'Gerlyn Espada', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-21 22:04:32', '210000875', 'https://drive.google.com/drive/folders/1riIKDHHR6H4CNMr-DsMYzmOgNsvqZqtQ?usp=drive_link', NULL, 'submitted'),
(148, '2025-03-17', 8, 8, 8, 8, 8, 0, 144, 40, 0, 0, 'Bryan Joseph Ronquillo', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-21 22:13:24', '210001277', 'https://drive.google.com/drive/folders/1-82QvU4c-FngPiDBoigEd373DjlSgs8r', NULL, 'submitted'),
(149, '2025-03-17', 8, 8, 4, 8, 8, 0, 440, 36, 0, 0, 'Dexter Marcellano', 'BSIS 4B', 1, 'Porac Municipal Police Station ', '', '2025-03-21 22:22:56', '210000846', 'https://drive.google.com/file/d/1fhxyIK7E0uRrLDYapbg_7YkJFOIoEAeL/view?usp=drivesdk', NULL, 'submitted'),
(150, '2025-03-17', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mark Rhyan  Popatco', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Department of Agriculture)', '', '2025-03-21 22:35:43', '210000864', 'https://drive.google.com/file/d/1WbK6UGsCd3VXTPEkX4atOQrWlmv2gKZK/view?usp=drivesdk', 'No Access in google drive ', 'denied'),
(151, '2025-03-17', 8, 8, 8, 8, 8, 0, 468, 40, 0, 0, 'Kim Elaiza Delos Santos', 'BSIS 4B', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-21 22:36:41', '210000876', 'https://drive.google.com/drive/folders/1QJGzwaNdvWB9grUZXOng2Jn3vjXiJ6VZ', 'No Access in google drive', 'denied'),
(152, '2025-03-17', 8, 8, 8, 8, 8, 0, 220, 40, 0, 0, 'John Michael Gabito', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-21 23:44:25', '210000849', 'https://drive.google.com/file/d/13DxaCN8wdA_NQfshua-AB4-xuMEfc1Y-/view?usp=drivesdk', NULL, 'submitted'),
(153, '2025-03-17', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-03-22 00:09:30', '210001204', 'https://drive.google.com/drive/folders/1fVHhRGPt9CrJQnuXnzTHt24xevyELgLc', NULL, 'submitted'),
(154, '2025-03-17', 8, 8, 8, 4, 8, 0, 210, 36, 0, 0, 'Ian Carlo Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-22 08:43:04', '210001212', 'https://drive.google.com/file/d/1fRyMjdT3qDILfXWatU2kmA2sNs7DEX0H/view?usp=sharing', NULL, 'submitted'),
(155, '2025-03-17', 8, 8, 8, 8, 8, 0, 151, 40, 0, 0, 'John Dexter Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-22 08:48:31', '210001066', 'https://drive.google.com/file/d/1jZM3rZ8hrIqFFVRxyVI8D6WWzezCJO6e/view?usp=drivesdk', NULL, 'submitted'),
(156, '2025-03-17', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mykel Roi Mangiliman', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-22 08:50:01', '210000903', 'https://drive.google.com/drive/folders/1Wja1kaNJnrSEBbnEW7W883MDhYuI3EMs', 'the signature isn\'t in proper form, \" must sign each time according to its day\"', 'denied'),
(157, '2025-03-17', 8, 8, 8, 8, 8, 0, 154, 40, 0, 0, 'Darvin Lhoyd Galang', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-22 08:52:34', '  210000878', 'https://drive.google.com/file/d/1w1DcguK8EnTOaYFNO5VJh8MqqX0BrJo8/view?usp=drivesdk', NULL, 'submitted'),
(158, '2025-03-17', 0, 8, 8, 8, 4, 0, 476, 28, 0, 0, 'Arnold Ronquillo', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-22 10:05:00', '210000879', 'https://drive.google.com/file/d/1OUYHyxO4jHjTsyZ_f3lHC39HPMKpE5Fp/view?usp=drivesdk', 'Wrong Submitted DTR', 'denied'),
(159, '2025-03-17', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Ronel Roque', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-22 10:51:04', '210001234', 'https://drive.google.com/file/d/1On2Np_HKwcXVFBW7ZB6cvWBu3GB2gMft/view?usp=drivesdk', 'No Signature of Supervisor', 'denied'),
(160, '2025-03-17', 0, 8, 8, 8, 4, 0, 353, 28, 0, 0, 'Mary Jane Devibar', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-22 12:18:29', '210001257', 'https://drive.google.com/drive/folders/13v1GzrDhaWZTnHXfpqBwN8WDliKN7EK3', NULL, 'submitted'),
(161, '2025-03-17', 8, 0, 4, 4, 8, 0, 436, 24, 0, 0, 'Ashley Jude Santos', 'BSIS 4B', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-03-22 12:43:55', '210000883', 'https://drive.google.com/drive/folders/1mqmUszzy0PTbbG7a425kH7eFaGCzCI0O', NULL, 'submitted'),
(162, '2025-03-17', 8, 8, 8, 4, 0, 0, 432, 28, 0, 0, 'Noah Isip', 'BSIS 4A', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-03-22 12:47:19', '210001215', 'https://drive.google.com/file/d/1g5Pw6Lf9W9pY-54O-VkoHna4fB5zEr61/view?usp=sharing', NULL, 'submitted'),
(163, '2025-03-17', 8, 8, 8, 8, 8, 0, 152, 40, 0, 0, 'Ivan Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-22 12:54:55', '210000884', 'https://drive.google.com/file/d/13MZT53rBxcmA7WbK3ZEb2lXdVuFgLTjF/view?usp=drivesdk', NULL, 'submitted'),
(164, '2025-03-17', 8, 8, 8, 8, 8, 0, 242, 40, 0, 0, 'Gabriel Santos', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', '', '2025-03-22 13:39:54', '200000722', 'https://drive.google.com/drive/folders/1EwGPi7C8F8E-B25BBKa5zj_-P4E76gTY', NULL, 'submitted'),
(165, '2025-03-17', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Genesis Harran Tadeo', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-03-22 14:06:39', '210000842', 'https://drive.google.com/drive/folders/1jDhHzt4fy5VEC109hYY4_tQJlfsVova0?usp=drive_link', NULL, 'submitted'),
(166, '2025-03-03', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Heart Kate Sarmiento', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-22 15:59:41', '210001268', 'https://drive.google.com/drive/folders/1-Og2jpa2iFxZYrLUubzbDH6FPmT6dR3Q', NULL, 'submitted'),
(167, '2025-02-03', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-22 16:10:16', '210000890', 'https://docs.google.com/document/d/11FVTT2DcUbGs7_vn2VxHyoZjSuoT0_NNeHHaRKFIACg/edit', 'Please put all of your DTR in google drive folder', 'denied'),
(168, '2025-02-10', 8, 7, 8, 8, 8, 8, 404, 47, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-22 16:12:13', '210000890', 'https://docs.google.com/document/d/11WMaj8RpH2annlVyO0K8iQeKlCV_WQhY-bZBjDP1DgE/edit', 'Please put all of your DTR in google drive folder', 'denied'),
(169, '2025-03-17', 8, 0, 8, 4, 8, 0, 466, 34, 0, 6, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-03-22 16:13:46', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'submitted'),
(170, '2025-02-17', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-22 16:14:47', '210000890', 'https://docs.google.com/document/d/11WMaj8RpH2annlVyO0K8iQeKlCV_WQhY-bZBjDP1DgE/edit', 'Please put all of your DTR in google drive folder', 'denied'),
(171, '2025-03-17', 8, 0, 8, 4, 8, 0, 466, 34, 0, 6, 'Adrian Layug', 'BSIS 4A', 1, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', '', '2025-03-22 16:16:30', '210000848', 'https://drive.google.com/drive/folders/12WrqsN02Zp_NiEhhdDKWpQtRHsCT1zST', NULL, 'submitted'),
(172, '2025-02-24', 4, 6.3, 8, 8, 4, 8, 404, 38, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-22 16:17:26', '210000890', 'https://docs.google.com/document/d/13D52L9PQ15xKFBDOppLHeEcNnPT98leeq8yDt793mE4/edit', 'Please put all of your DTR in google drive folder', 'denied'),
(173, '2025-03-03', 8, 8, 8, 8, 4, 8, 404, 44, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-22 16:19:42', '210000890', 'https://docs.google.com/document/d/13HgkrEMDT9VFadbxGpXVTBSdUIX8qHv6nhPUhFHRR00/edit', 'Please put all of your DTR in google drive folder', 'denied'),
(174, '2025-03-10', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-22 16:22:00', '210000890', 'https://docs.google.com/document/d/13k3WrhXmQKvHCI7Oe0QTRokdFigTTa_xpvIOvZj0unM/edit', 'Please put all of your DTR in google drive folder', 'denied'),
(175, '2025-03-17', 8, 8, 8, 8, 8, 0, 428, 40, 0, 0, 'Jonel Lansang', 'BSIS 4B', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-03-22 16:23:09', '210000870', 'https://drive.google.com/file/d/1G8dt2wew0OVpCVWX3GSTBY2wDzs3o0He/view?usp=drivesdk', NULL, 'submitted'),
(176, '2025-03-17', 8, 8, 8, 8, 8, 8, 228, 48, 0, 0, 'Xertxlle Prestoza', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-22 16:31:31', '210000932', 'https://drive.google.com/file/d/1nimE2fh9htO3SH8RXebPKIUz2dCq9YJS/view?usp=drivesdk', 'Please input in google drive folder all your DTR', 'denied'),
(177, '2025-03-17', 8, 8, 8, 8, 8, 8, 140, 48, 0, 0, 'Wilson Ello', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-22 16:40:13', '210001019', 'https://drive.google.com/file/d/1lYepSQaLfQzNzdSKm0Yk6P3_pSgJq0Yo/view?usp=drivesdk', NULL, 'submitted'),
(178, '2025-03-17', 8, 8, 8, 8, 8, 8, 228, 48, 0, 0, 'Jerald Muli', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-22 16:42:16', '210000881', 'https://drive.google.com/file/d/1tHHkcPo7lPromX-NXU_XOSV7behhmukC/view?usp=drivesdk', 'Please input in google drive folder all your DTR', 'denied'),
(179, '2025-03-17', 8, 8, 8, 8, 8, 0, 140, 40, 0, 0, 'Jamel Roseth Sanschez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-03-22 16:42:28', '210000857', 'https://drive.google.com/file/d/1-FSEZjCW9kHkAyYimLAxNYdk6HyIkmYQ/view?usp=drivesdk', NULL, 'submitted'),
(180, '2025-03-17', 8, 8, 8, 8, 8, 8, 500, 48, 0, 0, 'Arvie De Mesa', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-03-22 16:45:08', '210001249', 'https://drive.google.com/file/d/1Z81RVIUcbaEDqC9MHgSY1hGnhy_GyAGm/view?usp=drivesdk', 'No DTR March 17-21', 'denied'),
(181, '2025-03-17', 8, 8, 8, 8, 8, 8, 476, 48, 0, 0, 'Justine Saylo', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-22 16:45:43', '210001260', 'https://drive.google.com/drive/folders/17hL9FVsi4awmrqt8V6m5AH6dQNSUPKps?usp=drive_link', 'No Signature of Supervisor', 'denied'),
(182, '2025-03-17', 8, 8, 8, 8, 8, 8, 372, 48, 0, 0, 'John Paul  Nacu', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-22 16:47:33', '210001271', 'https://drive.google.com/drive/folders/1WX5CvZdSHP0rZ6OUAl6WWzToGIK1v288?usp=drive_link', 'No Signature of Supervisor', 'denied'),
(183, '2025-03-17', 8, 8, 8, 8, 8, 8, 204, 48, 0, 0, 'Sherwin Manuel', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-03-22 16:50:14', '210000887', 'https://drive.google.com/drive/folders/1t8XbFHNJoKUHQZL20HZMP0dcc9f37tbv', NULL, 'submitted'),
(184, '2025-03-17', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Ian Carlo Infante', 'BSIS 4A', 1, 'Golden Green Enterprise ', '', '2025-03-22 17:06:55', '21000', 'https://drive.google.com/drive/folders/1vjwXfcy3E3NYlaUxkNtXdPe-l36ni_X0', NULL, 'submitted'),
(185, '2025-03-17', 8, 8, 8, 8, 8, 8, 112, 48, 0, 0, 'Aljon Dave MaÃ±alac', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-22 17:31:23', '210000886', 'https://drive.google.com/file/d/1Ie9u2RBw5E1WqJCSmKquQO7XKwOrqU1m/view?usp=drivesdk', NULL, 'submitted'),
(186, '2025-03-17', 0, 8, 8, 4, 8, 8, 296, 36, 0, 0, 'Jake David', 'BSIS 4B', 1, 'Golden Green Enterprise ', '', '2025-03-22 17:37:23', '210000841', 'https://drive.google.com/drive/folders/1SmkO4tv42YW-Q_MKBSSjyAGRaUOhE1IU?usp=drive_link', NULL, 'submitted'),
(187, '2025-03-17', 8, 8, 8, 7, 8, 8, 404, 47, 0, 0, 'Jayver Buan', 'BSIS 4B', 1, 'Rigourtech Calibrating Services', '', '2025-03-22 17:42:37', '210000891', 'https://drive.google.com/file/d/1176PbcvwXHlvDg_jAnWzJPgrHDT-wWvb/view?usp=drivesdk', 'No Access of google drive', 'denied'),
(188, '2025-03-17', 8, 8, 8, 8, 8, 8, 428, 48, 0, 0, 'Michael Bon  Lapid', 'BSIS 4B', 1, 'Sta. Rita (Commision of Elections)', '', '2025-03-22 18:16:15', '210001251', 'https://drive.google.com/drive/folders/1WmSuj5gGBAyQm3ylCcmGNTQNdswgMkfn', NULL, 'submitted'),
(189, '2025-03-17', 8, 8, 8, 4, 0, 0, 244, 28, 0, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-03-22 18:31:40', '210000850', 'https://drive.google.com/file/d/1706at9YCCUu1tMgIZDmM3XYHuwjgoK2K/view?usp=drivesdk', NULL, 'submitted'),
(190, '2025-03-17', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Claire Macaspac', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-22 18:41:59', '21000837', 'https://drive.google.com/drive/folders/1-CXQd46Wa0AvVRKcpoTdvo9Tj8zgz3F3', 'No Indicate Time', 'denied'),
(191, '2025-03-17', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-22 18:45:51', '210001256', 'https://drive.google.com/drive/folders/1-8e8ZRret-ZYX5idXnFRIC-7M9W5gISL', 'No Access in Google drive', 'denied'),
(192, '2025-03-17', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Dennielle Nikko  Calma', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-03-22 18:51:36', '210000843', 'https://drive.google.com/drive/folders/1i0h3i1oTaQ9ntCIfbLWuMixPvJ7r5r_P?usp=sharing', NULL, 'submitted'),
(193, '2025-03-17', 8, 8, 8, 8, 8, 0, 364, 40, 0, 0, 'Paul Ivan  Pineda', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-22 18:55:59', '210001253', 'https://drive.google.com/drive/folders/1dXZMMrR-bLHmfmgZWHl8WM1UR1I9cnRv', NULL, 'submitted'),
(194, '2025-03-17', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Kathlene Tesoro', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-22 19:07:50', '210001276', 'https://docs.google.com/document/d/1Nix8HBR3CNaGVN5W1plF0pOffLe5MihB/edit?usp=drivesdk&ouid=100662934803195057434&rtpof=true&sd=true', NULL, 'submitted'),
(195, '2025-03-17', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Heart Kate Sarmiento', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-22 19:15:34', '210001268', 'https://drive.google.com/drive/folders/1-Og2jpa2iFxZYrLUubzbDH6FPmT6dR3Q', 'No Indicate Time', 'denied'),
(196, '2025-03-17', 8, 8, 8, 8, 8, 0, 436, 40, 0, 0, 'Jerson Balagtas', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-22 19:40:31', '210001239', 'https://drive.google.com/drive/folders/1v0ylV_Cp1HwYgKe_xjy_Wk7CMoOgjaYB', NULL, 'submitted'),
(197, '2025-03-17', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Nico  Prado', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-22 19:52:08', '210001252', 'https://drive.google.com/drive/folders/16gkImNczm5zmOLAqWPc4PtDcOABzCh15', 'No access in google drive', 'denied'),
(198, '2025-03-17', 8, 8, 0, 8, 8, 8, 452, 40, 0, 0, 'Joel  Paguio', 'BSIS 4B', 1, 'SF Oil Incorporated', '', '2025-03-22 19:57:42', '210000532', 'https://drive.google.com/drive/folders/11HEqgBWMWwMK2icVmhn6xCjsvIfNZBkd', 'Date must be chronological', 'denied'),
(199, '2025-03-17', 8, 8, 8, 8, 8, 8, 104, 48, 0, 0, 'Charles  Lagman', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-22 19:58:23', '210000854', 'https://drive.google.com/file/d/1dcXDmWg7k0hVJZqpjnUq8bbc2bA6jogv/view?usp=sharing', NULL, 'submitted'),
(200, '2025-03-17', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Janine Salta', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-22 20:11:26', '210000902', 'https://drive.google.com/file/d/1ir7eYl-U-ZeF-qKiwRt42nFjIOWBfviR/view?usp=sharing', 'No Signature of Supervisor', 'denied'),
(201, '2025-03-17', 8, 8, 8, 8, 8, 0, 158, 40, 0, 0, 'Bernadette Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-22 20:22:39', '210000866', 'https://drive.google.com/drive/folders/1EKCvmIskDxXXaVTFI_wV_LwUJNd2ljA6', NULL, 'submitted');
INSERT INTO `tbl_weekly_time_entries` (`id`, `week_start_date`, `monday_time`, `tuesday_time`, `wednesday_time`, `thursday_time`, `friday_time`, `saturday_time`, `remaining_time`, `total_hours`, `bon_time`, `over_time`, `student_fullname`, `course`, `sessionId`, `comp_name`, `comp_link`, `date_created`, `admissionNumber`, `image_link`, `remarks`, `status`) VALUES
(202, '2025-03-17', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Fille Anusencion', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-03-22 20:26:11', '210000895', 'https://drive.google.com/drive/folders/1-Uh8ZckNELpdMadDZUuIiZGV0jS7NHz2', NULL, 'submitted'),
(203, '2025-03-17', 8, 8, 8, 8, 8, 8, 108, 48, 0, 0, 'Zander  Banquerico', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-22 20:41:28', '210000893', 'https://drive.google.com/file/d/1AhJ5lC0WTbBed3c0N0SAsllzrDd5dku0/view?usp=drivesdk', NULL, 'submitted'),
(204, '2025-03-17', 8, 8, 8, 8, 8, 8, 180, 48, 0, 0, 'Denzen Ocampo', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-22 20:48:42', '210001217', 'https://drive.google.com/file/d/18SvXFcck-hreMX23AqoP3XkO9emwftag/view?usp=sharing', NULL, 'submitted'),
(205, '2025-03-17', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Joshua Marjef Deleon', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-22 20:56:34', '210001206', 'https://drive.google.com/file/d/1gKfDQEzYGjLeJl5TPj5-dWVUhn24NDbT/view?usp=drive_link', NULL, 'submitted'),
(206, '2025-03-17', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Aldwin PeÃ±a', 'BSIS 4A', 1, 'Sasmuan Police Station', '', '2025-03-22 20:56:52', '2100001264', 'https://drive.google.com/drive/folders/1LRK9ndNZmtCjsdXPK25kWKYLZVAUFocs', NULL, 'submitted'),
(207, '2025-03-17', 0, 8, 8, 8, 0, 0, 436, 24, 0, 0, 'Edward  Salalila', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (Security and Maintenance Unit)', '', '2025-03-22 21:26:06', '210000856', 'https://drive.google.com/file/d/1eRF8ZrVlsifzMZCR1x8CXXdTSSMRGemG/view?usp=drivesdk', 'No Access in google drive', 'denied'),
(208, '2025-03-17', 8, 8, 8, 8, 8, 8, 104, 48, 0, 0, 'Manuel Liscano', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-22 21:41:41', '210000814', 'https://drive.google.com/file/d/1qZ-fFRSlUn46dTkRhVyeX5rJDNndO_Or/view?usp=sharing ', NULL, 'submitted'),
(209, '2025-03-17', 8, 8, 8, 8, 8, 8, 476, 48, 0, 0, 'Gervin  Quinsay', 'BSIS 4B', 1, 'MDGC Bills Payment Center', '', '2025-03-22 21:52:02', '210001273', 'https://drive.google.com/drive/folders/1GyMUmEx7zV15lYlADC_wAtLL_vEUKjg4?usp=sharing', 'No Signature of Supervisor', 'denied'),
(210, '2025-03-17', 8, 8, 8, 0, 8, 0, 404, 40, 0, 8, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-03-22 22:04:57', '210000888', 'https://drive.google.com/file/d/13OKqjTP26OW_hJlnYUI6-_kDDvbuOcmH/view?usp=drivesdk', NULL, 'submitted'),
(211, '2025-03-17', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Roger Ocampo', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-23 08:04:31', '210001254', 'https://drive.google.com/drive/folders/1BrIUu-XjkH3rp-dqhK5Clvd3kJgar96-', 'No Access of DTR', 'denied'),
(212, '2025-03-17', 8, 8, 8, 8, 8, 8, 440, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-03-23 14:31:53', '210001235', 'https://drive.google.com/drive/folders/1OrB3qD3XL6sVLmRFDjF_N01axZB5qZRJ?usp=drive_link', NULL, 'submitted'),
(213, '2025-02-03', 8, 8, 8, 8, 8, 8, 368, 48, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-23 17:00:15', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', NULL, 'submitted'),
(214, '2025-02-10', 8, 8, 8, 8, 8, 8, 368, 48, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-23 17:01:13', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', NULL, 'submitted'),
(215, '2025-02-17', 8, 8, 8, 8, 8, 8, 416, 48, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-23 17:01:58', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', 'twice submit', 'denied'),
(216, '2025-02-24', 8, 8, 8, 8, 8, 8, 416, 48, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-23 17:03:07', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', 'twice submit', 'denied'),
(217, '2025-03-17', 8, 8, 8, 8, 8, 8, 500, 48, 0, 0, 'Cristopher James Angeles', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-23 17:11:56', '210000905', 'https://drive.google.com/drive/folders/1TMD4OVh5hDUUOwX33h8hItSJGmghrR2u', 'No Signature of Supervisor', 'denied'),
(218, '2025-03-17', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'John Marlou  Taglorin', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-23 18:48:35', '200000767', 'https://drive.google.com/drive/folders/1Aj6UMQKb1WNdm8QzGIjv0Uxv5O1JT_88', NULL, 'submitted'),
(219, '2025-03-17', 5, 8, 8, 8, 4, 0, 476, 33, 0, 0, 'Gerald Guanlao', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-23 23:18:23', '210001125', 'https://drive.google.com/drive/folders/1lKlVqKdBPKvnc2m8FXWpwsHEeOxcnIUP', 'No Access in google drive', 'denied'),
(221, '2025-03-24', 8, 8, 8, 8, 8, 0, 90, 40, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-28 10:53:01', '210000859', 'src.edu.ph', 'n', 'denied'),
(222, '2025-03-24', 8, 8, 8, 8, 8, 0, 90, 40, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-28 10:53:56', '210000859', 'src.edu.ph', 'TEST1', 'denied'),
(223, '2025-03-24', 8, 8, 8, 8, 8, 0, 90, 40, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-28 10:56:57', '210000859', 'src.edu.ph', 'n', 'denied'),
(224, '2025-03-24', 8, 8, 8, 8, 0, 0, 58, 32, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-28 11:14:54', '210000859', 'src.edu.ph', NULL, 'submitted'),
(225, '2025-03-24', 8, 8, 8, 8, 8, 0, 212, 40, 0, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-28 11:35:15', '210000894', 'https://drive.google.com/file/d/1Qgdl4Xen8gNiTqwNTmoLNIDz8lPSZj-_/view?usp=drivesdk', NULL, 'submitted'),
(226, '2025-03-24', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Kathlene Tesoro', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-03-28 11:53:44', '210001276', 'https://docs.google.com/document/d/1U4KXQmj8bJyy_nSsCAw34lzZZOwyZl2L/edit?usp=drivesdk&ouid=100662934803195057434&rtpof=true&sd=true', NULL, 'submitted'),
(227, '2025-03-24', 8, 8, 8, 8, 8, 0, 122, 40, 0, 0, 'Hazel Santos', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-28 17:58:19', '210000889', 'https://drive.google.com/drive/folders/1aTPk9P7WyHQ1p2bjfbsOIKzpJjL-aT2Y', NULL, 'submitted'),
(228, '2025-03-24', 8, 8, 8, 8, 8, 0, 170, 40, 0, 0, 'Ian Carlo Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-28 18:22:01', '210001212', 'https://drive.google.com/file/d/16i5Y8xXkhcG94YhWaRrYh1ix8RSGVNFT/view?usp=drive_link', NULL, 'submitted'),
(229, '2025-03-24', 8, 8, 0, 8, 8, 0, 234, 32, 0, 0, 'Karen Cristine Lugue', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-03-28 18:34:22', '210000892', 'https://drive.google.com/file/d/1Gk8MSpqWKfKtLy3tCnIsX55fJQ_H1xs-/view?usp=sharing', NULL, 'submitted'),
(230, '2025-03-24', 4, 8, 8, 8, 8, 0, 196, 36, 0, 0, 'Kim Elaiza Delos Santos', 'BSIS 4B', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-28 19:15:30', '210000876', 'https://drive.google.com/drive/folders/1ABrC6nAVJHusiNex-TNDfcYevIKbx4xQ', '.', 'denied'),
(231, '2025-03-24', 8, 8, 8, 8, 8, 0, 436, 40, 0, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-28 19:29:39', '210000836', 'https://drive.google.com/drive/folders/18CHutCXPReBWikCaZxvlj0BmqU9WvQAr', NULL, 'submitted'),
(232, '2025-03-24', 8, 8, 8, 8, 8, 0, 114, 40, 0, 0, 'Darvin Lhoyd Galang', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-28 19:40:08', '  210000878', 'https://drive.google.com/file/d/1P2mTlC83g1cK9bQt5QOTovna_skXN-xj/view?usp=drivesdk', NULL, 'submitted'),
(233, '2025-03-24', 8, 8, 8, 8, 8, 0, 396, 40, 0, 0, 'Ashley Jude Santos', 'BSIS 4B', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-03-28 20:43:43', '210000883', 'https://drive.google.com/drive/folders/1mqmUszzy0PTbbG7a425kH7eFaGCzCI0O', NULL, 'submitted'),
(234, '2025-03-24', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Kevin TaÃ±edo', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-28 23:15:23', '210000861', 'https://drive.google.com/drive/folders/1F0ALCj2dif3rj0Ho9Oe4Ku3L_2KsUDfd', 'No Signature of Supervisor', 'denied'),
(235, '2025-03-24', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-03-29 00:43:11', '210001204', 'https://drive.google.com/drive/folders/1-4iq5cZKjMHVs1HnjaSIUxXQptjql3OH', 'wrong Submitted DTR', 'denied'),
(236, '2025-03-24', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mykel Roi Mangiliman', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-29 08:58:19', '210000903', 'https://drive.google.com/drive/folders/1Wja1kaNJnrSEBbnEW7W883MDhYuI3EMs', 'the signature isn\'t in proper form, \" must sign each according to its day\" and wrong submitted DTR ', 'denied'),
(237, '2025-03-24', 8, 8, 8, 8, 8, 0, 196, 40, 0, 0, 'David Jr. Romeo', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-29 09:51:46', '200000668', 'https://drive.google.com/file/d/1LDdEdJqNnuTy2L0w2xDvL4K8Uu67DHoZ/view?usp=drivesdk', NULL, 'submitted'),
(238, '2025-03-24', 4, 8, 8, 8, 8, 0, 476, 36, 0, 0, 'Arnold Ronquillo', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-29 12:42:57', '210000879', 'https://drive.google.com/file/d/1OUYHyxO4jHjTsyZ_f3lHC39HPMKpE5Fp/view?usp=drivesdk    ', 'Wrong Submit DTR', 'denied'),
(239, '2025-03-24', 8, 0, 8, 0, 8, 0, 436, 30, 0, 6, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-03-29 13:50:44', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'submitted'),
(240, '2025-03-24', 8, 8, 8, 8, 8, 0, 436, 40, 0, 0, 'Ronel Roque', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-29 14:48:42', '210001234', 'https://drive.google.com/file/d/1eOkV1cI6rB-ezPUMBVop1udG4zZFPbZ8/view?usp=drivesdk', NULL, 'submitted'),
(241, '2025-03-24', 8, 8, 8, 8, 4, 0, 424, 36, 0, 0, 'Justine Sotto', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-03-29 15:14:11', '210001211', 'https://acrobat.adobe.com/id/urn:aaid:sc:AP:ba861039-c22e-42d9-8c41-e309d5d9e1e5', NULL, 'submitted'),
(242, '2025-03-24', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Rowie Pascual', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-03-29 15:49:10', '210000845', 'https://drive.google.com/drive/folders/17Go3ASL-wsf34LOXBbjWnj8QgCgo8tsC', 'wrong submitted DTR', 'denied'),
(243, '2025-03-24', 8, 8, 8, 8, 8, 0, 202, 40, 0, 0, 'Gabriel Santos', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', '', '2025-03-29 16:18:47', '200000722', 'https://drive.google.com/drive/folders/199xX_4emq4vkx_mKy_HRmI7oAK7Ovniw', NULL, 'submitted'),
(244, '2025-03-24', 8, 8, 8, 8, 8, 8, 356, 48, 0, 0, 'Ian Carlo Infante', 'BSIS 4A', 1, 'Golden Green Enterprise ', '', '2025-03-29 16:42:00', '21000', 'https://drive.google.com/drive/folders/1vjwXfcy3E3NYlaUxkNtXdPe-l36ni_X0', NULL, 'submitted'),
(245, '2025-03-24', 8, 8, 8, 8, 8, 8, 64, 48, 0, 0, 'Aljon Dave MaÃ±alac', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-29 18:12:48', '210000886', 'https://drive.google.com/file/d/1ee5iCRNw4iZQomLjpnZ7tVSNqEAxQ3Up/view?usp=drivesdk', NULL, 'submitted'),
(246, '2025-03-24', 8, 8, 4, 8, 8, 0, 352, 36, 0, 0, 'Aerolle Jeremy Salonga', 'BSIS 4B', 1, 'Ronmark Construction ', '', '2025-03-29 18:34:17', '210001233', 'https://drive.google.com/file/d/1Lf5YBjyXh_0ohIf3pkn853rsQhUr321M/view?usp=drivesdk', NULL, 'submitted'),
(247, '2025-03-24', 8, 8, 8, 8, 8, 0, 392, 40, 0, 0, 'Noah Isip', 'BSIS 4A', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-03-29 18:35:10', '210001215', 'https://drive.google.com/file/d/1clJUYIej3fXo6wlEaYqEA5WKGmzycnae/view?usp=sharing', NULL, 'submitted'),
(248, '2025-03-24', 8, 8, 8, 8, 8, 8, 428, 48, 0, 0, 'Justine Saylo', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-29 18:53:36', '210001260', 'https://drive.google.com/drive/folders/17hL9FVsi4awmrqt8V6m5AH6dQNSUPKps?usp=drive_link', NULL, 'submitted'),
(249, '2025-03-24', 8, 8, 8, 8, 8, 0, 132, 40, 0, 0, 'Renalyn  Balagtas', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-29 18:57:07', '210001237', 'https://drive.google.com/drive/folders/1aWAEo8PO5GZ4_qhJFE5_J9eQhfnLpsCG', NULL, 'submitted'),
(250, '2025-03-24', 8, 8, 8, 8, 8, 8, 324, 48, 0, 0, 'John Paul  Nacu', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-03-29 18:58:20', '210001271', 'https://drive.google.com/drive/folders/1WX5CvZdSHP0rZ6OUAl6WWzToGIK1v288?usp=drive_link', NULL, 'submitted'),
(251, '2025-03-24', 8, 8, 8, 8, 8, 0, 104, 40, 0, 0, 'Bryan Joseph Ronquillo', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-29 18:58:46', '210001277', 'https://drive.google.com/drive/folders/1-82QvU4c-FngPiDBoigEd373DjlSgs8r', NULL, 'submitted'),
(252, '2025-03-24', 4, 8, 8, 8, 8, 8, 60, 44, 0, 0, 'Charles  Lagman', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-29 19:02:18', '210000854', 'https://drive.google.com/drive/folders/1bRf8h3zIxfL5zRwyZfyZhTj7D9t4OcDD?usp=sharing', NULL, 'submitted'),
(253, '2025-03-24', 8, 8, 8, 8, 8, 0, 100, 40, 0, 0, 'Jamel Roseth Sanchez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-03-29 19:03:32', '210000857', 'https://drive.google.com/file/d/1-f-OWXLXN7BUmQ2swQYXRRzg0yOBNN7F/view?usp=drivesdk', NULL, 'submitted'),
(254, '2025-03-24', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Fille Anusencion', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-03-29 19:16:15', '210000895', 'https://drive.google.com/drive/folders/1-Uh8ZckNELpdMadDZUuIiZGV0jS7NHz2', NULL, 'submitted'),
(255, '2025-03-24', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Nico  Prado', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-29 19:26:47', '210001252', 'https://drive.google.com/drive/folders/16gkImNczm5zmOLAqWPc4PtDcOABzCh15', 'I can\'t access you google drive folder', 'denied'),
(256, '2025-03-24', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Cristopher James Angeles', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-29 19:36:21', '210000905', 'https://drive.google.com/drive/folders/1TMD4OVh5hDUUOwX33h8hItSJGmghrR2u', NULL, 'submitted'),
(257, '2025-03-24', 8, 8, 4, 6, 8, 0, 406, 34, 0, 0, 'Dexter Marcellano', 'BSIS 4B', 1, 'Porac Municipal Police Station ', '', '2025-03-29 19:59:59', '210000846', 'https://drive.google.com/file/d/1les3x5Io5qEI89gWxXd1-KGQw0JPmpUA/view?usp=drivesdk', NULL, 'submitted'),
(258, '2025-03-24', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Kyla Charina Joy Mercado', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-29 20:42:38', '210000880', 'https://drive.google.com/file/d/13bdC5KNZ4xJard2UqRZn7ZfhdocouaVH/view?usp=drivesdk', 'Wrong Submitted DTR', 'denied'),
(259, '2025-03-24', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-29 21:07:20', '210001256', 'https://drive.google.com/file/d/1jE2IokNpV3v7le0WjtvoAHM_qXbHZkrN/view?usp=sharing', '.', 'denied'),
(260, '2025-03-24', 8, 8, 8, 4, 8, 8, 452, 44, 0, 0, 'Aldwin PeÃ±a', 'BSIS 4A', 1, 'Sasmuan Police Station', '', '2025-03-29 21:26:10', '2100001264', 'https://drive.google.com/drive/folders/1LRK9ndNZmtCjsdXPK25kWKYLZVAUFocs', 'Wrong Submitted DTR \r\nMarch 24-29', 'denied'),
(261, '2025-03-24', 8, 8, 8, 8, 8, 8, 346, 58, 0, 10, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-03-29 21:57:06', '210000888', 'https://drive.google.com/file/d/1hc0ay_dKP3TZ7H0JZPVnhBvjte02iQCk/view?usp=drivesdk', NULL, 'submitted'),
(262, '2025-03-24', 8, 8, 8, 8, 8, 8, 248, 48, 0, 0, 'Jake David', 'BSIS 4B', 1, 'Golden Green Enterprise ', '', '2025-03-29 22:15:36', '210000841', 'https://drive.google.com/drive/folders/1SmkO4tv42YW-Q_MKBSSjyAGRaUOhE1IU?usp=sharing', NULL, 'submitted'),
(263, '2025-03-24', 8, 8, 8, 8, 8, 0, 380, 40, 0, 0, 'Dennielle Nikko  Calma', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-03-29 22:51:00', '210000843', 'https://drive.google.com/drive/folders/1i0h3i1oTaQ9ntCIfbLWuMixPvJ7r5r_P', NULL, 'submitted'),
(264, '2025-03-24', 8, 8, 8, 8, 8, 0, 380, 40, 0, 0, 'Genesis Harran Tadeo', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-03-29 22:51:59', '210000842', 'https://drive.google.com/drive/folders/1jDhHzt4fy5VEC109hYY4_tQJlfsVova0?usp=drive_link', NULL, 'submitted'),
(265, '2025-03-24', 8, 8, 0, 0, 8, 0, 220, 24, 0, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-03-29 23:17:06', '210000850', 'https://drive.google.com/file/d/17hlR6WDYKWWOjiJdmtxJZ9u-aOLz1WmZ/view?usp=drivesdk', NULL, 'submitted'),
(266, '2025-03-24', 8, 8, 8, 8, 8, 8, 132, 48, 0, 0, 'Denzen Ocampo', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-29 23:49:49', '210001217', 'https://drive.google.com/file/d/1RyhOTX_E0AZ19C0jiFj0gk5eX5GR5S44/view?usp=sharing', NULL, 'submitted'),
(267, '2025-03-24', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Amberlene  Gamboa', 'BSIS 4A', 1, 'Office of the Municipal Engineer', '', '2025-03-30 08:52:34', '210000852', 'https://drive.google.com/drive/folders/1xNF8bfT3TAoVBkZ0KvMMWGKAMFTVdvfh', NULL, 'submitted'),
(268, '2025-03-24', 4, 8, 8, 8, 8, 0, 115, 36, 0, 0, 'John Dexter Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-30 09:02:47', '210001066', 'https://drive.google.com/file/d/1H6YUo3iolX2CeFhKWCwlp7QRWXN44zYN/view?usp=drivesdk', NULL, 'submitted'),
(269, '2025-03-24', 7.5, 0, 8, 8, 8, 0, 127, 32, 0, 0, 'Gerlyn Espada', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-30 09:20:57', '210000875', 'https://drive.google.com/drive/folders/1riIKDHHR6H4CNMr-DsMYzmOgNsvqZqtQ', NULL, 'submitted'),
(270, '2025-03-24', 8, 8, 8, 5, 8, 8, 159, 45, 0, 0, 'Sherwin Manuel', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-03-30 11:11:26', '210000887', 'https://drive.google.com/drive/folders/1t8XbFHNJoKUHQZL20HZMP0dcc9f37tbv', NULL, 'submitted'),
(271, '2025-03-24', 8, 8, 8, 8, 8, 0, 436, 40, 0, 0, 'Roger Ocampo', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-30 11:57:51', '210001254', 'https://drive.google.com/drive/folders/1BrIUu-XjkH3rp-dqhK5Clvd3kJgar96-', NULL, 'submitted'),
(272, '2025-03-24', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Guanlao Carl Owen', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-30 12:39:28', '210000844', 'https://drive.google.com/file/d/1UPp_I8DA-KWWlYyGWfqN3YG_AKVHVF3d/view?usp=drivesdk', 'I can\'t access you google drive', 'denied'),
(273, '2025-03-24', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Gerald Guanlao', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-30 13:18:33', '210001125', 'https://drive.google.com/drive/folders/1lKlVqKdBPKvnc2m8FXWpwsHEeOxcnIUP?usp=drive_link', 'I can\'t access you google drive folder', 'denied'),
(274, '2025-03-24', 8, 8, 8, 8, 8, 8, 60, 48, 0, 0, 'Zander  Banquerico', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-30 13:44:55', '210000893', 'https://drive.google.com/file/d/1C9sZrAKvle5XgOORgzqq-Y8IR-bLhPQT/view?usp=drivesdk', NULL, 'submitted'),
(275, '2025-03-24', 8, 8, 8, 8, 8, 8, 56, 48, 0, 0, 'Manuel Liscano', 'BSIS 4B', 1, 'Sta. Rita Police Station', '', '2025-03-30 14:28:50', '210000814', 'https://drive.google.com/drive/folders/1IVQvTWJsuvM3Ln2pJ1QHc3EH_I8GANnK?usp=sharing ', NULL, 'submitted'),
(276, '2025-03-24', 8, 8, 8, 8, 8, 0, 100, 40, 0, 0, 'Wilson Ello', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-30 15:17:39', '210001019', 'https://drive.google.com/file/d/10tBG2IxmD_Ki5h09AVVm-s1yqCjV52R7/view?usp=drivesdk', NULL, 'submitted'),
(277, '2025-03-24', 8, 8, 8, 8, 8, 8, 180, 48, 0, 0, 'Xertxlle Prestoza', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-30 15:36:57', '210000932', 'https://drive.google.com/file/d/1EgD9bg4UGs06RIVylAXfBZfKqOFtfgV-/view?usp=drivesdk', NULL, 'submitted'),
(278, '2025-03-24', 8, 8, 8, 8, 8, 8, 228, 48, 0, 0, 'Jerald Muli', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-03-30 15:41:27', '210000881', 'https://drive.google.com/file/d/1rWto3Yd93J2FasSCGW6L-mfW_pLR_G7e/view?usp=drivesdk', 'Wrong Submitted DTR', 'denied'),
(279, '2025-03-24', 8, 8, 8, 8, 8, 8, 452, 48, 0, 0, 'Arvie De Mesa', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-03-30 15:47:14', '210001249', 'https://drive.google.com/file/d/1fFUu8K0gNUKTwjetGqjXA3AZ-9jQjcDf/view?usp=drivesdk', NULL, 'submitted'),
(280, '2025-03-24', 8, 8, 8, 8, 8, 8, 356, 48, 0, 0, 'Joshua Marjef Deleon', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-03-30 16:03:13', '210001206', 'https://drive.google.com/file/d/1lwwkr1tbj0klF0xyF6dlC_g0hMLARTNR/view?usp=drive_link', NULL, 'submitted'),
(281, '2025-03-24', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Janine Salta', 'BSIS 4B', 1, 'Porac (Commision on Election)', '', '2025-03-30 16:21:58', '210000902', 'https://drive.google.com/drive/folders/1vSzL3drztGH4o1629pekv8PMQuFWsU5k?usp=sharing', 'The signature isn\'t in proper form, \" Must Sign each according to its day\"', 'denied'),
(282, '2025-03-24', 8, 8, 8, 8, 8, 0, 324, 40, 0, 0, 'Paul Ivan  Pineda', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-03-30 16:48:39', '210001253', 'https://drive.google.com/drive/folders/18Gj9epMIG68VqqiUbMr7OVTUKhAaE9km', NULL, 'submitted'),
(283, '2025-03-24', 8, 8, 8, 8, 8, 0, 396, 40, 0, 0, 'Jerson Balagtas', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-03-30 16:50:56', '210001239', 'https://drive.google.com/drive/folders/1uJKk084AcWqKQ4j9t1k2V9PiY6J3m0EN', NULL, 'submitted'),
(284, '2025-03-24', 0, 8, 8, 8, 8, 8, 280, 40, 0, 0, 'Kyle Aldrin  Amio', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-30 18:12:59', '210000860', 'https://drive.google.com/drive/folders/13RtZ0_DNInnK0n3T8TVTuV7kXPRTWjuO', NULL, 'submitted'),
(285, '2025-03-24', 8, 8, 8, 8, 8, 0, 404, 40, 0, 0, 'Victor Val  David', 'BSIS 4A', 1, 'Saint Catherines Academy', '', '2025-03-30 18:43:18', '210002143', 'https://drive.google.com/drive/folders/1QApUux1HY0_eGpXMgUs5MtBu9d0ijD6A?usp=sharing', NULL, 'submitted'),
(286, '2025-03-24', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Jayver Buan', 'BSIS 4B', 1, 'Rigourtech Calibrating Services', '', '2025-03-30 18:45:22', '210000891', 'https://drive.google.com/file/d/1Istbu4jVjx9a_ZgwA8yiGszvAdP62vEb/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(287, '2025-03-24', 8, 8, 8, 8, 8, 0, 476, 40, 0, 0, 'Mark Darelle Serrano', 'BSIS 4A', 1, 'Saint Catherines Academy', '', '2025-03-30 18:47:54', '210000885', 'https://drive.google.com/drive/folders/1fvdlBvupKAfvioMLI2EyjtCoXkLzGJA4?usp=drive_link', 'I can\'t access you google drive folder', 'denied'),
(288, '2025-03-24', 8, 8, 8, 8, 8, 0, 404, 40, 0, 0, 'Angelo Carlo Carreon', 'BSIS 4A', 1, 'Saint Catherines Academy', '', '2025-03-30 19:05:10', '210000869', 'https://drive.google.com/drive/folders/1knxdKQyeEZU_8RmT4fY1ktQchKKhyxKA?usp=sharing', NULL, 'submitted'),
(289, '2025-03-24', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Aerol Jann Isip', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-03-30 20:06:17', '190000454', 'https://drive.google.com/file/d/1_i-QuGONzEMvDdF1nSdcOe1IRUvUJL8s/view?usp=drive_link', 'I can\'t access your DTR', 'denied'),
(290, '2025-03-24', 8, 8, 8, 8, 8, 8, 440, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-03-30 20:18:21', '210001235', 'https://drive.google.com/drive/folders/1OncoWrRM-v9Uuixt909l0yNiutdWClyG   https://drive.google.com/file/d/1OhW6CmMvk6SZuWvtnj2ZJiPdXGv0g7aE/view?usp=drivesdk  https://drive.google.com/file/d/1Qm4WzCHQZmP0zLI1ezb39b66dsTtM4Fe/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(291, '2025-02-03', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Christian Anthony  Cuare', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-30 20:40:07', '210000890', 'https://drive.google.com/drive/folders/1Wk0-eTLcAg539iP-9ZuAnYGM_yFGVTWm', 'No DTR March 24-29', 'denied'),
(292, '2025-03-24', 8, 8, 8, 8, 8, 0, 436, 40, 0, 0, 'Edward  Salalila', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (Security and Maintenance Unit)', '', '2025-03-30 20:51:12', '210000856', 'https://drive.google.com/file/d/1i49LTBvP-xHzfpoLXrjpzzowiUQRjBLE/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(293, '2025-03-24', 8, 8, 4, 8, 8, 0, 116, 36, 0, 0, 'Ivan Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-03-30 21:10:47', '210000884', 'https://drive.google.com/file/d/171jDMU1xZkRkcPF0vMf7FiNxYd73dHBn/view?usp=drivesdk', NULL, 'submitted'),
(294, '2025-03-24', 8, 8, 8, 8, 8, 8, -20, 48, 0, 0, 'Michael Bon  Lapid', 'BSIS 4B', 1, 'Sta. Rita (Commision of Elections)', '', '2025-03-30 21:37:57', '210001251', 'https://drive.google.com/file/d/1jmGWhO_dS7kXMo6VcxpdY_cchLz0Nynz/view?usp=drivesdk', NULL, 'submitted'),
(295, '2025-03-24', 0, 8, 8, 8, 8, 8, 412, 40, 0, 0, 'John Marlou  Taglorin', 'BSIS 4B', 1, 'Power Scan Computer System & Gen. Merchandises', '', '2025-03-30 22:09:46', '200000767', 'https://drive.google.com/drive/folders/1Aj6UMQKb1WNdm8QzGIjv0Uxv5O1JT_88', NULL, 'submitted'),
(296, '2025-03-24', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-03-31 09:13:59', '210001256', 'https://drive.google.com/file/d/1iOGuKS5jJ4YrXVOmlHlBJ0kQXI0Hs0s7/view?usp=drivesdk', NULL, 'submitted'),
(297, '2025-03-24', 8, 8, 8, 8, 8, 0, 252, 40, 0, 0, 'Renjoy Marie David', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-03-31 09:17:18', '21001248', 'https://drive.google.com/file/d/1Lc3mQQlX9vjkLjYcyMaoNVIG1eFp4Rf5/view?usp=drivesdk', NULL, 'submitted'),
(298, '2025-03-31', 4, 8, 8, 8, 8, 0, 160, 36, 0, 0, 'Kim Elaiza Delos Santos', 'BSIS 4B', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-03-31 10:06:00', '210000876', 'https://drive.google.com/drive/folders/1QJGzwaNdvWB9grUZXOng2Jn3vjXiJ6VZ', NULL, 'submitted'),
(299, '2025-03-31', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Kevin TaÃ±edo', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-31 11:24:15', '210000861', 'https://drive.google.com/drive/folders/1F0ALCj2dif3rj0Ho9Oe4Ku3L_2KsUDfd', NULL, 'submitted'),
(300, '2025-03-31', 8, 8, 8, 8, 5, 0, 500, 37, 0, 0, 'Guanlao Carl Owen', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-31 11:28:35', '210000844', 'https://drive.google.com/file/d/1Ujy7jO0hJuif4gyaUO12UtuzUbsTohZ3/view?usp=drivesdk', 'Wrong Submit DTR- March 24-29', 'denied'),
(301, '2025-03-31', 8, 8, 8, 8, 5, 0, 463, 37, 0, 0, 'Guanlao Carl Owen', 'BSIS 4A', 1, 'Becuran National High School', '', '2025-03-31 11:56:48', '210000844', 'https://drive.google.com/drive/folders/1UuFtZoJxUdVvVMQKkx_0kMebyAzrHwTH', NULL, 'submitted'),
(302, '2025-03-31', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Teofilo Pineda', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (HRMO)', '', '2025-03-31 17:59:14', '210001205', 'https://drive.google.com/file/d/1QIi8FZq1LjDEIZeo6N4yRI-FiqkusiMk/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(303, '2025-03-31', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mark Rhyan  Popatco', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Department of Agriculture)', '', '2025-03-31 18:23:24', '210000864', 'https://drive.google.com/file/d/1apX4dZariwubAzk27mf8UCOzTTBPTNQc/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(304, '2025-03-31', 8, 0, 8, 8, 8, 0, 170, 32, 0, 0, 'Gabriel Santos', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', '', '2025-04-05 17:40:08', '200000722', 'https://drive.google.com/file/d/1JtQeNwxNmMHP15ELpDaFeU6j3qzw3keR/view?usp=drivesdk', NULL, 'submitted'),
(305, '2025-03-31', 8, 0, 8, 8, 8, 0, 164, 32, 0, 0, 'David Jr. Romeo', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-04-05 19:16:56', '200000668', 'https://drive.google.com/file/d/1NajooRbcx-SZjxCLKZoi7J7n-QRiydMc/view?usp=drivesdk', NULL, 'submitted'),
(306, '2025-03-31', 8, 8, 8, 8, 8, 0, 172, 40, 0, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-04-05 19:55:13', '210000894', 'https://drive.google.com/file/d/1nngHV3OwYx4tB4E3LkKvmWxt3C-IAEtm/view?usp=drivesdk', NULL, 'submitted'),
(307, '2025-03-31', 8, 8, 8, 8, 8, 8, 52, 48, 0, 0, 'Wilson Ello', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-04-05 20:12:58', '210001019', 'https://drive.google.com/file/d/12EOPfxu_eNlBsStisLVXMj1oSXv6NKBD/view?usp=drivesdk', NULL, 'submitted'),
(308, '2025-03-31', 0, 0, 0, 8, 8, 8, 316, 30, 0, 6, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-05 21:43:13', '210000888', 'https://drive.google.com/file/d/1qawGmMEkp9c_h_JuCyHEILCYsd1ljk9d/view?usp=drivesdk', NULL, 'submitted'),
(309, '2025-03-31', 8, 8, 8, 8, 8, 0, 380, 40, 0, 0, 'Kathlene Tesoro', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-04-06 00:44:16', '210001276', 'https://docs.google.com/document/d/1_LSghiZc0U_CdKcLEQ-a3l962P6WOrDf/edit?usp=drivesdk&ouid=100662934803195057434&rtpof=true&sd=true', NULL, 'submitted'),
(310, '2025-03-31', 8, 8, 8, 8, 8, 8, 380, 48, 0, 0, 'Justine Saylo', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-04-06 08:48:22', '210001260', 'https://drive.google.com/drive/folders/17hL9FVsi4awmrqt8V6m5AH6dQNSUPKps?usp=drive_link', NULL, 'submitted'),
(311, '2025-03-31', 8, 8, 8, 8, 8, 8, 276, 48, 0, 0, 'John Paul  Nacu', 'BSIS 4A', 1, 'MDGC Bills Payment Center', '', '2025-04-06 08:53:39', '210001271', 'https://drive.google.com/drive/folders/1WX5CvZdSHP0rZ6OUAl6WWzToGIK1v288?usp=drive_link', NULL, 'submitted'),
(312, '2025-03-31', 8, 8, 8, 8, 8, 8, 111, 48, 0, 0, 'Sherwin Manuel', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-04-06 09:18:22', '210000887', 'https://drive.google.com/drive/folders/1t8XbFHNJoKUHQZL20HZMP0dcc9f37tbv', NULL, 'submitted'),
(313, '2025-03-31', 8, 8, 8, 8, 8, 0, 396, 40, 0, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-04-06 09:22:59', '210000836', 'https://drive.google.com/drive/folders/18CHutCXPReBWikCaZxvlj0BmqU9WvQAr', NULL, 'submitted'),
(314, '2025-03-31', 8, 8, 8, 8, 8, 0, 100, 40, 0, 0, 'John Michael Gabito', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-04-06 09:45:27', '210000849', 'https://drive.google.com/file/d/1EJeW6ljbSJY1VTWiYwvd83x0v0ODZg4_/view?usp=drivesdk', NULL, 'submitted'),
(315, '2025-03-31', 8, 0, 8, 8, 8, 0, 348, 32, 0, 0, 'Genesis Harran Tadeo', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-04-06 09:55:01', '210000842', 'https://drive.google.com/drive/folders/1jDhHzt4fy5VEC109hYY4_tQJlfsVova0?usp=drive_link', NULL, 'submitted'),
(316, '2025-03-31', 8, 0, 8, 8, 8, 8, 412, 40, 0, 0, 'Cristopher James Angeles', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 09:56:18', '210000905', 'https://drive.google.com/drive/folders/1TMD4OVh5hDUUOwX33h8hItSJGmghrR2u', NULL, 'submitted'),
(317, '2025-03-31', 8, 0, 8, 8, 8, 0, 404, 32, 0, 0, 'Ronel Roque', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 09:57:27', '210001234', 'https://drive.google.com/drive/folders/1calaEX8gSmcC4lGP84fuVLiIRzV8NefO', NULL, 'submitted'),
(318, '2025-03-31', 7, 8, 8, 8, 8, 0, 93, 39, 0, 0, 'Renalyn  Balagtas', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 10:02:02', '210001237', 'https://drive.google.com/drive/folders/1aWAEo8PO5GZ4_qhJFE5_J9eQhfnLpsCG', NULL, 'submitted'),
(319, '2025-03-31', 7, 0, 8, 8, 8, 0, 91, 31, 0, 0, 'Hazel Santos', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 10:07:28', '210000889', 'https://drive.google.com/drive/folders/1aTPk9P7WyHQ1p2bjfbsOIKzpJjL-aT2Y', NULL, 'submitted'),
(320, '2025-03-31', 8, 8, 8, 4, 8, 0, 476, 36, 0, 0, 'Arnold Ronquillo', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 10:10:01', '210000879', 'https://drive.google.com/file/d/1_msslfFbwAJJcDyQ5naa5Lj932RL-6ye/view?usp=drivesdk   ', 'Wrong dtr submitted', 'denied'),
(321, '2025-03-31', 8, 0, 8, 8, 8, 0, 444, 32, 0, 0, 'Adrian Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 10:10:41', '210000872', 'https://drive.google.com/drive/folders/1TxXXV3b2X91ordm_zX35F_vFntw0t1_Y', NULL, 'submitted'),
(322, '2025-03-31', 8, 8, 8, 8, 8, 0, 396, 40, 0, 0, 'Roger Ocampo', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-04-06 10:45:55', '210001254', 'https://drive.google.com/drive/folders/1BrIUu-XjkH3rp-dqhK5Clvd3kJgar96-', NULL, 'submitted'),
(323, '2025-03-31', 8, 8, 8, 8, 6, 0, 500, 38, 0, 0, 'Mark Rhyan  Popatco', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Department of Agriculture)', '', '2025-04-06 10:48:41', '210000864', 'https://drive.google.com/file/d/1d5oTmGscR105lwXGfMBIlqkX0kWxrrLD/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(324, '2025-03-31', 8, 8, 8, 8, 8, 8, 228, 48, 0, 0, 'Jerald Muli', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-04-06 11:01:49', '210000881', 'https://drive.google.com/file/d/1HhvlWe-wT4b5JYuMrmWAmrJtG_W2bsfQ/view?usp=drivesdk', 'Wrong dtr you submitted', 'denied'),
(325, '2025-03-31', 8, 0, 8, 8, 8, 0, 388, 32, 0, 0, 'Rowie Pascual', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-04-06 11:36:25', '210000845', 'https://drive.google.com/drive/folders/13m0SuoujsxkTUqjZIviJYYf7bDIkSTaI', NULL, 'submitted'),
(326, '2025-03-31', 4.3, 4.3, 8, 0, 0, 0, 435, 17, 0, 0, 'Joel  Paguio', 'BSIS 4B', 1, 'SF Oil Incorporated', '', '2025-04-06 11:50:37', '210000532', 'https://drive.google.com/file/d/16du87rqGcGds9rBO9bUYW59Luufy4wLF/view?usp=drivesdk', NULL, 'submitted'),
(327, '2025-03-31', 8, 0, 8, 8, 8, 0, 68, 32, 0, 0, 'Jamel Roseth Sanchez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-04-06 13:56:25', '210000857', 'https://drive.google.com/drive/folders/1-vppKWQlTOH81yPzs5rYsovHWJab6K0M', NULL, 'submitted'),
(328, '2025-03-31', 8, 0, 8, 4, 8, 0, 192, 28, 0, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-04-06 14:32:15', '210000850', 'https://drive.google.com/file/d/181IeNDk-ne2f2Vx7vIv_GP04vBxeSv90/view?usp=drivesdk', NULL, 'submitted'),
(329, '2025-03-31', 8, 0, 8, 8, 8, 8, 208, 40, 0, 0, 'Jake David', 'BSIS 4B', 1, 'Golden Green Enterprise ', '', '2025-04-06 16:42:15', '210000841', 'https://drive.google.com/drive/folders/1SmkO4tv42YW-Q_MKBSSjyAGRaUOhE1IU?usp=sharing', NULL, 'submitted'),
(330, '2025-03-31', 8, 0, 0, 8, 8, 0, 372, 24, 0, 0, 'Ashley Jude Santos', 'BSIS 4B', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-04-06 16:48:15', '210000883', 'https://drive.google.com/drive/folders/1mqmUszzy0PTbbG7a425kH7eFaGCzCI0O', NULL, 'submitted'),
(331, '2025-03-31', 8, 0, 8, 8, 8, 0, 392, 32, 0, 0, 'Justine Sotto', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-04-06 16:51:27', '210001211', 'https://acrobat.adobe.com/id/urn:aaid:sc:AP:bd06bb6a-2519-48d9-91d5-f9ebb758a461', NULL, 'submitted'),
(332, '2025-03-31', 8, 8, 8, 8, 8, 8, 308, 48, 0, 0, 'Ian Carlo Infante', 'BSIS 4A', 1, 'Golden Green Enterprise ', '', '2025-04-06 17:01:49', '21000', 'https://drive.google.com/drive/folders/1vjwXfcy3E3NYlaUxkNtXdPe-l36ni_X0', NULL, 'submitted'),
(333, '2025-03-31', 8, 8, 8, 8, 8, 8, 428, 48, 0, 0, 'Gervin  Quinsay', 'BSIS 4B', 1, 'MDGC Bills Payment Center', '', '2025-04-06 19:17:24', '210001273', 'https://drive.google.com/drive/folders/1GyMUmEx7zV15lYlADC_wAtLL_vEUKjg4?usp=sharing', NULL, 'submitted'),
(334, '2025-03-31', 8, 0, 8, 8, 8, 0, 500, 32, 0, 0, 'Aerol Jann Isip', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-04-06 19:18:57', '190000454', 'https://drive.google.com/file/d/1nL8Zptt9_XaK51ZEKm5YTS3r6ZuebmBG/view?usp=sharing', 'I can\'t access you google drive folder', 'denied'),
(335, '2025-03-31', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Jayver Buan', 'BSIS 4B', 1, 'Rigourtech Calibrating Services', '', '2025-04-06 19:29:45', '210000891', 'https://drive.google.com/file/d/1ZZjJqA1jE5guFpGbhV-cx2SXPBd-OaPa/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(336, '2025-03-31', 8, 0, 8, 8, 8, 0, 364, 32, 0, 0, 'Jerson Balagtas', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-04-06 19:42:48', '210001239', 'https://drive.google.com/drive/folders/1vN2BJp10Wd9CO3JwJbf3WdF2yD-07RBq', NULL, 'submitted'),
(337, '2025-03-31', 8, 0, 8, 8, 8, 0, 292, 32, 0, 0, 'Paul Ivan  Pineda', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-04-06 19:45:50', '210001253', 'https://drive.google.com/drive/folders/1xYNSXvuFzYVV5nzO7basTCnvZlTIIt48', NULL, 'submitted'),
(338, '2025-03-31', 8, 0, 8, 8, 8, 0, 348, 32, 0, 0, 'Dennielle Nikko  Calma', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-04-06 20:01:50', '210000843', 'https://drive.google.com/drive/folders/1i0h3i1oTaQ9ntCIfbLWuMixPvJ7r5r_P', NULL, 'submitted'),
(339, '2025-03-31', 8, 0, 0, 0, 0, 0, 384, 8, 0, 0, 'Noah Isip', 'BSIS 4A', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-04-06 20:36:47', '210001215', 'https://drive.google.com/file/d/1OP_YxjjDpXBc7-rlftN33x-jzyAjN3Te/view?usp=sharing', NULL, 'submitted'),
(340, '2025-03-31', 8, 8, 8, 8, 8, 0, 420, 40, 0, 0, 'Claire Macaspac', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-06 20:44:36', '21000837', 'https://drive.google.com/drive/folders/1esm7Klpsjky--hatNwVasvLGcjWjW_EE', NULL, 'submitted'),
(341, '2025-03-31', 8, 0, 8, 8, 8, 0, 420, 32, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-06 20:50:01', '210001256', 'https://drive.google.com/file/d/1TfXB0X4DAqhEkhv6RriUbTQiHR8JFqtS/view?usp=drivesdk', 'I can\'t access you google drive folder', 'denied'),
(342, '2025-03-31', 8, 8, 8, 8, 8, 0, 380, 40, 0, 0, 'Fille Anusencion', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-04-06 20:51:46', '210000895', 'https://drive.google.com/drive/folders/1-Uh8ZckNELpdMadDZUuIiZGV0jS7NHz2', NULL, 'submitted'),
(343, '2025-03-31', 8, 0, 8, 8, 8, 0, 388, 32, 0, 0, 'Heart Kate Sarmiento', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-06 20:53:27', '210001268', 'https://drive.google.com/drive/folders/1-Og2jpa2iFxZYrLUubzbDH6FPmT6dR3Q?usp=sharing', NULL, 'submitted'),
(344, '2025-03-31', 8, 0, 8, 0, 8, 0, 228, 24, 0, 0, 'Renjoy Marie David', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-06 21:25:00', '21001248', 'https://drive.google.com/file/d/14sTu1O0k6MwbVYZujw5Z-J7-xS45onWb/view?usp=drivesdk', NULL, 'submitted'),
(345, '2025-03-31', 8, 0, 8, 8, 8, 0, 397, 39, 0, 7, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-04-06 22:29:28', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'submitted'),
(346, '2025-03-31', 8, 0, 8, 8, 8, 0, 427, 39, 0, 7, 'Adrian Layug', 'BSIS 4A', 1, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', '', '2025-04-06 22:36:01', '210000848', 'https://drive.google.com/drive/folders/12WrqsN02Zp_NiEhhdDKWpQtRHsCT1zST', NULL, 'submitted'),
(347, '2025-03-31', 8, 8, 8, 8, 0, 8, -60, 40, 0, 0, 'Michael Bon  Lapid', 'BSIS 4B', 1, 'Sta. Rita (Commision of Elections)', '', '2025-04-06 22:41:42', '210001251', 'https://drive.google.com/file/d/1oZ5XP6C4EmO8REy9RBiJzmxc2ZhJf7aK/view?usp=drivesdk', NULL, 'submitted'),
(348, '2025-03-31', 8, 8, 8, 8, 8, 8, 380, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-06 23:49:10', '210001235', 'https://drive.google.com/drive/folders/1SSYym7pB9DA_Pfw8fJ2R_64nWB4SbfVr', NULL, 'submitted'),
(349, '2025-04-07', 8, 0, 8, 8, 8, 0, 468, 32, 0, 0, 'Kyla Charina Joy Mercado', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-07 09:56:33', '210000880', 'https://drive.google.com/file/d/1aAAkaNaCygr3Oyv_GefGTY3k7xl6fO2P/view?usp=drivesdk', NULL, 'submitted'),
(350, '2025-04-07', 8, 8, 8, 8, 8, 0, 436, 40, 0, 0, 'Gerald Guanlao', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-04-07 10:46:48', '210001125', 'https://drive.google.com/drive/folders/1lKlVqKdBPKvnc2m8FXWpwsHEeOxcnIUP?usp=drive_link', NULL, 'submitted'),
(353, '2025-04-07', 4, 0, 8, 8, 0, 0, 150, 20, 0, 0, 'Ian Carlo Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-12 00:03:31', '210001212', 'https://drive.google.com/file/d/16agxK1dHFkNBOxPblusxSciA7dge1Ixi/view?usp=sharing', NULL, 'submitted'),
(354, '2025-04-07', 0, 8, 0, 8, 8, 0, 134, 24, 0, 0, 'Bernadette Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-12 10:28:53', '210000866', 'https://drive.google.com/drive/folders/1EKCvmIskDxXXaVTFI_wV_LwUJNd2ljA6', NULL, 'submitted'),
(355, '2025-03-31', 8, 0, 8, 8, 8, 0, 388, 32, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-04-12 17:37:47', '210001204', 'https://drive.google.com/drive/folders/1sgJvkzA2i418fDDTfs-zIA-16FTk5FxE', NULL, 'submitted'),
(356, '2025-04-07', 8, 8, 0, 8, 8, 0, 388, 32, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-04-12 17:38:13', '210001204', 'https://drive.google.com/drive/folders/1sgJvkzA2i418fDDTfs-zIA-16FTk5FxE', NULL, 'submitted'),
(357, '2025-04-07', 8, 0, 0, 8, 8, 0, 380, 24, 0, 0, 'Ronel Roque', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-12 17:44:05', '210001234', 'https://drive.google.com/file/d/1NYkZ9Dz2PrsuBBKEufrA7f_ynks7HXxe/view?usp=drivesdk', NULL, 'submitted'),
(358, '2025-04-07', 8, 8, 0, 8, 8, 0, 196, 32, 0, 0, 'Renjoy Marie David', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-12 17:45:18', '21001248', 'https://drive.google.com/file/d/1yWlSA7XW5IzMXkIsMImXt2ZB-LiraiDr/view?usp=drivesdk', NULL, 'submitted'),
(359, '2025-04-07', 8, 8, 0, 8, 8, 0, 36, 32, 0, 0, 'Jamel Roseth Sanchez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-04-12 17:57:39', '210000857', 'https://drive.google.com/file/d/103X8s2U3V9FWDYXwbbfAhBahyysyMEt-/view?usp=drivesdk', NULL, 'submitted'),
(360, '2025-04-07', 8, 8, 0, 8, 8, 0, 128, 32, 0, 0, 'Kim Elaiza Delos Santos', 'BSIS 4B', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-04-12 18:43:00', '210000876', 'https://drive.google.com/drive/folders/1QJGzwaNdvWB9grUZXOng2Jn3vjXiJ6VZ', NULL, 'submitted'),
(361, '2025-04-07', 8, 8, 8, 8, 8, 8, 308, 48, 0, 0, 'Joshua Marjef Deleon', 'BSIS 4B', 1, 'Xaviery Computer Center', '', '2025-04-12 19:55:17', '210001206', 'https://drive.google.com/file/d/1--IYn0zJiva-ZyZec40F2bihAwxHPgdW/view?usp=drive_link', NULL, 'submitted'),
(362, '2025-04-07', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Teofilo Pineda', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (HRMO)', '', '2025-04-12 20:31:47', '210001205', 'https://drive.google.com/file/d/1c9Z2iCag6SoKYu7grOrjJSk0GpoRQSS4/view?usp=drivesdk', NULL, 'submitted'),
(363, '2025-04-07', 8, 8, 0, 8, 8, 8, 436, 40, 0, 0, 'Arnold Ronquillo', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-12 20:37:15', '210000879', 'https://drive.google.com/file/d/1evfoT4ei1XBG-Y6TUqgnpj46E5FYhCV4/view?usp=drivesdk', NULL, 'submitted'),
(364, '2025-04-07', 8, 8, 8, 8, 8, 8, 4, 48, 0, 0, 'Wilson Ello', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-04-12 20:42:16', '210001019', 'https://drive.google.com/file/d/14uNyMTAnRHl3gER5ZhDr7EWEm-lYOgJR/view?usp=drivesdk', NULL, 'submitted'),
(365, '2025-04-07', 8, 8, 0, 8, 8, 0, 316, 32, 0, 0, 'Dennielle Nikko  Calma', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-04-12 22:07:07', '210000843', 'https://drive.google.com/drive/folders/1i0h3i1oTaQ9ntCIfbLWuMixPvJ7r5r_P', NULL, 'submitted'),
(366, '2025-04-07', 8, 8, 0, 0, 8, 0, 184, 24, 0, 0, 'Jake David', 'BSIS 4B', 1, 'Golden Green Enterprise ', '', '2025-04-12 22:09:12', '210000841', 'https://drive.google.com/drive/folders/1SmkO4tv42YW-Q_MKBSSjyAGRaUOhE1IU?usp=sharing', NULL, 'submitted'),
(367, '2025-04-07', 8, 8, 0, 8, 8, 0, 132, 32, 0, 0, 'David Jr. Romeo', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-04-12 22:26:19', '200000668', 'https://drive.google.com/file/d/1Publq9Dh2-YTdjB0BupiQzpj1ydkdsE6/view?usp=drivesdk', NULL, 'submitted'),
(368, '2025-04-07', 8, 8, 0, 8, 8, 0, 76, 32, 0, 0, 'John Michael Gabito', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-04-12 22:27:05', '210000849', 'https://drive.google.com/file/d/1MA2OFzjzZyiJfJKSyHlm9WTMPrFooF5T/view?usp=sharing', NULL, 'submitted'),
(369, '2025-04-07', 8, 8, 0, 8, 8, 0, 69, 32, 0, 0, 'Renalyn  Balagtas', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-13 10:15:36', '210001237', 'https://drive.google.com/drive/folders/1aWAEo8PO5GZ4_qhJFE5_J9eQhfnLpsCG', NULL, 'submitted'),
(370, '2025-03-17', 8, 8, 8, 8, 8, 0, 380, 40, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-13 10:35:48', '210001256', 'https://drive.google.com/file/d/10hRjE7s9F_DIT512hK57JAEilI2FlnP9/view?usp=drivesdk', NULL, 'submitted'),
(371, '2025-04-07', 8, 8, 0, 8, 8, 0, 388, 32, 0, 0, 'Allyssa Manalang', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-13 10:36:30', '210001256', 'https://drive.google.com/drive/folders/1-8e8ZRret-ZYX5idXnFRIC-7M9W5gISL', NULL, 'submitted'),
(372, '2025-04-07', 8, 8, 0, 8, 8, 0, 396, 32, 0, 0, 'Claire Macaspac', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-13 10:48:57', '21000837', 'https://drive.google.com/drive/folders/1Li-5SAAStsTzxYmzLt559OvwBVlclFoL', NULL, 'submitted'),
(373, '2025-04-07', 8, 8, 0, 8, 8, 8, 372, 40, 0, 0, 'Cristopher James Angeles', 'BSIS 4B', 1, 'Santa Rita College of Pampanga', '', '2025-04-13 10:52:31', '210000905', 'https://drive.google.com/drive/folders/1TMD4OVh5hDUUOwX33h8hItSJGmghrR2u', NULL, 'submitted'),
(374, '2025-04-07', 8, 8, 0, 8, 8, 0, 72, 32, 0, 0, 'Bryan Joseph Ronquillo', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-13 11:22:55', '210001277', 'https://drive.google.com/drive/folders/1-82QvU4c-FngPiDBoigEd373DjlSgs8r', NULL, 'submitted'),
(375, '2025-04-07', 8, 8, 8, 8, 8, 0, 132, 40, 0, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-04-13 11:36:56', '210000894', 'https://drive.google.com/file/d/17l2GzYolaG1NSFQsBj3Y2d9HUr2llvvC/view?usp=drivesdk', NULL, 'submitted'),
(376, '2025-04-07', 8, 8, 0, 8, 8, 0, 356, 32, 0, 0, 'Heart Kate Sarmiento', 'BSIS 4A', 1, 'Porac Fire Station BFP R3', '', '2025-04-13 11:37:54', '210001268', 'https://drive.google.com/drive/folders/1-Og2jpa2iFxZYrLUubzbDH6FPmT6dR3Q?usp=drive_link', NULL, 'submitted'),
(377, '2025-04-07', 8, 8, 0, 8, 8, 0, 356, 32, 0, 0, 'Rowie Pascual', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (MDRRMC)', '', '2025-04-13 11:37:55', '210000845', 'https://drive.google.com/file/d/17gtq_gEBtuxBd1dkKvYOOip8SyGo4ott/view?usp=drivesdk', NULL, 'submitted'),
(378, '2025-04-07', 8, 8, 8, 8, 8, 8, 132, 48, 0, 0, 'Xertxlle Prestoza', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-04-13 11:45:09', '210000932', 'https://drive.google.com/file/d/1nimE2fh9htO3SH8RXebPKIUz2dCq9YJS/view?usp=drivesdk', NULL, 'submitted'),
(379, '2025-04-07', 8, 8, 8, 8, 8, 0, 188, 40, 0, 0, 'Jerald Muli', 'BSIS 4B', 1, 'RL Resort and Leisure Park', '', '2025-04-13 11:48:07', '210000881', 'https://drive.google.com/file/d/1yQamS4ljfEjHWz0aPK3MOPwTkYRnBu4A/view?usp=drivesdk', NULL, 'submitted'),
(380, '2025-04-07', 8, 8, 8, 8, 8, 8, 404, 48, 0, 0, 'Arvie De Mesa', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-04-13 11:50:07', '210001249', 'https://drive.google.com/file/d/1onvb1VxK_y5-k2e6hFvZfQE1QzQXc4DJ/view?usp=drivesdk', NULL, 'submitted'),
(381, '2025-04-07', 8, 8, 8, 8, 8, 0, 74, 40, 0, 0, 'Darvin Lhoyd Galang', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-13 11:50:53', '  210000878', 'https://drive.google.com/file/d/1eASmOF0fdoJsrDNWMtONN8zldIVT1C0E/view?usp=drivesdk', NULL, 'submitted'),
(382, '2025-04-07', 8, 8, 0, 8, 8, 0, 342, 32, 0, 0, 'Dexter Marcellano', 'BSIS 4B', 1, 'Porac Municipal Police Station ', '', '2025-04-13 12:01:55', '210000846', 'https://drive.google.com/file/d/1tdU95iM4fUvBCk2DontInzNP64f5PocZ/view?usp=drivesdk', NULL, 'submitted'),
(383, '2025-04-07', 8, 8, 0, 8, 8, 0, 316, 32, 0, 0, 'Genesis Harran Tadeo', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-04-13 12:20:50', '210000842', 'https://drive.google.com/drive/folders/1jDhHzt4fy5VEC109hYY4_tQJlfsVova0?usp=drive_link', NULL, 'submitted'),
(384, '2025-04-07', 8, 8, 8, 8, 8, 0, 364, 40, 0, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-04-13 12:42:48', '210000836', 'https://drive.google.com/drive/folders/18CHutCXPReBWikCaZxvlj0BmqU9WvQAr', NULL, 'submitted'),
(385, '2025-04-07', 8, 0, 8, 0, 8, 0, 367, 30, 0, 6, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-04-13 12:46:32', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'submitted'),
(386, '2025-04-07', 8, 0, 8, 0, 8, 0, 397, 30, 0, 6, 'Adrian Layug', 'BSIS 4A', 1, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', '', '2025-04-13 13:01:35', '210000848', 'https://drive.google.com/drive/folders/12WrqsN02Zp_NiEhhdDKWpQtRHsCT1zST', NULL, 'submitted');
INSERT INTO `tbl_weekly_time_entries` (`id`, `week_start_date`, `monday_time`, `tuesday_time`, `wednesday_time`, `thursday_time`, `friday_time`, `saturday_time`, `remaining_time`, `total_hours`, `bon_time`, `over_time`, `student_fullname`, `course`, `sessionId`, `comp_name`, `comp_link`, `date_created`, `admissionNumber`, `image_link`, `remarks`, `status`) VALUES
(387, '2025-04-07', 8, 8, 8, 8, 8, 0, 352, 40, 0, 0, 'Justine Sotto', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-04-13 13:13:36', '210001211', 'https://acrobat.adobe.com/id/urn:aaid:sc:AP:99afa999-1b1d-467a-a5b9-2e80a671c77c', NULL, 'submitted'),
(388, '2025-04-07', 8, 8, 0, 0, 0, 0, 176, 16, 0, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-04-13 14:55:40', '210000850', 'https://drive.google.com/file/d/18ehaxe7wECll2lMVYhv9eBURm16OM9-G/view?usp=drivesdk', NULL, 'submitted'),
(389, '2025-04-07', 8, 8, 0, 8, 8, 8, 252, 40, 0, 0, 'Paul Ivan  Pineda', 'BSIS 4A', 1, 'Sta. Rita Elementary School', '', '2025-04-13 15:29:39', '210001253', 'https://drive.google.com/drive/folders/1zvt1rpKnizP94Wl7FZAAxRKXwZaAC4RW', NULL, 'submitted'),
(390, '2025-04-07', 8, 8, 0, 8, 8, 8, 324, 40, 0, 0, 'Jerson Balagtas', 'BSIS 4B', 1, 'Sta. Rita Elementary School', '', '2025-04-13 15:32:24', '210001239', 'https://drive.google.com/drive/folders/1SuGeKyzzI9PXzTi-Fr6RC3yRZkZvMpj3', NULL, 'submitted'),
(391, '2025-04-07', 8, 8, 0, 0, 8, 8, 284, 32, 0, 0, 'Ian Carlo Infante', 'BSIS 4A', 1, 'Golden Green Enterprise ', '', '2025-04-13 16:45:06', '21000', 'https://drive.google.com/drive/folders/1vjwXfcy3E3NYlaUxkNtXdPe-l36ni_X0', NULL, 'submitted'),
(392, '2025-04-07', 8, 8, 0, 8, 8, 0, 352, 32, 0, 0, 'Noah Isip', 'BSIS 4A', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-04-13 16:50:22', '210001215', 'https://drive.google.com/file/d/1yMB-6hDus3ZQ4FVUlucUZzaAhUSb-KRa/view?usp=sharing', NULL, 'submitted'),
(393, '2025-04-07', 8, 8, 8, 8, 8, 8, 63, 48, 0, 0, 'Sherwin Manuel', 'BSIS 4A', 1, 'RL Resort and Leisure Park', '', '2025-04-13 17:01:55', '210000887', 'https://drive.google.com/drive/folders/1t8XbFHNJoKUHQZL20HZMP0dcc9f37tbv', NULL, 'submitted'),
(394, '2025-04-07', 8, 8, 8, 8, 8, 0, 95, 40, 0, 0, 'Jordan  Zapanta', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-13 17:26:30', '210000859', 'Example.com', NULL, 'submitted'),
(395, '2025-04-07', 8, 8, 0, 8, 8, 0, 138, 32, 0, 0, 'Gabriel Santos', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (Public Employment Service Office P.E.S.O)', '', '2025-04-13 19:32:13', '200000722', 'https://drive.google.com/file/d/1-F-1MJdTRo6JljerapGpaXegmdm2Dy4G/view?usp=drivesdk', NULL, 'submitted'),
(396, '2025-04-07', 8, 8, 8, 8, 8, 0, 348, 40, 0, 0, 'Fille Anusencion', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-04-13 20:18:40', '210000895', 'https://drive.google.com/drive/folders/1-Uh8ZckNELpdMadDZUuIiZGV0jS7NHz2', NULL, 'submitted'),
(397, '2025-04-07', 8, 8, 0, 8, 8, 0, 321, 32, 0, 0, 'Mary Jane Devibar', 'BSIS 4B', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-13 20:32:47', '210001257', 'https://drive.google.com/drive/folders/13v1GzrDhaWZTnHXfpqBwN8WDliKN7EK3', NULL, 'submitted'),
(398, '2025-04-07', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Aerol Jann Isip', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-04-13 20:54:50', '190000454', 'https://drive.google.com/file/d/1VQ5nOO1AN92ZG2ONSB84ch3HI22MnZId/view?usp=drive_link', NULL, 'submitted'),
(399, '2025-04-07', 8, 8, 8, 8, 8, 0, 380, 40, 0, 0, 'Amberlene  Gamboa', 'BSIS 4A', 1, 'Office of the Municipal Engineer', '', '2025-04-13 21:00:20', '210000852', 'https://drive.google.com/drive/folders/1xNF8bfT3TAoVBkZ0KvMMWGKAMFTVdvfh', NULL, 'submitted'),
(400, '2025-04-07', 8, 8, 8, 8, 8, 0, 87, 40, 0, 0, 'Gerlyn Espada', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-13 21:15:30', '210000875', 'https://drive.google.com/drive/folders/1riIKDHHR6H4CNMr-DsMYzmOgNsvqZqtQ?usp=drive_link', NULL, 'submitted'),
(401, '2025-04-07', 4, 4, 0, 8, 8, 0, 67, 24, 0, 0, 'Hazel Santos', 'BSIS 4A', 1, 'Santa Rita College of Pampanga', '', '2025-04-13 22:29:38', '210000889', 'https://drive.google.com/drive/folders/1aTPk9P7WyHQ1p2bjfbsOIKzpJjL-aT2Y', NULL, 'submitted'),
(402, '2025-04-07', 8, 8, 0, 8, 8, 0, 83, 32, 0, 0, 'John Dexter Garcia', 'BSIS 4A', 1, 'Santa Rita College of Pampanga (MIS Office)', '', '2025-04-13 23:26:59', '210001066', 'https://drive.google.com/drive/folders/1--Z75uWINkNLn1OofUClcg0H6zptVcXs', NULL, 'submitted'),
(403, '2025-02-03', 0, 8, 5, 5, 7, 0, 291, 25, 0, 0, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 09:35:02', '210000888', 'https://drive.google.com/file/d/1Lm8BwMuIHhxGuyEGO3SzhYYHtQOqhAo4/view?usp=drivesdk', NULL, 'submitted'),
(404, '2025-02-10', 0, 0, 5, 0, 8, 8, 295, 21, 0, 0, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 09:38:21', '210000888', 'https://drive.google.com/file/d/1jFDgEl55PqjF0pZ495h0iYq-eF5xC6AU/view?usp=drivesdk', NULL, 'submitted'),
(405, '2025-02-17', 8, 8, 8, 8, 8, 0, 267, 49, 0, 9, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 09:42:06', '210000888', 'https://drive.google.com/file/d/18JhBHfE65uXczvLShhjkh87Xi5wPe6Oc/view?usp=drivesdk', NULL, 'submitted'),
(406, '2025-02-24', 0, 8, 8, 8, 0, 0, 291, 25, 0, 1, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 09:45:12', '210000888', 'https://drive.google.com/file/d/1wnCi-rnItFViCrV0QLXpQPs7tDXYMkMK/view?usp=drivesdk', NULL, 'submitted'),
(407, '2025-04-07', 8, 8, 8, 8, 8, 8, 256, 60, 0, 12, 'Candice Cuenco', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 09:51:30', '210000888', 'https://drive.google.com/file/d/1za830JMyaq0FekpgHfExkz3J3yu1xNCM/view?usp=drivesdk', NULL, 'submitted'),
(408, '2025-04-14', 8, 8, 8, 8, 8, 0, 328, 52, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 09:54:57', '210001235', 'https://drive.google.com/drive/folders/1XGCE7i47vsMrdHpYI7m3gRyiJhsIzmLt', NULL, 'submitted'),
(409, '2025-04-07', 8, 8, 8, 8, 8, 8, 320, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 10:07:40', '210001235', 'https://drive.google.com/drive/folders/1VFHqqmlULOKHsK1OIV2ggdy0PPAggw8v', NULL, 'submitted'),
(410, '2025-03-03', 8, 8, 8, 8, 8, 8, 320, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 10:10:59', '210001235', 'https://drive.google.com/drive/folders/1OW02t4IVFTctQ5gRBFmTHIUmwpckuN9c', NULL, 'submitted'),
(411, '2025-02-03', 8, 8, 8, 8, 8, 8, 320, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-04-19 10:16:30', '210001235', 'https://drive.google.com/drive/folders/1OncoWrRM-v9Uuixt909l0yNiutdWClyG', NULL, 'submitted'),
(412, '2025-04-14', 8, 8, 8, 0, 0, 0, 324, 24, 0, 0, 'Genesis Harran Tadeo', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-04-19 16:24:19', '210000842', 'https://drive.google.com/drive/folders/1jDhHzt4fy5VEC109hYY4_tQJlfsVova0?usp=drive_link', NULL, 'submitted'),
(413, '2025-04-14', 8, 8, 0, 0, 0, 0, 356, 16, 0, 0, 'Ashley Jude Santos', 'BSIS 4B', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-04-19 21:03:34', '210000883', 'https://drive.google.com/drive/folders/1mqmUszzy0PTbbG7a425kH7eFaGCzCI0O', NULL, 'submitted'),
(414, '2025-04-14', 8, 8, 4, 0, 0, 0, 384, 20, 0, 0, 'Nicole Lobo', 'BSIS 4A', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-04-20 09:33:23', '210000836', 'https://drive.google.com/drive/folders/18CHutCXPReBWikCaZxvlj0BmqU9WvQAr', NULL, 'submitted'),
(415, '2025-04-14', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Teofilo Pineda', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (HRMO)', '', '2025-04-20 19:28:47', '210001205', 'https://drive.google.com/file/d/1hoUttOQZsMdlWhBRjIkSJnzjtBkaD7cB/view?usp=drivesdk', NULL, 'submitted'),
(416, '2025-04-14', 8, 8, 8, 0, 0, 0, 367, 30, 0, 6, 'Nicole Garcia', 'BSIS 4A', 1, 'Pampanga Medical Specialist Hospital Inc.', '', '2025-04-20 19:31:24', '210001255', 'https://drive.google.com/drive/folders/1VYlWjoc_92bYXHnLpYGwNtahOpG28D8Z', NULL, 'submitted'),
(417, '2025-04-14', 8, 8, 8, 0, 0, 0, 397, 30, 0, 6, 'Adrian Layug', 'BSIS 4A', 1, 'Pampanga Advanced Renal Care Hemodialysis Center, Corp.', '', '2025-04-20 19:42:14', '210000848', 'https://drive.google.com/drive/folders/12WrqsN02Zp_NiEhhdDKWpQtRHsCT1zST', NULL, 'submitted'),
(418, '2025-04-14', 8, 8, 0, 0, 0, 0, 372, 16, 0, 0, 'Fille Anusencion', 'BSIS 4A', 1, 'Municipality of Sta. Rita Pampanga (RHU)', '', '2025-04-20 20:01:08', '210000895', 'https://drive.google.com/drive/folders/1-Uh8ZckNELpdMadDZUuIiZGV0jS7NHz2', NULL, 'submitted'),
(419, '2025-04-14', 8, 8, 6, 0, 0, 0, 370, 22, 0, 0, 'Justine Sotto', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-04-20 20:04:53', '210001211', 'https://acrobat.adobe.com/id/urn:aaid:sc:AP:65622814-8816-4d26-853b-ebee38a2f730', NULL, 'submitted'),
(420, '2025-04-14', 8, 8, 6, 0, 0, 0, 478, 22, 0, 0, 'Aerol Jann Isip', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-04-20 20:12:21', '190000454', 'https://drive.google.com/file/d/1yXz2y_WRSPL3PO91Lurp7vJdWlrUY27a/view?usp=drive_link', NULL, 'submitted'),
(421, '2025-04-14', 0, 8, 8, 0, 0, 0, 176, 16, 0, 0, 'Franchesca Masa', 'BSIS 4A', 1, 'RDF feed, Livestock and Foods, Inc.', '', '2025-04-20 20:19:08', '210000850', 'https://drive.google.com/file/d/191aaugkvgsKz2lmL74l_PVkmv62Pk-dZ/view?usp=drivesdk', NULL, 'submitted'),
(422, '2025-04-14', 8, 8, 8, 0, 0, 0, 324, 24, 0, 0, 'Dennielle Nikko  Calma', 'BSIS 4B', 1, 'Municipality of Porac (Human Resource Management Office)', '', '2025-04-20 20:53:08', '210000843', 'https://drive.google.com/drive/folders/1i0h3i1oTaQ9ntCIfbLWuMixPvJ7r5r_P', NULL, 'submitted'),
(423, '2025-04-07', 8, 8, 8, 8, 8, 8, 356, 48, 0, 0, 'Jayver Buan', 'BSIS 4B', 1, 'Rigourtech Calibrating Services', '', '2025-04-20 20:53:42', '210000891', 'https://drive.google.com/file/d/1zy33WYh4SFvfsrfzTssfgmzCAf5If2xI/view?usp=drivesdk', NULL, 'submitted'),
(424, '2025-04-14', 8, 8, 8, 0, 0, 0, 148, 24, 0, 0, 'Mangiliman Shanchai', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-04-20 20:54:01', '210000894', 'https://drive.google.com/file/d/1YuPTtfP2a1eB33Fe3Qh8NGMO5XD44mMV/view?usp=drivesdk', NULL, 'submitted'),
(425, '2025-04-14', 8, 8, 8, 8, 8, 8, 356, 48, 0, 0, 'Jayver Buan', 'BSIS 4B', 1, 'Rigourtech Calibrating Services', '', '2025-04-20 21:01:25', '210000891', 'https://drive.google.com/file/d/1hvFvN06ylThp14HeROk48DTOlUSb62c2/view?usp=drivesdk', NULL, 'submitted'),
(426, '2025-04-14', 8, 8, 0, 0, 0, 0, 92, 16, 0, 0, 'Noah Isip', 'BSIS 4A', 1, 'Municipality of Porac ( Lydo Local Youth Development Office)', '', '2025-04-20 21:16:31', '210001215', 'https://drive.google.com/file/d/1cMeee7-s8vbzzIslvqK-jSRedX1nOiBM/view?usp=sharing', NULL, 'submitted'),
(427, '2025-04-14', 8, 8, 8, 0, 0, 0, 356, 24, 0, 0, 'Kathlene Tesoro', 'BSIS 4A', 1, 'Municipality of Porac (Office of the Vice Mayor)', '', '2025-04-20 21:43:10', '210001276', 'https://docs.google.com/document/d/1fU7FAOSvlIjEMmQFEx2b9NcN6IYui4SC/edit?usp=drivesdk&ouid=100662934803195057434&rtpof=true&sd=true', NULL, 'submitted'),
(428, '2025-04-14', 8, 8, 0, 0, 0, 0, 52, 16, 0, 0, 'Jamel Roseth Sanchez', 'BSIS 4A', 1, 'Municipality Of Porac (Office of DTI negosyo Center)', '', '2025-04-20 22:51:37', '210000857', 'https://drive.google.com/file/d/10LlUK_LaR6MkmRCW9OxvtnlpyXki-c1q/view?usp=drivesdk', NULL, 'submitted'),
(429, '2025-04-14', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Lice Junet Ramos', 'BSIS 4B', 1, 'Porac Municipal Police Station ', '', '2025-04-20 23:27:01', '210000865', 'https://drive.google.com/drive/folders/17DloT-JtldZWgz8ynsLyZk71OetpXZBb', NULL, 'submitted'),
(430, '2025-04-14', 8, 8, 4, 0, 0, 0, 140, 20, 0, 0, 'Kim Elaiza Delos Santos', 'BSIS 4B', 1, 'Municipality of Lubao Pampanga (Department of Health)', '', '2025-04-20 23:51:51', '210000876', 'https://drive.google.com/drive/folders/1QJGzwaNdvWB9grUZXOng2Jn3vjXiJ6VZ', NULL, 'submitted'),
(431, '2025-04-28', 8, 8, 8, 8, 8, 8, 320, 60, 0, 12, 'Shekinah Katerielle Cruz', 'BSIS 4B', 1, 'Royce Hotel & Casino', '', '2025-05-03 22:26:46', '210001235', 'https://drive.google.com/drive/folders/1Y1IY3_4MBxjsSCTU70B6LElTCUXfDS-X?usp=drive_link                          https://drive.google.com/drive/folders/1_jHpYHugwZdTR50YRAUnDMRsVlzWFi1g?usp=drive_link', NULL, 'submitted'),
(432, '2025-04-14', 8, 8, 0, 0, 0, 0, 404, 16, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-05-03 23:15:11', '210001204', 'https://drive.google.com/drive/folders/1HftiJCpU7YbudfyUlJjkUEjYb7qNmp14', NULL, 'submitted'),
(433, '2025-04-21', 8, 0, 0, 4, 0, 0, 408, 12, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-05-03 23:16:31', '210001204', 'https://drive.google.com/drive/folders/16QLWBL1EazKVSutTj15L-4t30nXkyGsm', NULL, 'submitted'),
(434, '2025-04-28', 8, 0, 0, 0, 0, 0, 412, 8, 0, 0, 'Russel Valencia', 'BSIS 4A', 1, 'LGU Sta. Rita Pampanga', '', '2025-05-03 23:17:36', '210001204', 'https://drive.google.com/drive/folders/1gltd91WTJUp6ysE4r1IBjjUG5bTmV4od', NULL, 'submitted'),
(435, '2025-04-28', 8, 8, 8, 8, 8, 0, 460, 40, 0, 0, 'Aerol Jann Isip', 'BSIS 4A', 1, 'Municipality of Porac (Agricultural Office)', '', '2025-05-04 08:13:49', '190000454', 'https://drive.google.com/file/d/1HvUgCooPnFKD1TNkXf-q5lDMCBOOn6GC/view?usp=drive_link', NULL, 'submitted'),
(436, '2026-01-19', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mark Glen Guevarra', 'BSIS 4A', 2, 'Santa Rita College of Pampanga', '', '2026-01-23 08:26:03', '22-0002148', 'https://drive.google.com/drive/folders/1imUcRCjFt74zv63ASQ5k2OtoRznJ46Op?usp=drive_link', 'baliw poster in pass mo', 'denied'),
(437, '2026-01-19', 8, 8, 8, 8, 8, 0, 500, 40, 0, 0, 'Mark Glen Guevarra', 'BSIS 4A', 2, 'Santa Rita College of Pampanga', '', '2026-01-23 08:27:14', '22-0002148', 'https://drive.google.com/drive/folders/1imUcRCjFt74zv63ASQ5k2OtoRznJ46Op?usp=drive_link', 'mali', 'denied');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblannouncement`
--
ALTER TABLE `tblannouncement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblaudit_log`
--
ALTER TABLE `tblaudit_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblenroll`
--
ALTER TABLE `tblenroll`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblreports`
--
ALTER TABLE `tblreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tblreports_sessionId` (`sessionId`);

--
-- Indexes for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblstudent`
--
ALTER TABLE `tblstudent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idx_sessionTermId` (`sessionTermId`);

--
-- Indexes for table `tblstudents_archive`
--
ALTER TABLE `tblstudents_archive`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblsubmit`
--
ALTER TABLE `tblsubmit`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbltask`
--
ALTER TABLE `tbltask`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblterm`
--
ALTER TABLE `tblterm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbl_weekly_time_entries`
--
ALTER TABLE `tbl_weekly_time_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblannouncement`
--
ALTER TABLE `tblannouncement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `tblaudit_log`
--
ALTER TABLE `tblaudit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblclass`
--
ALTER TABLE `tblclass`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tblenroll`
--
ALTER TABLE `tblenroll`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblreports`
--
ALTER TABLE `tblreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblstudent`
--
ALTER TABLE `tblstudent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `tblsubmit`
--
ALTER TABLE `tblsubmit`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltask`
--
ALTER TABLE `tbltask`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblterm`
--
ALTER TABLE `tblterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `tbl_weekly_time_entries`
--
ALTER TABLE `tbl_weekly_time_entries`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
