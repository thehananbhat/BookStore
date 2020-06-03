-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 26, 2021 at 08:14 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books-portal`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser` (IN `param_username` VARCHAR(255), IN `param_password` VARCHAR(255), IN `param_email` VARCHAR(255), IN `param_firstName` VARCHAR(255), IN `param_middleName` VARCHAR(255), IN `param_lastName` VARCHAR(255), IN `param_city` VARCHAR(255), IN `param_pincode` INT(11), IN `param_category` VARCHAR(255), IN `param_role` VARCHAR(255), IN `param_contact` VARCHAR(20), IN `param_isverified` VARCHAR(25), IN `param_date` DATE)  BEGIN
          INSERT INTO users(username,password,email,first_name,middle_name,last_name,city,pincode,user_category,role,is_verified,date)  VALUES(param_username,param_password,param_email,param_firstName,param_middleName,param_lastName,param_city,param_pincode,param_category,param_role,param_isverified,param_date);
            INSERT INTO contacts(username,contact_no) VALUES(param_username,param_contact);
       END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `username` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `edition` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `book_price` int(11) NOT NULL DEFAULT '0',
  `book_original_price` int(11) NOT NULL DEFAULT '0',
  `book_description` varchar(1000) DEFAULT 'No Description Available',
  `book_image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `book_status` varchar(255) NOT NULL DEFAULT 'available',
  `date` date NOT NULL DEFAULT '1920-05-20'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `username`, `book_name`, `author`, `edition`, `subject`, `category_id`, `book_price`, `book_original_price`, `book_description`, `book_image`, `book_status`, `date`) VALUES
(1, 'hanan', 'Kumbhojkar', 'Kumbhojkar', '6', 'Maths', 3, 250, 400, '90% of his book contains questions which have already appeared on previous years question papers. So it gives a wrong idea that question papers of Mumbai University are set from his book. ', 'kumbhojkar.jpg', 'available', '2020-08-02'),
(3, 'sumukha', 'Analysis of Algorithms', 'Sartaj Sahani', '5', 'AOA', 1, 275, 400, 'The first section of each of these chapters describes the design method. The remaining sections apply the method to solve real world applications. Allows students to compare the efficiency of the solution resulting from the design method and some other methods', 'aoa.jpg', 'unavailable', '2020-08-15'),
(4, 'hanan', 'Computer Architecture', 'WIlliam Stalling', '6', 'COA', 1, 499, 650, 'Four-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association, Computer Organization and Architecture: Designing for Performance provides a thorough discussion of the fundamentals of computer organization and architecture, covering not just processor design, but memory, I/O, and parallel systems.Coverage is supported by a wealth of concrete examples emphasizing modern systems', 'coa.jpg', 'available', '2020-08-25'),
(5, 'sumukha', 'JAVA,The Complete Reference', 'Herbert Schildt', '5', 'OOPM', 1, 550, 700, 'Fully updated for Java SE 8, Java: The Complete Reference, explains how to develop, compile, debug, and run Java programs. Bestselling programming author Herb Schildt covers the entire Java language, including its syntax, keywords, and fundamental programming principles, as well as significant portions of the Java API library. JavaBeans, servlets, applets, and Swing are examined and real-world examples demonstrate Java in action', 'java.jpg', 'available', '2020-09-08'),
(6, 'sumukha', 'Data Structures Using C', 'Reema Thareja', '5', 'DS', 1, 250, 300, 'Data Structures Using C has been developed to provide a comprehensive and consistent coverage of both the abstract concepts of data structures as well as the implementation of these concepts using C language. It begins with a thorough overview of the concepts of C programming followed by introduction of different data structures and methods to analyse the complexity of different algorithms. It then connects these concepts and applies them to the study of various data structures such as arrays, strings, linked lists, stacks, queues, trees, heaps, and graphs.', 'ds.jpg', 'unavailable', '2020-09-10'),
(7, 'sumukha', 'Computer Architecture', 'WIlliam Stalling', '6', 'COA', 6, 450, 650, 'Four-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association, Computer Organization and Architecture: Designing for Performance provides a thorough discussion of the fundamentals of computer organization and architecture, covering not just processor design, but memory, I/O, and parallel systems.Coverage is supported by a wealth of concrete examples emphasizing modern systems', 'coa.jpg', 'available', '2020-09-24'),
(8, 'hanan', 'Data Structures Using C', 'Reema Thareja', '5', 'DS', 2, 230, 300, 'Data Structures Using C has been developed to provide a comprehensive and consistent coverage of both the abstract concepts of data structures as well as the implementation of these concepts using C language. It begins with a thorough overview of the concepts of C programming followed by introduction of different data structures and methods to analyse the complexity of different algorithms. It then connects these concepts and applies them to the study of various data structures such as arrays, strings, linked lists, stacks, queues, trees, heaps, and graphs.', 'ds.jpg', 'available', '2020-09-28'),
(9, 'hanan', 'JAVA,The Complete Reference', 'Herbert Schildt', '5', 'OOPM', 2, 499, 700, 'Fully updated for Java SE 8, Java: The Complete Reference, explains how to develop, compile, debug, and run Java programs. Bestselling programming author Herb Schildt covers the entire Java language, including its syntax, keywords, and fundamental programming principles, as well as significant portions of the Java API library. JavaBeans, servlets, applets, and Swing are examined and real-world examples demonstrate Java in action', 'java.jpg', 'available', '2020-10-08'),
(11, 'hanan', 'Kumbhojkar', 'Kumbhojkar', '5', 'Maths', 2, 350, 400, '90% of his book contains questions which have already appeared on previous years question papers. So it gives a wrong idea that question papers of Mumbai University are set from his book. ', 'kumbhojkar.jpg', 'available', '2020-10-05'),
(12, 'sumukha', 'Computer Architecture', 'WIlliam Stalling', '6', 'COA', 3, 550, 650, 'Four-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association, Computer Organization and Architecture: Designing for Performance provides a thorough discussion of the fundamentals of computer organization and architecture, covering not just processor design, but memory, I/O, and parallel systems.Coverage is supported by a wealth of concrete examples emphasizing modern systems', 'coa.jpg', 'available', '2020-10-25'),
(13, 'sumukha', 'JAVA,The Complete Reference', 'Herbert Schildt', '5', 'OOPM', 3, 499, 700, 'Fully updated for Java SE 8, Java: The Complete Reference, explains how to develop, compile, debug, and run Java programs. Bestselling programming author Herb Schildt covers the entire Java language, including its syntax, keywords, and fundamental programming principles, as well as significant portions of the Java API library. JavaBeans, servlets, applets, and Swing are examined and real-world examples demonstrate Java in action', 'java.jpg', 'available', '2020-10-28'),
(14, 'hanan', 'Analysis of Algorithms', 'Sartaj Sahani', '5', 'AOA', 3, 250, 400, 'The first section of each of these chapters describes the design method. The remaining sections apply the method to solve real world applications. Allows students to compare the efficiency of the solution resulting from the design method and some other methods', 'aoa.jpg', 'available', '2020-10-04'),
(15, 'sumukha', 'Analysis of Algorithms', 'Sartaj Sahani', '5', 'AOA', 4, 300, 400, 'The first section of each of these chapters describes the design method. The remaining sections apply the method to solve real world applications. Allows students to compare the efficiency of the solution resulting from the design method and some other methods', 'aoa.jpg', 'available', '2020-10-11'),
(16, 'hanan', 'Computer Architecture', 'WIlliam Stalling', '6', 'COA', 4, 450, 650, 'Four-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association, Computer Organization and Architecture: Designing for Performance provides a thorough discussion of the fundamentals of computer organization and architecture, covering not just processor design, but memory, I/O, and parallel systems.Coverage is supported by a wealth of concrete examples emphasizing modern systems', 'coa.jpg', 'available', '2020-10-05'),
(17, 'hanan', 'Kumbhojkar', 'Kumbhojkar', '5', 'Maths', 4, 325, 400, '90% of his book contains questions which have already appeared on previous years question papers. So it gives a wrong idea that question papers of Mumbai University are set from his book. ', 'kumbhojkar.jpg', 'available', '2020-08-05'),
(18, 'sumukha', 'Data Structures Using C', 'Reema Thareja', '5', 'DS', 4, 150, 300, 'Data Structures Using C has been developed to provide a comprehensive and consistent coverage of both the abstract concepts of data structures as well as the implementation of these concepts using C language. It begins with a thorough overview of the concepts of C programming followed by introduction of different data structures and methods to analyse the complexity of different algorithms. It then connects these concepts and applies them to the study of various data structures such as arrays, strings, linked lists, stacks, queues, trees, heaps, and graphs.', 'ds.jpg', 'available', '2020-10-10'),
(20, 'hanan', 'Fundamental of Heat and Mass Transfer', 'Bergemann', '7', 'Fundamental of Heat and Mass Transfer', 2, 395, 550, 'Fundamentals of Heat and Mass Transfer is the gold standard of heat transfer pedagogy for more than 30 years, with a commitment to continuous improvement by four authors having more than 150 years of combined experience in heat transfer education, research and practice. Using a rigorous and systematic problem-solving methodology pioneered by this text, it is abundantly filled with examples and problems that reveal the richness and beauty of the discipline. ', 'fohmt.jpg', 'available', '2020-11-01'),
(22, 'sumukha', 'Theory of Automata', 'Rajeev Motwani', '7', 'Theory of Automata', 1, 399, 450, 'This classic book on formal languages, automata theory and computational complexity has been updated to present theoretical concepts in a concise and straightforward manner with the increase of hands-on, practical applications. This edition offers students a less formal writing style while providing the most accessible coverage of automata theory, solid treatment on constructing proofs, many figures and diagrams to help convey ideas and sidebars to highlight related material. Each chapter offers an abundance of exercises for hands-on learning.', 'Tcs.jpg', 'available', '2020-11-12'),
(23, 'sumukha', 'Theory of Machines', 'JK Gupta', '1', 'Theory of Machines', 2, 300, 400, 'A textbook of machine design is useful for students preparing for entrance exams like upsc engineering services exam, amie (india) examinations. It is also recommended for students studying btech, be, and other professional courses related to machine design. The book is systematic and is presented in clear and simple language.', 'Tom.jpg', 'available', '2020-11-05'),
(24, 'hanan', 'Mechanical Engineering Design', 'Keiss Nisbertt', '8', 'Mechanical Engineering Design', 2, 699, 800, 'A textbook of machine design is useful for students preparing for entrance exams like upsc engineering services exam, amie (india) examinations. It is also recommended for students studying btech, be, and other professional courses related to machine design. The book is systematic and is presented in clear and simple language.', 'Med.jpg', 'available', '2020-11-25'),
(25, 'hanan', 'Fundamental of Fluid Mechanics', 'Rothmayour', '7', 'Fundamental of Fluid Mechanics', 2, 130, 250, 'Fundamentals of Fluid Mechanics offers comprehensive topical coverage, with varied examples and problems, application of visual component of fluid mechanics, and strong focus on effective learning.Each important concept is introduced in easy–to–understand terms before more complicated examples are discussed.  Continuing this book?s tradition of extensive real–world applications, this latest edition includes more Fluid in the News case study boxes in each chapter, new problem types, an increased number of real–world photos, and additional videos to augment the text material and help generate interest in the topic.', 'fluid.jpg', 'available', '2020-09-22'),
(26, 'sumukha', 'Thermodynamics', 'RK Rajput', '3', 'Thermodynamics', 2, 500, 750, 'This book titled \"Basic Thermodynamics\" makes an attempt to cover the portions keeping in view of the syllabus for IIIrd semester B.E., Mechanical, prescribed by Visveswaraiah Technological University. This book can also be useful for students of other engineering disciplines like B.E. in Industrial production, Industrial Engineering management, Automobile, Diploma in Mechanical and IP, IEM and Automobile engineering, AMIE, etc. ', 'thermo.jpg', 'available', '2020-11-02'),
(28, 'hanan', 'Mechanical Engineering Design', 'Keiss Nisbertt', '10', 'Mechanical Engineering Design', 2, 699, 800, 'A textbook of machine design is useful for students preparing for entrance exams like upsc engineering services exam, amie (india) examinations. It is also recommended for students studying btech, be, and other professional courses related to machine design. The book is systematic and is presented in clear and simple language.', 'Med.jpg', 'available', '2020-10-29'),
(29, 'sumukha', 'Theory of Automata', 'Rajeev Motwani', '3', 'Theory of Automata', 1, 350, 450, 'This classic book on formal languages, automata theory and computational complexity has been updated to present theoretical concepts in a concise and straightforward manner with the increase of hands-on, practical applications. This edition offers students a less formal writing style while providing the most accessible coverage of automata theory, solid treatment on constructing proofs, many figures and diagrams to help convey ideas and sidebars to highlight related material. Each chapter offers an abundance of exercises for hands-on learning.', 'Tcs.jpg', 'available', '2020-12-10'),
(30, 'sumukha', 'Thermodynamics', '', '3', 'Thermodynamics', 3, 420, 72, 'no description', 'thermo.jpg', 'available', '2020-12-12'),
(31, 'sumukha', 'Mechanical Engineering Design', 'Keiss Nisbertt', '10', 'Mechanical Engineering Design', 3, 89, 195, 'A textbook of machine design is useful for students preparing for entrance exams like upsc engineering services exam, amie (india) examinations. It is also recommended for students studying btech, be, and other professional courses related to machine design. The book is systematic and is presented in clear and simple language.', 'Med.jpg', 'available', '2020-10-21'),
(32, 'hanan', 'Theory of Automata', 'Rajeev Motwani', '3', 'Theory of Automata', 4, 363, 450, 'This classic book on formal languages, automata theory and computational complexity has been updated to present theoretical concepts in a concise and straightforward manner with the increase of hands-on, practical applications. This edition offers students a less formal writing style while providing the most accessible coverage of automata theory, solid treatment on constructing proofs, many figures and diagrams to help convey ideas and sidebars to highlight related material. Each chapter offers an abundance of exercises for hands-on learning.', 'Tcs.jpg', 'available', '2020-11-25'),
(33, 'hanan', 'Theory of Machines', '', '1', 'Theory of Machines', 4, 306, 59, 'no description', 'Tom.jpg', 'available', '2020-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `username` varchar(255) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL,
  `transaction_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_category_id`) VALUES
(1, 'Computer Engineering', 0),
(2, 'Mechanical Engineering', 0),
(3, 'Civil Engineering', 0),
(4, 'Electrical Engineering', 0),
(5, 'EXTC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `username` varchar(255) NOT NULL,
  `contact_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`username`, `contact_no`) VALUES
