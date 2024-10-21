-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 01:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmyshow`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `bookingid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `showtimeid` int(11) DEFAULT NULL,
  `no_of_seats` int(11) DEFAULT NULL,
  `totalamount` decimal(10,2) DEFAULT NULL,
  `payementstatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingid`, `userid`, `showtimeid`, `no_of_seats`, `totalamount`, `payementstatus`) VALUES
(1, 1, 1, 2, 500.00, 'sucessfull'),
(2, 2, 2, 3, 900.00, 'sucessfull'),
(3, 3, 3, 1, 275.00, 'sucessfull'),
(4, 4, 4, 3, 870.00, 'failed'),
(5, 5, 5, 1, 320.00, 'failed');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `durationminutes` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `releasedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieid`, `title`, `genre`, `durationminutes`, `language`, `releasedate`) VALUES
(1, 'rayan', 'action', 145, 'tamil,telugu,hindi', '2024-07-27'),
(2, 'deadpool', 'action,adventure', 128, 'english,telugu,tamil,hindi', '2024-07-24'),
(3, 'kalki', 'action,thriller', 128, 'english,telugu,tamil,hindi', '2024-06-27'),
(4, 'animal', 'action,crime,drama', 201, 'telugu,hindi,kannada,malayalam', '2023-12-01'),
(5, 'leo', 'action,thriller', 164, 'telugu,hindi,kannada,tamil', '2023-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentid` int(11) NOT NULL,
  `bookingid` int(11) DEFAULT NULL,
  `paymentdate` datetime DEFAULT NULL,
  `paymentmethod` varchar(50) DEFAULT NULL,
  `amountpaid` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentid`, `bookingid`, `paymentdate`, `paymentmethod`, `amountpaid`) VALUES
(1, 1, '2024-08-10 13:00:00', 'Credit Card', 1000.00),
(2, 2, '2024-08-11 15:30:00', 'Debit Card', 600.00),
(3, 3, '2024-08-12 17:00:00', 'UPI', 1500.00),
(4, 4, '2024-08-13 11:00:00', 'Digital Wallet', 800.00),
(5, 5, '2024-08-14 14:30:00', 'UPI', 1200.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `payment_status`
-- (See below for the actual view)
--
CREATE TABLE `payment_status` (
`userid` int(11)
,`name` varchar(50)
,`pno` bigint(20)
,`totalamount` decimal(10,2)
,`payementstatus` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE `screens` (
  `screenid` int(11) NOT NULL,
  `theaterid` int(11) DEFAULT NULL,
  `screenname` varchar(50) DEFAULT NULL,
  `seatingcapacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `screens`
--

INSERT INTO `screens` (`screenid`, `theaterid`, `screenname`, `seatingcapacity`) VALUES
(1, 1, 'screen1', 750),
(2, 2, 'screen2', 650),
(3, 3, 'screen3', 550),
(4, 4, 'screen1', 600),
(5, 5, 'screen1', 800);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seatid` int(11) NOT NULL,
  `bookingid` int(11) DEFAULT NULL,
  `seatno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seatid`, `bookingid`, `seatno`) VALUES
(1, 1, 'A1'),
(2, 2, 'B1'),
(3, 3, 'A2'),
(4, 4, 'C1'),
(5, 5, 'B3');

-- --------------------------------------------------------

--
-- Table structure for table `showtimes`
--

CREATE TABLE `showtimes` (
  `showtimeid` int(11) NOT NULL,
  `movieid` int(11) DEFAULT NULL,
  `screenid` int(11) DEFAULT NULL,
  `showdate` datetime DEFAULT NULL,
  `availableseats` int(11) DEFAULT NULL,
  `priceperseat` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `showtimes`
--

INSERT INTO `showtimes` (`showtimeid`, `movieid`, `screenid`, `showdate`, `availableseats`, `priceperseat`) VALUES
(1, 1, 1, '2024-08-10 12:00:00', 750, 250.00),
(2, 2, 2, '2024-08-10 18:30:00', 650, 300.00),
(3, 3, 3, '2024-08-11 21:00:00', 550, 275.00),
(4, 4, 4, '2024-08-12 15:00:00', 600, 290.00),
(5, 5, 5, '2024-08-13 19:30:00', 800, 320.00);

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `theaterid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`theaterid`, `name`, `location`, `capacity`) VALUES
(1, 'PVR Ameerpet', 'Ameerpet, Hyderabad', 800),
(2, 'INOX Banjara Hills', 'Banjara Hills, Hyderabad', 750),
(3, 'Cinepolis Hitech City', 'Hitech City, Hyderabad', 900),
(4, 'Inorbit Mall Theater', 'Madhapur, Hyderabad', 650),
(5, 'City Center Mall Theater', 'Secunderabad, Hyderabad', 700);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pno` bigint(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `name`, `email`, `pno`, `password`, `createdAt`) VALUES
(1, 'raghu', 'raghu@gmail.com', 9747281947, 'raghu', '2024-08-09 12:22:05'),
(2, 'rani', 'rani@gmail.com', 8747346947, 'rani', '2024-08-09 12:22:38'),
(3, 'kavya', 'kavya@gmail.com', 6747388947, 'kavya', '2024-08-09 12:23:16'),
(4, 'arun', 'arun@gmail.com', 6747333478, 'arun', '2024-08-09 12:24:00'),
(5, 'abhi', 'abhi@gmail.com', 6300353478, 'abhi', '2024-08-09 12:24:45');

-- --------------------------------------------------------

--
-- Structure for view `payment_status`
--
DROP TABLE IF EXISTS `payment_status`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payment_status`  AS SELECT `u`.`UserID` AS `userid`, `u`.`name` AS `name`, `u`.`pno` AS `pno`, `b`.`totalamount` AS `totalamount`, `b`.`payementstatus` AS `payementstatus` FROM (`users` `u` join `bookings` `b` on(`u`.`UserID` = `b`.`userid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `showtimeid` (`showtimeid`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `bookingid` (`bookingid`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`screenid`),
  ADD KEY `theaterid` (`theaterid`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seatid`),
  ADD KEY `bookingid` (`bookingid`);

--
-- Indexes for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD PRIMARY KEY (`showtimeid`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `screenid` (`screenid`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`theaterid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `pno` (`pno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`showtimeid`) REFERENCES `showtimes` (`showtimeid`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`bookingid`) REFERENCES `bookings` (`bookingid`);

--
-- Constraints for table `screens`
--
ALTER TABLE `screens`
  ADD CONSTRAINT `screens_ibfk_1` FOREIGN KEY (`theaterid`) REFERENCES `theaters` (`theaterid`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`bookingid`) REFERENCES `bookings` (`bookingid`);

--
-- Constraints for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`screenid`) REFERENCES `screens` (`screenid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
