

--
-- Database: `sports`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `LOGIN_ID` varchar(10) NOT NULL,
  `PWD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authentication`
--

INSERT INTO `authentication` (`LOGIN_ID`, `PWD`) VALUES
('admin', 'e6e061838856bf47e1de730719fb2609'),
('alex_s1', 'b757f97c9ff375ae14b1260e690fb210'),
('wps_122', '5769ff9e4e23b0a31af8dd31d08f2952');

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
  `RETURN_TIME` time,
  `DUE_TIME` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issued_to_play`
--

INSERT INTO `issued_to_play` (`SID`, `UID`, `ISSUE_TIME`, `RETURN_TIME`, `DUE_TIME`) VALUES
('3443242411', '211210045', '01:00:18', null, '02:00:18');
INSERT INTO `issued_to_play` (`SID`, `UID`, `ISSUE_TIME`, `RETURN_TIME`, `DUE_TIME`) VALUES
('2663627262','211210045','01:00:18',null,'02:00:18');
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
INSERT INTO `issued_to_use` (`SID`, `UID`, `ISSUE_DATE`, `RETURN_DATE`, `DUE_DATE`) VALUES
('3566252622','211210056','2022-11-30',NULL,'2022-12-15');

CREATE TABLE `pays` (
  `PID` varchar(10) NOT NULL,
  `UID` varchar(10) NOT NULL,
  `FNO` varchar(10) NOT NULL,
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
('4524414257', '02', 'BALL', 'NIKE', 'ORANGE', '2022-10-11', '1123223187', 3),
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
  `LOG_ID` varchar(10) NOT NULL
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
  `CONTACT_NO` varchar(10) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT 'e6e061838856bf47e1de730719fb2609'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
CREATE TABLE `log`
(
  `UID` varchar(10),
  `SID` varchar(10),
  `ISSUE_DATE` DATETIME,
  `RETURN_DATE` DATETIME
);

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
  ADD PRIMARY KEY (`SID`,`UID`),
  ADD KEY `UID` (`UID`);

--
-- Indexes for table `issued_to_use`
--
ALTER TABLE `issued_to_use`
  ADD PRIMARY KEY (`SID`,`UID`),
  ADD KEY `UID` (`UID`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `UID` (`UID`),
  ADD KEY `FNO` (`FNO`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`SCODE`);

--
-- Indexes for table `sports_item`
--
ALTER TABLE `sports_item`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `DIST_ID` (`DIST_ID`),
  ADD KEY `SPORT_CODE` (`SPORT_CODE`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFF_ID`),
  ADD KEY `LOG_ID` (`LOG_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issued_to_play`
--
ALTER TABLE `issued_to_play`
  ADD CONSTRAINT `issued_to_play_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`),
  ADD CONSTRAINT `issued_to_play_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`);

--
-- Constraints for table `issued_to_use`
--
ALTER TABLE `issued_to_use`
  ADD CONSTRAINT `issued_to_use_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `issued_to_use_ibfk_10` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`),
  ADD CONSTRAINT `issued_to_use_ibfk_11` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`),
  ADD CONSTRAINT `issued_to_use_ibfk_12` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`),
  ADD CONSTRAINT `issued_to_use_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `issued_to_use_ibfk_3` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `issued_to_use_ibfk_4` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `issued_to_use_ibfk_5` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `issued_to_use_ibfk_6` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `issued_to_use_ibfk_7` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`),
  ADD CONSTRAINT `issued_to_use_ibfk_8` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`),
  ADD CONSTRAINT `issued_to_use_ibfk_9` FOREIGN KEY (`SID`) REFERENCES `sports_item` (`SID`);

--
-- Constraints for table `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `pays_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`),
  ADD CONSTRAINT `pays_ibfk_2` FOREIGN KEY (`FNO`) REFERENCES `fine` (`FNO`),
  ADD CONSTRAINT `pays_ibfk_3` FOREIGN KEY (`FNO`) REFERENCES `fine` (`FNO`),
  ADD CONSTRAINT `pays_ibfk_4` FOREIGN KEY (`FNO`) REFERENCES `fine` (`FNO`);

--
-- Constraints for table `sports_item`
--
ALTER TABLE `sports_item`
  ADD CONSTRAINT `sports_item_ibfk_1` FOREIGN KEY (`DIST_ID`) REFERENCES `distributor` (`DID`),
  ADD CONSTRAINT `sports_item_ibfk_2` FOREIGN KEY (`SPORT_CODE`) REFERENCES `sports` (`SCODE`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`LOG_ID`) REFERENCES `authentication` (`LOGIN_ID`);