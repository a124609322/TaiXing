/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : taixing

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-04-20 16:15:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `table_exp_banner`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_banner`;
CREATE TABLE `table_exp_banner` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `createDate` datetime NOT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL,
  `managerId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_banner
-- ----------------------------
INSERT INTO `table_exp_banner` VALUES ('cc0d273880384de984915c89938ba4e7', 'banner1', 'banner/cc0d273880384de984915c89938ba4e7/1460692321653.jpg', '2016-04-15 11:52:01', null, '1', '0');
INSERT INTO `table_exp_banner` VALUES ('25966cf50a7646ec8b7ade6c3dbab0a1', 'banner2', 'banner/25966cf50a7646ec8b7ade6c3dbab0a1/1460692332421.jpg', '2016-04-15 11:52:12', null, '1', '0');

-- ----------------------------
-- Table structure for `table_exp_link`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_link`;
CREATE TABLE `table_exp_link` (
  `id` varchar(255) NOT NULL,
  `linkname` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL,
  `managerId` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `managerId` (`managerId`),
  CONSTRAINT `table_exp_link_ibfk_1` FOREIGN KEY (`managerId`) REFERENCES `table_exp_manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_link
-- ----------------------------
INSERT INTO `table_exp_link` VALUES ('42f2fc083395436489040e1165ed5dc7', '百度', 'link/42f2fc083395436489040e1165ed5dc7/1460700561392.png', '2016-04-15 14:09:21', null, '1', '0', 'http://www.baidu.com');
INSERT INTO `table_exp_link` VALUES ('834b9a98c3284f55afc4df459dda2244', '百度', 'link/834b9a98c3284f55afc4df459dda2244/1460511215133.jpg', '2016-04-13 09:33:35', null, '1', '0', 'http://www.baidu.com');

