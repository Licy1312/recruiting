-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: recruiting
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` varchar(128) DEFAULT NULL COMMENT '约谈时间',
  `isConfirm` tinyint(3) DEFAULT '-1' COMMENT '投递的单位是否确认',
  `remark` text COMMENT '备注',
  `applytime` date DEFAULT NULL COMMENT '应聘者提交简历的时间',
  `userid` int(10) unsigned DEFAULT NULL COMMENT '应聘者的id',
  `requiredid` int(10) unsigned DEFAULT NULL COMMENT '招聘表的id',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `requiredid` (`requiredid`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`requiredid`) REFERENCES `required` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (29,'',0,'','2015-12-25',6,11),(30,'',1,'','2015-12-25',6,11),(31,'',1,'','2015-12-29',12,11);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '文章的标题',
  `local` varchar(256) DEFAULT NULL COMMENT '文章发表的地方',
  `userid` int(10) unsigned DEFAULT NULL COMMENT '用户的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'改进的向量空间模型在主题爬虫中的应用','中国科技论文在线',1),(2,'数据挖掘研究','对大数据进行研究',6);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `requiredid` int(10) unsigned NOT NULL,
  `collectiontime` date DEFAULT NULL COMMENT '收藏的时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `requiredid` (`requiredid`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`requiredid`) REFERENCES `required` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `name` varchar(32) DEFAULT NULL COMMENT '单位名称',
  `address` varchar(128) DEFAULT NULL COMMENT '单位地址',
  `url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'123@qq.com','202cb962ac59075b964b07152d234b70','上海大学','上大路99号','http://www.shu.edu.cn/'),(2,'1234@qq.com','202cb962ac59075b964b07152d234b70','同济大学',NULL,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobtype`
--

DROP TABLE IF EXISTS `jobtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobtype`
--

LOCK TABLES `jobtype` WRITE;
/*!40000 ALTER TABLE `jobtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `parentid` int(11) NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'经济学',0,0),(3,'教育学',0,0),(4,'法学',0,0),(5,'历史学',0,0),(6,'文学',0,0),(7,'理学',0,0),(8,'农学',0,0),(9,'工学',0,0),(10,'医学',0,0),(11,'军事学',0,0),(12,'管理学',0,0),(13,'艺术学',0,0),(14,'应用经济学',1,0),(15,'统计学',1,0),(16,'理论经济学',1,0),(17,'法学',4,0),(18,'政治学',4,0),(19,'社会学',4,0),(20,'民族学',4,0),(21,'马克思主义理论',4,0),(22,'公安学',4,0),(23,'心理学',3,0),(24,'教育学',3,0),(25,'体育学',3,0),(26,'中国语言文学',6,0),(27,'外国语言文学',6,0),(28,'新闻传播学',6,0),(29,'考古学',5,0),(30,'世界史',5,0),(31,'中国史',5,0),(32,'数学',7,0),(33,'化学',7,0),(34,'天文学',7,0),(35,'物理学',7,0),(36,'大气科学',7,0),(37,'地理学',7,0),(38,'海洋科学',7,0),(39,'地质学',7,0),(40,'地球物理学',7,0),(41,'生物学',7,0),(42,'科学技术史',7,0),(43,'系统科学',7,0),(44,'统计学',7,0),(45,'生态学',7,0),(46,'心理学',7,0),(47,'力学',7,0),(48,'环境科学与工程',7,0),(49,'计算机科学与技术',7,0),(50,'生物医学工程',7,0),(51,'公共卫生与预防医学',7,0),(52,'电子科学与技术',7,0),(53,'中药学',7,0),(54,'护理学',7,0),(55,'材料科学与工程',7,0),(56,'药学',7,0),(57,'基础医学',7,0),(58,'医学技术',7,0),(59,'光学工程',9,0),(60,'力学',9,0),(61,'冶金工程',9,0),(62,'材料科学与工程',9,0),(63,'机械工程',9,0),(64,'仪器科学与技术',9,0),(65,'电子科学与技术',9,0),(66,'动力工程及工程热物理',9,0),(67,'信息与通信工程',9,0),(68,'计算机科学与技术',9,0),(69,'控制科学与工程',9,0),(70,'建筑学',9,0),(71,'水利工程',9,0),(72,'测绘科学与技术',9,0),(73,'电气工程',9,0),(74,'化学工程与技术',9,0),(75,'土木工程',9,0),(76,'地质资源与地质工程',9,0),(77,'纺织科学与工程',9,0),(78,'石油与天然气工程',9,0),(79,'轻工技术与工程',9,0),(80,'交通运输工程',9,0),(81,'航空宇航科学与技术',9,0),(82,'兵器科学与技术',9,0),(83,'矿业工程',9,0),(84,'船舶与海洋工程',9,0),(85,'核科学与技术',9,0),(86,'农业工程',9,0),(87,'林业工程',9,0),(88,'环境科学与工程',9,0),(89,'生物医学工程',9,0),(90,'城乡规划学',9,0),(91,'食品科学与工程',9,0),(92,'风景园林学',9,0),(93,'软件工程',9,0),(94,'生物工程',9,0),(95,'网络空间安全',9,0),(96,'公安技术',9,0),(97,'安全科学与工程',9,0),(98,'科学技术史',9,0),(99,'设计学',9,0),(100,'管理科学与工程',9,0),(101,'园艺学',8,0),(102,'作物学',8,0),(103,'兽医学',8,0),(104,'农业资源与环境',8,0),(105,'植物保护',8,0),(106,'畜牧学',8,0),(107,'林学',8,0),(108,'草学',8,0),(109,'科学技术史',8,0),(110,'食品科学与工程',8,0),(111,'水产',8,0),(112,'风景园林学',8,0),(113,'环境科学与工程',8,0),(114,'公共卫生与预防医学',10,0),(115,'中西医结合',10,0),(116,'基础医学',10,0),(117,'中医学',10,0),(118,'口腔医学',10,0),(119,'临床医学',10,0),(120,'医学技术',10,0),(121,'特种医学',10,0),(122,'护理学',10,0),(123,'药学',10,0),(124,'科学技术史',10,0),(125,'生物医学工程',10,0),(126,'中药学',10,0),(127,'军事思想及军事历史',11,0),(128,'战术学',11,0),(129,'战略学',11,0),(130,'战役学',11,0),(131,'军队指挥学',11,0),(132,'军制学',11,0),(133,'军队政治工作学',11,0),(134,'军事后勤学',11,0),(135,'军事装备学',11,0),(136,'军事训练学',11,0),(137,'工商管理',12,0),(138,'公共管理',12,0),(139,'管理科学与工程',12,0),(140,'农林经济管理',12,0),(141,'图书情报与档案管理',12,0),(142,'艺术学理论',13,0),(143,'设计学',13,0),(144,'戏剧与影视学',13,0),(145,'音乐与舞蹈学',13,0),(146,'美术学',13,0);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '项目名',
  `intro` text COMMENT '项目介绍',
  `userid` int(10) unsigned DEFAULT NULL COMMENT '用户的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'跨领域信息抽取方法及其在数字图书中的应用研究','国家自然科学基金项目',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) DEFAULT NULL,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'北京',0),(2,'上海',0),(3,'成都',0),(4,'广州',0),(5,'武汉',0);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required`
