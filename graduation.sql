/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50020
Source Host           : localhost:3306
Source Database       : blt2

Target Server Type    : MYSQL
Target Server Version : 50020
File Encoding         : 65001

Date: 2017-11-25 16:14:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`fid`  int(11) NULL DEFAULT NULL COMMENT '本表父id' ,
`jc`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称' ,
`man`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主负责人' ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话' ,
`email`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真' ,
`info`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介' ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`level`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '级别' ,
`del`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='部门表'
/*!50003 AUTO_INCREMENT=2 */

;

-- ----------------------------
-- Records of t_department
-- ----------------------------
BEGIN;
INSERT INTO `t_department` VALUES ('1', '00000', '信息部', null, 'xx', '刘东赫', '8888888', '0451-999', '无', null, null, '2', null);
COMMIT;

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称' ,
`num`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备数量' ,
`unit`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号' ,
`cid`  int(11) NULL DEFAULT NULL COMMENT '类别id' ,
`category`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类别' ,
`creater`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商' ,
`sid`  int(11) NULL DEFAULT NULL COMMENT '供应商id' ,
`supplier`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商' ,
`flag`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0重型设备，1一般设备，2大型设备' ,
`intime`  datetime NULL DEFAULT NULL COMMENT '购入时间' ,
`certifier`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产证明人' ,
`deperction`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折旧方式' ,
`perPrice`  double(10,2) NULL DEFAULT NULL COMMENT '资产原值' ,
`rate`  int(3) NULL DEFAULT NULL COMMENT '净残率' ,
`checkRound`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查周期' ,
`preCheck`  datetime NULL DEFAULT NULL COMMENT '上次检验' ,
`nextCheck`  datetime NULL DEFAULT NULL COMMENT '下次检验' ,
`preMaintain`  datetime NULL DEFAULT NULL COMMENT '上次维修' ,
`useStatus`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用情况' ,
`did`  int(11) NULL DEFAULT NULL COMMENT '部门id' ,
`dname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`operator`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员' ,
`place`  varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装地点' ,
`ext1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext7`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext3`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext4`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext5`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext6`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=5 */

;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------
BEGIN;
INSERT INTO `t_equipment` VALUES ('1', '哈尔滨', '00002', '无', '3', '货梯', '哈尔滨市', null, '1', '0', '2016-01-05 00:00:00', '刘东赫', '现金', '52222.00', '2', '年', '2016-01-27 00:00:00', '2016-01-28 00:00:00', '2016-01-26 00:00:00', '未启用', '1', '办公室', null, '无', null, null, null, null, null, null, null), ('2', '货梯', '00001', '吨', '3', '货梯', '企业家和', '1', '慧客指点', '1', '2016-01-20 00:00:00', '刘东赫', '现金', '50000.00', '25', '1月', '2016-01-13 00:00:00', '2016-01-04 00:00:00', '2016-01-26 00:00:00', '禁用', '2', '维修部', null, '哈尔滨', null, null, null, null, null, null, null), ('3', '发电机', '00002', '5顿', '4', '医用电梯', '钱元坤和', '1', '慧客指点', '0', '2016-01-14 00:00:00', '刘东赫', '现金', '50000.00', '14', '一周', '2016-01-13 00:00:00', '2016-01-12 00:00:00', '2016-01-27 00:00:00', '出租', null, '质检部', null, '哈尔滨', null, null, null, null, null, null, null), ('4', '测试设备', '00006', '大大方方的', '2', '日用电梯', '打发反对法的', '1', '慧客指点', '0', '2016-03-24 00:00:00', '东方饭店', '发', '12.00', '12', '2016-03-30', '2016-03-03 00:00:00', '2016-04-06 00:00:00', '2016-03-07 00:00:00', '未启用', null, '生成部', null, '123323', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_equipmentcategory
-- ----------------------------
DROP TABLE IF EXISTS `t_equipmentcategory`;
CREATE TABLE `t_equipmentcategory` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`info`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明' ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '设备分类编码' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备分类名称' ,
`del`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效性；1无效，0有效' ,
`sid`  int(11) NULL DEFAULT NULL COMMENT '父id' ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext3`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='设备类别表'
/*!50003 AUTO_INCREMENT=7 */