-- ----------------------------
-- Table structure for `table_exp_manager`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_manager`;
CREATE TABLE `table_exp_manager` (
  `id` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `table_exp_manager_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `table_exp_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_manager
-- ----------------------------
INSERT INTO `table_exp_manager` VALUES ('0', '泰兴管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', '2016-03-28 17:22:50', '2016-03-29 09:53:29', '1');
INSERT INTO `table_exp_manager` VALUES ('1', '测试管理', 'guest', '21232f297a57a5a743894a0e4a801fc3', '1', '2016-03-29 10:10:34', '2016-03-31 17:23:02', '1');

-- ----------------------------
-- Table structure for `table_exp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_menu`;
CREATE TABLE `table_exp_menu` (
  `id` varchar(255) NOT NULL,
  `menuname` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL,
  `sort` int(2) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `table_exp_menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `table_exp_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_menu
-- ----------------------------
INSERT INTO `table_exp_menu` VALUES ('0', '用户管理', null, null, '2016-03-29 09:56:53', null, '1', '0', '0xf0c0');
INSERT INTO `table_exp_menu` VALUES ('1', '网站设置', null, null, '2016-03-29 09:57:19', null, '1', '2', '0xf085');
INSERT INTO `table_exp_menu` VALUES ('10', '物流信息管理', 'logisticsModule', '2', '2016-04-05 14:42:56', null, '1', '3', '0xf0d1');
INSERT INTO `table_exp_menu` VALUES ('2', '运单管理', null, null, '2016-03-29 09:57:35', null, '1', '1', '0xf0c5');
INSERT INTO `table_exp_menu` VALUES ('3', '管理员管理', 'managerModule', '0', '2016-03-29 09:57:56', null, '1', '0', '0xf007');
INSERT INTO `table_exp_menu` VALUES ('4', '角色管理', 'roleModule', '0', '2016-03-29 09:58:25', null, '1', '1', '0xf0f0');
INSERT INTO `table_exp_menu` VALUES ('5', '网站公告', 'noticeModule', '1', '2016-03-29 09:59:35', null, '1', '3', '0xf022');
INSERT INTO `table_exp_menu` VALUES ('6', '友情链接', 'linkModule', '1', '2016-03-29 09:59:54', null, '1', '1', '0xf08c');
INSERT INTO `table_exp_menu` VALUES ('7', '运单信息管理', 'waybillModule', '2', '2016-03-29 10:00:50', null, '1', '0', '0xf0f6');
INSERT INTO `table_exp_menu` VALUES ('8', 'Banner管理', 'bannerModule', '1', '2016-03-29 10:01:11', null, '1', '0', '0xf03e');
INSERT INTO `table_exp_menu` VALUES ('9', '运单回收站', 'recyclebinModule', '2', '2016-03-29 10:01:25', null, '1', '2', '0xf014');

-- ----------------------------
-- Table structure for `table_exp_notice`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_notice`;
CREATE TABLE `table_exp_notice` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `content` text,
  `createdate` datetime NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL,
  `managerId` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `top` datetime DEFAULT NULL,
  `types` varchar(255) DEFAULT NULL,
  `isRoll` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `managerId` (`managerId`),
  CONSTRAINT `table_exp_notice_ibfk_1` FOREIGN KEY (`managerId`) REFERENCES `table_exp_manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_notice
-- ----------------------------
INSERT INTO `table_exp_notice` VALUES ('040b782e8b99409f9e25e5c72de08601', 'ggggg', 'gggg', '<p>ggg</p>', '2016-04-16 09:37:10', null, '1', '0', null, '2016-04-16 09:37:10', 'contactus', '0');
INSERT INTO `table_exp_notice` VALUES ('20de38c5a8544d7ea7e9972346413372', '```````````````', '``````````````', '<p>``````````````</p>', '2016-04-18 13:41:12', null, '1', '0', null, '0002-11-30 00:00:00', 'other', '0');
INSERT INTO `table_exp_notice` VALUES ('581191a6ae354a9cae91ea257ad739dd', 'ffffffffff', 'fffffffffffff', '<p><br/></p><p><img src=\"/tx/ueditor/jsp/upload/image/20160418/1460944349038027928.png\" title=\"1460944349038027928.png\" alt=\"btn_lianxiwomen.png\"/></p><p>fffffffffffff</p>', '2016-04-15 16:51:47', '2016-04-18 09:52:30', '1', '0', null, '2016-04-18 14:11:17', 'abouttaixing', '1');
INSERT INTO `table_exp_notice` VALUES ('5a78cbee08564e68b54d5b5a72daffd7', 'sfsdf', 'sdfsdfds', '<p>fsdfsdf</p>', '2016-04-15 15:51:10', '2016-04-15 17:01:39', '1', '0', null, '2016-04-15 18:12:00', 'settlement', '1');
INSERT INTO `table_exp_notice` VALUES ('6bda5a77cd664de19191bfe517b8c052', 'ffssssssssss', 'ssssssssssss', '<p>ssssssssssss</p>', '2016-04-15 16:58:44', '2016-04-15 17:22:22', '1', '0', null, '0002-11-30 00:00:00', 'other', '1');
INSERT INTO `table_exp_notice` VALUES ('6e3b0b553f0c4d698d06c2fb9d3f2411', 'sdfsdf', 'sdfsdf', '<p>sdfdsf</p>', '2016-04-15 17:12:31', '2016-04-15 17:20:19', '1', '0', null, '0002-11-30 00:00:00', 'other', '1');
INSERT INTO `table_exp_notice` VALUES ('95f88894e7d64e7d8044b9a0ef417539', '123123', 'sdfdsf', '<p>sdfdsf</p>', '2016-04-15 17:57:57', null, '1', '0', null, '0002-11-30 00:00:00', 'embargo', '1');
INSERT INTO `table_exp_notice` VALUES ('c7b70bfec83c4138a0f47cd216566799', '123123', '123123123', '<p>123123123</p>', '2016-04-15 17:57:07', null, '1', '0', null, '0002-11-30 00:00:00', 'embargo', '0');

-- ----------------------------
-- Table structure for `table_exp_role`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_role`;
CREATE TABLE `table_exp_role` (
  `id` varchar(255) NOT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_role
-- ----------------------------
INSERT INTO `table_exp_role` VALUES ('0', '超级管理员', '2016-03-29 09:53:14', '2016-04-05 14:49:33', '1');
INSERT INTO `table_exp_role` VALUES ('1', '小小管理员', '2016-03-29 10:12:17', null, '1');

-- ----------------------------
-- Table structure for `table_exp_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_role_menu`;
CREATE TABLE `table_exp_role_menu` (
  `roleId` varchar(100) NOT NULL,
  `menuId` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`,`menuId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `table_exp_role_menu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `table_exp_role` (`id`),
  CONSTRAINT `table_exp_role_menu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `table_exp_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_role_menu
-- ----------------------------
INSERT INTO `table_exp_role_menu` VALUES ('0', '0');
INSERT INTO `table_exp_role_menu` VALUES ('1', '0');
INSERT INTO `table_exp_role_menu` VALUES ('0', '1');
INSERT INTO `table_exp_role_menu` VALUES ('1', '1');
INSERT INTO `table_exp_role_menu` VALUES ('0', '10');
INSERT INTO `table_exp_role_menu` VALUES ('0', '2');
INSERT INTO `table_exp_role_menu` VALUES ('0', '3');
INSERT INTO `table_exp_role_menu` VALUES ('0', '4');
INSERT INTO `table_exp_role_menu` VALUES ('0', '5');
INSERT INTO `table_exp_role_menu` VALUES ('0', '6');
INSERT INTO `table_exp_role_menu` VALUES ('0', '7');
INSERT INTO `table_exp_role_menu` VALUES ('0', '8');
INSERT INTO `table_exp_role_menu` VALUES ('0', '9');

