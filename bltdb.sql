# MySQL-Front 5.1  (Build 2.7)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 222.73.135.243    Database: bltdb
# ------------------------------------------------------
# Server version 5.6.12

#
# Source for table t_department
#

DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(40) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `fid` int(11) DEFAULT NULL COMMENT '本表父id',
  `jc` varchar(40) DEFAULT NULL COMMENT '简称',
  `man` varchar(50) DEFAULT NULL COMMENT '主负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(60) DEFAULT NULL COMMENT '传真',
  `info` varchar(255) DEFAULT NULL COMMENT '简介',
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `level` char(2) DEFAULT NULL COMMENT '级别',
  `del` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='部门表';

#
# Dumping data for table t_department
#
LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;

INSERT INTO `t_department` VALUES (1,'00000','信息部',NULL,'xx','刘东赫','8888888','0451-999','无',NULL,NULL,'2',NULL);
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_equipment
#

DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `num` varchar(15) DEFAULT NULL COMMENT '设备数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '设备型号',
  `cid` int(11) DEFAULT NULL COMMENT '类别id',
  `category` varchar(10) DEFAULT NULL COMMENT '设备类别',
  `creater` varchar(50) DEFAULT NULL COMMENT '厂商',
  `sid` int(11) DEFAULT NULL COMMENT '供应商id',
  `supplier` varchar(50) DEFAULT NULL COMMENT '供应商',
  `flag` varchar(1) DEFAULT NULL COMMENT '0重型设备，1一般设备，2大型设备',
  `intime` datetime DEFAULT NULL COMMENT '购入时间',
  `certifier` varchar(50) DEFAULT NULL COMMENT '资产证明人',
  `deperction` varchar(20) DEFAULT NULL COMMENT '折旧方式',
  `perPrice` double(10,2) DEFAULT NULL COMMENT '资产原值',
  `rate` int(3) DEFAULT NULL COMMENT '净残率',
  `checkRound` varchar(15) DEFAULT NULL COMMENT '检查周期',
  `preCheck` datetime DEFAULT NULL COMMENT '上次检验',
  `nextCheck` datetime DEFAULT NULL COMMENT '下次检验',
  `preMaintain` datetime DEFAULT NULL COMMENT '上次维修',
  `useStatus` varchar(15) DEFAULT NULL COMMENT '使用情况',
  `did` int(11) DEFAULT NULL COMMENT '部门id',
  `dname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作员',
  `place` varchar(70) DEFAULT NULL COMMENT '安装地点',
  `ext1` varchar(200) DEFAULT NULL,
  `ext7` varchar(200) DEFAULT NULL,
  `ext2` varchar(200) DEFAULT NULL,
  `ext3` varchar(200) DEFAULT NULL,
  `ext4` varchar(200) DEFAULT NULL,
  `ext5` varchar(200) DEFAULT NULL,
  `ext6` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_equipment
#
LOCK TABLES `t_equipment` WRITE;
/*!40000 ALTER TABLE `t_equipment` DISABLE KEYS */;

INSERT INTO `t_equipment` VALUES (1,'哈尔滨','00002','无',3,'货梯','哈尔滨市',NULL,'1','0','2016-01-05','刘东赫','现金',52222,2,'年','2016-01-27','2016-01-28','2016-01-26','未启用',1,'办公室',NULL,'无',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `t_equipment` VALUES (2,'货梯','00001','吨',3,'货梯','企业家和',1,'慧客指点','1','2016-01-20','刘东赫','现金',50000,25,'1月','2016-01-13','2016-01-04','2016-01-26','禁用',2,'维修部',NULL,'哈尔滨',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `t_equipment` VALUES (3,'发电机','00002','5顿',4,'医用电梯','钱元坤和',1,'慧客指点','0','2016-01-14','刘东赫','现金',50000,14,'一周','2016-01-13','2016-01-12','2016-01-27','出租',NULL,'质检部',NULL,'哈尔滨',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `t_equipment` VALUES (4,'测试设备','00006','大大方方的',2,'日用电梯','打发反对法的',1,'慧客指点','0','2016-03-24','东方饭店','发',12,12,'2016-03-30','2016-03-03','2016-04-06','2016-03-07','未启用',NULL,'生成部',NULL,'123323',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_equipment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_equipmentcategory
#

DROP TABLE IF EXISTS `t_equipmentcategory`;
CREATE TABLE `t_equipmentcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(200) DEFAULT NULL COMMENT '说明',
  `num` varchar(40) DEFAULT '' COMMENT '设备分类编码',
  `name` varchar(50) DEFAULT NULL COMMENT '设备分类名称',
  `del` char(1) DEFAULT NULL COMMENT '有效性；1无效，0有效',
  `sid` int(11) DEFAULT NULL COMMENT '父id',
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='设备类别表';

#
# Dumping data for table t_equipmentcategory
#
LOCK TABLES `t_equipmentcategory` WRITE;
/*!40000 ALTER TABLE `t_equipmentcategory` DISABLE KEYS */;

