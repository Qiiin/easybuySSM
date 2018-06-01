/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.20-log : Database - easybuyssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`easybuyssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `easybuyssm`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `parentId` int(10) NOT NULL COMMENT '父级分类的id',
  `level` int(10) DEFAULT NULL COMMENT '1一级分类，2二级分类，3三级分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`parentId`,`level`) values (1,'数码影音',0,1),(2,'美食',0,1),(10,'手机',1,2),(11,'电脑',1,2),(12,'音箱',1,2),(13,'耳机',1,2),(22,'图书',0,1),(23,'笔记本电脑',11,3),(24,'平板电脑',11,3),(30,'经管励志',22,2),(31,'文学小说',22,2),(33,'生活艺术',22,2),(34,'历史社科',22,2),(35,'台式电脑',11,3),(36,'家居用品',0,1),(37,'家具',36,2),(38,'床上用品',36,2),(39,'酒',2,2),(40,'茶',2,2),(41,'生鲜',2,2);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`createTime`,`type`) values (1,'五一','五一优惠','2018-05-01 22:31:32','特惠'),(2,'六一','六一童装优惠','2018-05-01 22:32:02','特惠'),(3,'泳装大优惠','游泳健身了解一下','2018-05-01 22:33:20','公告'),(4,'夏装来袭','夏装新品上市','2018-05-01 22:35:45','新品'),(5,'春装特惠','换季大优惠','2018-05-01 22:36:30','换季'),(6,'端午来袭','粽子是甜的还是咸的','2018-05-01 22:37:26','新品');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `userId` int(10) NOT NULL,
  `loginName` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cost` float(10,2) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1待审核，2审核通过，3配货中，4卖家已发货，5已收货',
  `payType` int(1) NOT NULL DEFAULT '1' COMMENT '支付方式，1支付宝，2微信，3银联，默认支付宝',
  `serialNumber` varchar(64) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `orderId` int(10) NOT NULL,
  `productId` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `name` varchar(20) NOT NULL,
  `describe` varchar(100) DEFAULT NULL,
  `price` float(10,2) NOT NULL,
  `stock` int(10) NOT NULL,
  `categoryLevel1Id` int(10) NOT NULL,
  `categoryLevel2Id` int(10) DEFAULT NULL,
  `categoryLevel3Id` int(10) DEFAULT NULL,
  `fileName` varchar(100) NOT NULL COMMENT '上传的文件名',
  `isDelete` int(10) DEFAULT NULL COMMENT '1为删除，0为未删除',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`describe`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete`,`createTime`) values (1,'imac','苹果台式电脑',5688.00,100,1,11,35,'34B81787D2AD4D1885BFFCDE48D4EC0E.png',0,'2018-04-30 23:02:11'),(13,'MacBook','苹果笔记本电脑',9888.00,1000,1,11,23,'E43CEC7231004EA485E35CF2D9A64224.png',NULL,'2018-04-30 22:59:16');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `loginName` varchar(20) NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `sex` int(1) DEFAULT '1' COMMENT '1为男，0为女，默认男',
  `phone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `identityCode` varchar(18) DEFAULT NULL,
  `type` int(1) DEFAULT '3' COMMENT '1为超级管理员，2为商家，3为用户',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`loginName`,`userName`,`password`,`sex`,`phone`,`email`,`identityCode`,`type`,`createTime`) values (1,'test','test','123456',1,'1','1','1',3,'2018-05-03 19:11:59');

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `userId` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `isDefault` int(1) NOT NULL COMMENT '1是，0不是',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_address` */

/*Table structure for table `user_type` */

DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
  `type` int(1) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_type` */

insert  into `user_type`(`type`,`typeName`) values (1,'管理员'),(2,'商户'),(3,'普通用户');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
