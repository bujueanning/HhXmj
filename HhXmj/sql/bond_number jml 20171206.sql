/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.122_3306
Source Server Version : 50636
Source Host           : 192.168.1.122:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-12-06 15:36:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bond_number
-- ----------------------------
DROP TABLE IF EXISTS `bond_number`;
CREATE TABLE `bond_number` (
  `bond_asset_number_id` int(11) NOT NULL,
  `bond_deal` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bond_asset_number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bond_number
-- ----------------------------
INSERT INTO `bond_number` VALUES ('1', '单笔资产', '0');
INSERT INTO `bond_number` VALUES ('2', '资产包', '0');
