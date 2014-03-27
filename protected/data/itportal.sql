-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2014 at 10:51 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bdblog`
--
CREATE DATABASE IF NOT EXISTS `bdblog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bdblog`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tag`
--

CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Login` varchar(24) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_german2_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `content`, `status`, `create_time`, `author`, `email`, `url`, `post_id`) VALUES
(1, 'This is a test comment.', 2, 1230952187, 'Tester', 'tester@example.com', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lookup`
--

CREATE TABLE IF NOT EXISTS `tbl_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_lookup`
--

INSERT INTO `tbl_lookup` (`id`, `name`, `code`, `type`, `position`) VALUES
(1, 'Draft', 1, 'PostStatus', 1),
(2, 'Published', 2, 'PostStatus', 2),
(3, 'Archived', 3, 'PostStatus', 3),
(4, 'Pending Approval', 1, 'CommentStatus', 1),
(5, 'Approved', 2, 'CommentStatus', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE IF NOT EXISTS `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`id`, `title`, `content`, `tags`, `status`, `create_time`, `update_time`, `author_id`) VALUES
(1, 'Welcome!', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.\r\n\r\nFeel free to try this system by writing new posts and posting comments.', 'yii, blog', 2, 1230952187, 1230952187, 1),
(2, 'A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'test', 2, 1230952187, 1230952187, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tag`
--

CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_tag`
--

INSERT INTO `tbl_tag` (`id`, `name`, `frequency`) VALUES
(1, 'yii', 1),
(2, 'blog', 1),
(3, 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `email`, `profile`) VALUES
(1, 'demo', '$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC', 'webmaster@example.com', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;
--
-- Database: `itportal`
--
CREATE DATABASE IF NOT EXISTS `itportal` DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_520_ci;
USE `itportal`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `position` varchar(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `position`) VALUES
(1, 'Новая5', 'вверх'),
(2, 'Новая5', 'вверх'),
(3, 'dfssdf', 'зліва'),
(4, 'Новая5', 'вверх'),
(5, 'Протеїни', 'зліва'),
(6, 'Жири', 'зліва'),
(7, 'Білки', 'зліва'),
(8, 'Амінокислот и', 'зліва'),
(9, 'Коктелі', 'left'),
(10, 'Жири', 'зліва');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_520_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Password`, `Login`, `Username`, `Name`, `Email`, `Address`, `Comments`, `Birtday`, `Language`, `Style`, `Role`, `Hasavatar`) VALUES
(0, 'd8578edf8458ce06fbc5bb76a58c5ca4', 'admin', 'admin', 'admin', 'test@gmail.com', '', '', '0000-00-00', 0, 0, 0, 0),
(1, 'kolya', 'kolya', 'kolya', 'admin', 'test@gmail.com', NULL, NULL, NULL, 0, 0, 2, 0),
(2, 'admin', 'kolya', 'admin', NULL, 'admin', NULL, NULL, NULL, 0, 0, 2, 0),
(3, 'kolya', 'admin', 'kolya', NULL, 'tesdsfdsfdsfdst@gmail.com', NULL, NULL, NULL, 0, 0, 0, 0);
--
-- Database: `page`
--
CREATE DATABASE IF NOT EXISTS `page` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `page`;
--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE IF NOT EXISTS `basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `total price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `conten` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `conten`) VALUES
(1, 'Протеїни', 'left'),
(2, 'Жири', 'left');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `date` int(10) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `date`, `content`) VALUES
(1, 1, 'Білок', 12, 1394381186, NULL),
(2, 2, 'Жирок', 40, 1394382091, '<p>\r\n	<img alt="" height="578" src="/upload/userfiles/images/860751fd0657be089c76c1d0adced3f1.bmp" width="798" /></p>\r\n'),
(3, 2, 'Жирок', 40, 1394382156, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `userfist` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `mail` varchar(10) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `role` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;
--
-- Database: `sport`
--
CREATE DATABASE IF NOT EXISTS `sport` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sport`;

-- --------------------------------------------------------

--
-- Table structure for table `t_book`
--

CREATE TABLE IF NOT EXISTS `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `description` text,
  `link` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `t_book`
--

INSERT INTO `t_book` (`id`, `title`, `author`, `year`, `description`, `link`, `img`) VALUES
(8, 'Vini Push', 'ыфваыфафыаыфа', 2147483647, NULL, NULL, NULL),
(7, 'Вщйна ы миз', 'Tolctoy', 0, NULL, NULL, NULL),
(13, 'Вщйна ы миз', 'Tolctoy', 20049, NULL, NULL, NULL),
(9, 'Vini Push', 'ыфваыфафыаыфа', 2147483647, NULL, NULL, NULL),
(10, 'Вщйна ы миз', 'Tolctoy', 20049, NULL, NULL, NULL),
(0, 'Сверх Челавек', 'Нище', 234434, NULL, NULL, NULL),
(12, 'Вщйна ы миз', 'Tolctoy', 20049, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_category`
--

CREATE TABLE IF NOT EXISTS `t_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `t_category`
--

INSERT INTO `t_category` (`id`, `title`) VALUES
(1, 'Загальна к'),
(2, 'ыаыа'),
(3, 'ыаыа'),
(4, 'ыаыа'),
(5, 'ыа'),
(6, 'ыа'),
(7, ''),
(8, 'ыва'),
(9, 'О животних');

-- --------------------------------------------------------

--
-- Table structure for table `t_page`
--

CREATE TABLE IF NOT EXISTS `t_page` (
  `int` int(10) NOT NULL AUTO_INCREMENT,
  `table` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`int`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `t_page`
--

INSERT INTO `t_page` (`int`, `table`, `text`, `category_id`) VALUES
(1, 'Первая запись', 'Текст', 0),
(2, 'Другая Запісь', 'Це є друга записка', 2),
(3, 'dfad', 'fdsf', 0),
(4, 'dfs', 'dsfsfsdfds', 3),
(5, 'dsfdsf', '', 4),
(6, 'dsf', '', 0),
(7, '6', 'fsdf', 0),
(8, '6dssfs', 'sfdsf', 0),
(9, 'jghjgh', 'hgjhgj', 0),
(10, 'dgdg', 'cgcfg', 0),
(11, 'jghjghsfsdfssssssssssssssssssss', 'hgjhgjfssd', 0),
(12, 'jghjghsfsdfssssssssssssssssssss', 'hgjhgjfssd', 0),
(13, 'sf________________ssssssssssssssssssss', 'sdfdsf', 0),
(14, '1111', '', 0);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `vasi`
--
CREATE DATABASE IF NOT EXISTS `vasi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vasi`;
--
-- Database: `yii`
--
CREATE DATABASE IF NOT EXISTS `yii` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yii`;

-- --------------------------------------------------------

--
-- Table structure for table `cms_category`
--

CREATE TABLE IF NOT EXISTS `cms_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(222) NOT NULL,
  `position` varchar(2222) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `cms_category`
--

INSERT INTO `cms_category` (`id`, `title`, `position`) VALUES
(1, 'Новая5', 'вверх'),
(2, 'Новая5', 'вверх'),
(3, 'dfssdf', 'зліва'),
(4, 'Новая5', 'вверх'),
(5, 'Протеїни', 'зліва'),
(6, 'Жири', 'зліва'),
(7, 'Білки', 'зліва'),
(8, 'Амінокислот и', 'зліва'),
(9, 'Коктелі', 'left'),
(10, 'Жири', 'зліва');

-- --------------------------------------------------------

--
-- Table structure for table `cms_coment`
--

CREATE TABLE IF NOT EXISTS `cms_coment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coment` text,
  `page_id` int(111) DEFAULT NULL,
  `created` text,
  `user_id` int(111) DEFAULT NULL,
  `guest` varchar(111) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `cms_coment`
--

INSERT INTO `cms_coment` (`id`, `coment`, `page_id`, `created`, `user_id`, `guest`, `status`) VALUES
(1, '11111111', 1, '1', 1, NULL, 1),
(2, '', NULL, NULL, NULL, '', 0),
(3, 'df', NULL, NULL, NULL, 'df', 0),
(4, 'df', NULL, NULL, NULL, 'df', 0),
(5, 'dsfs', 6, '1392492004', NULL, 'sdf', 0),
(6, 'df', 6, '1392492059', NULL, 'sf', 0),
(7, 'vgh', 6, '1392492136', NULL, 'mm', 0),
(8, 'mmj', 6, '1392492192', NULL, 'll.', 0),
(9, 'dsf', 6, '1392492289', NULL, 'dsf', 0),
(10, 'sdfsd', 6, '1392493788', NULL, 'dsf', 0),
(11, 'efdsf', 4, '1392493909', NULL, 'dsf', 0),
(12, 'efdsf', 4, '1392493970', NULL, 'dsf', 0),
(13, 'dsfds', 4, '1392494025', NULL, 'dsf', 0),
(14, 'sdfdsf', 4, '1392494100', NULL, 'sdfs', 0),
(15, 'sdfdsf', 4, '1392494152', NULL, 'sdfs', 0),
(16, 'sdfds', 4, '1392494177', NULL, 'sdf', 0),
(17, 'sdfds', 4, '1392494410', NULL, 'sdf', 0),
(18, 'bjhnjj', 4, '1392494418', NULL, 'm,l', 0),
(19, 'njhkn', 4, '1392494630', NULL, 'nkm', 0),
(20, 'cghhg', 4, '1392494880', NULL, 'fvnvhj', 0),
(21, 'hhjbhj', 4, '1392495370', NULL, 'nkln', 0),
(22, 'hjk', 4, '1392495431', NULL, 'lmk', 0),
(23, 'hbj', 4, '1392495495', NULL, 'bjhkb', 0),
(24, 'bkknbknj', 4, '1392495504', NULL, 'mlml', 0),
(25, 'jjkj', 15, '1392495527', NULL, 'kkk', 0),
(26, 'jnnkjnkj', 10, '1392495555', NULL, 'km', 0),
(27, 'fdga', 10, '1392495661', NULL, 'dsf', 0),
(28, 'sdfg', 4, '1392496045', NULL, 'fdg', 0),
(29, 'fdgddddddddddg', 4, '1392496054', NULL, 'gdfg', 0),
(30, 'bkjkjnnkj', 4, '1392496540', NULL, 'nkj', 0),
(31, 'mjk', 4, '1392497087', NULL, 'dsf', 0),
(32, 'bhbhjk', 4, '1392498275', 6, 'jnkjb', 0),
(33, 'vbjhbjh', 4, '1392498286', 5, 'kjnkj', 0),
(34, 'куцу', 4, '1395057989', 2, 'уцкйу', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `title`, `content`, `created`, `status`, `category_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, '', '', NULL, NULL, NULL),
(3, 'Моя Перша сторінка', '', NULL, NULL, NULL),
(4, 'Моя Перша сторінка', '<h3 style="color:blue;">\r\n	<span style="background-color: rgb(204, 255, 102); color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px;">upload</span><img alt="" height="125" src="/upload/userfiles/images/5dcb7952a3b1eb47d74a2c0d3cb3fb1c.jpg" width="200" /><img alt="" height="325" src="/upload/userfiles/images/31694aa5a509cec42c1228e76a583d63.jpg" width="290" /></h3>\r\n<table border="1" cellpadding="1" cellspacing="1" style="width: 200px;">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<h3 style="color:blue;">\r\n	івавіаіааааааааааааааааааааааааааааааааааааааааааааааааааааааа<a name="іваі"></a></h3>\r\n', NULL, 0, 3),
(6, 'Cторінка головна', '<h3 style="color:blue;">\r\n	<img align="left" alt="" height="100" src="/upload/userfiles/images/a572baa90df4df3f5af2fee3a34c5289.jpg" width="160" /></h3>\r\n<table border="1" cellpadding="1" cellspacing="1" style="width: 200px;">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<h3 style="color:blue;">\r\n	<img alt="" height="260" width="260" />івавіаіааааааааааааааааааааааааааааааааааааааааааааааааааааааа<a name="іваі"></a></h3>\r\n<p>\r\n	&nbsp;</p>', NULL, 0, 3),
(7, '', '', NULL, NULL, NULL),
(8, '', '', NULL, 5, NULL),
(9, '', '', NULL, 1, 3),
(10, 'sdf', '', 1391891452, 0, 1),
(11, 'sdf', '<p>\r\n	sdfs</p>\r\n', 1391891453, 0, 1),
(12, 'sdf', '', 1391891470, 0, 1),
(13, 'sdf', '<p>\r\n	sdfsf</p>\r\n', 1391891484, 0, 1),
(14, 'Моя Перша сторінка', '', 1391892261, 0, 1),
(15, 'Моя Перша сторінка', '<p>\r\n	<img alt="" /></p>\r\n<p>\r\n	<img align="bottom" alt="" height="100" src="/upload/userfiles/images/c2357dd97484bfbb64b2039a4fd19916.jpg" width="160" /></p>\r\n', 1391892343, 1, 2),
(16, '', '<p>\r\n	<img alt="" height="100" src="/upload/userfiles/images/06da8c8429e0c8eb0e272223b2e08516.jpg" width="160" /></p>', 1391892427, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cms_rozdili`
--

CREATE TABLE IF NOT EXISTS `cms_rozdili` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `position` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `cms_rozdili`
--

INSERT INTO `cms_rozdili` (`id`, `title`, `position`) VALUES
(1, 'sdf', 'top'),
(2, 'sdfs', 'top'),
(3, 'sdfdsf', 'top'),
(4, 'sdfsd', 'top'),
(5, 'fdsf', 'top'),
(6, 'sdf', 'top'),
(7, 'fdsf', 'top'),
(8, 'sdf', 'top'),
(9, 'sdfdsf', 'top'),
(10, 'dsfsdf', 'top'),
(11, 'sdfs', 'top');

-- --------------------------------------------------------

--
-- Table structure for table `cms_user`
--

CREATE TABLE IF NOT EXISTS `cms_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usemame` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `ban` tinyint(1) DEFAULT NULL,
  `role` tinyint(1) DEFAULT NULL,
  `amail` varchar(3443) NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cms_user`
--

INSERT INTO `cms_user` (`id`, `usemame`, `password`, `created`, `ban`, `role`, `amail`) VALUES
(1, '1', '1', NULL, NULL, 2, ''),
(2, 'Коля', 'c7f1734f2e', 1392117140, 0, 1, 'sadsa'),
(3, 'Коля', '39f51ab1ef', 1392117247, 0, 1, '-'),
(4, 'dsfds', 'a7f1bbc904', 1392117391, 0, 1, 'colya.fedoriv@mail.ru'),
(5, 'demo', 'demo', 1392286708, 0, 1, 'demo@'),
(6, 'demo1', 'e368b99387', 1392499062, 0, 1, 'colya.fedoriv@mail.ru');
--
-- Database: `yiicms`
--
CREATE DATABASE IF NOT EXISTS `yiicms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yiicms`;

-- --------------------------------------------------------

--
-- Table structure for table `cms_comment`
--

CREATE TABLE IF NOT EXISTS `cms_comment` (
  `id` int(11) NOT NULL,
  `content` text,
  `page_id` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `title`, `content`, `created`, `status`, `category_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_rozdili`
--

CREATE TABLE IF NOT EXISTS `cms_rozdili` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `position` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `cms_rozdili`
--

INSERT INTO `cms_rozdili` (`id`, `title`, `position`) VALUES
(1, 'sdf', 'top'),
(2, 'sdfs', 'top'),
(3, 'sdfdsf', 'top'),
(4, 'sdfsd', 'top'),
(5, 'fdsf', 'top'),
(6, 'sdf', 'top'),
(7, 'fdsf', 'top'),
(8, 'sdf', 'top'),
(9, 'sdfdsf', 'top'),
(10, 'dsfsdf', 'top'),
(11, 'sdfs', 'top');

-- --------------------------------------------------------

--
-- Table structure for table `cms_user`
--

CREATE TABLE IF NOT EXISTS `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usemame` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `ban` tinyint(1) DEFAULT NULL,
  `role` tinyint(1) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