--

DROP TABLE IF EXISTS `required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `required` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `salary` varchar(64) DEFAULT NULL COMMENT '薪水',
  `address` varchar(128) DEFAULT NULL COMMENT '工作地址',
  `intro` text COMMENT '工作介绍',
  `startdate` date DEFAULT NULL COMMENT '开始时间',
  `enddate` date DEFAULT NULL COMMENT '结束时间',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '单位id',
  `majorid` int(10) unsigned DEFAULT NULL COMMENT '所属领域id',
  PRIMARY KEY (`id`),
  KEY `required_ibfk_1` (`uid`),
  KEY `required_ibfk_2` (`majorid`),
  CONSTRAINT `required_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `required_ibfk_2` FOREIGN KEY (`majorid`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required`
--

LOCK TABLES `required` WRITE;
/*!40000 ALTER TABLE `required` DISABLE KEYS */;
INSERT INTO `required` VALUES (11,'第一组','面议','上海','发士大夫大师傅','2015-12-25',NULL,1,14),(12,'第二组','面议','上海','的test','2015-12-25',NULL,7,14),(13,'第三组','面议','上海','tesetw','2015-12-28',NULL,1,14),(14,'123','面议','上海','1231','2015-12-29',NULL,1,14);
/*!40000 ALTER TABLE `required` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requireds`
--

DROP TABLE IF EXISTS `requireds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requireds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `major` varchar(64) DEFAULT NULL COMMENT '专业要求',
  `publishTime` date DEFAULT NULL COMMENT '发布时间',
  `jobType` int(10) unsigned NOT NULL COMMENT '职位类型',
  `age` varchar(64) DEFAULT '不限' COMMENT '年龄要求',
  `academicTitle` varchar(64) DEFAULT '不限' COMMENT '职称要求',
  `eduBackground` char(16) DEFAULT NULL COMMENT '学历要求',
  `department` varchar(64) DEFAULT NULL COMMENT '用人部门',
  `workBackground` varchar(64) DEFAULT NULL COMMENT '工作经验',
  `nums` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '招聘人数',
  `jobNature` char(2) DEFAULT '不限' COMMENT '工作性质',
  `condition` text COMMENT '应聘条件',
  `procedure` text COMMENT '招聘程序',
  `treatment` text COMMENT '工作待遇',
  `basicCondition` text COMMENT '应聘基本条件',
  `contextWay` varchar(256) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`),
  KEY `jobType` (`jobType`),
  CONSTRAINT `requireds_ibfk_1` FOREIGN KEY (`jobType`) REFERENCES `jobtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requireds`