('hanan', '7006232465'),
('admin', '7738878906'),
('sumukha', '8890022133');

-- ---------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Unseen',
  `buyer_name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `offer_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `username` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `ratings` int(11) NOT NULL DEFAULT '0',
  `review_content` varchar(255) NOT NULL DEFAULT 'No Review Content'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT 'noemail@noemail@noemail',
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL DEFAULT '-1',
  `user_category` varchar(255) NOT NULL DEFAULT 'FirstYear',
  `role` varchar(255) NOT NULL,
  `street_no` int(11) DEFAULT '-1',
  `area` varchar(255) DEFAULT NULL,
  `is_verified` varchar(25) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `first_name`, `middle_name`, `last_name`, `city`, `pincode`, `user_category`, `role`, `street_no`, `area`, `is_verified`, `date`) VALUES
('hanan', '1234', 'hanan@gmail.com', 'Mohammad', 'Hanan', 'Bhat', 'Srinagar', 190001, 'ThirdYear', 'user', 55, NULL,'true', '2020-09-02'),
('admin', '$2y$10$wqeYW8EoWKStg2QKx/HZb.SIznv0tHSBmNW7onSsF6HCo080y0iAe', 'bhathanan66@gmail.com', 'admin', 'admin', 'admin', 'Srinagar', 190001, 'Computer', 'admin', -1, NULL, 'true', '2020-10-16'),
('sumukha', '1234', 'sumukha@gmail.com', 'Sumukha', 'Kollegal', 'Raghu', 'Bombay', 560059, 'ThirdYear', 'user', 10, 'Vikhroli', 'true', '2020-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `email_id` varchar(255) NOT NULL,
  `code` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`username`,`book_id`),
  ADD KEY `fk_book_id_bookmark` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_books_username` (`username`),
  ADD KEY `book_price` (`book_price`),
  ADD KEY `book_name` (`book_name`),
  ADD KEY `book_image` (`book_image`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD KEY `fk_username_users` (`username`),
  ADD KEY `fk_book_name` (`book_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_no`),
  ADD KEY `fk_username_contacts` (`username`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_username_users` (`username`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`username`,`book_id`),
  ADD KEY `fk_book_id_reviews` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `fk_book_id_bookmark` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_username_bookmark` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_username_contacts` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_book_id_reviews` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_username_reviews` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;