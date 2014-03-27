-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2014 at 06:29 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `itportal`
--
CREATE DATABASE IF NOT EXISTS `itportal` DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_520_ci;
USE `itportal`;

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE IF NOT EXISTS `entry` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Creatorid` int(10) unsigned NOT NULL,
  `Creatorusername` varchar(16) COLLATE utf32_unicode_520_ci NOT NULL,
  `Cretiondate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Caption` varchar(64) COLLATE utf32_unicode_520_ci NOT NULL,
  `Content` text COLLATE utf32_unicode_520_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `entry`
--

INSERT INTO `entry` (`ID`, `Creatorid`, `Creatorusername`, `Cretiondate`, `Caption`, `Content`) VALUES
(1, 0, 'admin', '2014-03-20 18:12:52', 'Test caption', 'This is a test entry. Its only for test. A real entry will have usefull information in it.');

-- --------------------------------------------------------

--
-- Table structure for table `forumpost`
--

CREATE TABLE IF NOT EXISTS `forumpost` (
  `ID` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `Creatorid` int(10) unsigned NOT NULL,
  `Caption` varchar(32) COLLATE utf32_unicode_520_ci DEFAULT NULL COMMENT 'Always null for comments, never null for new entry.',
  `Message` text COLLATE utf32_unicode_520_ci NOT NULL,
  `Creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Lastupdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Entryid` int(10) unsigned NOT NULL,
  `Postnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `Locationid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Password` varchar(128) COLLATE utf32_unicode_520_ci NOT NULL,
  `Login` varchar(16) COLLATE utf32_unicode_520_ci NOT NULL,
  `Username` varchar(16) COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `Name` varchar(48) COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `Email` varchar(64) COLLATE utf32_unicode_520_ci NOT NULL,
  `Address` varchar(64) COLLATE utf32_unicode_520_ci DEFAULT NULL,
  `Comments` text COLLATE utf32_unicode_520_ci,
  `Birtday` date DEFAULT NULL,
  `Language` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-ukrainian,1-english',
  `Style` int(1) NOT NULL DEFAULT '0',
  `Role` int(1) NOT NULL DEFAULT '0' COMMENT '0-user',
  `Hasavatar` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Password`, `Login`, `Username`, `Name`, `Email`, `Address`, `Comments`, `Birtday`, `Language`, `Style`, `Role`, `Hasavatar`) VALUES
(0, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'admin', NULL, NULL, 'test@gmail.com', NULL, NULL, NULL, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