-- ----------------------------
-- Table structure for `table_exp_waybill`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_waybill`;
CREATE TABLE `table_exp_waybill` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `expresscode` varchar(255) DEFAULT NULL,
  `expresscompany` varchar(255) DEFAULT NULL,
  `batchcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `goods1` varchar(255) DEFAULT NULL,
  `amount1` int(11) DEFAULT NULL,
  `price1` decimal(10,2) DEFAULT NULL,
  `goods2` varchar(255) DEFAULT NULL,
  `amount2` int(11) DEFAULT NULL,
  `price2` decimal(10,2) DEFAULT NULL,
  `goods3` varchar(255) DEFAULT NULL,
  `amount3` int(11) DEFAULT NULL,
  `price3` decimal(10,2) DEFAULT NULL,
  `worth` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `insurance` decimal(10,2) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  `managerId` varchar(255) DEFAULT NULL,
  `problem` int(1) DEFAULT NULL,
  `problemreason` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `isautoupdate` int(1) DEFAULT NULL,
  `robotId` varchar(255) DEFAULT NULL,
  `isEnd` int(1) DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `currentstate` int(11) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `managerId` (`managerId`),
  KEY `robotId` (`robotId`),
  CONSTRAINT `table_exp_waybill_ibfk_1` FOREIGN KEY (`managerId`) REFERENCES `table_exp_manager` (`id`),
  CONSTRAINT `table_exp_waybill_ibfk_2` FOREIGN KEY (`robotId`) REFERENCES `table_exp_waybill_robot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of table_exp_waybill
-- ----------------------------
INSERT INTO `table_exp_waybill` VALUES ('3bc8cfc78e224c93bc25e3d165b98acf', '111101', '881443775034378914', 'YTO', 'T001', '张三', '130', '四川成都市', '保健品', '1', '10.50', '水杯', '10', '2.00', null, null, null, '30.50', '10.10', '3.00', '纽约泰兴', '2016-04-19 11:14:52', '2016-04-19 11:16:52', '1', '0', '0', null, 'A', null, null, null, null, '00000000000');
INSERT INTO `table_exp_waybill` VALUES ('705c153ef97c4425a8e9c2718c582de8', '111105', null, null, 'T001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-04-19 11:14:52', null, '1', '0', '0', null, null, null, null, null, null, '00000000000');
INSERT INTO `table_exp_waybill` VALUES ('bc22f53e041d43d3a9fed6e8899455d0', '111103', null, null, 'T001', '李四', '189', '香港荃湾TML广场', '鞋', '30', '1.00', null, null, null, null, null, null, '30.00', '15.00', '6.00', '香港泰兴', '2016-04-19 11:14:52', '2016-04-19 11:16:52', '1', '0', '0', null, 'B', null, null, null, null, '00000000000');
INSERT INTO `table_exp_waybill` VALUES ('c665233277b7474a8475ec8ceb0522d3', '111102', null, null, 'T002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-04-19 11:14:52', null, '1', '0', '0', null, null, null, null, null, null, '00000000000');
INSERT INTO `table_exp_waybill` VALUES ('d7bc79de5f0042f7a3cb9799cdba1e57', '111104', null, null, 'T002', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-04-19 11:14:52', null, '1', '0', '0', null, null, null, null, null, null, '00000000000');

-- ----------------------------
-- Table structure for `table_exp_waybill_logistics`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_waybill_logistics`;
CREATE TABLE `table_exp_waybill_logistics` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `waybillId` varchar(255) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL,
  `managerId` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_exp_waybill_logistics_ibfk_2` (`waybillId`),
  KEY `table_exp_waybill_logistics_ibfk_1` (`managerId`),
  CONSTRAINT `table_exp_waybill_logistics_ibfk_1` FOREIGN KEY (`managerId`) REFERENCES `table_exp_manager` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `table_exp_waybill_logistics_ibfk_2` FOREIGN KEY (`waybillId`) REFERENCES `table_exp_waybill` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_waybill_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for `table_exp_waybill_robot`
-- ----------------------------
DROP TABLE IF EXISTS `table_exp_waybill_robot`;
CREATE TABLE `table_exp_waybill_robot` (
  `id` varchar(255) NOT NULL,
  `batchcode` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `isautoupdate` int(11) DEFAULT NULL,
  `currentstate` varchar(255) DEFAULT NULL,
  `state1` varchar(255) DEFAULT NULL,
  `state2` varchar(255) DEFAULT NULL,
  `state3` varchar(255) DEFAULT NULL,
  `state4` varchar(255) DEFAULT NULL,
  `state5` varchar(255) DEFAULT NULL,
  `state6` varchar(255) DEFAULT NULL,
  `interval` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  `managerId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_exp_waybill_robot
-- ----------------------------
