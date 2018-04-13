-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2018 at 11:50 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ios-social`
--

-- --------------------------------------------------------

--
-- Table structure for table `taccount`
--

CREATE TABLE `taccount` (
  `id` int(6) NOT NULL,
  `fullname` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taccount`
--

INSERT INTO `taccount` (`id`, `fullname`, `email`, `password`) VALUES
(1, 'Hendro Steven', 'hendro.steven@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'Andre', 'andre@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `tcomment`
--

CREATE TABLE `tcomment` (
  `id` int(11) NOT NULL,
  `posting_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tcomment`
--

INSERT INTO `tcomment` (`id`, `posting_id`, `account_id`, `comment`, `comment_date`) VALUES
(2, 1, 1, 'Coba lagi', '2018-04-13 06:05:20');

-- --------------------------------------------------------

--
-- Table structure for table `tfriend`
--

CREATE TABLE `tfriend` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tfriend`
--

INSERT INTO `tfriend` (`id`, `account_id`, `friend_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tposting`
--

CREATE TABLE `tposting` (
  `id` int(11) NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `photo` longtext,
  `description` text,
  `taccount_id` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tposting`
--

INSERT INTO `tposting` (`id`, `post_date`, `photo`, `description`, `taccount_id`) VALUES
(1, '0000-00-00 00:00:00', 'ini photo', 'description', 1),
(2, '2018-04-12 06:06:52', 'ini photo x', 'description x', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `taccount`
--
ALTER TABLE `taccount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcomment`
--
ALTER TABLE `tcomment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tfriend`
--
ALTER TABLE `tfriend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tposting`
--
ALTER TABLE `tposting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taccount_id` (`taccount_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `taccount`
--
ALTER TABLE `taccount`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tcomment`
--
ALTER TABLE `tcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tfriend`
--
ALTER TABLE `tfriend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tposting`
--
ALTER TABLE `tposting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tposting`
--
ALTER TABLE `tposting`
  ADD CONSTRAINT `tposting_ibfk_1` FOREIGN KEY (`taccount_id`) REFERENCES `taccount` (`id`);
