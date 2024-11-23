-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2024 at 03:10 PM
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
-- Database: `evstation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `stationid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `b_date` varchar(100) NOT NULL,
  `intime` time NOT NULL,
  `outtime` time NOT NULL,
  `duration` int(11) NOT NULL,
  `slotid` int(11) NOT NULL,
  `voltage` int(11) NOT NULL,
  `b_status` varchar(110) NOT NULL,
  `amount` int(11) NOT NULL,
  `bookingon` datetime NOT NULL,
  `slotname` varchar(200) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `vehicle` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `stationid`, `userid`, `b_date`, `intime`, `outtime`, `duration`, `slotid`, `voltage`, `b_status`, `amount`, `bookingon`, `slotname`, `vehicleid`, `vehicle`) VALUES
(1, 4, 1, '24/02/2024', '17:00:00', '20:00:00', 3, 1, 100, 'Cancelled', 500, '2024-02-24 16:43:20', 'Voltage : 400 Price : 500', 1, 'TATA Nexon - MH09FX0394'),
(3, 4, 1, '03/09/2024', '01:20:00', '04:20:00', 3, 2, 100, 'Cancelled', 500, '2024-09-01 17:23:33', 'Voltage : 250 Price : 300', 1, 'TATA Nexon - MH09FX0394');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `location`, `city`, `latitude`, `longitude`) VALUES
(4, 'TataTech EV ', 'Near Shahu Market', 'Kolhapur', '16.70907033127918', '74.2697721179542'),
(5, 'HP Station', 'Near DSK Toyota ', 'kolhapur', '16.80678626409079', '74.28326631079517'),
(6, 'Pratik Kumbhar', 'Panchaganga ', 'Kolhapur ', '16.713892347607953', '74.24136600953392');

-- --------------------------------------------------------

--
-- Table structure for table `station_slots`
--

CREATE TABLE `station_slots` (
  `id` int(11) NOT NULL,
  `stationid` int(11) NOT NULL,
  `voltage` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `station_slots`
--

INSERT INTO `station_slots` (`id`, `stationid`, `voltage`, `price`, `status`) VALUES
(1, 4, '400', '500', 'Enable'),
(2, 4, '250', '300', 'Enable'),
(3, 5, '400', '500', 'Enable'),
(4, 5, '250', '300', 'Disable');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobileno`, `password`) VALUES
(1, 'Pratik', 'abc@gmail.com', '9552610806', '123'),
(2, 'kishor chafekanade', 'kishorc024@gmail.com', '7821070219', '123'),
(3, 'pa', 'pa@gmail.com', '123456789', '1234'),
(4, 'qa', 'qa@gmail.com', '12345678', '0987');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `veh_number` varchar(100) NOT NULL,
  `veh_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `userid`, `veh_number`, `veh_name`) VALUES
(1, 1, 'MH09FX0394', 'TATA Nexon'),
(2, 1, 'MH09DA8530', 'Elantra EV'),
(3, 1, 'Pra', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station_slots`
--
ALTER TABLE `station_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `station_slots`
--
ALTER TABLE `station_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
