-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2026 at 01:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EventVolunteerManagementSystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assignments`
--

CREATE TABLE `Assignments` (
  `Assignment_ID` int(11) NOT NULL,
  `Volunteer_ID` int(11) NOT NULL,
  `Task_ID` int(11) NOT NULL,
  `Assignment_Status` enum('Assigned','Pending','Completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Assignments`
--

INSERT INTO `Assignments` (`Assignment_ID`, `Volunteer_ID`, `Task_ID`, `Assignment_Status`) VALUES
(1, 1, 1, 'Assigned'),
(2, 2, 2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `Event_ID` int(11) NOT NULL,
  `Event_Name` varchar(45) NOT NULL,
  `Event_Date` date NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL,
  `Location` varchar(45) NOT NULL,
  `Max_Volunteers` int(11) NOT NULL
) ;

--
-- Dumping data for table `Events`
--

INSERT INTO `Events` (`Event_ID`, `Event_Name`, `Event_Date`, `Start_Time`, `End_Time`, `Location`, `Max_Volunteers`) VALUES
(1, 'Charity Run', '2026-04-15', '08:00:00', '12:00:00', 'Central Park', 20);

-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE `Tasks` (
  `Task_ID` int(11) NOT NULL,
  `Event_ID` int(11) NOT NULL,
  `Task_Name` varchar(45) NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time NOT NULL
) ;

--
-- Dumping data for table `Tasks`
--

INSERT INTO `Tasks` (`Task_ID`, `Event_ID`, `Task_Name`, `Start_Time`, `End_Time`) VALUES
(1, 1, 'Registration Desk', '08:00:00', '10:00:00'),
(2, 1, 'Water Station', '10:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Role` enum('admin','volunteer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`User_ID`, `Username`, `Email`, `Password_Hash`, `Role`) VALUES
(1, 'admin1', 'admin1@mail.com', 'hash_admin', 'admin'),
(2, 'volunteer1', 'vol1@mail.com', 'hash_vol1', 'volunteer'),
(3, 'volunteer2', 'vol2@mail.com', 'hash_vol2', 'volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `Volunteers`
--

CREATE TABLE `Volunteers` (
  `Volunteer_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Volunteers`
--

INSERT INTO `Volunteers` (`Volunteer_ID`, `User_ID`, `First_Name`, `Last_Name`, `Phone`) VALUES
(1, 2, 'Walter', 'White', '123-456-7890'),
(2, 3, 'Jessie', 'Pinkman', '987-654-3210');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD PRIMARY KEY (`Assignment_ID`),
  ADD KEY `Volunteer_ID` (`Volunteer_ID`),
  ADD KEY `Task_ID` (`Task_ID`);

--
-- Indexes for table `Events`
--
ALTER TABLE `Events`
  ADD PRIMARY KEY (`Event_ID`);

--
-- Indexes for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`Task_ID`),
  ADD KEY `Event_ID` (`Event_ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Volunteers`
--
ALTER TABLE `Volunteers`
  ADD PRIMARY KEY (`Volunteer_ID`),
  ADD UNIQUE KEY `User_ID` (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Assignments`
--
ALTER TABLE `Assignments`
  MODIFY `Assignment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Events`
--
ALTER TABLE `Events`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tasks`
--
ALTER TABLE `Tasks`
  MODIFY `Task_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Volunteers`
--
ALTER TABLE `Volunteers`
  MODIFY `Volunteer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`Volunteer_ID`) REFERENCES `Volunteers` (`Volunteer_ID`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`Task_ID`) REFERENCES `Tasks` (`Task_ID`);

--
-- Constraints for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `Events` (`Event_ID`);

--
-- Constraints for table `Volunteers`
--
ALTER TABLE `Volunteers`
  ADD CONSTRAINT `volunteers_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
