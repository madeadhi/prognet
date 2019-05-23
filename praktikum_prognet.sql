/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.1.37-MariaDB : Database - db_paktikum_prognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_paktikum_prognet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_paktikum_prognet`;

/*Table structure for table `admin_notifications` */

DROP TABLE IF EXISTS `admin_notifications`;

CREATE TABLE `admin_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `admin_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_notifications` */

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`,`name`,`profile_image`,`phone`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','$2y$10$vIyJfdXLwmdCuA77kOBhCuVrDjUYWlz3dPdkGt6AVjEz.URN9TwYe','admin','aaa','085238269034','0iCuoDq8TcBIfH5mKHQhDS89xpN7DVr7PGNFWIDdyPmheHi2MHuHmxqaVLa0','2019-03-20 15:03:56','2019-03-20 15:03:56');

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('checkedout','notyet','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id`,`user_id`,`product_id`,`qty`,`created_at`,`updated_at`,`status`) values 
(25,2,26,1,'2019-05-21 14:00:19','2019-05-21 14:00:41','checkedout'),
(26,2,26,1,'2019-05-21 14:04:24','2019-05-21 14:04:33','checkedout'),
(27,2,26,1,'2019-05-21 14:06:21','2019-05-21 14:06:32','checkedout'),
(28,2,26,1,'2019-05-21 14:08:03','2019-05-21 14:12:44','checkedout'),
(29,2,25,1,'2019-05-21 14:13:45','2019-05-21 14:13:56','checkedout'),
(30,2,25,1,'2019-05-23 10:03:02','2019-05-23 10:03:58','checkedout'),
(31,2,25,1,'2019-05-23 10:06:30','2019-05-23 10:06:41','checkedout');

/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `couriers` */

insert  into `couriers`(`id`,`courier`,`created_at`,`updated_at`) values 
(3,'jne','2019-05-15 16:28:18','2019-05-15 16:28:18'),
(4,'pos','2019-05-15 16:28:22','2019-05-15 16:28:22'),
(5,'tiki','2019-05-15 16:28:27','2019-05-15 16:28:27');

/*Table structure for table `discounts` */

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `discounts` */

