-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 20, 2012 at 01:05 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.3-1ubuntu9.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_ejfs1g10`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE IF NOT EXISTS `Book` (
  `id` int(11) NOT NULL DEFAULT '0',
  `title` text NOT NULL,
  `author` text NOT NULL,
  `type` text NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`id`, `title`, `author`, `type`, `quantity`) VALUES
(1, 'All That I Am', 'Anna Funder', 'fiction', 2),
(2, 'August', 'Bernard Beckett', 'fiction', 2),
(3, 'Autumn Laing', 'Alex Miller', 'fiction', 2),
(4, 'Before I Go to Sleep', 'S J Watson', 'fiction', 2),
(5, 'Bereft', 'Chris Womersley', 'fiction', 2),
(6, 'Black Jesus', 'Simone Felice', 'fiction', 2),
(7, 'Catch - 22', 'Joseph Heller', 'fiction', 2),
(8, 'Delirium', 'Lauren Oliver', 'fiction', 2),
(9, 'Five Bells', 'Gail Jones', 'fiction', 2),
(10, 'Great Expectations', 'Charles Dickens', 'fiction', 2),
(11, 'Indelible Ink', 'Fiona McGregor', 'fiction', 2),
(12, 'Middlesex', 'Jeffrey Eugenides', 'fiction', 2),
(13, 'On Canaan''s Side', 'Sebastian Barry', 'fiction', 2),
(14, 'Please Look After Mother', 'Kyung-Sook Shin', 'fiction', 2),
(15, 'Sarah Thornhill', 'Kate Grenville', 'fiction', 2),
(16, 'Sister', 'Rosamund Lupton', 'fiction', 2),
(17, 'Snowdrops', 'Andrew Miller', 'fiction', 2),
(18, 'State of Wonder', 'Ann Patchett', 'fiction', 2),
(19, 'The Boundary', 'Nicole Watson', 'fiction', 2),
(20, 'The Cat''s Table', 'Michael Ondaatje', 'fiction', 2),
(21, 'The Chase', 'Christopher Kremmer', 'fiction', 2),
(22, 'The Fix', 'Nick Earls', 'fiction', 2),
(23, 'The Hand That First Held Mine', 'Maggie O?Farrell', 'fiction', 2),
(24, 'The Hidden Child', 'Camilla Lackberg', 'fiction', 2),
(25, 'The Language of Flowers', 'Vanessa Diffenbaugh', 'fiction', 2),
(26, 'The Ottoman Motel', 'Christopher Currie', 'fiction', 2),
(27, 'The Paris Wife', 'Paula McLain', 'fiction', 2),
(28, 'The Pile of Stuff at the Bottom of the Stairs', 'Christina Hopkinson', 'fiction', 2),
(29, 'The Stranger''s Child', 'Alan Hollinghurst', 'fiction', 2),
(30, 'To Be Sung Underwater', 'Tom McNeal', 'fiction', 2),
(31, 'Bligh : Master Mariner', 'Rob Mundle', 'non-fiction', 2),
(32, 'Cocktail Hour Under the Tree of Forgetfulness', 'Alexandra Fuller', 'non-fiction', 2),
(33, 'Hamlet?s Blackberry', 'William Powers', 'non-fiction', 2),
(34, 'Her Father?s Daughter', 'Alice Pung', 'non-fiction', 2),
(35, 'Kinglake - 350', 'Adrian Hyland', 'non-fiction', 2),
(36, 'Life', 'Keith Richards', 'non-fiction', 2),
(37, 'Notebooks', 'Betty Churcher', 'non-fiction', 2),
(38, 'The Alice Behind Wonderland', 'Simon Winchester', 'non-fiction', 2),
(39, 'The Hare with the Amber Eyes', 'Edmund de Waal', 'non-fiction', 2),
(40, 'The Psychopath Test', 'Jon Ronson', 'non-fiction', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `BookLoan`
--
CREATE TABLE IF NOT EXISTS `BookLoan` (
`loanid` int(11)
,`id` int(11)
,`title` text
,`author` text
,`type` text
,`readerid` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `BookReservation`
--
CREATE TABLE IF NOT EXISTS `BookReservation` (
`reservationid` int(11)
,`id` int(11)
,`title` text
,`author` text
,`type` text
,`readerid` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `Loan`
--

CREATE TABLE IF NOT EXISTS `Loan` (
  `loanid` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `readerid` int(11) NOT NULL,
  PRIMARY KEY (`loanid`),
  KEY `bookid` (`bookid`),
  KEY `readerid` (`readerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `Loan`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `LoanAndReservation`
