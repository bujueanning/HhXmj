/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-20 11:09:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kill_process
-- ----------------------------
DROP TABLE IF EXISTS `kill_process`;
CREATE TABLE `kill_process` (
  `kill_id` varchar(255) NOT NULL COMMENT 'id',
  `kill_time` datetime NOT NULL COMMENT '在这个时间无法使用',
  `kill_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kill_process
-- ----------------------------
INSERT INTO `kill_process` VALUES ('1', '2018-11-18 00:00:00', '');
