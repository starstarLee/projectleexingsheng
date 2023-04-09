-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2023 at 05:47 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examsystemdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` varchar(100) NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `EMAIL_ADDRESS` varchar(40) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `PHONE` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ADMIN_ID`, `PASSWORD`, `EMAIL_ADDRESS`, `NAME`, `GENDER`, `PHONE`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'lshengxing@gmail.com', 'lol', 'male', '0178837487');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `EXAM_ID` int(11) NOT NULL,
  `START_TIME` datetime NOT NULL,
  `END_TIME` datetime NOT NULL,
  `SUBJECT_ID` varchar(10) NOT NULL,
  `TOTAL_QUESTIONS` int(11) NOT NULL,
  `MARKS_PER_CORRECT_ANSWER` int(11) NOT NULL,
  `MARKS_PER_WRONG_ANSWER` int(11) NOT NULL,
  `EXAM_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`EXAM_ID`, `START_TIME`, `END_TIME`, `SUBJECT_ID`, `TOTAL_QUESTIONS`, `MARKS_PER_CORRECT_ANSWER`, `MARKS_PER_WRONG_ANSWER`, `EXAM_NAME`) VALUES
(1, '2022-10-27 09:05:00', '2022-10-29 21:05:00', 'i18', 2, 20, 0, 'math');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `QUESTION_ID` int(11) NOT NULL,
  `EXAM_ID` int(11) NOT NULL,
  `QUESTION_TITLE` varchar(100) NOT NULL,
  `CORRECT_OPTION` enum('A','B','C','D') NOT NULL,
  `OPTIONA` varchar(100) NOT NULL,
  `OPTIONB` varchar(100) NOT NULL,
  `OPTIONC` varchar(100) NOT NULL,
  `OPTIOND` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QUESTION_ID`, `EXAM_ID`, `QUESTION_TITLE`, `CORRECT_OPTION`, `OPTIONA`, `OPTIONB`, `OPTIONC`, `OPTIOND`) VALUES
(1, 1, '2+2', 'A', '4', '5', '6', '7'),
(2, 1, '1+1', 'A', '2', '3', '4', '5');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `STUDENT_ID` varchar(100) NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `EMAIL_ADDRESS` varchar(40) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `PHONE` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`STUDENT_ID`, `PASSWORD`, `EMAIL_ADDRESS`, `NAME`, `GENDER`, `PHONE`) VALUES
('i18015291', '7afed1af73bbfd5523a0eaf747ecce83', 'lshengxing@gmail.com', 'Lee ', 'male', '0178837487'),
('i19016784', '7afed1af73bbfd5523a0eaf747ecce83', 'lshengxing@gmail.com', 'Lee Xing Sheng', 'male', '0172647486');

-- --------------------------------------------------------

--
-- Table structure for table `studentanswer`
--

CREATE TABLE `studentanswer` (
  `QUESTION_ID` int(11) NOT NULL,
  `SELECTED_OPTION` varchar(50) NOT NULL,
  `STUDENT_ID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studentexam`
--

CREATE TABLE `studentexam` (
  `STUDENT_ID` varchar(100) NOT NULL,
  `EXAM_ID` int(11) NOT NULL,
  `EXAM_RESULT` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `SUBJECT_ID` varchar(10) NOT NULL,
  `SUBJECT_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SUBJECT_ID`, `SUBJECT_NAME`) VALUES
('i18', 'math');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TEACHER_ID` varchar(100) NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `EMAIL_ADDRESS` varchar(40) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `PHONE` varchar(11) NOT NULL,
  `DEPARTMENT` varchar(11) NOT NULL,
  `EDUCATIONAL_LEVEL` enum('Professor','Master','Degree') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`TEACHER_ID`, `PASSWORD`, `EMAIL_ADDRESS`, `NAME`, `GENDER`, `PHONE`, `DEPARTMENT`, `EDUCATIONAL_LEVEL`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'lshengxing@gmail.com', 'lol', 'male', '0172647487', 'it', 'Professor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`),
  ADD UNIQUE KEY `ADMIN_ID` (`ADMIN_ID`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`EXAM_ID`),
  ADD UNIQUE KEY `EXAM_ID` (`EXAM_ID`),
  ADD KEY `SUBJECT_ID` (`SUBJECT_ID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QUESTION_ID`),
  ADD UNIQUE KEY `QUESTION_ID` (`QUESTION_ID`),
  ADD KEY `EXAM_ID` (`EXAM_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`STUDENT_ID`),
  ADD UNIQUE KEY `STUDENT_ID` (`STUDENT_ID`);

--
-- Indexes for table `studentanswer`
--
ALTER TABLE `studentanswer`
  ADD PRIMARY KEY (`STUDENT_ID`,`QUESTION_ID`),
  ADD KEY `QUESTION_ID` (`QUESTION_ID`);

--
-- Indexes for table `studentexam`
--
ALTER TABLE `studentexam`
  ADD PRIMARY KEY (`STUDENT_ID`,`EXAM_ID`),
  ADD KEY `EXAM_ID` (`EXAM_ID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SUBJECT_ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TEACHER_ID`),
  ADD UNIQUE KEY `TEACHER_ID` (`TEACHER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `EXAM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `QUESTION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`SUBJECT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`EXAM_ID`) REFERENCES `exam` (`EXAM_ID`) ON DELETE CASCADE;

--
-- Constraints for table `studentanswer`
--
ALTER TABLE `studentanswer`
  ADD CONSTRAINT `studentanswer_ibfk_1` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentanswer_ibfk_2` FOREIGN KEY (`QUESTION_ID`) REFERENCES `question` (`QUESTION_ID`) ON DELETE CASCADE;

--
-- Constraints for table `studentexam`
--
ALTER TABLE `studentexam`
  ADD CONSTRAINT `studentexam_ibfk_1` FOREIGN KEY (`EXAM_ID`) REFERENCES `exam` (`EXAM_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `studentexam_ibfk_2` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