insert  into `discounts`(`id`,`id_product`,`percentage`,`start`,`end`,`created_at`,`updated_at`) values 
(1,25,50,'2019-05-10','2019-05-23','2019-05-20 10:29:30','2019-05-20 10:29:33'),
(2,24,20,'2019-05-13','2019-05-22','2019-05-14 12:02:58','2019-05-14 12:03:00'),
(4,26,100,'2019-05-13','2019-05-22','2019-05-14 12:02:58','2019-05-14 12:03:00'),
(5,25,10,'2019-05-10','2019-05-23','2019-05-20 10:29:30','2019-05-20 10:29:36');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_02_15_123603_create_admins_table',1),
(4,'2019_02_15_123744_create_sellers_table',1),
(5,'2019_02_15_125445_create_products_table',1),
(6,'2019_02_15_130341_create_product_images_table',1),
(7,'2019_02_15_131114_create_transactions_table',1),
(8,'2019_02_15_131132_create_transaction_details_table',1),
(9,'2019_02_15_132352_create_product_categories_table',1),
(10,'2019_02_15_132701_create_carts_table',1),
(11,'2019_02_15_134220_create_wishlists_table',1),
(12,'2019_02_16_044815_create_rates_table',1),
(13,'2019_02_16_045411_create_product_reviews_table',1),
(14,'2019_02_16_062504_create_qna_products_table',1),
(15,'2019_02_16_063238_create_shopping_voucers_table',1),
(16,'2019_02_16_064643_create_couriers_table',1),
(17,'2019_02_16_102028_create_notifications_table',1),
(18,'2019_02_16_103007_create_seller_notifications_table',1),
(19,'2019_02_16_103024_create_user_notifications_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_categories` */

insert  into `product_categories`(`id`,`category_name`,`created_at`,`updated_at`) values 
(23,'Bedroom','2019-05-10 17:15:34','2019-05-10 17:15:34'),
(24,'Stools','2019-05-10 17:26:27','2019-05-10 17:26:27'),
(25,'Cabinets','2019-05-10 17:26:40','2019-05-10 17:26:40'),
(26,'Lamps','2019-05-10 17:26:52','2019-05-10 17:26:52'),
(27,'Office Chairs','2019-05-10 17:27:06','2019-05-10 17:27:06'),
(28,'Beds','2019-05-10 17:27:18','2019-05-10 17:27:18');

/*Table structure for table `product_category_details` */

DROP TABLE IF EXISTS `product_category_details`;

CREATE TABLE `product_category_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_category_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

/*Data for the table `product_category_details` */

insert  into `product_category_details`(`id`,`product_id`,`category_id`,`created_at`,`updated_at`) values 
(40,24,23,'2019-05-11 01:06:06','2019-05-11 01:06:06'),
(41,25,26,'2019-05-11 01:09:39','2019-05-11 01:09:39'),
(42,25,28,'2019-05-11 01:09:39','2019-05-11 01:09:39'),
(43,26,25,'2019-05-11 01:13:40','2019-05-11 01:13:40'),
(44,27,24,'2019-05-11 01:15:41','2019-05-11 01:15:41'),
(45,27,27,'2019-05-11 01:15:41','2019-05-11 01:15:41'),
(46,28,24,'2019-05-11 01:44:16','2019-05-11 01:44:16'),
(47,28,27,'2019-05-11 01:44:16','2019-05-11 01:44:16');

/*Table structure for table `product_images` */

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_images` */

insert  into `product_images`(`id`,`product_id`,`image_name`,`created_at`,`updated_at`) values 
(58,24,'images/product/24/product1-1.jpg','2019-05-11 01:06:06','2019-05-11 01:06:06'),
(59,25,'images/product/25/product2-1.jpg','2019-05-11 01:09:39','2019-05-11 01:09:39'),
(60,26,'images/product/26/product3-1.jpg','2019-05-11 01:13:40','2019-05-11 01:13:40'),
(61,27,'images/product/27/product4-1.jpg','2019-05-11 01:15:41','2019-05-11 01:15:41'),
(62,28,'images/product/28/product12-1.jpg','2019-05-11 01:44:16','2019-05-11 01:44:16'),
(63,28,'images/product/28/product14-1.jpg','2019-05-11 01:44:16','2019-05-11 01:44:16'),
(64,28,'images/product/28/product16-1.jpg','2019-05-11 01:44:16','2019-05-11 01:44:16');

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `rate` int(1) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `rate_id` (`rate`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `product_reviews_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_rate` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`product_name`,`price`,`description`,`product_rate`,`created_at`,`updated_at`,`stock`,`weight`) values 
(24,'Lampu Biasa',100000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.',NULL,'2019-05-11 01:06:06','2019-05-11 01:06:06',1,1),
(25,'Bedside Lamp',400000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.',NULL,'2019-05-11 01:09:39','2019-05-11 01:09:39',10,4),
(26,'Wooden Closet',300000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.',NULL,'2019-05-11 01:13:40','2019-05-11 01:13:40',2,16),
(27,'Monero Chair',59000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.',NULL,'2019-05-11 01:15:41','2019-05-11 01:15:41',5,2),
(28,'Kursi Kayu',75000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, diam non iaculis finibus, ipsum arcu sollicitudin dolor, ut cursus sapien sem sed purus. Donec vitae fringilla tortor, sed fermentum nunc. Suspendisse sodales turpis dolor, at rutrum dolor tristique id. Quisque pellentesque ullamcorper felis, eget gravida mi elementum a. Maecenas consectetur volutpat ante, sit amet molestie urna luctus in. Nulla eget dolor semper urna malesuada dictum. Duis eleifend pellentesque dui et finibus. Pellentesque dapibus dignissim augue. Etiam odio est, sodales ac aliquam id, iaculis eget lacus. Aenean porta, ante vitae suscipit pulvinar, purus dui interdum tellus, sed dapibus mi mauris vitae tellus.',NULL,'2019-05-11 01:44:16','2019-05-11 01:44:16',5,4);

/*Table structure for table `response` */

DROP TABLE IF EXISTS `response`;

CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `response` */

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(3) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_transaction` (`transaction_id`),
  KEY `id_product` (`product_id`),
  CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

insert  into `transaction_details`(`id`,`transaction_id`,`product_id`,`qty`,`discount`,`selling_price`,`created_at`,`updated_at`) values 
(37,36,25,1,10,400000,'2019-05-21 14:13:56','2019-05-21 14:13:56'),
(38,41,25,1,10,400000,'2019-05-23 10:03:58','2019-05-23 10:03:58'),
(39,42,25,1,10,400000,'2019-05-23 10:06:41','2019-05-23 10:06:41');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeout` datetime NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(12,2) NOT NULL,
  `shipping_cost` double(12,2) NOT NULL,
  `sub_total` double(12,2) NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `proof_of_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('unverified','verified','delivered','success','expired','canceled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transactions` */

insert  into `transactions`(`id`,`timeout`,`address`,`regency`,`province`,`total`,`shipping_cost`,`sub_total`,`user_id`,`courier_id`,`proof_of_payment`,`created_at`,`updated_at`,`status`,`service`) values 
(36,'2019-05-23 14:13:56','cengiling','Bangka','Bangka Belitung',266000.00,46000.00,200000.00,2,3,NULL,'2019-05-21 14:13:56','2019-05-21 18:27:27','canceled','OKE'),
(37,'2019-05-23 14:13:56','cengiling','Bangka','Bangka Belitung',266000.00,46000.00,200000.00,2,3,NULL,'2019-05-21 14:13:56','2019-05-21 18:17:02','canceled','OKE'),
(38,'2019-05-23 14:13:56','cengiling','Bangka','Bangka Belitung',266000.00,46000.00,200000.00,2,3,NULL,'2019-05-21 14:13:56','2019-05-21 14:13:56','canceled','OKE'),
(39,'2019-05-23 14:13:56','cengiling','Bangka','Bangka Belitung',266000.00,46000.00,200000.00,2,3,NULL,'2019-05-21 14:13:56','2019-05-21 18:25:38','canceled','OKE'),
(40,'2019-05-23 14:13:56','cengiling','Bangka','Bangka Belitung',266000.00,46000.00,200000.00,2,3,NULL,'2019-05-21 14:13:56','2019-05-21 18:23:48','canceled','OKE'),
(41,'2019-05-25 10:03:58','cengiling','Badung','Bali',406000.00,6000.00,400000.00,2,3,NULL,'2019-05-23 10:03:58','2019-05-23 10:04:10','canceled','CTC'),
(42,'2019-05-25 10:06:41','cengiling','Bengkulu','Bengkulu',445000.00,45000.00,400000.00,2,3,NULL,'2019-05-23 10:06:41','2019-05-23 10:06:41','unverified','OKE');

/*Table structure for table `user_notifications` */

DROP TABLE IF EXISTS `user_notifications`;

CREATE TABLE `user_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(11) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifiable_id` (`notifiable_id`),
  CONSTRAINT `user_notifications_ibfk_1` FOREIGN KEY (`notifiable_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_notifications` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aa',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aa',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`profile_image`,`status`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','admin@gmail.com','aa','aa',NULL,'$2y$10$vu84z1CG3IbKaQs/8KdaIea3dix7wNk9BNrpsqQbLCCJeZfhpyxC2','J1UVRtxKJmqiRgxOaEm4RN5HU18X4uEgPoIlTzsVIJ2qR5ltZPLgKpFns8nm','2019-03-20 13:04:57','2019-03-20 13:04:57'),
(2,'admin','user@gmail.com','images/profile_user/5.jpg','Administrator',NULL,'$2y$10$QWUzM7nI6WRBvgsy.HO5JefXKdV6EXTDg0CWenMskDVFrsevZub.y','kU1E8a88CAlric1zTA6xiozLxDvUGC0llVODMQigTqq0LjeHxStFaf30EYGQ','2019-03-20 13:57:01','2019-03-20 13:57:01'),
(3,'','','aa','aa',NULL,'',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
