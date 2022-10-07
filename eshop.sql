-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.27 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for eshop
CREATE DATABASE IF NOT EXISTS `eshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eshop`;

-- Dumping structure for table eshop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table eshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(550) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `imgName` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table eshop.register
CREATE TABLE IF NOT EXISTS `register` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `status` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `register` (`id`, `fname`, `lname`, `email`, `mobile`, `password`, `address`, `city`, `state`, `zip`, `status`) VALUES (1, 'admin', 'root', 'admin@root.com', '1234567890', 'root', '123 Main st', 'abc', 'xyz', '123', 'Y');

INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (1, 'Bibliophile', 'The ultimate gift for book lovers, this volume brims with literary treasures, all delightfully illustrated by beloved artist and founder of Ideal Bookshelf, Jane Mount. Book lovers, rejoice! In this love letter to all things bookish, Jane Mount brings literary people, places, and things to life through her signature and vibrant illustrations.', 'art-1', 'art', 20.85);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (2, 'Between The Lines', 'Delilah is a bit of a loner who prefers spending her time in the school library with her head in a book—one book in particular. Between the Lines may be a fairy tale, but it feels real. Prince Oliver is brave, adventurous, and loving. He really speaks to Delilah.', 'art-2', 'art', 33.26);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (3, 'Life of Picasso', 'The beautifully illustrated fourth volume of Picasso’s life—set in France and Spain during the Spanish Civil War and World War II—covers friendships with the surrealist painters; artistic inspiration around Guernica and the Minotaur; and his muses Marie-Thérèse, Dora Maar, and Françoise Gilot; and much more.', 'art-3', 'art', 35);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (4, 'The Golden Hrs', 'From the author of The Deep & Dark Blue comes a tender graphic novel, perfect for our time, that gently explores themes of self-discovery, friendship, healing from tragedy, and hope for a better tomorrow.', 'art-4', 'art', 11.99);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (5, 'You\'ll Be The Death Of Me', 'From the author of One of Us Is Lying comes a brand-new pulse-pounding thriller. It\'s Ferris Bueller\'s Day Off with murder when three old friends relive an epic ditch day, and it goes horribly - and fatally - wrong.', 'mystery-1', 'mystery', 11.99);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (6, 'All Her Little Secrets', '“All Her Little Secrets is a brilliantly nuanced but powerhouse exploration of race, the legal system, and the crushing pressure of keeping secrets. Morris brings a vibrant and welcome new voice to the thriller space.”', 'mystery-2', 'mystery', 30.63);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (7, 'The Hidden', 'Following her acclaimed debut, Little Darlings, Melanie Golding’s newest folkloric suspense is a spine-tingling twist on Celtic mythology. For readers of Sophia Hannah, Tana French and Sabine Durrant.', 'mystery-3', 'mystery', 23.75);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (8, 'Year of the Reaper', '“I love the magic Lucier weaves through this dark yet hopeful tale. I devoured it in one sitting!”', 'mystery-4', 'mystery', 24.56);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (9, 'Corruptible', 'A provocative and revelatory look at what power is, who gets it, and what happens when they do, based on over 500 interviews with those who (for a while, at least) have had the upper hand—from the creator of the Power Corrupts podcast and Washington Post columnist Brian Klaas.', 'psychology-1', 'psychology', 35.2);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (10, 'The Least Of Us', 'From the New York Times bestselling author of Dreamland, a searing follow-up that explores the terrifying next stages of the opioid epidemic and the quiet yet ardent stories of community repair.', 'psychology-2', 'psychology', 37.62);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (11, 'The Runnig is a Kind of Dreamming', 'A powerful, breathtaking memoir about a young man\'s descent into madness, and how running saved his life.', 'psychology-3', 'psychology', 25);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (12, 'Dear Memory Victoria Chang', 'For poet Victoria Chang, memory “isn’t something that blooms, but something that bleeds internally.” It is willed, summoned, and dragged to the surface. The remembrances in this collection of letters are founded in the fragments of stories her mother shared reluctantly, and the silences of her father, who first would not and then could not share more.', 'psychology-4', 'psychology', 32.26);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (13, 'All Her Little  Secrets', '“All Her Little Secrets is a brilliantly nuanced but powerhouse exploration of race, the legal system, and the crushing pressure of keeping secrets. Morris brings a vibrant and welcome new voice to the thriller space.”', 'thriller-1', 'thriller', 30.63);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (14, 'These Silent Woods', 'A father and daughter living in the remote Appalachian mountains must reckon with the ghosts of their past in Kimi Cunningham Grant\'s These Silent Woods, a mesmerizing novel of suspense.', 'thriller-2', 'thriller', 36.72);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (15, 'Autopsy', 'In this relaunch of the electrifying, landmark #1 bestselling thriller series, chief medical examiner Dr. Kay Scarpetta hunts those responsible for two wildly divergent and chilling murders. ', 'thriller-3', 'thriller', 19.8);
INSERT INTO `products` (`id`, `title`, `description`, `imgName`, `category`, `price`) VALUES (16, 'Her Name is Knight', 'A smash debut novel from rising star Yasmin Angoe, Her Name Is Knight features an elite assassin heroine on a mission to topple a human trafficking ring and avenge her family.', 'thriller-4', 'thriller', 17.99);


-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
