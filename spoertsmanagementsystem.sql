-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 07:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spoertsmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `LOGIN_ID` varchar(10) NOT NULL,
  `PWD` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`LOGIN_ID`, `PWD`) VALUES
('admin', 'admin@123'),
('alex_s1', 'pwd@123'),
('wps_122', 'aux12qe');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `DID` varchar(10) NOT NULL,
  `DNAME` varchar(20) NOT NULL,
  `DLOCATION` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`DID`, `DNAME`, `DLOCATION`) VALUES
('1121156473', 'ARYANSPORTS', 'NOIDA_UTTARPRADESH'),
('1123223187', 'REX_SPORTS_LTD', 'UTTAR_PRADESH'),
('1453735627', 'TUNGRILA_SPORTS', 'HARYANA'),
('1462662772', 'SUN_SPORTS', 'NEW_DELHI.');

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `FNO` varchar(10) NOT NULL,
  `FINE_AMT` float DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `TIMESTAMP` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issued_to_play`
--

CREATE TABLE `issued_to_play` (
  `SID` varchar(10) NOT NULL,
  `UID` varchar(10) NOT NULL,
  `ISSUE_TIME` time NOT NULL,
  `RETURN_TIME` time NOT NULL,
  `DUE_TIME` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issued_to_use`
--

CREATE TABLE `issued_to_use` (
  `SID` varchar(10) NOT NULL,
  `UID` varchar(10) NOT NULL,
  `ISSUE_DATE` date DEFAULT NULL,
  `RETURN_DATE` date DEFAULT NULL,
  `DUE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `PID` varchar(10) NOT NULL,
  `UID` varchar(10) NOT NULL,
  `SID` varchar(10) NOT NULL,
  `RECEIPT_NO` varchar(10) NOT NULL,
  `PAYMENT_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `SCODE` varchar(10) NOT NULL,
  `SNAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`SCODE`, `SNAME`) VALUES
('01', 'CRICKET'),
('02', 'FOOTBALL'),
('03', 'TABLE_TENNIS'),
('04', 'BADMINTON'),
('05', 'BASKETBALL'),
('06', 'ATHLETICS'),
('07', 'CHESS'),
('08', 'SNOOKERS'),
('09', 'VOLLEYBALL');

-- --------------------------------------------------------

--
-- Table structure for table `sports_item`
--

CREATE TABLE `sports_item` (
  `SID` varchar(10) NOT NULL,
  `SPORT_CODE` varchar(10) NOT NULL,
  `ITEM_NAME` varchar(20) NOT NULL,
  `BRAND` varchar(20) NOT NULL,
  `COLOUR` varchar(10) NOT NULL,
  `PURCHASE_DATE` date NOT NULL,
  `DIST_ID` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sports_item`
--

INSERT INTO `sports_item` (`SID`, `SPORT_CODE`, `ITEM_NAME`, `BRAND`, `COLOUR`, `PURCHASE_DATE`, `DIST_ID`, `QUANTITY`) VALUES
('2626621121', '01', 'BAT', 'SG', 'RED', '2020-01-23', '1121156473', 2),
('2663627262', '01', 'HELMET', 'SG', 'NAVY_BLUE', '2021-03-27', '1121156473', 3),
('266817551', '01', 'BAT', 'SS', 'BLUE', '2021-02-26', '1453735627', 3),
('3443242411', '01', 'BALL', 'KOOKABURRA', 'RED', '2022-06-12', '1453735627', 4),
('3566252622', '02', 'CONE', 'ROXAN', 'RED', '2020-09-09', '1462662772', 3),
('3566252624', '02', 'CONE', 'ROXAN', 'BLUE', '2020-09-09', '1462662772', 4),
('4524414253', '02', 'BALL', 'ADIDAS', 'BLACK', '2022-07-14', '1123223187', 4),
('4524414257', '02', 'BALL', 'NIKE', 'ORANGE', '2022-10-11', '4524414253', 3),
('5562551621', '01', 'BALL', 'KOOKABURRA', 'WHITE', '2022-04-17', '1121156473', 2),
('563262551', '03', 'RACKET', 'YONEX', 'RED', '2022-04-11', '1123223187', 5);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `STAFF_ID` varchar(10) NOT NULL,
  `FNAME` varchar(50) NOT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `DOB` date NOT NULL,
  `CONTACT_NO` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `GENDER` varchar(1) NOT NULL,
  `DEPARTMENT` varchar(50) NOT NULL,
  `LOG_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STAFF_ID`, `FNAME`, `LNAME`, `DOB`, `CONTACT_NO`, `ADDRESS`, `EMAIL`, `GENDER`, `DEPARTMENT`, `LOG_ID`) VALUES
('1232212212', 'AAYUSH', 'YADAV', '1993-04-28', '9377377378', 'FLAT M-4,CP,NEW DELHI.', 'GOODIETWOSHOES@YAHOO', 'M', 'LIB', 'alex_s1'),
('1433424142', 'REX', 'AUSTIN', '1991-02-12', '7492762363', 'BAKOLI,NARELA,NEW DELHI.', 'REXAUSTIN@GMAIL.COM', 'M', 'LIB', 'wps_122');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UID` varchar(10) NOT NULL,
  `FNAME` varchar(50) NOT NULL,
  `LNAME` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(20) DEFAULT NULL,
  `D_O_B` date NOT NULL,
  `DEPT` varchar(20) NOT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  `CONTACT_NO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UID`, `FNAME`, `LNAME`, `CATEGORY`, `D_O_B`, `DEPT`, `GENDER`, `CONTACT_NO`) VALUES
('201210022', 'GAURI', 'SINGH', 'GEN', '2013-04-20', 'CSE', 'F', '9383728827'),
('201230058', 'YASH', 'RAJ', 'OBC', '2001-08-22', 'EEE', 'M', '7736262729'),
('211210029', 'KABIR', 'SINGH', 'GEN', '2004-12-11', 'CSE', 'M', '8374873481'),
('211210045', 'RAHUL', 'MISHRA', 'GEN', '2002-07-16', 'CSE', 'M', '7736261718'),
('211210053', 'ROHIT', 'KUMAR', 'OBC', '2004-01-15', 'CSE', 'M', '7838147484'),
('211210056', 'SAJAL', 'SAHU', 'GEN', '2003-02-03', 'CSE', 'M', '8847832623'),
('211210058', 'SARVESH', 'BEHARE', 'CSE', '2002-09-22', 'CSE', 'M', '8716246348'),
('21122003', 'AARTI', 'RAANA', 'OBC', '2003-01-28', 'ECE', 'F', '7262367372'),
('211220034', 'MUSTAFA', 'RAHEEM', 'MINORITY', '2004-11-17', 'ECE', 'M', '8728728361'),
('211230034', 'ZAHEER', 'HUSSAIN', 'MINORITY', '2004-01-01', 'EEE', 'M', '8843636289');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD PRIMARY KEY (`LOGIN_ID`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`DID`);

--
-- Indexes for table `fine`
--
ALTER TABLE `fine`
  ADD PRIMARY KEY (`FNO`);

--
-- Indexes for table `issued_to_play`
--
ALTER TABLE `issued_to_play`
  ADD PRIMARY KEY (`SID`,`UID`);

--
-- Indexes for table `issued_to_use`
--
ALTER TABLE `issued_to_use`
  ADD PRIMARY KEY (`SID`,`UID`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`SCODE`);

--
-- Indexes for table `sports_item`
--
ALTER TABLE `sports_item`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFF_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
