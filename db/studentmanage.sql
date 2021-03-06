-- MySQL dump 10.13  Distrib 5.5.51, for Win64 (x86)
--
-- Host: localhost    Database: studentmanage
-- ------------------------------------------------------
-- Server version	5.5.51

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
-- Table structure for table `tbl_article`
--

DROP TABLE IF EXISTS `tbl_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_article` (
  `id` varchar(36) NOT NULL,
  `agree` int(11) NOT NULL,
  `browse` int(11) NOT NULL,
  `content` text,
  `createDateTime` datetime DEFAULT NULL,
  `title` text,
  `tag_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsvfkqciv1avi0gxxwnugedgda` (`tag_id`),
  KEY `FK7kx6crav6ko0t73x6waqre7y3` (`user_id`),
  CONSTRAINT `FK7kx6crav6ko0t73x6waqre7y3` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKsvfkqciv1avi0gxxwnugedgda` FOREIGN KEY (`tag_id`) REFERENCES `tbl_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_article`
--

LOCK TABLES `tbl_article` WRITE;
/*!40000 ALTER TABLE `tbl_article` DISABLE KEYS */;
INSERT INTO `tbl_article` VALUES ('2ab25a02-62b7-40bc-8beb-21f642fe2624',0,5,'bbb','2016-11-06 00:34:55','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('2af31d5e-1592-488a-9aa7-168455920f25',0,2,'<p>eeeee</p>','2016-11-14 15:15:50','teeeee','dd9990c1-718c-4b88-ab38-3fa48ebcd2ef','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('2f897740-0146-449c-8e4a-280fd96d7dad',0,2,'bbb','2016-11-06 00:34:54','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('496cd632-2960-4e39-95ec-0058a5f43ac4',0,2,'bbb','2016-11-06 00:34:55','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('4ad57db3-2948-49db-8560-2b6ba6930429',0,0,'<p>eeee</p>','2016-11-20 22:02:08','eee','043e3caf-6511-4b38-acf5-7c4cf0499bbd','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('4b252b2f-051c-4381-bd73-6bb4d40be523',0,0,'<p>bbb</p>','2016-11-20 21:58:49','bbb','043e3caf-6511-4b38-acf5-7c4cf0499bbd','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('581cf227-828d-45fe-95c2-11060e794ea0',0,135,'bbb','2016-11-01 23:00:05','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('58abc02c-2fe4-47d3-b959-8f70bcaae73d',0,1,'bbb','2016-11-06 00:34:53','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('5deb925e-f20e-4120-9373-8f8b6f6cd8f7',0,5,'bbb','2016-11-01 21:09:33','aaa','1f9e8483-3766-4e12-a830-06e8a1560d0d','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('61f24c45-683a-466f-a65e-24b5e6efc096',0,0,'bbb','2016-11-06 00:34:27','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('64a55abc-fd8c-4001-bd52-a5deaa734a97',0,0,'bbb','2016-11-06 00:34:56','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('68cd487a-022f-4e34-80bf-8c6ad7df87b6',0,0,'bbb','2016-11-01 21:09:32','aaa','1f9e8483-3766-4e12-a830-06e8a1560d0d','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('6f251583-c3bd-499f-b899-9415bf2db0f9',0,0,'bbb','2016-11-06 00:34:54','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('6f5fe5a5-a032-4827-be39-ea65e3ec9257',0,0,'bbb','2016-11-06 00:34:54','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('76f89434-2b0a-40df-bc16-85a922826fe8',0,3,'<p style=\"text-align: center; \"><b>eeee</b></p>','2016-11-21 14:36:45','1111','e5ac2762-f295-4a16-aed6-61c17c5a3a7e','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('7a335750-586f-4e80-a955-25951ca6134b',0,0,'bbb','2016-11-06 00:34:27','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('7a44dffc-73fb-4dcc-aca7-d10a8ae50d28',0,0,'bbb','2016-11-06 00:34:27','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('7cb0f182-fb82-48a0-94b1-a5be38ad7405',0,0,'bbb','2016-11-06 00:34:55','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('808407c6-8b52-489e-a86e-d2c3b9aaa423',0,4,'bbb','2016-11-01 21:09:19','aaa','1f9e8483-3766-4e12-a830-06e8a1560d0d','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('826f4805-e3f4-4193-9399-c94cda6175f9',0,0,'bbb','2016-11-01 21:09:32','aaa','1f9e8483-3766-4e12-a830-06e8a1560d0d','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('8c055d08-05d1-49d5-8471-831ed4d7ef08',0,0,'bbb','2016-11-06 00:34:55','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('8edbabc2-e8a6-4a1d-86df-602f4752b3fc',0,0,'<p>eee</p>','2016-11-20 21:56:16','bb','043e3caf-6511-4b38-acf5-7c4cf0499bbd','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('92db5a0d-6f13-4ba7-9f3e-1ba499a7c2b5',0,0,'<p>eeee</p>','2016-11-20 21:54:24','eeee','043e3caf-6511-4b38-acf5-7c4cf0499bbd','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('94c3a480-4f3d-4421-b2f3-e68c03b21773',0,2,'<p>test鍏偣</p><p><br></p>','2016-11-09 09:03:02','test鍏偣','aeef869d-af6a-43fa-89c9-a8639f119a6d','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('a710359f-92cb-4839-8d45-61514fdc6921',0,0,'bbb','2016-11-06 00:34:54','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('a7c499a2-6afb-4d4e-b40a-8d38c6666f2e',0,0,'bbb','2016-11-06 00:34:55','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('a8109527-2928-410c-85ef-42de270f2bf8',0,7,NULL,'2016-11-01 21:09:33','鍟﹀暒鍟?,'4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('a9e4bec4-fe03-42b3-8300-a2133806c621',0,0,'<p>bbb</p>','2016-11-20 22:01:29','bbb','043e3caf-6511-4b38-acf5-7c4cf0499bbd','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('b4a3cea3-be2c-44e2-9692-d75f96b0a56e',0,0,'bbb','2016-11-06 00:34:56','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('bae99438-4189-4363-a6e3-dc07751cf53c',0,1,'bbb','2016-11-06 00:34:56','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('bbf64e13-39f0-4b13-830d-5b327aed38cd',0,0,'bbb','2016-11-06 00:34:29','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('c1479f8c-bf5c-421f-a016-f9b85f9766a7',0,0,'bbb','2016-11-06 00:34:28','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('c38e8e61-c326-4d6c-bf38-2b82cb347add',0,2,'<p>tttt</p>','2016-11-16 09:20:22','tttt','e5ac2762-f295-4a16-aed6-61c17c5a3a7e','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('c5aa84d0-01a4-4786-91b3-4c49c01e2639',0,5,'bbb','2016-11-06 00:34:28','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('ce28ddb6-cd35-4665-bdfc-e76ac33cd330',0,0,'bbb','2016-11-06 00:34:54','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('d1e67e56-0fa3-4a55-9e93-eae2cf691288',0,0,'<p>tttttteeeeeeeeeeeeeeee</p>','2016-11-16 09:43:11','tttteeeeeeeeeeeeeeeeeeeeeeee','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('d75d21f3-69a4-45b1-b675-4ca3ce0a3a57',0,0,'bbb','2016-11-06 00:34:28','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('f407e3dd-4f96-4e68-bca6-eac08ba2bbdb',0,0,'<p>bbb</p>','2016-11-20 21:55:26','bb','810c695d-caea-4a55-87a6-887c44e615f2','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('f628aa2d-5a63-4bdc-a7d3-51d9ae845deb',0,1,'<p>aalalal</p>','2016-11-20 22:00:16','lalala','043e3caf-6511-4b38-acf5-7c4cf0499bbd','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('f74386a8-a977-4f78-ab2f-470430ef64e7',0,0,'bbb','2016-11-06 00:34:28','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('f7e311e2-cb7e-4e2b-9da3-ad29fdf33888',0,2,'bbb','2016-11-06 00:34:29','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('f85c60c8-cc90-4b32-b71c-94adcc798fb9',0,1,'bbb','2016-11-06 00:34:28','aaa','4865b197-2dc7-4182-b55c-2c42e4566544','7c37b106-c57c-4ca7-88a8-2b7ad75991e8');
/*!40000 ALTER TABLE `tbl_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comment` (
  `id` varchar(36) NOT NULL,
  `agree` int(11) NOT NULL,
  `content` text,
  `createDateTime` datetime DEFAULT NULL,
  `article_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj567xpq4fmslmd3amlvoetd9n` (`article_id`),
  KEY `FKgjlkbaxyvqqrmxeoxh6pb4oj7` (`user_id`),
  CONSTRAINT `FKgjlkbaxyvqqrmxeoxh6pb4oj7` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKj567xpq4fmslmd3amlvoetd9n` FOREIGN KEY (`article_id`) REFERENCES `tbl_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES ('1f64e3d8-a839-47ef-a2da-5e34ea04d8b7',0,'杩欐槸鍥炲','2016-11-05 15:43:12','a8109527-2928-410c-85ef-42de270f2bf8','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('21b576bc-763a-43c1-b877-a1a348f4a93c',0,'娴嬭瘯鍥炲1','2016-11-06 10:50:43','581cf227-828d-45fe-95c2-11060e794ea0','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('305e05da-ecf1-49bf-8570-820dd667070e',0,'<p>eeeeee</p>','2016-11-07 15:14:42','808407c6-8b52-489e-a86e-d2c3b9aaa423','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('45f35923-11f5-47ac-8eda-482d511a34ea',0,'bbb鍟婂晩','2016-11-05 15:43:48','a8109527-2928-410c-85ef-42de270f2bf8','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('5add4a20-9801-4ab6-ad48-5befade0907d',0,'<p>aaaaaaaaaaa</p>','2016-11-21 14:44:47','f7e311e2-cb7e-4e2b-9da3-ad29fdf33888','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('62706acc-98b1-43e4-beca-7ef474edf24e',0,'鍟婂晩鍟婂晩鍟?,'2016-11-06 11:34:12','581cf227-828d-45fe-95c2-11060e794ea0','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('655fb94a-4dc6-49f3-aec3-52cc861aebf1',0,'娴嬫槸鍟﹀暒鍟﹀暒','2016-11-06 11:35:05','581cf227-828d-45fe-95c2-11060e794ea0','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('8c012f80-2a37-4686-89b6-36feb9041001',0,'娴嬭瘯鍥炲3','2016-11-06 10:50:48','581cf227-828d-45fe-95c2-11060e794ea0','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('96ca9ba6-9908-409b-8ee3-e5294caad03a',0,'娴嬭瘯鍥炲2','2016-11-06 10:50:45','581cf227-828d-45fe-95c2-11060e794ea0','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('c7fca8b6-d2a1-40b4-8727-bc2763b9e48f',0,'娴嬭瘯鍥炲4','2016-11-06 10:50:57','581cf227-828d-45fe-95c2-11060e794ea0','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('df5340ae-f1b4-4d32-93e1-e4b5590b6d35',0,'<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\"><br></p><p><br></p>','2016-11-07 15:14:47','808407c6-8b52-489e-a86e-d2c3b9aaa423','7c37b106-c57c-4ca7-88a8-2b7ad75991e8'),('ff2a5490-08df-488a-a944-1dd88ace2cdc',0,'<p>eeeeee</p>','2016-11-21 14:37:30','2ab25a02-62b7-40bc-8beb-21f642fe2624','7c37b106-c57c-4ca7-88a8-2b7ad75991e8');
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_role` (
  `id` varchar(36) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES ('340270db-b4c7-448e-a96f-2f21c386dea3',NULL,'鐢ㄦ埛'),('6cd0f7b2-09c6-4acc-8ab5-e1731d5e1cfe',NULL,'admin');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tag`
--

DROP TABLE IF EXISTS `tbl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tag` (
  `id` varchar(36) NOT NULL,
  `decription` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tag`
--

LOCK TABLES `tbl_tag` WRITE;
/*!40000 ALTER TABLE `tbl_tag` DISABLE KEYS */;
INSERT INTO `tbl_tag` VALUES ('043e3caf-6511-4b38-acf5-7c4cf0499bbd',NULL,'deeee',NULL),('10fd68f1-e23e-4639-8f99-c023045491ff',NULL,'鍟﹀暒鍟﹀暒',NULL),('16b34b98-836c-45fe-9dd8-9465d20ee3f2',NULL,'娴嬭瘯1',NULL),('17c47875-f51c-4502-8fca-ec1cfb20c4e4',NULL,'google',NULL),('1f9e8483-3766-4e12-a830-06e8a1560d0d',NULL,'娴嬭瘯',NULL),('4865b197-2dc7-4182-b55c-2c42e4566544',NULL,'娴嬭瘯2',NULL),('4a800635-caa1-4c0b-ba0c-b0be627ca9f8',NULL,'瀹夊叏',NULL),('752783b4-9c41-4ce0-bc54-76fd9f4426f1',NULL,'璁捐妯″紡',NULL),('7eb9dda5-c300-42fa-af3e-2ae2c8552bea',NULL,'chrome',NULL),('810c695d-caea-4a55-87a6-887c44e615f2',NULL,'it',NULL),('94cda09f-8455-43fa-9140-12075ed73e77',NULL,'闊充箰',NULL),('aeef869d-af6a-43fa-89c9-a8639f119a6d',NULL,'鐧惧害',NULL),('c1d8089e-f3f6-4dd6-8a8e-4fdbbda579b9',NULL,'鐢熸椿',NULL),('dd9990c1-718c-4b88-ab38-3fa48ebcd2ef',NULL,'灏忕背',NULL),('e5ac2762-f295-4a16-aed6-61c17c5a3a7e',NULL,'ttttt',NULL),('f7003cf2-da12-4f52-bb69-63cef8e5971f',NULL,'java',NULL),('ff5619b3-acda-40ed-91c1-bf1234ef1dfd',NULL,'android',NULL);
/*!40000 ALTER TABLE `tbl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` varchar(36) NOT NULL,
  `avatar` text,
  `createDateTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` text,
  `password` varchar(32) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqyhp9ytkc0o8uapy1vtqmw350` (`role_id`),
  CONSTRAINT `FKqyhp9ytkc0o8uapy1vtqmw350` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES ('1aaadbc2-a15e-4aea-b05a-9ac862605d2a',NULL,'2016-10-31 21:12:02',NULL,'cc2@admin.com','08f8e0260c64418510cefb2b06eee5cd','aaa2','340270db-b4c7-448e-a96f-2f21c386dea3'),('21144ce5-bc50-41c5-9521-bd04e509279c',NULL,'2016-10-31 21:10:11',NULL,'user@qq.com','ee11cbb19052e40b07aac0ca060c23ee','user','340270db-b4c7-448e-a96f-2f21c386dea3'),('260c243e-5e05-4a12-8004-0bdff301f45a',NULL,'2016-11-21 14:59:27',NULL,'eeeeeeeee','ebe1b49e3c01a7ed012ed737235fcc3b','eee','340270db-b4c7-448e-a96f-2f21c386dea3'),('314cc711-5a20-4173-a76c-e2043db77161',NULL,'2016-11-20 22:40:41',NULL,'admin@111.com','74b87337454200d4d33f80c4663dc5e5','adminl','340270db-b4c7-448e-a96f-2f21c386dea3'),('42e79e95-b79a-4754-ac2e-6de561c28eda',NULL,'2016-11-20 23:00:07',NULL,'admin@qqqq.com','21232f297a57a5a743894a0e4a801fc3','adminaaa','340270db-b4c7-448e-a96f-2f21c386dea3'),('4d2991bd-bbdf-4769-b15a-0b432c0781e7',NULL,'2016-11-21 14:10:28',NULL,'admin222@qq.com','96e79218965eb72c92a549dd5a330112','admin122','340270db-b4c7-448e-a96f-2f21c386dea3'),('7436f28d-0a8f-40e1-83ff-085aab1ce71b',NULL,'2016-10-31 21:11:53',NULL,'cc1@admin.com','08f8e0260c64418510cefb2b06eee5cd','aaa1','340270db-b4c7-448e-a96f-2f21c386dea3'),('7c37b106-c57c-4ca7-88a8-2b7ad75991e8','http://wenda.wecenter.com/uploads/avatar/000/00/99/91_avatar_max.jpg','2016-10-31 21:09:35','lalalallala','admin@qq.com','21232f297a57a5a743894a0e4a801fc3','admin','6cd0f7b2-09c6-4acc-8ab5-e1731d5e1cfe'),('872adb36-094d-4e20-82ba-5825f23d1254',NULL,'2016-11-21 14:46:46',NULL,'aaaa','47bce5c74f589f4867dbd57e9ca9f808','aaaaaaaaaaa','340270db-b4c7-448e-a96f-2f21c386dea3'),('906a0bd2-1ef4-4c89-8137-922dc6e51f30',NULL,'2016-11-20 22:42:38',NULL,'admin2@111.com','44a1cb0b087d4a89ae631fc6f7643a0f','adminl2','340270db-b4c7-448e-a96f-2f21c386dea3'),('9d407f73-6a59-4b7a-8e94-d5c026c8f1ee',NULL,'2016-10-31 21:11:45',NULL,'cc@admin.com','08f8e0260c64418510cefb2b06eee5cd','aaa','340270db-b4c7-448e-a96f-2f21c386dea3'),('9eced12c-a825-4905-8c77-c2eb41c42338',NULL,'2016-11-20 22:58:09',NULL,'admin@qqq.com','21232f297a57a5a743894a0e4a801fc3','admin111','340270db-b4c7-448e-a96f-2f21c386dea3'),('a0ea5784-73b1-4aae-a387-dc43e05fb7c8',NULL,'2016-11-21 15:06:42',NULL,'admin888@qq.com','7fef6171469e80d32c0559f88b377245','admin888','340270db-b4c7-448e-a96f-2f21c386dea3'),('a53d92aa-3f2a-463f-a805-b7155cc186aa',NULL,'2016-11-20 22:38:02',NULL,'aaaa@qq.com','e1faffe9c3c801f2f8c3fbe7cb032cb2','aaaaa','340270db-b4c7-448e-a96f-2f21c386dea3'),('bc7dd256-dd6a-4cc3-9828-a267375c18f4',NULL,'2016-11-20 23:03:33',NULL,'admin@bbbb.com','594f803b380a41396ed63dca39503542','adminaaaa','340270db-b4c7-448e-a96f-2f21c386dea3'),('d689f77a-d9bf-44a0-94b2-f13078158261',NULL,'2016-11-20 22:35:45',NULL,'adminb2@qq.com','187b3372e9300894a7376e2a4e5cfb65','admin1222','340270db-b4c7-448e-a96f-2f21c386dea3'),('d9786058-e908-4758-9d62-a663cf0a8d8e',NULL,'2016-11-21 00:03:11',NULL,'abc','440ac85892ca43ad26d44c7ad9d47d3e','abcabc','340270db-b4c7-448e-a96f-2f21c386dea3'),('ed5fc261-08ab-44bc-96de-389cb18d2fc3',NULL,'2016-11-21 14:39:49',NULL,'bbb','e0323a9039add2978bf5b49550572c7c','aa33a','340270db-b4c7-448e-a96f-2f21c386dea3'),('f9044e6f-4006-4fb3-bf44-9458d48bd68e',NULL,'2016-11-20 22:34:23',NULL,'adminb@qq.com','2edd8267a9481a190cf116bef013336f','admin1','340270db-b4c7-448e-a96f-2f21c386dea3'),('ffe48700-463c-4649-a8f1-f58a48fc873a',NULL,'2016-11-21 15:05:22',NULL,'eeee','d2f2297d6e829cd3493aa7de4416a18f','eeee','340270db-b4c7-448e-a96f-2f21c386dea3');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21 16:05:57
