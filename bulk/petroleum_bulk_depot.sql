-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2017 at 11:20 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petroleum_bulk_depot`
--

-- --------------------------------------------------------

--

--
-- Table structure for table 'admin'

CREATE TABLE `admin`(
   `u_name` varchar(20) NOT NULL,
   `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `department`

INSERT INTO `admin`(`u_name`,`password`) VALUES
('dbms','dbms');
  
-- Table structure for table `department`

CREATE TABLE `department` (
  `DNo` int(11) NOT NULL,
  `DName` varchar(30) NOT NULL,
  `MGRIDNo` varchar(15) DEFAULT NULL,
  `MGRStartDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNo`, `DName`, `MGRIDNo`, `MGRStartDate`) VALUES
(1, 'Quality Asurance', '1', '2017-08-08'),
(2, 'Storage', '4', '2017-08-12'),
(3, 'Logistic', '2', '2017-08-02'),
(4, 'Financial', '5', '2017-08-01'),
(5, 'Sales and customer service', '3', '2017-08-16'),
(6, 'Engineering and Maintenance', '8', '2017-08-24');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `IDNo` varchar(15) NOT NULL,
  `Class` varchar(1) NOT NULL,
  `VehicleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `IDNo` varchar(15) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Sex` enum('Male','Female') NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `DNo` int(11) DEFAULT NULL,
  `JobType` enum('Labour','Engineer','Technician','Driver','Firefighter','SecurityOfficer','Accountant') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`IDNo`, `FName`, `LName`, `Sex`, `Address`, `DateOfBirth`, `Salary`, `DNo`, `JobType`) VALUES
('1', 'Daenerys', 'Targaryen', 'Female', '123 6th St. \r\nMelbourne, FL 32904', '1820-02-11', 20000, 3, 'Labour'),
('2', 'Jon ', 'Snow', 'Male', '71 Pilgrim Avenue \r\nChevy Chase, MD 20815', '1850-10-05', 20000, 6, 'Engineer'),
('3', 'Cersei', 'Lannister', 'Male', '70 Bowman St. \r\nSouth Windsor, CT 06074', '1802-02-01', 45000, 2, 'Technician'),
('4', 'Ned ', 'Stark', 'Male', '44 Shirley Ave. \r\nWest Chicago, IL 60185', '1820-04-05', 25000, 3, 'Driver'),
('5', 'Jorah ', 'Mormont', 'Male', '514 S. Magnolia St. \r\nOrlando, FL 32806', '1818-12-05', 50000, 6, 'Firefighter'),
('6', 'Petyr ', 'Baelish', 'Female', '53 Addison Drive \r\nDayton, OH 45420', '1900-02-05', 35000, 4, 'SecurityOfficer'),
('8', 'Arya ', 'Stark', 'Female', '14 South Devon St. \r\nBuffalo Grove, IL 60089', '1866-10-06', 12000, 4, 'Accountant');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

