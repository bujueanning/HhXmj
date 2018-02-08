/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-24 17:27:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `sys_user_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_user_name` varchar(255) DEFAULT 'NULL' COMMENT '姓名',
  `sys_user_account` varchar(255) DEFAULT 'NULL' COMMENT '帐号',
  `sys_user_password` varchar(255) DEFAULT 'NULL' COMMENT '密码',
  `sys_user_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `sys_user_login_ip` varchar(255) DEFAULT 'NULL' COMMENT '登陆ip地址',
  `sys_user_status_d` varchar(255) DEFAULT '''880d185f11794395a9439705eab558e0''' COMMENT '用户状态:0_审核通过,1_待审核',
  `sys_user_card` varchar(255) DEFAULT 'NULL' COMMENT '身份证号',
  `sys_user_flag_c` varchar(255) DEFAULT 'NULL' COMMENT '用户标记:0_系统用户,1_注册用户,2_双身份',
  `sys_user_reg_date` datetime DEFAULT NULL COMMENT '注册时间',
  `sys_user_reg_type_d` varchar(255) DEFAULT 'NULL' COMMENT '用户来源:0_企业发布方,1_普通用户,2_加盟方',
  `sys_area_id` varchar(255) DEFAULT NULL COMMENT '所在地主键',
  `sys_org_id` varchar(255) DEFAULT 'NULL' COMMENT '组织机构主键',
  `sys_user_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_user_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_user_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人id',
  `sys_user_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '修改人id',
  `sys_company_area` varchar(255) DEFAULT NULL COMMENT '公司的地址',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('04abbf62fc1048e59ec162ddfea8e087', '河北会海', '1234569875', 'c5bbf79292db6c2c930d0265f42cb606', null, 'NULL', '\'880d185f11794395a9439705eab558e0\'', 'NULL', 'NULL', null, '0', 'NULL', 'NULL', '2017-11-09 09:58:25', null, 'NULL', 'NULL', '-1');
INSERT INTO `sys_user` VALUES ('209922d27af74d85856c2171109f6eaa', '用户管理员', 'useradmin', '56b84c4cd72bc9dc685ea72946c3f963', null, 'NULL', '\'NULL\'', 'NULL', 'NULL', null, '\'NULL\'', 'NULL', 'NULL', '2017-09-15 01:10:52', null, 'da8c252c6672450db9a4af267aa5e6ad', 'NULL', '-1');
INSERT INTO `sys_user` VALUES ('3eec968c9d47425cbd2d7f826bbf02ae', '我是发布方', '15345678911', '2046b53ff2973fa416cc45ae8943b898', null, 'NULL', '\'880d185f11794395a9439705eab558e0\'', 'NULL', 'NULL', null, '0', '150001', 'NULL', '2017-11-24 15:03:17', '2017-11-24 17:23:36', 'NULL', '3eec968c9d47425cbd2d7f826bbf02ae', '130001');
INSERT INTO `sys_user` VALUES ('6a7e6f30d2d44566ab1172569e28416c', '河北汇海', '11111111111', '8dd09390b9b9d9f3068dae70cd7d79e1', null, 'NULL', '\'880d185f11794395a9439705eab558e0\'', 'NULL', 'NULL', null, '0', '石家庄桥西区', '000000', '2017-11-23 16:25:43', null, 'NULL', 'NULL', '-1');
INSERT INTO `sys_user` VALUES ('a8a003597b784f7cacfa188f64b4418f', '鑫淼聚处置', '22222222222', '0a4efee11a30ba110fc9a1d80defb16a', null, 'NULL', '\'880d185f11794395a9439705eab558e0\'', 'NULL', 'NULL', null, '2', '石家庄桥西区', '0', '2017-11-23 16:33:35', '2017-11-24 16:30:23', 'NULL', 'a8a003597b784f7cacfa188f64b4418f', '-1');
INSERT INTO `sys_user` VALUES ('da8c252c6672450db9a4af267aa5e6ad', '超人', 'admin', 'be98207ac6d9de9ce8f53ada21922be3', null, null, '880d185f11794395a9439705eab558e0', '', 'a6a5b5dffe754fd5901698bf10cf2f15', null, '37b73a43f23a42edb6bef45a96628217', '', '', null, '2017-09-18 02:15:17', null, 'da8c252c6672450db9a4af267aa5e6ad', '-1');
INSERT INTO `sys_user` VALUES ('e53a23d606014114b72a9c40b3c57bf8', '加盟方', '13346602135', 'c67927cc042e300da015d51477cede1c', null, 'NULL', '\'880d185f11794395a9439705eab558e0\'', 'NULL', 'NULL', null, '2', '100006', 'NULL', '2017-11-24 16:01:11', '2017-11-24 16:44:15', 'NULL', 'e53a23d606014114b72a9c40b3c57bf8', '-1');
