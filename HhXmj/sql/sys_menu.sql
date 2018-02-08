/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-15 17:17:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `sys_menu_id` varchar(32) NOT NULL COMMENT '主键',
  `sys_menu_pid` varchar(32) DEFAULT 'NULL' COMMENT '父主键',
  `sys_menu_name` varchar(50) DEFAULT 'NULL' COMMENT '菜单名称',
  `sys_menu_url` varchar(500) DEFAULT 'NULL' COMMENT '菜单地址',
  `sys_menu_order` varchar(20) DEFAULT 'NULL' COMMENT '菜单排号',
  `sys_menu_icon_url` varchar(50) DEFAULT 'NULL' COMMENT '菜单图标地址',
  PRIMARY KEY (`sys_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=780 ROW_FORMAT=DYNAMIC COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('06015fb13ca344a7b5519819fd129124', '2b1753b058f1433a8defe794013ecfc8', '处置方公告', 'manage/notice/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('0ccd416d257246d79231d7db876a9075', 'root', '系统管理', '', '', '');
INSERT INTO `sys_menu` VALUES ('19d9e0d3ecff4e339de7d910b6227c67', '0ccd416d257246d79231d7db876a9075', '角色配置', 'sys/role/treerolemenupermconf', '', '');
INSERT INTO `sys_menu` VALUES ('1cfb5064e86a42b2a3118446ae678bca', 'ccc19d77c84342c69887cd22b8bfd5de', '委外订单', 'sys/bond/sheetList', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('220941abb91b457889ac3f9865a1240f', '2b1753b058f1433a8defe794013ecfc8', '发布方公告', 'release/notice/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('26dc8309b2f8414b924b6166d821a637', 'e72d1f637ac940aebbe2a36e0b2e0a88', '资产查询', 'sys/goods/list', null, null);
INSERT INTO `sys_menu` VALUES ('2b1753b058f1433a8defe794013ecfc8', 'root', '网站信息', 'NULL', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('31a453c233c8447fa39759b8abefc905', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('3652a1edc49a4972881792d1969ec0f7', '817e76595b5241d386c4a66f0122d599', '发布方查询', 'sys/user/query?sys_user_reg_type_d=0', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('41ab04a45d1847a4aa50235f57a87de1', '0ccd416d257246d79231d7db876a9075', '用户管理', 'sys/user/list', '', '');
INSERT INTO `sys_menu` VALUES ('4730ec04a4fc40d09e1c9f17ce56f9ae', 'ccc19d77c84342c69887cd22b8bfd5de', '发布审核', 'sys/bond/list', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('4b9c7c37534b481684755e02aaa40fd7', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('512faabc2b0141adacbef614220cf7e0', '0ccd416d257246d79231d7db876a9075', '数据字典', 'sys/dict/tree', null, null);
INSERT INTO `sys_menu` VALUES ('53a3fbe9d0384791b1f9d243487a4922', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('6e4e2a5ccee04c85a991b75a7c14f8dd', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('7cf4df6cb8664d2db99f4bbab5aea44b', '9e5fb647769b4162b6ba80ad19433741', '角色配置', 'sys/role/treeroleactiviticonf', '', '');
INSERT INTO `sys_menu` VALUES ('817e76595b5241d386c4a66f0122d599', 'root', '用户管理', null, null, null);
INSERT INTO `sys_menu` VALUES ('82450024f2de499397da2cedac74fdf8', 'ccc19d77c84342c69887cd22b8bfd5de', '竞单报名', 'sys/bond/acceptList', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('a459e2be2f8d41a4b9bd0f5b4d441708', '2b1753b058f1433a8defe794013ecfc8', '公司动态', 'company/news/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('a4ecc83b87484c139ffe423b1fb580b6', '817e76595b5241d386c4a66f0122d599', '处置方查询', 'sys/user/query?sys_user_reg_type_d=2', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('b409189f42654fd6a06a7a068113d565', '0ccd416d257246d79231d7db876a9075', '系统文件管理', 'sys/file/list', null, null);
INSERT INTO `sys_menu` VALUES ('b5a632a7a466441294ca53f93571623c', 'd89d4708bdd7406da6f684e4a8d21f2a', '购买记录', 'sys/buy/list', null, null);
INSERT INTO `sys_menu` VALUES ('b5ec76178e1b4553947e879dae19461f', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('ca0481f406074859a9de0cfafe092221', '0ccd416d257246d79231d7db876a9075', '权限管理', 'sys/perm/tree', '', '');
INSERT INTO `sys_menu` VALUES ('cbab83a6a81345e4852f3c5e1682a784', '2b1753b058f1433a8defe794013ecfc8', '走进鑫淼聚', 'about/us/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('ccc19d77c84342c69887cd22b8bfd5de', 'root', '资产委外', 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('d005b1898de74061b5fbde648e54dfec', '9e5fb647769b4162b6ba80ad19433741', '节点管理', 'sys/activiti/tree', '', '');
INSERT INTO `sys_menu` VALUES ('d482851118be4674b09fb386a7bdd02c', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('d48e75286b38452897e6e861a9922b1f', '817e76595b5241d386c4a66f0122d599', '加盟商审核', 'sys/user/query?sys_user_reg_type_d=a55c6e261e774082bbd5521130c5c1e6', null, null);
INSERT INTO `sys_menu` VALUES ('d48e75286b38452897e6e861a9924b1f', '817e76595b5241d386c4a66f0122d599', '用户审核', 'sys/user/query?sys_user_reg_type_d=37b73a43f23a42edb6bef45a96628217', null, null);
INSERT INTO `sys_menu` VALUES ('d48e75286b38452897e6e861a9924b9f', '817e76595b5241d386c4a66f0122d599', '用户查询', 'sys/user/query', null, null);
INSERT INTO `sys_menu` VALUES ('d89d4708bdd7406da6f684e4a8d21f2a', 'root', '购买管理', null, null, null);
INSERT INTO `sys_menu` VALUES ('e3e5d57933b84d4b80c7b6dd9860c9d4', '0ccd416d257246d79231d7db876a9075', '角色管理', 'sys/role/tree', '', '');
INSERT INTO `sys_menu` VALUES ('e72d1f637ac940aebbe2a36e0b2e0a88', 'root', '资产管理', null, null, null);
INSERT INTO `sys_menu` VALUES ('e7dc8a885290493fa3283b196d9ee787', '0ccd416d257246d79231d7db876a9075', '菜单管理', 'sys/menu/tree', '', '');
INSERT INTO `sys_menu` VALUES ('f6f3b0334aa646a88f92d059fc9e5ca8', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('f7cd6582eb4b47b6b623cd5f29ff751e', 'fdf99edaa39148b7a894881a0a5d1c6f', '请假管理', 'sys/leave/list', '', '');
