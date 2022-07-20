-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 02:23 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `vcs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `courseCode` varchar(50) NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `courseCode`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'Sample Comment 101', 'class101_a', 'james_foreman', 'claire_blake', '2022-07-07 16:25:07', 'no', 2),
(2, 'Test', 'class101_a', 'claire_blake', 'claire_blake', '2022-07-07 16:25:36', 'no', 2);

-- --------------------------------------------------------

--
-- Table structure for table `createclass`
--

CREATE TABLE `createclass` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `className` varchar(50) NOT NULL,
  `section` varchar(25) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `courseCode` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `num_posts` int(11) NOT NULL,
  `student_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `createclass`
--

INSERT INTO `createclass` (`id`, `username`, `className`, `section`, `subject`, `courseCode`, `date`, `num_posts`, `student_array`) VALUES
(1, 'claire_blake', 'Class101', 'A', 'SampleClassOnly', 'class101_a', '2022-07-07', 0, 'james_foreman ,');

-- --------------------------------------------------------

--
-- Table structure for table `joinclass`
--

CREATE TABLE `joinclass` (
  `user_id_fk` int(11) NOT NULL,
  `class_id_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joinclass`
--

INSERT INTO `joinclass` (`user_id_fk`, `class_id_fk`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opended` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opended`, `viewed`) VALUES
(1, 'james_foreman', 'claire_blake', 'Claire Blake posted on your class room', 'classRoom.php?classCode=class101_a#post_id=1', '2022-07-07 16:24:06', 'no', 'yes'),
(2, 'james_foreman', 'claire_blake', 'Claire Blake posted on your class room', 'classRoom.php?classCode=class101_a#post_id=2', '2022-07-07 16:24:29', 'no', 'yes'),
(3, 'claire_blake', 'james_foreman', 'James Foreman commented on your post', 'classRoom.php?classCode=class101_a#post_id=2&comment=1', '2022-07-07 16:25:07', 'no', 'yes'),
(4, 'james_foreman', 'claire_blake', 'Claire Blake commented on a post you commented on', 'classRoom.php?classCode=class101_a#post_id=2&comment=2', '2022-07-07 16:25:36', 'no', 'yes'),
(5, 'claire_blake', 'james_foreman', 'James Foreman posted on your class room', 'classRoom.php?classCode=class101_a#post_id=3', '2022-07-07 16:33:38', 'no', 'yes'),
(6, 'claire_blake', 'james_foreman', 'James Foreman posted on your class room', 'classRoom.php?classCode=class101_a#post_id=4', '2022-07-07 16:33:43', 'no', 'yes'),
(7, 'claire_blake', 'james_foreman', 'James Foreman posted on your class room', 'classRoom.php?classCode=class101_a#post_id=5', '2022-07-07 16:33:51', 'no', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `courseCode` varchar(50) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `edited` varchar(3) NOT NULL,
  `files` varchar(500) DEFAULT NULL,
  `fileDestination` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `courseCode`, `user_to`, `date_added`, `user_closed`, `edited`, `files`, `fileDestination`) VALUES
(1, 'Hello', 'claire_blake', 'class101_a', 'none', '2022-07-07 16:24:06', 'no', 'no', 'none', 'none'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet justo justo. Duis consectetur sapien quis sapien tempus pulvinar. Morbi imperdiet at ante ut pulvinar. Suspendisse sed tellus in risus scelerisque placerat nec mollis tellus. Pellentesque mattis, mauris at fringilla tincidunt, turpis diam cursus erat, sed venenatis justo justo eget est. In posuere ex orci, quis bibendum odio iaculis sit amet. Donec ultrices velit vitae sapien tempor, ut placerat magna venenatis. Pellentesque malesuada odio et dictum pellentesque. Nulla sed purus sit amet massa consectetur iaculis.', 'claire_blake', 'class101_a', 'none', '2022-07-07 16:24:29', 'no', 'no', 'none', 'none'),
(3, 'Sample 101', 'james_foreman', 'class101_a', 'claire_blake', '2022-07-07 16:33:38', 'no', 'no', 'none', 'none'),
(4, 'Sample 102', 'james_foreman', 'class101_a', 'claire_blake', '2022-07-07 16:33:43', 'no', 'no', 'none', 'none'),
(5, 'Sample 103', 'james_foreman', 'class101_a', 'claire_blake', '2022-07-07 16:33:51', 'no', 'no', 'none', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profilePic` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `phoneNumber` int(50) NOT NULL,
  `bio` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `profilePic`, `signup_date`, `user_closed`, `num_posts`, `phoneNumber`, `bio`) VALUES
(1, 'Claire', 'Blake', 'claire_blake', 'cblake@mail.com', '4744ddea876b11dcb1d169fadf494418', 'assets/images/profilePics/claire_blake6e5f1415ada13ee653fbec47341b42fan.jpeg', '2022-07-06', 'no', 0, 2147483647, 'Sampole only'),
(2, 'James', 'Foreman', 'james_foreman', 'jforeman@mail.com', 'd5066b535a749eb91090b9e820ddbc9a', 'assets/images/profilePics/deafultPP.png', '2022-07-06', 'no', 0, 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `createclass`
--
ALTER TABLE `createclass`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joinclass`
--
ALTER TABLE `joinclass`
  ADD PRIMARY KEY (`user_id_fk`,`class_id_fk`),
  ADD KEY `user_id_fk` (`user_id_fk`),
  ADD KEY `class_id_fk` (`class_id_fk`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `createclass`
--
ALTER TABLE `createclass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;