;

-- ----------------------------
-- Records of t_equipmentcategory
-- ----------------------------
BEGIN;
INSERT INTO `t_equipmentcategory` VALUES ('2', '', '00000', '日用电梯', '0', null, null, null, null), ('3', '博林特货梯', '00001', '货梯', '0', null, null, null, null), ('4', '', '00002', '医用电梯', '0', null, null, null, null), ('5', '', '00003', '乘客电梯', '0', null, null, null, null), ('6', '博林特普通电梯', '00004', '乘客电梯', '0', null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_equipmentpart
-- ----------------------------
DROP TABLE IF EXISTS `t_equipmentpart`;
CREATE TABLE `t_equipmentpart` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`info`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配件说明' ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配件编码' ,
`name`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备配件名称' ,
`del`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '有效性 0 有效 1无效' ,
`sid`  int(10) NULL DEFAULT NULL COMMENT '父ID' ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext3`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=4 */

;

-- ----------------------------
-- Records of t_equipmentpart
-- ----------------------------
BEGIN;
INSERT INTO `t_equipmentpart` VALUES ('1', '货梯配件', '000001', '01配件', '0', null, '损坏', null, null), ('2', '货梯配件', '000002', '02配件', '0', null, '磨损', null, null), ('3', '货梯配件', '000003', '03配件', '0', null, '磨损', null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_function
-- ----------------------------
DROP TABLE IF EXISTS `t_function`;
CREATE TABLE `t_function` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`href`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接地址' ,
`fid`  int(11) NULL DEFAULT NULL COMMENT '父id' ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=34 */

;

-- ----------------------------
-- Records of t_function
-- ----------------------------
BEGIN;
INSERT INTO `t_function` VALUES ('1', '权限管理', '', '-1', '根节点', '1'), ('2', '角色管理', 'role/Go.do', '1', '权限管理', '1'), ('3', '用户管理', 'user/Go.do', '1', '权限管理', '2'), ('4', '功能', 'function/Go.do', '1', '权限管理', '3'), ('5', '主数据', '', '-1', '根节点', '2'), ('6', '按部门', 'equipment/GoBM.do', '5', '主数据', '1'), ('7', '按使用状态', 'equipment/GoZT.do', '5', '主数据', '2'), ('8', '基本信息', '', '-1', '根节点', '3'), ('9', '设备分类', 'equipmentcategory/Go.do', '8', '基本信息', '1'), ('10', '供应商', 'supplier/Go.do', '8', '基本信息', '2'), ('11', '组织结构', 'department/Go.do', '1', '权限管理', '4'), ('13', '按设备类型', 'equipment/GoLX.do', '5', '主数据', '3'), ('14', '条件查询', 'equipment/condition.do', '5', '主数据', '4'), ('15', '新增设备', 'equipment/GoSave.do', '5', '主数据', '5'), ('16', '维保管理', '', '-1', '根节点', '4'), ('17', '添加维修计划', 'maintainplan/GoSave.do', '16', '维保管理', '1'), ('18', '维修计划', 'maintainplan/Go.do', '16', '维保管理', '2'), ('19', '工单管理', '', '-1', '根节点', '5'), ('20', '新增工单', 'maintainorder/GoSave.do', '19', '工单管理', '1'), ('21', '工单列表', 'maintainorder/Go.do', '19', '工单管理', '2'), ('22', '设备台账', '', '-1', '根节点', '6'), ('23', '新增台账', 'standing/GoSave.do', '22', '设备台账', '1'), ('24', '台账展示', 'standing/Go.do', '22', '设备台账', '2'), ('25', '报表管理', '', '-1', '根节点', '7'), ('26', '月季金额报表', 'report/goStandingMonth.do', '25', '报表管理', '1'), ('27', '月季数量报表', 'report/goStandingCount.do', '25', '报表管理', '2'), ('28', '知识库管理', '', '-1', '根节点', '8'), ('31', '分类知识管理', 'knowledge/Go.do', '28', '知识库管理', '1'), ('32', '添加保养计划', 'protect/GoSave.do', '16', '维保管理', '3'), ('33', '保养计划', 'protect/Go.do', '16', '维保管理', '4');
COMMIT;

-- ----------------------------
-- Table structure for t_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledge`;
CREATE TABLE `t_knowledge` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`filename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名称' ,
`classify`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '类别' ,
`uploadDate`  timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间' ,
`accessory`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '附件' ,
`imgs`  varchar(360) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图片' ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图片' ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图片' ,
`ext3`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`ext4`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`ext5`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_unicode_ci
/*!50003 AUTO_INCREMENT=42 */

;

-- ----------------------------
-- Records of t_knowledge
-- ----------------------------
BEGIN;
INSERT INTO `t_knowledge` VALUES ('34', '郭襄', '合同', '2016-01-25 10:30:42', null, 'upload/111.jpg', 'upload/5CFE252E63BC7ABA267B2B19DB0424F0.jpeg', 'upload/222.jpg', '', '', ''), ('35', '杨过', '技术文档', '2016-01-25 10:33:03', null, 'upload\\333.jpg', 'upload\\555.jpg', 'upload\\444.jpg', '', '', ''), ('36', '小龙女', '合同', '2016-01-25 10:33:42', null, 'upload\\0bd162d9f2d3572c93ff0be28913632762d0c3eb.jpg', 'upload\\5CFE252E63BC7ABA267B2B19DB0424F0.jpeg', 'upload\\111.jpg', '', '', ''), ('37', '黄蓉', '合同', '2016-01-25 10:34:18', null, 'upload/333.jpg', 'upload/psb (1).jpg', 'upload/5CFE252E63BC7ABA267B2B19DB0424F0.jpeg', '', '', ''), ('38', '郭靖', '技术文档', '2016-01-26 15:36:15', null, 'upload\\111.jpg', 'upload\\222.jpg', 'upload\\333.jpg', null, null, null), ('39', '周芷若', '合同', '2016-01-27 14:19:27', null, 'upload/u=606383730,2010157794&fm=21&gp=0.jpg', 'upload/u=777215192,3426878957&fm=21&gp=0.jpg', 'upload/u=2534508684,761730951&fm=21&gp=0.jpg', null, null, null), ('40', '哈哈哈', '合同', '2016-01-29 14:51:30', null, 'upload/u=196024968,2454780024&fm=21&gp=0.jpg', 'upload/u=718889327,3941597842&fm=21&gp=0.jpg', 'upload/u=4027421683,2923566180&fm=21&gp=0.jpg', null, null, null), ('41', '令狐冲', '合同', '2016-02-02 10:28:36', null, 'upload/333.jpg', 'upload/5CFE252E63BC7ABA267B2B19DB0424F0.jpeg', 'upload/000.jpg', null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_maintainorder
-- ----------------------------
DROP TABLE IF EXISTS `t_maintainorder`;
CREATE TABLE `t_maintainorder` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`mname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称' ,
`dnum`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号' ,
`unit`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`mlevel`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修级别' ,
`man`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dotime`  datetime NULL DEFAULT NULL ,
`project`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`standard`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`info`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`flag`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eid`  int(11) NULL DEFAULT NULL ,
`ext1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=3 */

;

-- ----------------------------
-- Records of t_maintainorder
-- ----------------------------
BEGIN;
INSERT INTO `t_maintainorder` VALUES ('1', '00000', '货梯', '00001', '吨', '维修部', '一级', '刘东赫', '2016-01-20 15:41:02', '换部件', '可用', '啦啦啦啦', '未完成', '3', null, null), ('2', '00002', '哈尔滨', '00002', '无', '办公室', '一级', '刘东赫', '2016-01-25 16:27:48', '电梯', '可用', '哈哈', '未完成', '2', null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_maintainplan
-- ----------------------------
DROP TABLE IF EXISTS `t_maintainplan`;
CREATE TABLE `t_maintainplan` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`unit`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`mlevel`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修级别' ,
`method`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`man`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dotime`  datetime NULL DEFAULT NULL ,
`state`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`project`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`standard`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`info`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eid`  int(11) NULL DEFAULT NULL ,
`ext1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=3 */

;

-- ----------------------------
-- Records of t_maintainplan
-- ----------------------------
BEGIN;
INSERT INTO `t_maintainplan` VALUES ('1', '哈尔滨', '00002', '无', '办公室', '一级', 'on', '张三', '2016-01-11 00:00:00', '启用', '电梯', '良好', '哈哈', '2', null, null), ('2', '货梯', '00001', '吨', '维修部', '1', '月循环', '张梓', '2016-04-22 00:00:00', '启动', '货梯', '', '', '3', null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_protect
-- ----------------------------
DROP TABLE IF EXISTS `t_protect`;
CREATE TABLE `t_protect` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称' ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号' ,
`unit`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格型号' ,
`dname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在部门名称' ,
`mlevel`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养级别' ,
`method`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划保养循环类型' ,
`state`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态' ,
`dotime`  datetime NULL DEFAULT NULL COMMENT '下次保养时间' ,
`man`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养人员' ,
`project`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养项目' ,
`eid`  int(11) NULL DEFAULT NULL ,
`info`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养内容' ,
`plannum`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划单号' ,
`ext1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`standard`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保养标准' ,
`ext2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划保养内容' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=8 */

;

-- ----------------------------
-- Records of t_protect
-- ----------------------------
BEGIN;
INSERT INTO `t_protect` VALUES ('2', '哈尔滨', '00002', '无', '办公室', '1', '执行一次', '保养中', '2016-02-29 00:00:00', '谁谁', '柏林特', '2', 'xxx', '', null, '高', null), ('5', '货梯', '00001', '吨', '维修部', '2', '循环多次', '已结束', '2017-01-31 00:00:00', '上帝', '柏林特2', '3', '你好', 'B003', null, '很好', '东东'), ('6', '货梯', '00001', '吨', '维修部', '1级', '循环多次', '有效', '2018-01-30 00:00:00', '大神', '柏林特3', '3', '省略。。', 'X0003', null, '高高', '不清楚'), ('7', '哈尔滨', '00002', '无', '办公室', '2', '循环多次', '', '2016-03-30 00:00:00', '王二', '', '2', '', '', null, '', '');
COMMIT;

-- ----------------------------
-- Table structure for t_rf
-- ----------------------------
DROP TABLE IF EXISTS `t_rf`;
CREATE TABLE `t_rf` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`rid`  int(11) NULL DEFAULT NULL COMMENT '角色id外键' ,
`fid`  int(11) NULL DEFAULT NULL COMMENT '功能外键' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=276 */

;

-- ----------------------------
-- Records of t_rf
-- ----------------------------
BEGIN;
INSERT INTO `t_rf` VALUES ('236', '2', '16'), ('237', '2', '17'), ('238', '2', '18'), ('239', '2', '19'), ('240', '2', '20'), ('241', '2', '21'), ('242', '2', '32'), ('243', '2', '33'), ('245', '1', '18'), ('246', '1', '33'), ('247', '1', '24'), ('248', '1', '21'), ('249', '1', '5'), ('250', '1', '25'), ('251', '1', '7'), ('252', '1', '11'), ('253', '1', '17'), ('254', '1', '9'), ('255', '1', '31'), ('256', '1', '26'), ('257', '1', '1'), ('258', '1', '13'), ('259', '1', '32'), ('260', '1', '4'), ('261', '1', '16'), ('262', '1', '14'), ('263', '1', '19'), ('264', '1', '22'), ('265', '1', '20'), ('267', '1', '28'), ('268', '1', '8'), ('269', '1', '27'), ('270', '1', '23'), ('271', '1', '3'), ('272', '1', '10'), ('273', '1', '6'), ('274', '1', '15'), ('275', '1', '2');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`rank`  int(11) NULL DEFAULT NULL COMMENT '功能外键' ,
`del`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=3 */

;

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES ('1', '00000', '超级用户', null, '0', '管理员', null), ('2', '00001', '技工人员', null, '0', '普通用户', null);
COMMIT;

-- ----------------------------
-- Table structure for t_serialnum
-- ----------------------------
DROP TABLE IF EXISTS `t_serialnum`;
CREATE TABLE `t_serialnum` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`flag`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`num`  int(11) NULL DEFAULT NULL ,
`stime`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=14 */

;

-- ----------------------------
-- Records of t_serialnum
-- ----------------------------
BEGIN;
INSERT INTO `t_serialnum` VALUES ('6', 'user', '9', '2016-03-23'), ('7', 'xxx', '3', '2016-01-11'), ('8', 'role', '2', '2016-03-22'), ('9', 'quipcate', '5', '2016-02-02'), ('10', 'department', '2', '2016-03-23'), ('11', 'equipment', '7', '2016-03-24'), ('12', 'gd', '3', '2016-01-25'), ('13', 'standing', '1', '2016-01-25');
COMMIT;

-- ----------------------------
-- Table structure for t_standing
-- ----------------------------
DROP TABLE IF EXISTS `t_standing`;
CREATE TABLE `t_standing` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '主键' ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称' ,
`num`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备数量' ,
`unit`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号' ,
`cid`  int(11) NULL DEFAULT NULL COMMENT '类别id' ,
`category`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类别' ,
`creater`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂商' ,
`sid`  int(11) NULL DEFAULT NULL COMMENT '供应商id' ,
`supplier`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商' ,
`flag`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0重型设备，1一般设备，2大型设备' ,
`intime`  datetime NULL DEFAULT NULL COMMENT '购入时间' ,
`certifier`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产证明人' ,
`deperction`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折旧方式' ,
`perPrice`  double(10,2) NULL DEFAULT NULL COMMENT '资产原值' ,
`rate`  int(3) NULL DEFAULT NULL COMMENT '净残率' ,
`useStatus`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用情况' ,
`did`  int(11) NULL DEFAULT NULL COMMENT '部门id' ,
`dname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称' ,
`operator`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员' ,
`place`  varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装地点' ,
`ext1`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext7`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext3`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext4`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext5`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext6`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=3 */

;

-- ----------------------------
-- Records of t_standing
-- ----------------------------
BEGIN;
INSERT INTO `t_standing` VALUES ('1', '电梯', null, '100吨', '4', null, '哈尔滨', '1', null, '1', '2016-01-05 00:00:00', '刘东赫', '现金', '80000.00', '34', '停用', null, '生成部', null, '厢房', null, null, null, null, null, null, null), ('2', '发电机', '00000', '吨', '4', '医用电梯', '刘东赫', '1', '慧客指点', '1', '2016-01-05 00:00:00', '刘东赫', '现金', '90000.00', '34', '未启用', null, '质检部', null, '南岗', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`telphone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remark`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
/*!50003 AUTO_INCREMENT=2 */

;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
BEGIN;
INSERT INTO `t_supplier` VALUES ('1', '慧客指点', '黑龙江哈尔滨', 'Mr.liu', '1500000000', '无', null, null);
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`num`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号' ,
`uname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名' ,
`pwd`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`truename`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名' ,
`sex`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住址' ,
`flag`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在职什么的' ,
`rid`  int(11) NULL DEFAULT NULL COMMENT '角色外键' ,
`did`  int(11) NULL DEFAULT NULL COMMENT '部门id' ,
`del`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记。1删除，0，未删除' ,
`ext1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ext2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户表'
/*!50003 AUTO_INCREMENT=4 */

;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', '00001', 'admin', 'admin', 'admin', '0', null, null, null, null, '1', '1', '0', '超级管理员', '管理层'), ('2', '00002', 'root', 'root', 'root', '0', '', '', '', '', '2', '1', '0', '库存管理员', '信息部'), ('3', '00003', 'blt', 'blt', 'blt', '0', '', '', '', null, '2', '1', '0', '技工人员', '信息部');
COMMIT;

-- ----------------------------
-- Table structure for tb_alamworkitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_alamworkitem`;
CREATE TABLE `tb_alamworkitem` (
`alamid`  int(11) NOT NULL ,
`equipmentid`  int(11) NULL DEFAULT NULL ,
`createby`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`begintime`  datetime NULL DEFAULT NULL ,
`finishtime`  datetime NULL DEFAULT NULL ,
`alamcontent`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqspareid`  int(11) NULL DEFAULT NULL ,
`department`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqstatus`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`handstatus`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
`alamtype`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`alamworktype`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`alamid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_alamworkitem
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_alarmpara
-- ----------------------------
DROP TABLE IF EXISTS `tb_alarmpara`;
CREATE TABLE `tb_alarmpara` (
`paramid`  int(11) NOT NULL ,
`equipmentid`  int(11) NOT NULL ,
`assigndate`  datetime NULL DEFAULT NULL ,
`lthreshold`  double NULL DEFAULT NULL ,
`pararmid`  int(11) NOT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`operator`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`equipmentid`, `pararmid`, `paramid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_alarmpara
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_corpinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_corpinfo`;
CREATE TABLE `tb_corpinfo` (
`corpid`  int(11) NOT NULL DEFAULT 0 ,
`corpcode`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`corporation`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`handledate`  date NULL DEFAULT NULL ,
PRIMARY KEY (`corpid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_corpinfo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_departinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_departinfo`;
CREATE TABLE `tb_departinfo` (
`departid`  int(11) NOT NULL ,
`departcode`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`departname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parentdepcode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`supervisor`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contact`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' ,
`handledate`  date NULL DEFAULT NULL ,
PRIMARY KEY (`departid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_departinfo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_eqdiscard
-- ----------------------------
DROP TABLE IF EXISTS `tb_eqdiscard`;
CREATE TABLE `tb_eqdiscard` (
`discardid`  int(11) NOT NULL ,
`eqdiscardno`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`fixedassetsno`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`department`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`reason`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`eqstatus`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operator`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
`auditperson`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`auditdate`  datetime NULL DEFAULT NULL ,
`knowbyfinan`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`discardid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_eqdiscard
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_eqmeasureparam
-- ----------------------------
DROP TABLE IF EXISTS `tb_eqmeasureparam`;
CREATE TABLE `tb_eqmeasureparam` (
`measureparacode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`paraname`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`paraminvalue`  double NULL DEFAULT NULL ,
`abc`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`paramaxvalue`  double NULL DEFAULT NULL ,
`eqcategoryid`  int(11) NOT NULL ,
`equipmentid`  int(11) NULL DEFAULT NULL ,
`operadate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`measureparacode`, `eqcategoryid`),
INDEX `Relationship21` USING BTREE (`eqcategoryid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_eqmeasureparam
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_eqparahistory
-- ----------------------------
DROP TABLE IF EXISTS `tb_eqparahistory`;
CREATE TABLE `tb_eqparahistory` (
`recordid`  int(11) NOT NULL ,
`equipmentid`  int(11) NOT NULL ,
`assigndate`  datetime NOT NULL ,
`value`  double NULL DEFAULT NULL ,
`operator`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pararmid`  int(11) NOT NULL ,
PRIMARY KEY (`equipmentid`, `assigndate`, `recordid`, `pararmid`),
INDEX `Relationship27` USING BTREE (`equipmentid`, `pararmid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_eqparahistory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_eqrealpara
-- ----------------------------
DROP TABLE IF EXISTS `tb_eqrealpara`;
CREATE TABLE `tb_eqrealpara` (
`pararid`  int(11) NOT NULL ,
`equipmentid`  int(11) NOT NULL ,
`eqcategoryid`  int(11) NULL DEFAULT NULL ,
`measureparacode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lastvalue`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`assigndate`  datetime NULL DEFAULT NULL ,
`operator`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`equipmentid`, `pararid`),
INDEX `IX_Relationship25` USING BTREE (`measureparacode`, `eqcategoryid`),
INDEX `IX_Relationship28` USING BTREE (`eqcategoryid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_eqrealpara
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_equiparchives
-- ----------------------------
DROP TABLE IF EXISTS `tb_equiparchives`;
CREATE TABLE `tb_equiparchives` (
`archivesid`  int(11) NOT NULL ,
`equipmentid`  int(11) NULL DEFAULT NULL ,
`archivescode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`keywords`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`content`  longblob NULL ,
`version`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operator`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`archivesid`),
INDEX `IX_Relationship13` USING BTREE (`equipmentid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_equiparchives
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_equipcategory
-- ----------------------------
DROP TABLE IF EXISTS `tb_equipcategory`;
CREATE TABLE `tb_equipcategory` (
`eqcategoryid`  int(11) NOT NULL ,
`eqcategoreycode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`desc`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`suppercode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dsize`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`power`  decimal(38,0) NULL DEFAULT NULL ,
`techobjtype`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`eqcategoryid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_equipcategory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_equipment
-- ----------------------------
DROP TABLE IF EXISTS `tb_equipment`;
CREATE TABLE `tb_equipment` (
`equipmentid`  int(11) NOT NULL COMMENT '设备id' ,
`supperid`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父设备id' ,
`serial`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列号' ,
`materialcode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料编码' ,
`status`  varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态' ,
`desc`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备说明' ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效性' ,
`manufactureid`  int(11) NULL DEFAULT NULL COMMENT '制造商编号' ,
`supplierid`  int(11) NULL DEFAULT NULL COMMENT '供应商编号' ,
`purchaseprice`  float NULL DEFAULT NULL COMMENT '购买金额' ,
`agelimit`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用年限' ,
`purchasedate`  timestamp NULL DEFAULT NULL COMMENT '购买日期' ,
`financecategory`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财务类别' ,
`source`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用部门编号' ,
`audit`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收情况' ,
`auditdate`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收日期' ,
`auditoperator`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收人' ,
`techparam`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备技术参数' ,
`fixedassetnum`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remark`  char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`eqcategoryid`  int(11) NULL DEFAULT NULL COMMENT '设备分类id' ,
`funcid`  int(11) NULL DEFAULT NULL COMMENT '功能位置id' ,
`authgroup`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权组' ,
`equipname`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称' ,
`deptname`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用部门名称' ,
`manuname`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造商名称' ,
`suppliername`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称' ,
`flag`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备标识' ,
`inmethod`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购置方式' ,
`certifier`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资产证明人' ,
`deprection`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折旧方式' ,
`prePrice`  double(10,2) NULL DEFAULT NULL COMMENT '资产原值' ,
`rate`  double(2,2) NULL DEFAULT NULL COMMENT '净残率' ,
`checkRound`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验周期' ,
`preCheck`  timestamp NULL DEFAULT NULL COMMENT '上次检验' ,
`nextCheck`  timestamp NULL DEFAULT NULL COMMENT '下次检验' ,
`preMaintain`  timestamp NULL DEFAULT NULL COMMENT '上次维修' ,
`useStatus`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用情况:启用1，在用2，出租3，停用4' ,
`operator`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人' ,
`extl`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义冗余' ,
`del`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '0，删除;1,不是删除；默认是1' ,
`deptid`  int(10) NULL DEFAULT NULL COMMENT '部门主键' ,
PRIMARY KEY (`equipmentid`),
UNIQUE INDEX `设备ID` USING BTREE (`equipmentid`),
INDEX `IX_Relationship29` USING BTREE (`manufactureid`),
INDEX `IX_Relationship30` USING BTREE (`supplierid`),
INDEX `equipcat` USING BTREE (`eqcategoryid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_equipment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_equipmentsetup
-- ----------------------------
DROP TABLE IF EXISTS `tb_equipmentsetup`;
CREATE TABLE `tb_equipmentsetup` (
`equipsetupid`  int(11) NOT NULL ,
`startdate`  datetime NULL DEFAULT NULL ,
`expiredate`  datetime NULL DEFAULT NULL ,
`equipmentid`  int(11) NOT NULL ,
`funclid`  int(11) NOT NULL ,
`department`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operator`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operatetype`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operatedate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`equipmentid`, `funclid`, `equipsetupid`),
INDEX `locequiprecord` USING BTREE (`funclid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_equipmentsetup
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_equipspare
-- ----------------------------
DROP TABLE IF EXISTS `tb_equipspare`;
CREATE TABLE `tb_equipspare` (
`spareid`  int(11) NOT NULL ,
`sparename`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`quantity`  decimal(38,0) NULL DEFAULT NULL ,
`uomcode`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`eqcategoryid`  int(11) NOT NULL ,
`equitmentid`  int(11) NULL DEFAULT NULL ,
`fixedassetnum`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`有效性`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`spareid`, `eqcategoryid`),
INDEX `equitmentmm` USING BTREE (`eqcategoryid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_equipspare
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_faultdiagnosis
-- ----------------------------
DROP TABLE IF EXISTS `tb_faultdiagnosis`;
CREATE TABLE `tb_faultdiagnosis` (
`diagnosisid`  int(11) NOT NULL ,
`desc`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`faultcode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Performchar`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`equipmentid`  int(11) NULL DEFAULT NULL ,
`disable`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operator`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`diagnosisid`),
INDEX `IX_Relationship17` USING BTREE (`equipmentid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_faultdiagnosis
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_faulthistory
-- ----------------------------
DROP TABLE IF EXISTS `tb_faulthistory`;
CREATE TABLE `tb_faulthistory` (
`faultid`  int(11) NOT NULL ,
`equipmentid`  int(11) NULL DEFAULT NULL ,
`reason`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`hanleresult`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`createby`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`handleby`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`alamdate`  datetime NULL DEFAULT NULL ,
`handledate`  datetime NULL DEFAULT NULL ,
`workitemid`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`faultid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_faulthistory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_faulttype
-- ----------------------------
DROP TABLE IF EXISTS `tb_faulttype`;
CREATE TABLE `tb_faulttype` (
`faultcode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`abc`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`faultrate`  decimal(38,0) NULL DEFAULT NULL ,
`diagnosis`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`faultcode`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_faulttype
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_fixedassets
-- ----------------------------
DROP TABLE IF EXISTS `tb_fixedassets`;
CREATE TABLE `tb_fixedassets` (
`fixedascode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`catcode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`supplierid`  int(11) NULL DEFAULT NULL ,
`manufacturerid`  int(11) NULL DEFAULT NULL ,
`productdate`  datetime NULL DEFAULT NULL ,
`assetsdate`  datetime NULL DEFAULT NULL ,
`Initialprice`  double NULL DEFAULT NULL ,
`deprecperiod`  double NULL DEFAULT NULL ,
`deprecrule`  double NULL DEFAULT NULL ,
`Guarantee`  datetime NULL DEFAULT NULL ,
`eqcategoryid`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`fixedascode`),
INDEX `IX_Relationship22` USING BTREE (`eqcategoryid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_fixedassets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_funclocation
-- ----------------------------
DROP TABLE IF EXISTS `tb_funclocation`;
CREATE TABLE `tb_funclocation` (
`funclid`  int(11) NOT NULL ,
`funcloccode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`suppercode`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`catcode`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`equipmentcode`  varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`valid`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`operdate`  datetime NULL DEFAULT NULL ,
`supplierid`  int(11) NULL DEFAULT NULL ,
`roomno`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`abc`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`funclid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_funclocation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_manufacture
-- ----------------------------
DROP TABLE IF EXISTS `tb_manufacture`;
CREATE TABLE `tb_manufacture` (
`manufactureid`  int(11) NOT NULL ,
`address`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`contract`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`telphone`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`remark`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`manufactureid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tb_manufacture
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for t_department
-- ----------------------------
ALTER TABLE `t_department` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for t_equipment
-- ----------------------------
ALTER TABLE `t_equipment` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for t_equipmentcategory
-- ----------------------------
ALTER TABLE `t_equipmentcategory` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for t_equipmentpart
-- ----------------------------
ALTER TABLE `t_equipmentpart` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for t_function
-- ----------------------------
ALTER TABLE `t_function` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for t_knowledge
-- ----------------------------
ALTER TABLE `t_knowledge` AUTO_INCREMENT=42;

-- ----------------------------
-- Auto increment value for t_maintainorder
-- ----------------------------
ALTER TABLE `t_maintainorder` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for t_maintainplan
-- ----------------------------
ALTER TABLE `t_maintainplan` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for t_protect
-- ----------------------------
ALTER TABLE `t_protect` AUTO_INCREMENT=8;

-- ----------------------------
-- Auto increment value for t_rf
-- ----------------------------
ALTER TABLE `t_rf` AUTO_INCREMENT=276;

-- ----------------------------
-- Auto increment value for t_role
-- ----------------------------
ALTER TABLE `t_role` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for t_serialnum
-- ----------------------------
ALTER TABLE `t_serialnum` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for t_standing
-- ----------------------------
ALTER TABLE `t_standing` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for t_supplier
-- ----------------------------
ALTER TABLE `t_supplier` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for t_user
-- ----------------------------
ALTER TABLE `t_user` AUTO_INCREMENT=4;