INSERT INTO `t_equipmentcategory` VALUES (2,'','00000','日用电梯','0',NULL,NULL,NULL,NULL);
INSERT INTO `t_equipmentcategory` VALUES (3,'博林特货梯','00001','货梯','0',NULL,NULL,NULL,NULL);
INSERT INTO `t_equipmentcategory` VALUES (4,'','00002','医用电梯','0',NULL,NULL,NULL,NULL);
INSERT INTO `t_equipmentcategory` VALUES (5,'','00003','乘客电梯','0',NULL,NULL,NULL,NULL);
INSERT INTO `t_equipmentcategory` VALUES (6,'博林特普通电梯','00004','乘客电梯','0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_equipmentcategory` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_equipmentpart
#

DROP TABLE IF EXISTS `t_equipmentpart`;
CREATE TABLE `t_equipmentpart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `info` varchar(200) DEFAULT NULL COMMENT '配件说明',
  `num` varchar(40) DEFAULT NULL COMMENT '配件编码',
  `name` varchar(40) DEFAULT NULL COMMENT '设备配件名称',
  `del` char(1) DEFAULT '0' COMMENT '有效性 0 有效 1无效',
  `sid` int(10) DEFAULT NULL COMMENT '父ID',
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_equipmentpart
#
LOCK TABLES `t_equipmentpart` WRITE;
/*!40000 ALTER TABLE `t_equipmentpart` DISABLE KEYS */;

INSERT INTO `t_equipmentpart` VALUES (1,'货梯配件','000001','01配件','0',NULL,'损坏',NULL,NULL);
INSERT INTO `t_equipmentpart` VALUES (2,'货梯配件','000002','02配件','0',NULL,'磨损',NULL,NULL);
INSERT INTO `t_equipmentpart` VALUES (3,'货梯配件','000003','03配件','0',NULL,'磨损',NULL,NULL);
/*!40000 ALTER TABLE `t_equipmentpart` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_function
#

DROP TABLE IF EXISTS `t_function`;
CREATE TABLE `t_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `fid` int(11) DEFAULT NULL COMMENT '父id',
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_function
#
LOCK TABLES `t_function` WRITE;
/*!40000 ALTER TABLE `t_function` DISABLE KEYS */;

INSERT INTO `t_function` VALUES (1,'权限管理','',-1,'根节点','1');
INSERT INTO `t_function` VALUES (2,'角色管理','role/Go.do',1,'权限管理','1');
INSERT INTO `t_function` VALUES (3,'用户管理','user/Go.do',1,'权限管理','2');
INSERT INTO `t_function` VALUES (4,'功能','function/Go.do',1,'权限管理','3');
INSERT INTO `t_function` VALUES (5,'主数据','',-1,'根节点','2');
INSERT INTO `t_function` VALUES (6,'按部门','equipment/GoBM.do',5,'主数据','1');
INSERT INTO `t_function` VALUES (7,'按使用状态','equipment/GoZT.do',5,'主数据','2');
INSERT INTO `t_function` VALUES (8,'基本信息','',-1,'根节点','3');
INSERT INTO `t_function` VALUES (9,'设备分类','equipmentcategory/Go.do',8,'基本信息','1');
INSERT INTO `t_function` VALUES (10,'供应商','supplier/Go.do',8,'基本信息','2');
INSERT INTO `t_function` VALUES (11,'组织结构','department/Go.do',1,'权限管理','4');
INSERT INTO `t_function` VALUES (13,'按设备类型','equipment/GoLX.do',5,'主数据','3');
INSERT INTO `t_function` VALUES (14,'条件查询','equipment/condition.do',5,'主数据','4');
INSERT INTO `t_function` VALUES (15,'新增设备','equipment/GoSave.do',5,'主数据','5');
INSERT INTO `t_function` VALUES (16,'维保管理','',-1,'根节点','4');
INSERT INTO `t_function` VALUES (17,'添加维修计划','maintainplan/GoSave.do',16,'维保管理','1');
INSERT INTO `t_function` VALUES (18,'维修计划','maintainplan/Go.do',16,'维保管理','2');
INSERT INTO `t_function` VALUES (19,'工单管理','',-1,'根节点','5');
INSERT INTO `t_function` VALUES (20,'新增工单','maintainorder/GoSave.do',19,'工单管理','1');
INSERT INTO `t_function` VALUES (21,'工单列表','maintainorder/Go.do',19,'工单管理','2');
INSERT INTO `t_function` VALUES (22,'设备台账','',-1,'根节点','6');
INSERT INTO `t_function` VALUES (23,'新增台账','standing/GoSave.do',22,'设备台账','1');
INSERT INTO `t_function` VALUES (24,'台账展示','standing/Go.do',22,'设备台账','2');
INSERT INTO `t_function` VALUES (25,'报表管理','',-1,'根节点','7');
INSERT INTO `t_function` VALUES (26,'月季金额报表','report/goStandingMonth.do',25,'报表管理','1');
INSERT INTO `t_function` VALUES (27,'月季数量报表','report/goStandingCount.do',25,'报表管理','2');
INSERT INTO `t_function` VALUES (28,'知识库管理','',-1,'根节点','8');
INSERT INTO `t_function` VALUES (31,'分类知识管理','knowledge/Go.do',28,'知识库管理','1');
INSERT INTO `t_function` VALUES (32,'添加保养计划','protect/GoSave.do',16,'维保管理','3');
INSERT INTO `t_function` VALUES (33,'保养计划','protect/Go.do',16,'维保管理','4');
INSERT INTO `t_function` VALUES (34,'设备配件管理','',-1,'根节点','9');
INSERT INTO `t_function` VALUES (35,'配件分类','equipmentpart/Go.do',34,'设备配件管理','1');
/*!40000 ALTER TABLE `t_function` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_knowledge
#

DROP TABLE IF EXISTS `t_knowledge`;
CREATE TABLE `t_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `classify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类别',
  `uploadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `accessory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件',
  `imgs` varchar(360) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `ext1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `ext2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `ext3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ext4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ext5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table t_knowledge
#
LOCK TABLES `t_knowledge` WRITE;
/*!40000 ALTER TABLE `t_knowledge` DISABLE KEYS */;

INSERT INTO `t_knowledge` VALUES (34,'郭襄','合同','2016-01-25 10:30:42',NULL,'upload/111.jpg','upload/5CFE252E63BC7ABA267B2B19DB0424F0.jpeg','upload/222.jpg','','','');
INSERT INTO `t_knowledge` VALUES (35,'杨过','技术文档','2016-01-25 10:33:03',NULL,'upload\\333.jpg','upload\\555.jpg','upload\\444.jpg','','','');
INSERT INTO `t_knowledge` VALUES (36,'小龙女','合同','2016-01-25 10:33:42',NULL,'upload\\0bd162d9f2d3572c93ff0be28913632762d0c3eb.jpg','upload\\5CFE252E63BC7ABA267B2B19DB0424F0.jpeg','upload\\111.jpg','','','');
INSERT INTO `t_knowledge` VALUES (37,'黄蓉','合同','2016-01-25 10:34:18',NULL,'upload/333.jpg','upload/psb (1).jpg','upload/5CFE252E63BC7ABA267B2B19DB0424F0.jpeg','','','');
INSERT INTO `t_knowledge` VALUES (38,'郭靖','技术文档','2016-01-26 15:36:15',NULL,'upload\\111.jpg','upload\\222.jpg','upload\\333.jpg',NULL,NULL,NULL);
INSERT INTO `t_knowledge` VALUES (39,'周芷若','合同','2016-01-27 14:19:27',NULL,'upload/u=606383730,2010157794&fm=21&gp=0.jpg','upload/u=777215192,3426878957&fm=21&gp=0.jpg','upload/u=2534508684,761730951&fm=21&gp=0.jpg',NULL,NULL,NULL);
INSERT INTO `t_knowledge` VALUES (40,'哈哈哈','合同','2016-01-29 14:51:30',NULL,'upload/u=196024968,2454780024&fm=21&gp=0.jpg','upload/u=718889327,3941597842&fm=21&gp=0.jpg','upload/u=4027421683,2923566180&fm=21&gp=0.jpg',NULL,NULL,NULL);
INSERT INTO `t_knowledge` VALUES (41,'令狐冲','合同','2016-02-02 10:28:36',NULL,'upload/333.jpg','upload/5CFE252E63BC7ABA267B2B19DB0424F0.jpeg','upload/000.jpg',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_maintainorder
#

DROP TABLE IF EXISTS `t_maintainorder`;
CREATE TABLE `t_maintainorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(40) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `dnum` varchar(40) DEFAULT NULL COMMENT '设备编号',
  `unit` varchar(20) DEFAULT NULL,
  `dname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `mlevel` varchar(10) DEFAULT NULL COMMENT '维修级别',
  `man` varchar(50) DEFAULT NULL,
  `dotime` datetime DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `standard` varchar(100) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `flag` varchar(40) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `ext1` varchar(200) DEFAULT NULL,
  `ext2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_maintainorder
#
LOCK TABLES `t_maintainorder` WRITE;
/*!40000 ALTER TABLE `t_maintainorder` DISABLE KEYS */;

INSERT INTO `t_maintainorder` VALUES (1,'00000','货梯','00001','吨','维修部','一级','刘东赫','2016-01-20 15:41:02','换部件','可用','啦啦啦啦','未完成',3,NULL,NULL);
INSERT INTO `t_maintainorder` VALUES (2,'00002','哈尔滨','00002','无','办公室','一级','刘东赫','2016-01-25 16:27:48','电梯','可用','哈哈','未完成',2,NULL,NULL);
/*!40000 ALTER TABLE `t_maintainorder` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_maintainplan
#

DROP TABLE IF EXISTS `t_maintainplan`;
CREATE TABLE `t_maintainplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) DEFAULT NULL,
  `num` varchar(40) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `dname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `mlevel` varchar(10) DEFAULT NULL COMMENT '维修级别',
  `method` varchar(10) DEFAULT NULL,
  `man` varchar(50) DEFAULT NULL,
  `dotime` datetime DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `standard` varchar(100) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `ext1` varchar(200) DEFAULT NULL,
  `ext2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_maintainplan
#
LOCK TABLES `t_maintainplan` WRITE;
/*!40000 ALTER TABLE `t_maintainplan` DISABLE KEYS */;

INSERT INTO `t_maintainplan` VALUES (1,'哈尔滨','00002','无','办公室','一级','on','张三','2016-01-11','启用','电梯','良好','哈哈',2,NULL,NULL);
INSERT INTO `t_maintainplan` VALUES (2,'货梯','00001','吨','维修部','1','月循环','张梓','2016-04-22','启动','货梯','','',3,NULL,NULL);
/*!40000 ALTER TABLE `t_maintainplan` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_protect
#

DROP TABLE IF EXISTS `t_protect`;
CREATE TABLE `t_protect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `num` varchar(40) DEFAULT NULL COMMENT '设备编号',
  `unit` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `dname` varchar(50) DEFAULT NULL COMMENT '所在部门名称',
  `mlevel` varchar(10) DEFAULT NULL COMMENT '保养级别',
  `method` varchar(10) DEFAULT NULL COMMENT '计划保养循环类型',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `dotime` datetime DEFAULT NULL COMMENT '下次保养时间',
  `man` varchar(50) DEFAULT NULL COMMENT '保养人员',
  `project` varchar(50) DEFAULT NULL COMMENT '保养项目',
  `eid` int(11) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL COMMENT '保养内容',
  `plannum` varchar(50) DEFAULT NULL COMMENT '计划单号',
  `ext1` varchar(200) DEFAULT NULL,
  `standard` varchar(200) DEFAULT NULL COMMENT '保养标准',
  `ext2` varchar(200) DEFAULT NULL COMMENT '计划保养内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_protect
#
LOCK TABLES `t_protect` WRITE;
/*!40000 ALTER TABLE `t_protect` DISABLE KEYS */;

INSERT INTO `t_protect` VALUES (2,'哈尔滨','00002','无','办公室','1','执行一次','保养中','2016-02-29','谁谁','柏林特',2,'xxx','',NULL,'高',NULL);
INSERT INTO `t_protect` VALUES (5,'货梯','00001','吨','维修部','2','循环多次','已结束','2017-01-31','上帝','柏林特2',3,'你好','B003',NULL,'很好','东东');
INSERT INTO `t_protect` VALUES (6,'货梯','00001','吨','维修部','1级','循环多次','有效','2018-01-30','大神','柏林特3',3,'省略。。','X0003',NULL,'高高','不清楚');
INSERT INTO `t_protect` VALUES (7,'哈尔滨','00002','无','办公室','2','循环多次','','2016-03-30','王二','',2,'','',NULL,'','');
/*!40000 ALTER TABLE `t_protect` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_rf
#

DROP TABLE IF EXISTS `t_rf`;
CREATE TABLE `t_rf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '角色id外键',
  `fid` int(11) DEFAULT NULL COMMENT '功能外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_rf
#
LOCK TABLES `t_rf` WRITE;
/*!40000 ALTER TABLE `t_rf` DISABLE KEYS */;

INSERT INTO `t_rf` VALUES (236,2,16);
INSERT INTO `t_rf` VALUES (237,2,17);
INSERT INTO `t_rf` VALUES (238,2,18);
INSERT INTO `t_rf` VALUES (239,2,19);
INSERT INTO `t_rf` VALUES (240,2,20);
INSERT INTO `t_rf` VALUES (241,2,21);
INSERT INTO `t_rf` VALUES (242,2,32);
INSERT INTO `t_rf` VALUES (243,2,33);
INSERT INTO `t_rf` VALUES (244,1,35);
INSERT INTO `t_rf` VALUES (245,1,18);
INSERT INTO `t_rf` VALUES (246,1,33);
INSERT INTO `t_rf` VALUES (247,1,24);
INSERT INTO `t_rf` VALUES (248,1,21);
INSERT INTO `t_rf` VALUES (249,1,5);
INSERT INTO `t_rf` VALUES (250,1,25);
INSERT INTO `t_rf` VALUES (251,1,7);
INSERT INTO `t_rf` VALUES (252,1,11);
INSERT INTO `t_rf` VALUES (253,1,17);
INSERT INTO `t_rf` VALUES (254,1,9);
INSERT INTO `t_rf` VALUES (255,1,31);
INSERT INTO `t_rf` VALUES (256,1,26);
INSERT INTO `t_rf` VALUES (257,1,1);
INSERT INTO `t_rf` VALUES (258,1,13);
INSERT INTO `t_rf` VALUES (259,1,32);
INSERT INTO `t_rf` VALUES (260,1,4);
INSERT INTO `t_rf` VALUES (261,1,16);
INSERT INTO `t_rf` VALUES (262,1,14);
INSERT INTO `t_rf` VALUES (263,1,19);
INSERT INTO `t_rf` VALUES (264,1,22);
INSERT INTO `t_rf` VALUES (265,1,20);
INSERT INTO `t_rf` VALUES (266,1,34);
INSERT INTO `t_rf` VALUES (267,1,28);
INSERT INTO `t_rf` VALUES (268,1,8);
INSERT INTO `t_rf` VALUES (269,1,27);
INSERT INTO `t_rf` VALUES (270,1,23);
INSERT INTO `t_rf` VALUES (271,1,3);
INSERT INTO `t_rf` VALUES (272,1,10);
INSERT INTO `t_rf` VALUES (273,1,6);
INSERT INTO `t_rf` VALUES (274,1,15);
INSERT INTO `t_rf` VALUES (275,1,2);
/*!40000 ALTER TABLE `t_rf` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_role
#

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(40) DEFAULT NULL COMMENT '角色编号',
  `name` varchar(50) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL COMMENT '功能外键',
  `del` char(1) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_role
#
LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;

INSERT INTO `t_role` VALUES (1,'00000','超级用户',NULL,'0','管理员',NULL);
INSERT INTO `t_role` VALUES (2,'00001','技工人员',NULL,'0','普通用户',NULL);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_serialnum
#

DROP TABLE IF EXISTS `t_serialnum`;
CREATE TABLE `t_serialnum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `stime` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_serialnum
#
LOCK TABLES `t_serialnum` WRITE;
/*!40000 ALTER TABLE `t_serialnum` DISABLE KEYS */;

INSERT INTO `t_serialnum` VALUES (6,'user',9,'2016-03-23');
INSERT INTO `t_serialnum` VALUES (7,'xxx',3,'2016-01-11');
INSERT INTO `t_serialnum` VALUES (8,'role',2,'2016-03-22');
INSERT INTO `t_serialnum` VALUES (9,'quipcate',5,'2016-02-02');
INSERT INTO `t_serialnum` VALUES (10,'department',2,'2016-03-23');
INSERT INTO `t_serialnum` VALUES (11,'equipment',7,'2016-03-24');
INSERT INTO `t_serialnum` VALUES (12,'gd',3,'2016-01-25');
INSERT INTO `t_serialnum` VALUES (13,'standing',1,'2016-01-25');
/*!40000 ALTER TABLE `t_serialnum` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_standing
#

DROP TABLE IF EXISTS `t_standing`;
CREATE TABLE `t_standing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `num` varchar(15) DEFAULT NULL COMMENT '设备数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '设备型号',
  `cid` int(11) DEFAULT NULL COMMENT '类别id',
  `category` varchar(10) DEFAULT NULL COMMENT '设备类别',
  `creater` varchar(50) DEFAULT NULL COMMENT '厂商',
  `sid` int(11) DEFAULT NULL COMMENT '供应商id',
  `supplier` varchar(50) DEFAULT NULL COMMENT '供应商',
  `flag` varchar(1) DEFAULT NULL COMMENT '0重型设备，1一般设备，2大型设备',
  `intime` datetime DEFAULT NULL COMMENT '购入时间',
  `certifier` varchar(50) DEFAULT NULL COMMENT '资产证明人',
  `deperction` varchar(20) DEFAULT NULL COMMENT '折旧方式',
  `perPrice` double(10,2) DEFAULT NULL COMMENT '资产原值',
  `rate` int(3) DEFAULT NULL COMMENT '净残率',
  `useStatus` varchar(15) DEFAULT NULL COMMENT '使用情况',
  `did` int(11) DEFAULT NULL COMMENT '部门id',
  `dname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作员',
  `place` varchar(70) DEFAULT NULL COMMENT '安装地点',
  `ext1` varchar(200) DEFAULT NULL,
  `ext7` varchar(200) DEFAULT NULL,
  `ext2` varchar(200) DEFAULT NULL,
  `ext3` varchar(200) DEFAULT NULL,
  `ext4` varchar(200) DEFAULT NULL,
  `ext5` varchar(200) DEFAULT NULL,
  `ext6` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_standing
#
LOCK TABLES `t_standing` WRITE;
/*!40000 ALTER TABLE `t_standing` DISABLE KEYS */;

INSERT INTO `t_standing` VALUES (1,'电梯',NULL,'100吨',4,NULL,'哈尔滨',1,NULL,'1','2016-01-05','刘东赫','现金',80000,34,'停用',NULL,'生成部',NULL,'厢房',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `t_standing` VALUES (2,'发电机','00000','吨',4,'医用电梯','刘东赫',1,'慧客指点','1','2016-01-05','刘东赫','现金',90000,34,'未启用',NULL,'质检部',NULL,'南岗',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_standing` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_supplier
#

DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `telphone` varchar(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table t_supplier
#
LOCK TABLES `t_supplier` WRITE;
/*!40000 ALTER TABLE `t_supplier` DISABLE KEYS */;

INSERT INTO `t_supplier` VALUES (1,'慧客指点','黑龙江哈尔滨','Mr.liu','1500000000','无',NULL,NULL);
/*!40000 ALTER TABLE `t_supplier` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table t_user
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(40) DEFAULT NULL COMMENT '编号',
  `uname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(60) DEFAULT NULL COMMENT '密码',
  `truename` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL COMMENT '住址',
  `flag` char(1) DEFAULT NULL COMMENT '在职什么的',
  `rid` int(11) DEFAULT NULL COMMENT '角色外键',
  `did` int(11) DEFAULT NULL COMMENT '部门id',
  `del` char(1) DEFAULT NULL COMMENT '删除标记。1删除，0，未删除',
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Dumping data for table t_user
#
LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;

INSERT INTO `t_user` VALUES (1,'00001','admin','admin','admin','0',NULL,NULL,NULL,NULL,1,1,'0','超级管理员','管理层');
INSERT INTO `t_user` VALUES (2,'00002','root','root','root','0','','','','',2,1,'0','库存管理员','信息部');
INSERT INTO `t_user` VALUES (3,'00003','blt','blt','blt','0','','','',NULL,2,1,'0','技工人员','信息部');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_alamworkitem
#

DROP TABLE IF EXISTS `tb_alamworkitem`;
CREATE TABLE `tb_alamworkitem` (
  `alamid` int(11) NOT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `createby` varchar(10) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `finishtime` datetime DEFAULT NULL,
  `alamcontent` varchar(255) DEFAULT NULL,
  `eqspareid` int(11) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `eqstatus` char(1) DEFAULT NULL,
  `handstatus` char(1) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  `alamtype` varchar(10) DEFAULT NULL,
  `alamworktype` char(1) DEFAULT NULL,
  PRIMARY KEY (`alamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_alamworkitem
#
LOCK TABLES `tb_alamworkitem` WRITE;
/*!40000 ALTER TABLE `tb_alamworkitem` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_alamworkitem` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_alarmpara
#

DROP TABLE IF EXISTS `tb_alarmpara`;
CREATE TABLE `tb_alarmpara` (
  `paramid` int(11) NOT NULL,
  `equipmentid` int(11) NOT NULL,
  `assigndate` datetime DEFAULT NULL,
  `lthreshold` double DEFAULT NULL,
  `pararmid` int(11) NOT NULL,
  `disable` char(1) NOT NULL,
  `operator` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`equipmentid`,`pararmid`,`paramid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_alarmpara
#
LOCK TABLES `tb_alarmpara` WRITE;
/*!40000 ALTER TABLE `tb_alarmpara` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_alarmpara` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_corpinfo
#

DROP TABLE IF EXISTS `tb_corpinfo`;
CREATE TABLE `tb_corpinfo` (
  `corpid` int(11) NOT NULL DEFAULT '0',
  `corpcode` varchar(20) DEFAULT NULL,
  `corporation` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `handledate` date DEFAULT NULL,
  PRIMARY KEY (`corpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_corpinfo
#
LOCK TABLES `tb_corpinfo` WRITE;
/*!40000 ALTER TABLE `tb_corpinfo` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_corpinfo` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_departinfo
#

DROP TABLE IF EXISTS `tb_departinfo`;
CREATE TABLE `tb_departinfo` (
  `departid` int(11) NOT NULL,
  `departcode` varchar(20) DEFAULT NULL,
  `departname` varchar(100) DEFAULT NULL,
  `parentdepcode` varchar(30) DEFAULT NULL,
  `supervisor` varchar(10) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `disable` char(1) DEFAULT '0',
  `handledate` date DEFAULT NULL,
  PRIMARY KEY (`departid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_departinfo
#
LOCK TABLES `tb_departinfo` WRITE;
/*!40000 ALTER TABLE `tb_departinfo` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_departinfo` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_eqdiscard
#

DROP TABLE IF EXISTS `tb_eqdiscard`;
CREATE TABLE `tb_eqdiscard` (
  `discardid` int(11) NOT NULL,
  `eqdiscardno` varchar(30) NOT NULL,
  `fixedassetsno` varchar(30) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `reason` varchar(30) DEFAULT NULL,
  `eqstatus` char(1) DEFAULT NULL,
  `operator` varchar(10) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  `auditperson` varchar(10) DEFAULT NULL,
  `auditdate` datetime DEFAULT NULL,
  `knowbyfinan` char(1) DEFAULT NULL,
  PRIMARY KEY (`discardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_eqdiscard
#
LOCK TABLES `tb_eqdiscard` WRITE;
/*!40000 ALTER TABLE `tb_eqdiscard` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_eqdiscard` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_eqmeasureparam
#

DROP TABLE IF EXISTS `tb_eqmeasureparam`;
CREATE TABLE `tb_eqmeasureparam` (
  `measureparacode` varchar(30) NOT NULL,
  `paraname` varchar(50) DEFAULT NULL,
  `paraminvalue` double DEFAULT NULL,
  `abc` char(1) DEFAULT NULL,
  `paramaxvalue` double DEFAULT NULL,
  `eqcategoryid` int(11) NOT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `operadate` datetime DEFAULT NULL,
  PRIMARY KEY (`measureparacode`,`eqcategoryid`),
  KEY `Relationship21` (`eqcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_eqmeasureparam
#
LOCK TABLES `tb_eqmeasureparam` WRITE;
/*!40000 ALTER TABLE `tb_eqmeasureparam` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_eqmeasureparam` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_eqparahistory
#

DROP TABLE IF EXISTS `tb_eqparahistory`;
CREATE TABLE `tb_eqparahistory` (
  `recordid` int(11) NOT NULL,
  `equipmentid` int(11) NOT NULL,
  `assigndate` datetime NOT NULL,
  `value` double DEFAULT NULL,
  `operator` varchar(10) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `pararmid` int(11) NOT NULL,
  PRIMARY KEY (`equipmentid`,`assigndate`,`recordid`,`pararmid`),
  KEY `Relationship27` (`equipmentid`,`pararmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_eqparahistory
#
LOCK TABLES `tb_eqparahistory` WRITE;
/*!40000 ALTER TABLE `tb_eqparahistory` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_eqparahistory` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_eqrealpara
#

DROP TABLE IF EXISTS `tb_eqrealpara`;
CREATE TABLE `tb_eqrealpara` (
  `pararid` int(11) NOT NULL,
  `equipmentid` int(11) NOT NULL,
  `eqcategoryid` int(11) DEFAULT NULL,
  `measureparacode` varchar(30) NOT NULL,
  `lastvalue` varchar(100) DEFAULT NULL,
  `assigndate` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  PRIMARY KEY (`equipmentid`,`pararid`),
  KEY `IX_Relationship25` (`measureparacode`,`eqcategoryid`),
  KEY `IX_Relationship28` (`eqcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_eqrealpara
#
LOCK TABLES `tb_eqrealpara` WRITE;
/*!40000 ALTER TABLE `tb_eqrealpara` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_eqrealpara` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_equiparchives
#

DROP TABLE IF EXISTS `tb_equiparchives`;
CREATE TABLE `tb_equiparchives` (
  `archivesid` int(11) NOT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `archivescode` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `keywords` varchar(30) DEFAULT NULL,
  `content` longblob,
  `version` varchar(30) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`archivesid`),
  KEY `IX_Relationship13` (`equipmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_equiparchives
#
LOCK TABLES `tb_equiparchives` WRITE;
/*!40000 ALTER TABLE `tb_equiparchives` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_equiparchives` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_equipcategory
#

DROP TABLE IF EXISTS `tb_equipcategory`;
CREATE TABLE `tb_equipcategory` (
  `eqcategoryid` int(11) NOT NULL,
  `eqcategoreycode` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `suppercode` varchar(30) DEFAULT NULL,
  `dsize` varchar(30) DEFAULT NULL,
  `power` decimal(38,0) DEFAULT NULL,
  `techobjtype` varchar(30) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`eqcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_equipcategory
#
LOCK TABLES `tb_equipcategory` WRITE;
/*!40000 ALTER TABLE `tb_equipcategory` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_equipcategory` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_equipment
#

DROP TABLE IF EXISTS `tb_equipment`;
CREATE TABLE `tb_equipment` (
  `equipmentid` int(11) NOT NULL COMMENT '设备id',
  `supperid` varchar(30) DEFAULT NULL COMMENT '父设备id',
  `serial` varchar(30) DEFAULT NULL COMMENT '序列号',
  `materialcode` varchar(30) DEFAULT NULL COMMENT '物料编码',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `desc` varchar(30) DEFAULT NULL COMMENT '设备说明',
  `disable` char(1) DEFAULT NULL COMMENT '有效性',
  `manufactureid` int(11) DEFAULT NULL COMMENT '制造商编号',
  `supplierid` int(11) DEFAULT NULL COMMENT '供应商编号',
  `purchaseprice` float DEFAULT NULL COMMENT '购买金额',
  `agelimit` varchar(6) DEFAULT NULL COMMENT '使用年限',
  `purchasedate` timestamp NULL DEFAULT NULL COMMENT '购买日期',
  `financecategory` varchar(30) DEFAULT NULL COMMENT '财务类别',
  `source` varchar(30) DEFAULT NULL COMMENT '使用部门编号',
  `audit` varchar(30) DEFAULT NULL COMMENT '验收情况',
  `auditdate` varchar(30) DEFAULT NULL COMMENT '验收日期',
  `auditoperator` varchar(30) DEFAULT NULL COMMENT '验收人',
  `techparam` char(20) DEFAULT NULL COMMENT '设备技术参数',
  `fixedassetnum` char(20) DEFAULT NULL,
  `remark` char(20) DEFAULT NULL COMMENT '备注',
  `eqcategoryid` int(11) DEFAULT NULL COMMENT '设备分类id',
  `funcid` int(11) DEFAULT NULL COMMENT '功能位置id',
  `authgroup` varchar(10) DEFAULT NULL COMMENT '授权组',
  `equipname` varchar(20) DEFAULT NULL COMMENT '设备名称',
  `deptname` varchar(20) DEFAULT NULL COMMENT '使用部门名称',
  `manuname` varchar(30) DEFAULT NULL COMMENT '制造商名称',
  `suppliername` varchar(30) DEFAULT NULL COMMENT '供应商名称',
  `flag` char(1) DEFAULT NULL COMMENT '设备标识',
  `inmethod` char(1) DEFAULT NULL COMMENT '购置方式',
  `certifier` varchar(30) DEFAULT NULL COMMENT '资产证明人',
  `deprection` char(1) DEFAULT NULL COMMENT '折旧方式',
  `prePrice` double(10,2) DEFAULT NULL COMMENT '资产原值',
  `rate` double(2,2) DEFAULT NULL COMMENT '净残率',
  `checkRound` varchar(8) DEFAULT NULL COMMENT '检验周期',
  `preCheck` timestamp(6) NULL DEFAULT NULL COMMENT '上次检验',
  `nextCheck` timestamp(6) NULL DEFAULT NULL COMMENT '下次检验',
  `preMaintain` timestamp(6) NULL DEFAULT NULL COMMENT '上次维修',
  `useStatus` char(1) DEFAULT NULL COMMENT '使用情况:启用1，在用2，出租3，停用4',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作人',
  `extl` varchar(300) DEFAULT NULL COMMENT '自定义冗余',
  `del` char(1) DEFAULT '1' COMMENT '0，删除;1,不是删除；默认是1',
  `deptid` int(10) DEFAULT NULL COMMENT '部门主键',
  PRIMARY KEY (`equipmentid`),
  UNIQUE KEY `设备ID` (`equipmentid`),
  KEY `IX_Relationship29` (`manufactureid`),
  KEY `IX_Relationship30` (`supplierid`),
  KEY `equipcat` (`eqcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_equipment
#
LOCK TABLES `tb_equipment` WRITE;
/*!40000 ALTER TABLE `tb_equipment` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_equipment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_equipmentsetup
#

DROP TABLE IF EXISTS `tb_equipmentsetup`;
CREATE TABLE `tb_equipmentsetup` (
  `equipsetupid` int(11) NOT NULL,
  `startdate` datetime DEFAULT NULL,
  `expiredate` datetime DEFAULT NULL,
  `equipmentid` int(11) NOT NULL,
  `funclid` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `operatetype` char(1) DEFAULT NULL,
  `operatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`equipmentid`,`funclid`,`equipsetupid`),
  KEY `locequiprecord` (`funclid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_equipmentsetup
#
LOCK TABLES `tb_equipmentsetup` WRITE;
/*!40000 ALTER TABLE `tb_equipmentsetup` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_equipmentsetup` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_equipspare
#

DROP TABLE IF EXISTS `tb_equipspare`;
CREATE TABLE `tb_equipspare` (
  `spareid` int(11) NOT NULL,
  `sparename` varchar(30) DEFAULT NULL,
  `quantity` decimal(38,0) DEFAULT NULL,
  `uomcode` varchar(20) NOT NULL,
  `eqcategoryid` int(11) NOT NULL,
  `equitmentid` int(11) DEFAULT NULL,
  `fixedassetnum` varchar(30) DEFAULT NULL,
  `有效性` char(1) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`spareid`,`eqcategoryid`),
  KEY `equitmentmm` (`eqcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_equipspare
#
LOCK TABLES `tb_equipspare` WRITE;
/*!40000 ALTER TABLE `tb_equipspare` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_equipspare` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_faultdiagnosis
#

DROP TABLE IF EXISTS `tb_faultdiagnosis`;
CREATE TABLE `tb_faultdiagnosis` (
  `diagnosisid` int(11) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `faultcode` varchar(30) DEFAULT NULL,
  `Performchar` varchar(100) DEFAULT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`diagnosisid`),
  KEY `IX_Relationship17` (`equipmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_faultdiagnosis
#
LOCK TABLES `tb_faultdiagnosis` WRITE;
/*!40000 ALTER TABLE `tb_faultdiagnosis` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_faultdiagnosis` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_faulthistory
#

DROP TABLE IF EXISTS `tb_faulthistory`;
CREATE TABLE `tb_faulthistory` (
  `faultid` int(11) NOT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `hanleresult` varchar(100) DEFAULT NULL,
  `createby` varchar(10) DEFAULT NULL,
  `handleby` varchar(10) DEFAULT NULL,
  `alamdate` datetime DEFAULT NULL,
  `handledate` datetime DEFAULT NULL,
  `workitemid` int(11) DEFAULT NULL,
  PRIMARY KEY (`faultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_faulthistory
#
LOCK TABLES `tb_faulthistory` WRITE;
/*!40000 ALTER TABLE `tb_faulthistory` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_faulthistory` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_faulttype
#

DROP TABLE IF EXISTS `tb_faulttype`;
CREATE TABLE `tb_faulttype` (
  `faultcode` varchar(30) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `abc` char(1) DEFAULT NULL,
  `faultrate` decimal(38,0) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`faultcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_faulttype
#
LOCK TABLES `tb_faulttype` WRITE;
/*!40000 ALTER TABLE `tb_faulttype` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_faulttype` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_fixedassets
#

DROP TABLE IF EXISTS `tb_fixedassets`;
CREATE TABLE `tb_fixedassets` (
  `fixedascode` varchar(30) NOT NULL,
  `catcode` varchar(30) DEFAULT NULL,
  `supplierid` int(11) DEFAULT NULL,
  `manufacturerid` int(11) DEFAULT NULL,
  `productdate` datetime DEFAULT NULL,
  `assetsdate` datetime DEFAULT NULL,
  `Initialprice` double DEFAULT NULL,
  `deprecperiod` double DEFAULT NULL,
  `deprecrule` double DEFAULT NULL,
  `Guarantee` datetime DEFAULT NULL,
  `eqcategoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`fixedascode`),
  KEY `IX_Relationship22` (`eqcategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_fixedassets
#
LOCK TABLES `tb_fixedassets` WRITE;
/*!40000 ALTER TABLE `tb_fixedassets` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_fixedassets` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_funclocation
#

DROP TABLE IF EXISTS `tb_funclocation`;
CREATE TABLE `tb_funclocation` (
  `funclid` int(11) NOT NULL,
  `funcloccode` varchar(30) NOT NULL,
  `suppercode` varchar(30) DEFAULT NULL,
  `catcode` varchar(8) DEFAULT NULL,
  `equipmentcode` varchar(8) DEFAULT NULL,
  `valid` char(1) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  `supplierid` int(11) DEFAULT NULL,
  `roomno` varchar(50) DEFAULT NULL,
  `abc` char(1) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`funclid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_funclocation
#
LOCK TABLES `tb_funclocation` WRITE;
/*!40000 ALTER TABLE `tb_funclocation` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_funclocation` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_manufacture
#

DROP TABLE IF EXISTS `tb_manufacture`;
CREATE TABLE `tb_manufacture` (
  `manufactureid` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contract` varchar(30) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`manufactureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_manufacture
#
LOCK TABLES `tb_manufacture` WRITE;
/*!40000 ALTER TABLE `tb_manufacture` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_manufacture` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_masterdata
#

DROP TABLE IF EXISTS `tb_masterdata`;
CREATE TABLE `tb_masterdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名次',
  `num` varchar(40) DEFAULT NULL COMMENT '设备编号',
  `unit` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `category` int(10) DEFAULT NULL COMMENT '设备类型',
  `creater` int(10) DEFAULT NULL COMMENT '生产厂商主键编号',
  `creatername` varchar(40) DEFAULT NULL COMMENT '生产厂商名称',
  `supplier` int(10) DEFAULT NULL COMMENT '供应商主键编号',
  `suppliername` varchar(40) DEFAULT NULL COMMENT '供应商名称',
  `flag` char(1) DEFAULT NULL COMMENT '设备标志',
  `intime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '购置时间',
  `inmethod` char(1) DEFAULT NULL COMMENT '购置方式',
  `certifier` varchar(50) DEFAULT NULL COMMENT '资产证明人',
  `deprection` char(1) DEFAULT NULL COMMENT '折旧方式',
  `prePrice` double(10,2) DEFAULT NULL COMMENT '资产原值',
  `rate` double(2,2) DEFAULT NULL COMMENT '净残率',
  `checkRound` varchar(8) DEFAULT NULL COMMENT '检验周期',
  `preCheck` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' COMMENT '上次检验',
  `nextCheck` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' COMMENT '下次检验',
  `preMaintain` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' COMMENT '上次维修',
  `useStatus` char(1) DEFAULT NULL COMMENT '使用情况',
  `deptid` int(10) DEFAULT NULL COMMENT '使用部门id',
  `deptname` varchar(30) DEFAULT NULL COMMENT '使用部门名称',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作人',
  `place` varchar(100) DEFAULT NULL COMMENT '安装地点',
  `checkStatus` char(1) DEFAULT NULL COMMENT '检查情况',
  `extl` varchar(200) DEFAULT NULL COMMENT '冗余1-10',
  `del` char(1) DEFAULT NULL COMMENT '0:删除;1,不是删除;默认:1',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_masterdata
#
LOCK TABLES `tb_masterdata` WRITE;
/*!40000 ALTER TABLE `tb_masterdata` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_masterdata` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_materialitem
#

DROP TABLE IF EXISTS `tb_materialitem`;
CREATE TABLE `tb_materialitem` (
  `sparecode` varchar(30) NOT NULL,
  `mmname` varchar(50) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sparecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_materialitem
#
LOCK TABLES `tb_materialitem` WRITE;
/*!40000 ALTER TABLE `tb_materialitem` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_materialitem` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_organization
#

DROP TABLE IF EXISTS `tb_organization`;
CREATE TABLE `tb_organization` (
  `orgid` int(11) NOT NULL,
  `corpcode` varchar(30) DEFAULT NULL,
  `departcode` varchar(30) DEFAULT NULL,
  `parentdepcode` varchar(30) DEFAULT NULL,
  `operdate` date DEFAULT NULL,
  PRIMARY KEY (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_organization
#
LOCK TABLES `tb_organization` WRITE;
/*!40000 ALTER TABLE `tb_organization` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_organization` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_procecontrol
#

DROP TABLE IF EXISTS `tb_procecontrol`;
CREATE TABLE `tb_procecontrol` (
  `eqcontrid` int(11) NOT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `funcloccode` varchar(30) DEFAULT NULL,
  `contrtechparam` varchar(30) DEFAULT NULL,
  `eqstatus` char(1) DEFAULT NULL,
  `collectinterval` varchar(30) DEFAULT NULL,
  `alamparaid` int(11) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  `operator` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eqcontrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_procecontrol
#
LOCK TABLES `tb_procecontrol` WRITE;
/*!40000 ALTER TABLE `tb_procecontrol` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_procecontrol` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_repairsolution
#

DROP TABLE IF EXISTS `tb_repairsolution`;
CREATE TABLE `tb_repairsolution` (
  `solutionid` int(11) NOT NULL,
  `faultcode` varchar(30) NOT NULL,
  `opprocedure` varchar(255) DEFAULT NULL,
  `laborstandard` double DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `precondition` varchar(255) DEFAULT NULL,
  `postnotes` varchar(255) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `recorddate` datetime DEFAULT NULL,
  PRIMARY KEY (`faultcode`,`solutionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_repairsolution
#
LOCK TABLES `tb_repairsolution` WRITE;
/*!40000 ALTER TABLE `tb_repairsolution` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_repairsolution` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_spotinsplan
#

DROP TABLE IF EXISTS `tb_spotinsplan`;
CREATE TABLE `tb_spotinsplan` (
  `planid` int(11) NOT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `plandate` datetime DEFAULT NULL,
  `period` varchar(6) DEFAULT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `standard` varchar(50) DEFAULT NULL,
  `createby` varchar(10) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  PRIMARY KEY (`planid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_spotinsplan
#
LOCK TABLES `tb_spotinsplan` WRITE;
/*!40000 ALTER TABLE `tb_spotinsplan` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_spotinsplan` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_spotinsworkitem
#

DROP TABLE IF EXISTS `tb_spotinsworkitem`;
CREATE TABLE `tb_spotinsworkitem` (
  `spotinsid` int(11) NOT NULL,
  `equipmentid` int(11) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `workitemid` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `Faultcode` varchar(30) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `finishtime` datetime DEFAULT NULL,
  `operator` varchar(10) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`spotinsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_spotinsworkitem
#
LOCK TABLES `tb_spotinsworkitem` WRITE;
/*!40000 ALTER TABLE `tb_spotinsworkitem` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_spotinsworkitem` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_supplier
#

DROP TABLE IF EXISTS `tb_supplier`;
CREATE TABLE `tb_supplier` (
  `supplierid` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_supplier
#
LOCK TABLES `tb_supplier` WRITE;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_uom
#

DROP TABLE IF EXISTS `tb_uom`;
CREATE TABLE `tb_uom` (
  `uomcode` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `isprimary` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  PRIMARY KEY (`uomcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_uom
#
LOCK TABLES `tb_uom` WRITE;
/*!40000 ALTER TABLE `tb_uom` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_uom` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_workitem
#

DROP TABLE IF EXISTS `tb_workitem`;
CREATE TABLE `tb_workitem` (
  `workitemid` int(11) NOT NULL,
  `faultcode` char(20) DEFAULT NULL,
  `createdtime` varchar(30) DEFAULT NULL,
  `creadedby` varchar(30) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `disable` char(1) DEFAULT NULL,
  `totalexecutetime` double DEFAULT NULL,
  `completiontime` timestamp(6) NULL DEFAULT NULL,
  `respperson` varchar(10) DEFAULT NULL,
  `diagnosisid` int(11) DEFAULT NULL,
  PRIMARY KEY (`workitemid`),
  KEY `diagnosisworkitem` (`diagnosisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_workitem
#
LOCK TABLES `tb_workitem` WRITE;
/*!40000 ALTER TABLE `tb_workitem` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_workitem` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tb_workitemdetail
#

DROP TABLE IF EXISTS `tb_workitemdetail`;
CREATE TABLE `tb_workitemdetail` (
  `itemid` int(11) NOT NULL,
  `workitemid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `labortime` double DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `operator` varchar(10) DEFAULT NULL,
  `operdate` datetime DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `IX_Relationship19` (`workitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table tb_workitemdetail
#
LOCK TABLES `tb_workitemdetail` WRITE;
/*!40000 ALTER TABLE `tb_workitemdetail` DISABLE KEYS */;

/*!40000 ALTER TABLE `tb_workitemdetail` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table tb_alarmpara
#

ALTER TABLE `tb_alarmpara`
ADD CONSTRAINT `Relationship26` FOREIGN KEY (`equipmentid`, `pararmid`) REFERENCES `tb_eqrealpara` (`equipmentid`, `pararid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_eqmeasureparam
#

ALTER TABLE `tb_eqmeasureparam`
ADD CONSTRAINT `Relationship21` FOREIGN KEY (`eqcategoryid`) REFERENCES `tb_equipcategory` (`eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_eqparahistory
#

ALTER TABLE `tb_eqparahistory`
ADD CONSTRAINT `Relationship27` FOREIGN KEY (`equipmentid`, `pararmid`) REFERENCES `tb_eqrealpara` (`equipmentid`, `pararid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_eqrealpara
#

ALTER TABLE `tb_eqrealpara`
ADD CONSTRAINT `Relationship24` FOREIGN KEY (`equipmentid`) REFERENCES `tb_equipment` (`equipmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Relationship25` FOREIGN KEY (`measureparacode`, `eqcategoryid`) REFERENCES `tb_eqmeasureparam` (`measureparacode`, `eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Relationship28` FOREIGN KEY (`eqcategoryid`) REFERENCES `tb_equipcategory` (`eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_equiparchives
#

ALTER TABLE `tb_equiparchives`
ADD CONSTRAINT `equipcatdoc` FOREIGN KEY (`equipmentid`) REFERENCES `tb_equipcategory` (`eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_equipment
#

ALTER TABLE `tb_equipment`
ADD CONSTRAINT `equipcat` FOREIGN KEY (`eqcategoryid`) REFERENCES `tb_equipcategory` (`eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Relationship29` FOREIGN KEY (`manufactureid`) REFERENCES `tb_manufacture` (`manufactureid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Relationship30` FOREIGN KEY (`supplierid`) REFERENCES `tb_supplier` (`supplierid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_equipmentsetup
#

ALTER TABLE `tb_equipmentsetup`
ADD CONSTRAINT `eqlocrecord` FOREIGN KEY (`equipmentid`) REFERENCES `tb_equipment` (`equipmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `locequiprecord` FOREIGN KEY (`funclid`) REFERENCES `tb_funclocation` (`funclid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_equipspare
#

ALTER TABLE `tb_equipspare`
ADD CONSTRAINT `equitmentmm` FOREIGN KEY (`eqcategoryid`) REFERENCES `tb_equipcategory` (`eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_faultdiagnosis
#

ALTER TABLE `tb_faultdiagnosis`
ADD CONSTRAINT `equipdiagnosis` FOREIGN KEY (`equipmentid`) REFERENCES `tb_equipment` (`equipmentid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_fixedassets
#

ALTER TABLE `tb_fixedassets`
ADD CONSTRAINT `Relationship22` FOREIGN KEY (`eqcategoryid`) REFERENCES `tb_equipcategory` (`eqcategoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_repairsolution
#

ALTER TABLE `tb_repairsolution`
ADD CONSTRAINT `faultrepair` FOREIGN KEY (`faultcode`) REFERENCES `tb_faulttype` (`faultcode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_workitem
#

ALTER TABLE `tb_workitem`
ADD CONSTRAINT `diagnosisworkitem` FOREIGN KEY (`diagnosisid`) REFERENCES `tb_faultdiagnosis` (`diagnosisid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

#
#  Foreign keys for table tb_workitemdetail
#

ALTER TABLE `tb_workitemdetail`
ADD CONSTRAINT `workitemdetail` FOREIGN KEY (`workitemid`) REFERENCES `tb_workitem` (`workitemid`) ON DELETE NO ACTION ON UPDATE NO ACTION;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