--
CREATE TABLE IF NOT EXISTS `LoanAndReservation` (
`loanid` int(11)
,`bookid` int(11)
,`readerid` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `Reader`
--

CREATE TABLE IF NOT EXISTS `Reader` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `booklimit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reader`
--

INSERT INTO `Reader` (`id`, `name`, `booklimit`) VALUES
(1, 'Dick Dastardly', 3),
(2, 'Professor Pat Pending', 3),
(3, 'Penelope Pitstop', 4),
(4, 'Sergeant Blast', 2),
(5, 'Private Meekly', 2),
(6, 'Peter Perfect', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE IF NOT EXISTS `Reservation` (
  `reservationid` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `readerid` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`reservationid`),
  KEY `bookid` (`bookid`),
  KEY `readerid` (`readerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `Reservation`
--


-- --------------------------------------------------------

--
-- Structure for view `BookLoan`
--
DROP TABLE IF EXISTS `BookLoan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ejfs1g10`@`localhost` SQL SECURITY DEFINER VIEW `BookLoan` AS select `Loan`.`loanid` AS `loanid`,`Book`.`id` AS `id`,`Book`.`title` AS `title`,`Book`.`author` AS `author`,`Book`.`type` AS `type`,`Loan`.`readerid` AS `readerid` from (`Book` join `Loan` on((`Loan`.`bookid` = `Book`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `BookReservation`
--
DROP TABLE IF EXISTS `BookReservation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ejfs1g10`@`localhost` SQL SECURITY DEFINER VIEW `BookReservation` AS select `Reservation`.`reservationid` AS `reservationid`,`Book`.`id` AS `id`,`Book`.`title` AS `title`,`Book`.`author` AS `author`,`Book`.`type` AS `type`,`Reservation`.`readerid` AS `readerid` from (`Book` join `Reservation` on((`Reservation`.`bookid` = `Book`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `LoanAndReservation`
--
DROP TABLE IF EXISTS `LoanAndReservation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ejfs1g10`@`localhost` SQL SECURITY DEFINER VIEW `LoanAndReservation` AS select `Loan`.`loanid` AS `loanid`,`Loan`.`bookid` AS `bookid`,`Loan`.`readerid` AS `readerid` from `Loan` union select `Reservation`.`reservationid` AS `reservationid`,`Reservation`.`bookid` AS `bookid`,`Reservation`.`readerid` AS `readerid` from `Reservation`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Loan`
--
ALTER TABLE `Loan`
  ADD CONSTRAINT `Loan_ibfk_7` FOREIGN KEY (`bookid`) REFERENCES `Book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Loan_ibfk_8` FOREIGN KEY (`readerid`) REFERENCES `Reader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_3` FOREIGN KEY (`bookid`) REFERENCES `Book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Reservation_ibfk_4` FOREIGN KEY (`readerid`) REFERENCES `Reader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `BookExists`(b_id INT, OUT result INT)
BEGIN
        SELECT count(*)
        INTO result
        FROM Book
        WHERE id=b_id;
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `Borrow`(r_id INT, b_id INT)
BEGIN
        DECLARE top INT;

        CALL ReaderExists(r_id, @r_e);
        CALL BookExists(b_id, @b_e);
        CALL HasLoan(r_id, b_id, @l_e);
        CALL HasReservation(r_id, b_id, @hasres);
        CALL IsFree(b_id, @free);
        CALL CheckLimit(r_id, @lim);

        SELECT IsTopReservation(r_id, b_id)
        INTO top;

        IF @r_e <= 0 THEN
            SELECT "Reader does not exist";
        ELSEIF @b_e <= 0 THEN
            SELECT "Book does not exist";
        ELSEIF @l_e > 0 THEN
            SELECT "User already has a loan for this book";
        ELSEIF @lim <= 0 THEN
            SELECT "User has reached limit";
        ELSEIF @free > 0 OR top > 0 THEN
            START TRANSACTION;

            
            INSERT INTO Loan
            (bookid, readerid)
            VALUES (b_id, r_id);

            
            DELETE FROM Reservation
            WHERE readerid = r_id AND bookid = b_id;

            SELECT "Book loaned";
            COMMIT;
        ELSEIF @hasres > 0 THEN
            SELECT "User already has a reservation for this book";
        ELSE
            
            INSERT INTO Reservation
            (bookid, readerid, timestamp)
            VALUES (b_id, r_id, Now());

            SELECT "Book Reserved";
        END IF;
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `CheckLimit`(r_id INT, OUT result INT)
BEGIN

declare n INT;
declare lim INT; 

SELECT Count(*) INTO n FROM LoanAndReservation WHERE readerid = r_id;
SELECT booklimit INTO lim FROM Reader WHERE Reader.id = r_id;

set result = lim - n;

END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `CheckReservations`(r_id INT)
BEGIN
    
        CALL ReaderExists(r_id, @e);

        IF @e > 0 THEN
    
            SELECT id, title, author, type
            FROM BookReservation
            WHERE IsTopReservation(r_id, BookReservation.id) > 0
            GROUP BY id;
    
        ELSE
    
            SELECT "Reader does not exist";
    
        END IF; 
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `HasLoan`(r_id INT, b_id INT, OUT result INT)
BEGIN
    
        CALL ReaderExists(r_id, @r_e);
        CALL BookExists(b_id, @b_e); 

        IF @r_e <= 0 THEN
    
            SELECT "Reader does not exist";
    
        ELSEIF @b_e <= 0 THEN
    
            SELECT "Book does not exist";
    
        ELSE    
    
            SELECT Count(*)
            INTO result
            FROM Loan
            WHERE readerid = r_id AND bookid = b_id;
    
        END IF; 
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `HasLoanOrReservation`(r_id INT, b_id INT, OUT result INT)
BEGIN
    
        CALL ReaderExists(r_id, @r_e);
        CALL BookExists(b_id, @b_e); 

        IF @r_e <= 0 THEN
    
            SELECT "Reader does not exist";
    
        ELSEIF @b_e <= 0 THEN
    
            SELECT "Book does not exist";
    
        ELSE

            CALL HasLoan(r_id, b_id, @l_e);
            CALL HasReservation(r_id, b_id, @r_e);

            SET result = @l_e + @r_e;
    
        END IF; 
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `HasReservation`(r_id INT, b_id INT, OUT result INT)
BEGIN
    
        CALL ReaderExists(r_id, @r_e);
        CALL BookExists(b_id, @b_e); 

        IF @r_e <= 0 THEN
    
            SELECT "Reader does not exist";
    
        ELSEIF @b_e <= 0 THEN
    
            SELECT "Book does not exist";
    
        ELSE    
    
            SELECT Count(*)
            INTO result
            FROM Reservation
            WHERE readerid = r_id AND bookid = b_id;
    
        END IF; 
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `IsFree`(b_id INT, OUT result INT)
BEGIN
        DECLARE loans INT;
        DECLARE reservations INT;
        DECLARE copies INT;

        SELECT count(*)
        INTO loans
        FROM Loan
        WHERE bookid=b_id;

        SELECT count(*) 
        INTO reservations
        FROM Reservation
        WHERE bookid=b_id;

        SELECT quantity 
        INTO copies 
        FROM Book
        WHERE id=b_id;

        SET result = copies - (reservations + loans);
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `IsReserved`(b_id INT, OUT result INT)
BEGIN
        SELECT count(*) 
        INTO result
        FROM Reservation
        WHERE bookid=b_id;
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `ListLoans`(r_id INT)
BEGIN
    
        CALL ReaderExists(r_id, @e);

        IF @e > 0 THEN
            
            SELECT id, title, author, type
            FROM BookLoan
            WHERE readerid=r_id;
         
        ELSE

            SELECT "Reader does not exist";

        END IF;
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `ListReservations`(r_id INT)
BEGIN
    
    CALL ReaderExists(r_id, @e);

    IF @e > 0 THEN
 
        SELECT id, title, author, type
        FROM BookReservation
        WHERE readerid=r_id;
                                
    ELSE
                                
        SELECT "Reader does not exist";

    END IF; 

END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `ReaderExists`(r_id INT, OUT result INT)
BEGIN
        SELECT count(*)
        INTO result
        FROM Reader
        WHERE id=r_id;
END$$

CREATE DEFINER=`ejfs1g10`@`localhost` PROCEDURE `ReturnBook`(r_id INT, b_id INT)
BEGIN
    
        CALL ReaderExists(r_id, @r_e);
        CALL BookExists(b_id, @b_e); 
        CALL HasLoan(r_id, b_id, @l_e);

        IF @r_e <= 0 THEN
    
            SELECT "Reader does not exist";
    
        ELSEIF @b_e <= 0 THEN
    
            SELECT "Book does not exist";
    
        ELSEIF @l_e <= 0 THEN
    
            SELECT "User doesn't have a loan for this book";
    
        ELSE 
    
            
            DELETE FROM Loan 
            WHERE readerid = r_id AND bookid = b_id;

            SELECT "Book Returned";

        END IF; 
END$$

--
-- Functions
--
CREATE DEFINER=`ejfs1g10`@`localhost` FUNCTION `IsTopReservation`(r_id INT, b_id INT) RETURNS int(11)
BEGIN
        DECLARE loans INT;
        DECLARE copies INT; 
    
        CALL ReaderExists(r_id, @r_e);
        CALL BookExists(b_id, @b_e);

        IF @r_e = 0 THEN
            RETURN (-1);
        ELSEIF @b_e = 0 THEN
            RETURN (-1);
        ELSE
            SELECT Count(*) INTO loans FROM Loan WHERE Loan.bookid = b_id;
            SELECT quantity INTO copies FROM Book WHERE Book.id = b_id;

            SET @n = 0; 
            RETURN (
                SELECT Count(*)
                FROM
                    (SELECT readerid
                     FROM Reservation
                     WHERE Reservation.bookid = b_id
                     AND (@n := @n + 1) BETWEEN 0 and (copies - loans)
                     ORDER BY timestamp ASC 
                    )
                AS TopReservations
                WHERE readerid = r_id 
            );
        END IF;
END$$

DELIMITER ;
