-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2025 at 02:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `hod` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`id`, `department`, `description`, `hod`, `status`, `created_at`) VALUES
(3, 'Subscale', 'Subscale', 'EMP345', 1, '2025-02-26 09:09:26'),
(4, 'HRD', 'Human Resource Department', 'EMP123', 1, '2025-02-28 14:47:32'),
(5, 'RAW', 'Raw Material', 'EMP678', 1, '2025-02-26 09:12:57'),
(7, 'NDT', 'NDT', 'EMP945', 1, '2025-02-27 17:00:42'),
(8, 'QC', 'Quality Control', 'EMP345', 1, '2025-02-27 18:04:03'),
(9, 'CSG', 'Computer Section Group', 'EMP892', 1, '2025-02-28 08:54:21'),
(10, 'QA', 'Quality Assurance', 'EMP545', 1, '2025-02-28 14:13:31'),
(11, 'MMD', 'Material Management Division', 'EMP934', 1, '2025-02-28 14:48:17'),
(12, 'Trimming', 'Trimming', 'EMP946', 1, '2025-02-28 16:52:21'),
(13, 'Inhibition', 'Inhibition', 'EMP698', 1, '2025-03-02 09:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pass`
--

CREATE TABLE `tbl_pass` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `purpose` text NOT NULL,
  `department` varchar(255) NOT NULL,
  `initiating_officer` varchar(255) NOT NULL,
  `officer_designation` varchar(255) NOT NULL,
  `out_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `pass_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pass`
--

INSERT INTO `tbl_pass` (`id`, `name`, `designation`, `date`, `purpose`, `department`, `initiating_officer`, `officer_designation`, `out_time`, `created_at`, `status`, `pass_no`) VALUES
(1, 'Shruti Dashpute', 'Apprentice', '2025-03-03', 'CSD Canteen', 'HR', 'Sandeep Gupta', 'STA \'B\'', '18:22:00', '2025-02-28 09:53:00', 1, 'PASS1'),
(3, 'Dhanashri Halde', 'Apprentice', '2025-03-29', 'CSD Canteen', 'NDT', 'Sandeep Gupta', 'STA \'B\'', '18:35:00', '2025-02-28 10:05:31', 2, ''),
(7, 'Monali Shirsath', 'Technical Documentation writer', '2025-03-04', 'CSD Canteen', 'QC', 'Sandeep Gupta', 'STA \'B\'', '19:09:00', '2025-02-28 10:39:30', 1, 'PASS-9142'),
(8, 'Shruti Dashpute', 'Apprentice', '2025-03-03', 'Personal', 'CSG', 'Nisha Nandan', 'To B', '16:15:00', '2025-03-02 09:45:43', 1, 'PASS-3011');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visitors`
--

CREATE TABLE `tbl_visitors` (
  `id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `escort_person` varchar(100) NOT NULL,
  `contact_person_name` varchar(100) NOT NULL,
  `contact_person_tel` varchar(20) NOT NULL,
  `visitor_name` varchar(100) NOT NULL,
  `visitor_mobile` varchar(20) NOT NULL,
  `visitor_aadhar` varchar(20) NOT NULL,
  `visitor_vehicle` varchar(50) NOT NULL,
  `firm_name_address` text NOT NULL,
  `arrival_datetime` datetime NOT NULL,
  `area_facility` enum('Technical','Non-Technical') NOT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0,
  `in_time` datetime DEFAULT current_timestamp(),
  `purpose_visit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_visitors`
--

INSERT INTO `tbl_visitors` (`id`, `department`, `escort_person`, `contact_person_name`, `contact_person_tel`, `visitor_name`, `visitor_mobile`, `visitor_aadhar`, `visitor_vehicle`, `firm_name_address`, `arrival_datetime`, `area_facility`, `remark`, `created_at`, `status`, `in_time`, `purpose_visit`) VALUES
(3, 'HRD', 'Shubhaman Gill', 'Shreyas Iyer', '9875848595', 'Ishan Kisan', '9875848595', '336575847192', 'MH15JU4809', 'Infosys Pvt.Ltd', '2025-02-26 14:45:00', '', NULL, '2025-02-25 17:15:50', 2, '2025-02-26 14:58:01', ''),
(5, 'HRD', 'Shruti', 'Shruti ', '8668576498', 'Virat Kohli', '8668576498', '336575847192', 'MH15JU4809', 'Flat No 19, ALfa Crecent Society College Road Nashik', '2025-02-27 14:19:00', 'Non-Technical', NULL, '2025-02-26 08:50:15', 1, '2025-02-26 14:58:01', ''),
(6, 'Subscale', 'Pawan Kumar Soni', 'Nisha Nandan', '6857485974', 'Shreyas Iyer', '6857485974', '125874589575', 'MH15JU4585', 'Minitek Pvt.LTD', '2025-02-27 18:28:00', 'Technical', NULL, '2025-02-26 08:58:20', 1, '2025-02-26 14:58:01', ''),
(7, 'NDT', 'Shruti Dashpute ', 'Rashmi Dashpute', '8668576498', 'Rohit Sharma', '8668576498', '336575847192', 'MH15JU4585', 'Flat No 19, ALfa Crecent Society College Road, vise mala Nashik', '2025-02-28 15:31:00', 'Technical', '', '2025-02-27 17:01:36', 1, '2025-02-27 22:31:36', 'Printer'),
(8, 'NDT', 'Shruti Dashpute ', 'Rashmi Dashpute', '8668576498', 'Rohit Sharma', '8668576498', '336575847192', 'MH15JU4585', 'Flat No 19, ALfa Crecent Society College Road, vise mala Nashik', '2025-02-28 15:31:00', 'Technical', '', '2025-02-27 17:03:13', 2, '2025-02-27 22:33:13', 'Scanner'),
(9, 'Subscale', 'Janhavee Kapoor', 'Shridevi', '7895847589', 'Boni Kapoor', '7895847589', '658475985215', 'MH15JU4809', 'Flat No 19, ALfa Crecent Society College Road, vise mala Nashik', '2025-03-01 13:02:00', 'Technical', '', '2025-02-27 17:32:57', 1, '2025-02-27 23:02:57', 'Professional'),
(10, 'CSG', 'Nisha Nandan', 'Vishal Sejwal', '9685745849', 'Shivaji', '9685745849', '336575847192', 'MH15JU3456', 'Minitek Pvt.LTD', '2025-03-03 17:25:00', 'Technical', '', '2025-02-28 08:55:38', 1, '2025-02-28 14:25:38', 'Printer Repairing'),
(12, 'HRD', 'Nisha Nandan', 'Vishal Sejwal', '8668576498', 'Rohit Sharma', '8668576498', '658475985215', 'MH15JU4809', 'Flat No 19, ALfa Crecent Society College Road, vise mala Nashik', '2025-03-04 21:08:00', 'Technical', '', '2025-02-28 15:38:47', 0, '2025-02-28 21:08:47', 'Printer Repairing'),
(13, 'Subscale', 'Shruti Dashpute ', 'Shruti Dashpute ', '8668576498', 'Ishan Kisan', '8668576498', '336575847192', 'MH15JU4809', 'Flat No 19, ALfa Crecent Society College Road, vise mala Nashik', '2025-03-03 21:20:00', 'Technical', '', '2025-02-28 15:50:45', 0, '2025-02-28 21:20:45', 'Printer Repairing'),
(14, 'CSG', 'Rohit Sharma', 'Virat Kohli', '7895847586', 'Hardik Pandya', '7895847586', '369852147584', 'MH15AB456', 'Infosys Pvt.Ltd', '2025-03-04 18:13:00', 'Non-Technical', '', '2025-03-02 09:43:50', 1, '2025-03-02 15:13:50', 'Personal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `role` enum('Admin','Initiator','Security') DEFAULT 'Initiator',
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `emailid`, `role`, `status`) VALUES
(1, 'Virat Kohli', 'Virat', 'pass123', 'virat@gmail.com', 'Admin', 'active'),
(2, 'Jane Smith', 'janesmith', 'mypassword', 'jane@example.com', 'Initiator', 'active'),
(3, 'Security Guy', 'security01', 'securepass', 'security@example.com', 'Security', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pass`
--
ALTER TABLE `tbl_pass`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pass_no` (`pass_no`);

--
-- Indexes for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `emailid` (`emailid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_pass`
--
ALTER TABLE `tbl_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_visitors`
--
ALTER TABLE `tbl_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
