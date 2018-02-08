/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.146_3306
Source Server Version : 50636
Source Host           : 192.168.1.146:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-12-14 09:38:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_filex
-- ----------------------------
DROP TABLE IF EXISTS `sys_filex`;
CREATE TABLE `sys_filex` (
  `sys_filex_id` varchar(255) NOT NULL COMMENT ' 主键',
  `sys_filex_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `sys_filex_addr` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `sys_filex_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_filex_createdate` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `sys_filex_updateuid` varchar(255) DEFAULT NULL COMMENT '修改人',
  `sys_filex_createuid` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`sys_filex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_filex
-- ----------------------------
INSERT INTO `sys_filex` VALUES ('1', '577ccb8012597.jpg', 'dist/sysfiles/178e3a6d19c14e5e8da9dcf4fcb89286/1577ccb8012597.jpg', null, null, null, null);
INSERT INTO `sys_filex` VALUES ('40a50f8f4e394cc592c96144c83950b0', '12月12.txt', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/12月12.txt', null, '2017/12/13 15:01:55', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_filex` VALUES ('6967ae5a54564ed8a4fb228fc2e91e11', '110110112.xlsx', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/110110112.xlsx', null, '2017/12/13 14:25:33', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_filex` VALUES ('9a515d4857064da6ad3a026b1961db79', '鑫淼聚平台测试2 20171204.xlsx', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/鑫淼聚平台测试2 20171204.xlsx', null, '2017/12/13 13:56:02', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_filex` VALUES ('e601bc59653148df9c809ac6ebd56a68', '鑫淼聚平台测试2 20171204 1441.xlsx', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/鑫淼聚平台测试2 20171204 1441.xlsx', null, '2017/12/13 14:03:47', null, 'da8c252c6672450db9a4af267aa5e6ad');
