/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.17-log : Database - easybuyssm
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`parentId`,`level`) values (1,'数码影音',0,1),(2,'图书',0,1),(3,'美食',0,1),(4,'家居用品',0,1),(10,'手机通讯',1,2),(11,'电脑',1,2),(23,'笔记本电脑',11,3),(24,'平板电脑',11,3),(30,'经管励志',2,2),(31,'文学小说',2,2),(33,'生活艺术',2,2),(35,'台式电脑',11,3),(37,'家具',4,2),(38,'床上用品',4,2),(39,'酒',3,2),(40,'茶',3,2),(41,'生鲜',3,2),(42,'手机',10,3),(43,'手机配件',10,3),(44,'葡萄酒',39,3),(45,'洋酒',39,3),(46,'啤酒',39,3),(47,'红茶',40,3),(48,'绿茶',40,3),(49,'乌龙茶',40,3),(50,'花茶',40,3),(53,'海鲜',41,3),(54,'肉类',41,3),(55,'蔬果',41,3),(56,'投资理财',30,3),(57,'市场营销',30,3),(58,'经济学',30,3),(59,'散文',31,3),(60,'文学史',31,3),(61,'诗歌',31,3),(62,'推理小说',31,3),(63,'绘画',33,3),(64,'书法',33,3),(65,'摄影',33,3),(66,'音乐',33,3),(67,'客厅家具',37,3),(68,'卧室家具',37,3),(69,'户外家具',37,3),(70,'办公家具',37,3),(71,'浴室家具',37,3),(72,'床品件套',38,3),(73,'被子',38,3),(74,'凉席',38,3),(75,'蚊帐',38,3),(76,'抱枕靠垫',38,3),(77,'枕头枕芯',38,3),(78,'科学读物',2,2),(79,'心理学',78,3),(80,'逻辑学',78,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`userId`,`loginName`,`address`,`createTime`,`cost`,`status`,`payType`,`serialNumber`) values (1,1,'admin','福建省厦门市思明区何厝小学','2018-05-07 01:49:11',62468.00,6,1,'0F72F56D9E9A4FCD9336AB7D2E89DF7B'),(2,1,'admin','福建省厦门市思明区何厝小学','2018-05-07 01:14:24',69216.00,2,1,'857399B774214B95904D1B314FCB0252'),(3,1,'admin','福建省厦门市思明区何厝小学','2018-05-07 01:47:39',298520.00,2,1,'4BD519DD34E34FAFB95EF25BEBF5C736'),(4,2,'user','福建省厦门市思明区何厝小学','2018-05-07 12:34:18',34.40,2,1,'C2FFFC1EF2D84B929B7233C5A4D8CDE9');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `orderId` varchar(64) NOT NULL,
  `productId` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`orderId`,`productId`,`quantity`,`cost`) values (1,'0F72F56D9E9A4FCD9336AB7D2E89DF7B',1,5,28440.00),(2,'0F72F56D9E9A4FCD9336AB7D2E89DF7B',13,1,9888.00),(3,'0F72F56D9E9A4FCD9336AB7D2E89DF7B',14,1,10988.00),(4,'0F72F56D9E9A4FCD9336AB7D2E89DF7B',17,4,13152.00),(5,'857399B774214B95904D1B314FCB0252',13,7,69216.00),(6,'4BD519DD34E34FAFB95EF25BEBF5C736',1,10,56880.00),(7,'4BD519DD34E34FAFB95EF25BEBF5C736',13,10,98880.00),(8,'4BD519DD34E34FAFB95EF25BEBF5C736',14,10,109880.00),(9,'4BD519DD34E34FAFB95EF25BEBF5C736',17,10,32880.00),(10,'C2FFFC1EF2D84B929B7233C5A4D8CDE9',19,1,34.40);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，自动编号',
  `name` varchar(20) NOT NULL,
  `describe` varchar(1000) DEFAULT NULL,
  `price` float(10,2) NOT NULL,
  `stock` int(10) NOT NULL,
  `categoryLevel1Id` int(10) NOT NULL,
  `categoryLevel2Id` int(10) DEFAULT NULL,
  `categoryLevel3Id` int(10) DEFAULT NULL,
  `fileName` varchar(100) NOT NULL COMMENT '上传的文件名',
  `isDelete` int(10) DEFAULT NULL COMMENT '1为删除，0为未删除',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`describe`,`price`,`stock`,`categoryLevel1Id`,`categoryLevel2Id`,`categoryLevel3Id`,`fileName`,`isDelete`,`createTime`) values (1,'iMac','苹果台式电脑',5688.00,90,1,11,35,'D94D384763FB4909A69F1845973D262D.png',0,'2018-05-07 11:57:51'),(13,'MacBook','苹果笔记本电脑',9888.00,983,1,11,23,'C25C88A672D34AC1AFFDD0E633A1A86A.png',NULL,'2018-05-07 11:58:03'),(14,'MacBook Air','MacBookAir，更轻便的笔记本电脑',10988.00,90,1,11,23,'548E35F7323343B3ABA346B72ECF0032.png',NULL,'2018-05-07 11:58:17'),(15,'iPhoneX','iPhoneX',5488.00,10000,1,10,42,'CD4A66010DD5412494D5AB699EC6FE91.png',NULL,'2018-05-07 11:58:24'),(16,'iPhone8','Iphone8',4888.00,10000,1,10,42,'7096DEE85962464989F19932EF0827E3.png',NULL,'2018-05-07 11:58:33'),(17,'Ipad','Ipad 配置电子笔',3288.00,989,1,11,24,'AB97B2EDD62741BDA14682E7F6EDF2C6.png',NULL,'2018-05-07 11:58:42'),(18,'增长黑客','脸谱网如何从默默无闻到坐拥二十几亿用户？\r\n爱彼迎、优步何以在短短时间估值超过百亿美元？\r\n领英怎样跨步成为全球领先的职业社交平台?',44.30,889,2,30,56,'E294A31AD70E4CB0B7E0F8B00862EBDA.png',NULL,'2018-05-04 22:22:48'),(19,'影响力','在这本书中，心理学家罗伯特·B·西奥迪尼博士为我们解释了为什么有些人极具说服力，而我们总是容易上当受骗。隐藏在冲动地顺从他人行为背后的6大心理秘笈，正是这一切的根源。那些劝说高手们，总是熟练地运用它们，让我们就范。',34.40,665,2,30,57,'E95FF1063D6B4BC3B4508D56EBE6A8BB.png',NULL,'2018-05-07 12:34:18'),(20,'原则','瑞·达利欧是全世界投资家、企业家之一，对冲基金公司桥水创始人。桥水创立至今为客户赚取的收益远远超过历史上任何一家对冲基金。达利欧认为桥水的成功源自他所奉行的一套原则，而这些原则也是他一生中学到的最重要的东西。',65.50,777,2,30,56,'29BEA8BE7FE041F98782576513C77D94.png',NULL,'2018-05-04 22:31:36'),(21,'社会心理学','戴维·迈尔斯的《社会心理学》是美国700 多所大专院校社会心理学教学所采用的教材，自出版以来深受广大师生和社会心理学爱好者的喜爱，并被翻译成多种语言，有着广泛的影响力。本书译自第11 版。\r\n全书共分四编：社会思维、社会影响、社会关系和应用社会心理学。第1 章（社会心理学导论）着重介绍社会心理学的基本概念、重要观点、价值观对心理学的影响、社会心理学研究方法等内容，为读者系统完成后面四编社会心理学的课程奠定了坚实的基础。第一编（2~~4 章）着重探讨我们如何看待自己和他人。涉及自我概念、自尊、自我控制、自我服务偏差、印象管理、社会信念和判断、态度与行为的相互影响等内容。第二编（5~~8 章）着重探讨我们如何彼此影响和联系，深刻剖析社会影响的威力。涉及态度与行为的文化根源、社会服从的力量、说服的原理和群体影响等内容。第三编（9~~13 章）着重探讨我们彼此如何发生联系，分析了人与人之间感受和行为的正负极性：偏见、攻击、吸引与亲密、利他、冲突与和解。第四编（14~~16 章）着重将前面章节中的理论原理、研究成果应用到现实生活之中，社会心理学的应用其实贯穿全书，但这编系统介绍了社会心理学在临床、司法等领域中的应用，最后还展望了社会心理学与人类可持续发展的未来的关系，尤其探讨了在面临人口增长、过度消费、全球变暖等生态危机时，社会心理学应该发挥的作用',73.40,100,2,78,79,'2949C5F2EAD54E1CACF33FE429B2659C.png',NULL,'2018-05-04 22:35:46'),(22,'进化心理学','《进化心理学(第4版)》内容简介：进化心理学是当今心理学研究的一种新范式，在以往鲜有研究者涉足的某些心理学领域（比如爱情、择偶、亲属关系、友谊、美、母性、合作、性行为、攻击性等），进化心理学提供了一种富有建设性的解释框架。',53.20,98,2,78,79,'2F6E6D8975FC40D0A37CE05C56698148.png',NULL,'2018-05-04 22:36:34'),(23,'逻辑学导论','《国外经典哲学教材译丛:逻辑学导论(第13版)》是导论性逻辑教科书中最完满的一部：既有演绎逻辑亦有归纳逻辑，既有古典逻辑亦有现代逻辑。《国外经典哲学教材译丛:逻辑学导论(第13版)》是当今逻辑教科书的标准范本，是清晰性与准确性的典范，它能够使学生理解、把握并应用古典三段论逻辑和更为强有力的现代符号逻辑技术',88.80,45,2,78,80,'38C4D7E8F72A461DAD5098E19A7A06A3.png',NULL,'2018-05-04 22:39:12'),(24,'澳大利亚原瓶原装进口红酒','入杯，赤霞珠独特的黑醋栗、咖啡味扑鼻而来，入口后更有香草，黑莓及浓郁的橡木桶味回绕，饱满的酒体，结实的单宁，令人回味无穷，意犹未尽',296.00,1000,3,39,44,'D5F7D84FA4304D8D8AF96409B589BD6C.png',NULL,'2018-05-04 22:42:54'),(25,'Guinness 健力士黑啤','健力士生啤Guinness Draught，酒精度4.1%-5.1%体积比，呈暗黑色，有着厚实的褐色泡沫层头，富有巧克力似的干烤特征及明显的酸味。',188.00,200,3,39,46,'18383674A48D439683F71DFC939B267F.png',NULL,'2018-05-04 22:46:15'),(26,'金宾（Jim Beam）洋酒','金宾（Jim Beam）洋酒 美国波本威士忌（原白占边威士忌），出产于美国肯塔基州波本镇，酒液中与生俱来渗透着美国精神。自家族创始人 Jacob Beam 卖出波本威士忌以来，Beam 家族已将占边波本威士忌演化成为一种杰出的艺术品，世代相传。1933年美国取消禁酒令至今，占边品牌已销售了一千万桶、也相当于300亿箱波本威士忌。占边波本威士忌不仅是美国销量领先的威士忌品牌，也是全球较为畅销的波本威士忌。 1964年时，美国国会特别通过立法严格规定了波本威士忌的制造标准，并将之命名为美国国酒',97.00,111,3,39,45,'3C31449D2B824BB481BA671A3912EFB8.png',NULL,'2018-05-04 22:48:05'),(27,'滇迈','滇迈 2018年明前雀舌绿茶春茶雀舌茶叶 贵州湄潭翠芽明前日照毛尖云雾罐装120克',188.00,340,3,40,49,'B61A1E26EBDF48B89D153A1573B120DB.png',NULL,'2018-05-04 22:50:28'),(28,'梅府茗家【红茶组合】','梅府茗家***匠心为您找寻到4款风格迥异但品质优异的红茶，通过彩色袋装分门别类，适合您日常品饮，新老包装更替，不同批次袋子颜色不一样',108.00,333,3,40,47,'67FF34BECB8A4846B00CED3ED2DA034A.png',NULL,'2018-05-04 22:52:10'),(29,'金银花茶','金银花草茶 花茶 50g罐装',66.00,666,3,40,50,'F02740C696A8471C813C1262B4C0F3F4.png',NULL,'2018-05-04 22:53:45'),(30,'百伽 北欧现代简约实木床','主卧双人床1.8米橡木床成人小户型带床头柜61959/61964 白橡木款带USB可充电1.8米床+2个床头柜',4498.00,30,4,37,68,'0D5A6285166C40A58753ACCD0573B804.png',NULL,'2018-05-04 22:57:14'),(31,'INNESS 英尼斯','英国品牌 原装进口多功能旋转座椅 电脑椅 办公椅ST9853',668.00,33,4,37,70,'D0F7FB76BBAD455CA4F211AEB3A3F14B.png',NULL,'2018-05-04 22:59:08'),(32,'驯鹿家纺','裸睡全棉活性印染 春季床品 四件套 心动时分 AB版设计 1.5/1.8米床适用(200*230cm )',350.00,998,4,38,73,'C7F50C1CFDC64A0DAFABAE4567497FFE.png',NULL,'2018-05-04 23:00:38'),(33,'舒适纯棉 空调被 ','驯鹿家纺 北欧ins风 可水洗 清新简约 舒适纯棉 空调被 夏被 浅绿花开 150*200cm',358.00,888,4,38,72,'01A237B12116410FAE8F04ABB9EF418A.png',NULL,'2018-05-04 23:02:15'),(34,'北欧风家用客厅地毯','沙发茶几卧室地垫床前垫 宝宝爬行垫儿童玩耍地垫 可水洗 (190*230cm)',88.00,555,4,37,67,'EA267DDBA3F54B7E93662CBB31907AE1.png',NULL,'2018-05-04 23:04:10'),(35,'日式山形花器','陶水培花瓶花插 手工创意假山花瓶 家居装饰品摆件客厅玄关花艺艺术 禅意茶道小清新工艺品 (三山套装)',198.00,766,4,37,67,'1D4A2DD43CF5406D87543371AE2DAA8D.png',NULL,'2018-05-04 23:05:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`loginName`,`userName`,`password`,`sex`,`phone`,`email`,`identityCode`,`type`,`createTime`) values (1,'admin','管理员','123456',1,'1','1','1',1,'2018-05-07 11:48:59'),(2,'user','XLG','123456',1,'15606002666','277090520@qq.com','350135857394959684',3,'2018-05-07 11:49:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_address` */

insert  into `user_address`(`id`,`userId`,`address`,`isDefault`,`remark`,`createTime`) values (1,2,'福建省厦门市思明区何厝小学',1,'1','2018-05-07 12:21:38');

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