--

LOCK TABLES `requireds` WRITE;
/*!40000 ALTER TABLE `requireds` DISABLE KEYS */;
/*!40000 ALTER TABLE `requireds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `type` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('全职');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '邮箱',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `name` varchar(32) DEFAULT NULL COMMENT '名字',
  `phone` char(12) DEFAULT NULL COMMENT '手机号',
  `highestEducation` char(12) DEFAULT NULL COMMENT '最高学历',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业学校',
  `filename` varchar(32) DEFAULT NULL COMMENT '上传简历的文件名',
  `filepath` varchar(32) DEFAULT NULL COMMENT '文件路径',
  `regtime` date DEFAULT NULL COMMENT '注册的时间',
  `usertype` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`username`),
  FULLTEXT KEY `email_2` (`username`),
  FULLTEXT KEY `email_3` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'corlymeng@qq.com','202cb962ac59075b964b07152d234b70','孟爽','17717375261','硕士','上海大学','孟爽-冬季学期课表.xlsx','uploads/2015-11-28/184451-1','2015-10-27',2),(6,'qwe@qq.com','76d80224611fc919a5d54f0ff9fba446','小明','13237124501','博士','同济大学',NULL,NULL,'2015-10-29',1),(7,'asd@qq.com','7815696ecbf1c96e6894b779456d330e','小红','13237142831','','',NULL,NULL,'2015-10-28',2),(8,'rty@qq.com','24113791d2218cb84c9f0462e91596ef','test','1323715640','','',NULL,NULL,'2015-10-29',1),(12,'test@qq.com','098f6bcd4621d373cade4e832627b4f6','Tom','13237124501','','',NULL,NULL,'2015-10-30',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-29 15:25:43