CREATE TABLE `engineer` (
  `IDNo` varchar(15) NOT NULL,
  `Field` varchar(20) NOT NULL,
  `YearsOfExperience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `firefighter`
--

CREATE TABLE `firefighter` (
  `IDNo` varchar(15) NOT NULL,
  `Class` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hired`
--

CREATE TABLE `hired` (
  `VehicleID` int(11) NOT NULL,
  `Cost` int(11) NOT NULL,
  `Period` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `labour`
--

CREATE TABLE `labour` (
  `IDNo` varchar(15) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oil`
--

CREATE TABLE `oil` (
  `Type` varchar(10) NOT NULL,
  `CurrentRate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oil`
--

INSERT INTO `oil` (`Type`, `CurrentRate`) VALUES
('Diesel', 135),
('Kerosene', 120),
('Petrol', 185);

-- --------------------------------------------------------

--
-- Table structure for table `owned`
--

CREATE TABLE `owned` (
  `VehicleID` int(11) NOT NULL,
  `OwnedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `OrderNo` int(11) NOT NULL,
  `Date` date NOT NULL,
  `OilType` varchar(10) NOT NULL,
  `Volume` int(11) NOT NULL,
  `TankNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchaseorder`
--

INSERT INTO `purchaseorder` (`OrderNo`, `Date`, `OilType`, `Volume`, `TankNo`) VALUES
(1, '2017-08-20', 'Diesel', 20000, 2),
(2, '2017-08-01', 'Kerosene', 10000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesorder`
--

CREATE TABLE `salesorder` (
  `OrderNo` int(11) NOT NULL,
  `Date` date NOT NULL,
  `OilType` varchar(10) NOT NULL,
  `Volume` int(11) NOT NULL,
  `TankNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesorder`
--

INSERT INTO `salesorder` (`OrderNo`, `Date`, `OilType`, `Volume`, `TankNo`) VALUES
(1, '2017-08-19', 'Petrol', 5000, 1),
(2, '2017-08-11', 'Diesel', 3000, 2),
(3, '2017-08-09', 'Kerosene', 1000, 3),
(4, '2017-08-09', 'Kerosene', 1000, 3),
(5, '2017-08-09', 'Kerosene', 1000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `securityofficer`
--

CREATE TABLE `securityofficer` (
  `IDNo` varchar(15) NOT NULL,
  `Agency` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `TankNo` int(11) NOT NULL,
  `MaxCapacity` int(11) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `CurrentCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`TankNo`, `MaxCapacity`, `Type`, `CurrentCapacity`) VALUES
(1, 30000, 'Petrol', 15000),
(2, 35000, 'Diesel', 17000),
(3, 30000, 'Kerosene', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `IDNo` varchar(10) NOT NULL,
  `TGrade` varchar(1) NOT NULL,
  `YearsOfExperience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleID` int(11) NOT NULL,
  `LicensePlateNo` varchar(10) DEFAULT NULL,
  `Type` varchar(20) NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Ownership` enum('Hired','Owned') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`VehicleID`, `LicensePlateNo`, `Type`, `Capacity`, `Ownership`) VALUES
(1, 'NW-2135', 'Road Tanker', 1000, 'Hired');

--
-- Indexes for dumped tables
--

--

-- Indexes for table `admin `

ALTER TABLE `admin`
   ADD PRIMARY KEY (`u_name`,`password`);

-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DNo`),
  ADD KEY `MGRIDNo` (`MGRIDNo`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`IDNo`),
  ADD KEY `VehicleID` (`VehicleID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`IDNo`),
  ADD KEY `DNo` (`DNo`);

--
-- Indexes for table `engineer`
--
ALTER TABLE `engineer`
  ADD PRIMARY KEY (`IDNo`);

--
-- Indexes for table `firefighter`
--
ALTER TABLE `firefighter`
  ADD PRIMARY KEY (`IDNo`);

--
-- Indexes for table `hired`
--
ALTER TABLE `hired`
  ADD PRIMARY KEY (`VehicleID`);

--
-- Indexes for table `labour`
--
ALTER TABLE `labour`
  ADD PRIMARY KEY (`IDNo`);

--
-- Indexes for table `oil`
--
ALTER TABLE `oil`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `owned`
--
ALTER TABLE `owned`
  ADD PRIMARY KEY (`VehicleID`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`OrderNo`),
  ADD KEY `TankNo` (`TankNo`),
  ADD KEY `OilType` (`OilType`(1)),
  ADD KEY `OilType_2` (`OilType`),
  ADD KEY `TankNo_2` (`TankNo`),
  ADD KEY `OilType_3` (`OilType`);

--
-- Indexes for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD PRIMARY KEY (`OrderNo`),
  ADD KEY `TankNo` (`TankNo`),
  ADD KEY `OilType` (`OilType`) USING BTREE;

--
-- Indexes for table `securityofficer`
--
ALTER TABLE `securityofficer`
  ADD PRIMARY KEY (`IDNo`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`TankNo`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `technician`
--
ALTER TABLE `technician`
  ADD PRIMARY KEY (`IDNo`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleID`),
  ADD KEY `Ownership` (`Ownership`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `salesorder`
--
ALTER TABLE `salesorder`
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `storage`
--
ALTER TABLE `storage`
  MODIFY `TankNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `VehicleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGRIDNo`) REFERENCES `employee` (`IDNo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `employee` (`IDNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `employee` (`IDNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `firefighter`
--
ALTER TABLE `firefighter`
  ADD CONSTRAINT `firefighter_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `employee` (`IDNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hired`
--
ALTER TABLE `hired`
  ADD CONSTRAINT `hired_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `labour`
--
ALTER TABLE `labour`
  ADD CONSTRAINT `labour_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `employee` (`IDNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owned`
--
ALTER TABLE `owned`
  ADD CONSTRAINT `owned_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`TankNo`) REFERENCES `storage` (`TankNo`) ON UPDATE CASCADE;

--
-- Constraints for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD CONSTRAINT `salesorder_ibfk_1` FOREIGN KEY (`TankNo`) REFERENCES `storage` (`TankNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `salesorder_ibfk_2` FOREIGN KEY (`OilType`) REFERENCES `oil` (`Type`) ON UPDATE CASCADE;

--
-- Constraints for table `securityofficer`
--
ALTER TABLE `securityofficer`
  ADD CONSTRAINT `securityofficer_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `employee` (`IDNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technician`
--
ALTER TABLE `technician`
  ADD CONSTRAINT `technician_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `employee` (`IDNo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
