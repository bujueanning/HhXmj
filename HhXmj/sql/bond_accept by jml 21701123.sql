/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-23 17:29:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bond_accept
-- ----------------------------
DROP TABLE IF EXISTS `bond_accept`;
CREATE TABLE `bond_accept` (
  `bond_accept_id` varchar(255) NOT NULL COMMENT '主键',
  `bond_company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `bond_asset_number` varchar(255) DEFAULT NULL COMMENT '资产编号',
  `bond_accept_time` datetime DEFAULT NULL COMMENT '接单时间',
  `bond_accept_name` varchar(255) DEFAULT NULL COMMENT '接单处置方',
  `bond_accept_property` varchar(255) DEFAULT NULL COMMENT '处置方性质:1_接单，2_抢单',
  `bond_deal_name` varchar(255) DEFAULT NULL COMMENT '处置方名称',
  `bond_deal_phone` varchar(255) DEFAULT NULL COMMENT '处置方电话',
  `bond_deal_type` varchar(255) DEFAULT NULL COMMENT '处置方式',
  `bond_deal_img` varchar(255) DEFAULT NULL COMMENT '处置方图片',
  `bond_choose` varchar(255) DEFAULT NULL COMMENT '选择处置方：1_未选择,2_已确定',
  `bond_disposal_createuid` varchar(255) DEFAULT NULL COMMENT '发布人',
  `bond_disposal_id` varchar(255) DEFAULT NULL COMMENT '资产委外的id',
  `bond_accept_createuid` varchar(255) DEFAULT NULL COMMENT '报名的id',
  PRIMARY KEY (`bond_accept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报名的处置方信息表';

-- ----------------------------
-- Records of bond_accept
-- ----------------------------
INSERT INTO `bond_accept` VALUES ('09fa09f36c8d47edb98cda1342a0aa95', '需要报名的资产', '3247832423', '2017-11-07 00:00:00', 'b2', 'b2', 'b2', 'b2', 'b2', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '3bd3ba4068eb4d97974be60048b471e7', null);
INSERT INTO `bond_accept` VALUES ('0df74eec2b9447cc87e6aaf439ba3ee0', '需要报名的资产', '3247832423', '2017-11-07 00:00:00', 'b3', 'b3', 'b3', 'b3', 'b3', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '3bd3ba4068eb4d97974be60048b471e7', null);
INSERT INTO `bond_accept` VALUES ('0ed7caf02b254c8f8e334f9482ed671c', '西瓜', '5421321852', '2017-11-07 00:00:00', '瓜瓤', '瓜瓤', '瓜瓤', '瓜瓤', '瓜瓤', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', 'bf1a882414984d6ab031140cc8e7b756', null);
INSERT INTO `bond_accept` VALUES ('1', '东方红睿逸定期开放', '001309', '2017-10-03 00:00:00', '板蓝根集团', '国企', '炎某', '13515444564', '外访', null, '1', null, '10', null);
INSERT INTO `bond_accept` VALUES ('119a89794715408889e357bd9b681eb4', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', '2', null, '14', null);
INSERT INTO `bond_accept` VALUES ('1d915b964d6942cc8a6d5af5f03ecf90', '哇哈哈', '12364312312', '2017-11-07 00:00:00', 'W1', 'W1', 'W1', 'W1', 'W1', 'null\\null', '2', 'da8c252c6672450db9a4af267aa5e6ad', '3eb81824a932421d8296d16870e81a83', null);
INSERT INTO `bond_accept` VALUES ('22805f1853be483899fc21c3b983557d', '西瓜', '5421321852', '2017-11-07 00:00:00', '刨冰', '刨冰', '刨冰', '刨冰', '刨冰', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', 'bf1a882414984d6ab031140cc8e7b756', null);
INSERT INTO `bond_accept` VALUES ('3f2d419b143846be88a3d1a27cd9d1ff', '绿洲闪贷资产包', '12365555', '2017-11-21 00:00:00', '1', '1', '1', '1', null, 'null\\null', '1', 'b7494ab7e2244db7971ab6ac62966b7d', 'ba1df9ed15f247d6a771cd0df9c5d2ce', null);
INSERT INTO `bond_accept` VALUES ('43b8ae4c4b96461881ab51e77ce73172', '东方红睿轩沪港深', '169103', '2017-11-09 00:00:00', null, null, null, null, null, 'null\\null', '1', null, '11', null);
INSERT INTO `bond_accept` VALUES ('443bfaaacf554696a87eb2dbe80c82a2', '东方红睿逸定期开放', '001309', '2017-10-25 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', 'files/2017/10/25/14\\9d4ef5de-f873-4a00-8c78-f914ddba194f.jpg', '2', null, '10', null);
INSERT INTO `bond_accept` VALUES ('53f251eedbb44729ad7f1e4a5b2f2e69', '11月6号', '964223842', '2017-11-06 00:00:00', '紫色', '国企', '江', '16354789354', '外访', 'files/2017/11/06/11\\4ede13d6-9dfc-4861-9f2d-12f6193094df.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', 'eb834d3dc41d43da916f9d46f0385636', null);
INSERT INTO `bond_accept` VALUES ('548eb885ddba45bfa46b44a224378bcb', '瓶子', '99999999', '2017-11-10 00:00:00', '啤酒', 'ho', '萨', '9883332214', null, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', '552731f2d6704e9c8c49684073cf332a', null);
INSERT INTO `bond_accept` VALUES ('69b000a9286c48288687d78e2fe8412a', '绿洲闪贷资产包', '12365555', '2017-11-21 00:00:00', '12', '1', '1', '1', null, 'null\\null', '1', 'b7494ab7e2244db7971ab6ac62966b7d', 'ba1df9ed15f247d6a771cd0df9c5d2ce', null);
INSERT INTO `bond_accept` VALUES ('70ec58935f5246a78b1bfc4917eb6523', '绿洲闪贷资产包', '12365555', '2017-11-22 14:45:49', null, '1', null, null, null, 'null\\null', '1', 'b7494ab7e2244db7971ab6ac62966b7d', 'ba1df9ed15f247d6a771cd0df9c5d2ce', null);
INSERT INTO `bond_accept` VALUES ('7827bd2116504c5aa7a76604d0a362af', '需要报名的资产', '3247832423', '2017-11-07 00:00:00', 'b1', 'b1', 'b1', 'b1', 'b1', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '3bd3ba4068eb4d97974be60048b471e7', null);
INSERT INTO `bond_accept` VALUES ('7c51532cf5ba42479186e7588d546712', '芝麻', '6541613212', '2017-11-07 00:00:00', '水母', '水母', '水母', '水母', '水母', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '6359879020494fc5a211cad0c0867e33', null);
INSERT INTO `bond_accept` VALUES ('7d22b20a45ef40dcbc8acefa0b13ae53', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a3', 'a3', 'a3', 'a3', 'a3', 'null\\null', '2', 'da8c252c6672450db9a4af267aa5e6ad', 'fe95fb3626cf4e2a8c9a9373894777b5', null);
INSERT INTO `bond_accept` VALUES ('81d27cd2a0a84b61ba593bab53bb2900', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', 'null\\null', '2', null, '823994348a064503bbb83eca8047d253', null);
INSERT INTO `bond_accept` VALUES ('8a89968b14f74519a4788b30ed99c837', '东方红睿轩沪港深', '169103', '2017-11-03 14:51:07', '1', '1', '1', '12334562139', '1', 'files/2017/11/03/14\\16b81552-043d-437d-a034-3bae10fcdd90.jpg', '1', null, '11', null);
INSERT INTO `bond_accept` VALUES ('906e291ed61246139e357585289c686d', '水木公司', '495453212', '2017-11-07 00:00:00', 'a3', 'a3', 'a3', 'a3', 'a3', 'null\\null', '1', null, '0506e5b2f72e4d6d99f5dd0ad0fe6010', null);
INSERT INTO `bond_accept` VALUES ('967fd030b32b4a2f97c6aecec399f54f', '瓶子', '99999999', '2017-11-10 00:00:00', '可乐', '12', '12', '12', '12', 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', '552731f2d6704e9c8c49684073cf332a', null);
INSERT INTO `bond_accept` VALUES ('a0b163bd8610420688819c33a6897991', '芝麻', '6541613212', '2017-11-07 00:00:00', '海', '海', '海', '海', '海', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '6359879020494fc5a211cad0c0867e33', null);
INSERT INTO `bond_accept` VALUES ('a4bfeb595d9b473aa29c8fbdf62cc377', '11月6号', '964223842', '2017-11-06 00:00:00', '樱色', '国企', '烟', '123456789987', null, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', 'eb834d3dc41d43da916f9d46f0385636', null);
INSERT INTO `bond_accept` VALUES ('b8f911467c4a4bf3adcd2524db119025', '雪佛兰集团', '4654231', '2017-11-03 00:00:00', '黄蜂集团', '自营', '大先生', '16466321303', '电催', 'files/2017/11/03/09\\8161dda7-96ba-417c-80ab-5a884b36139a.jpg', '1', null, '1148ecc497da47cf9d4f316931dc81d2', null);
INSERT INTO `bond_accept` VALUES ('c26f94aebcbb46a6bdd7803d6db2be06', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a1', 'a1', 'a1', 'a1', 'a1', 'null\\null', '2', 'da8c252c6672450db9a4af267aa5e6ad', 'fe95fb3626cf4e2a8c9a9373894777b5', null);
INSERT INTO `bond_accept` VALUES ('cd7e07aa03594c2baf2f91a772fc3ea2', '绿叶子有限公司', '16412121', '2017-10-31 10:59:01', '环境保护集团', '国企', '李某某', '12334562139', '电催', 'null\\null', '1', null, '823994348a064503bbb83eca8047d253', null);
INSERT INTO `bond_accept` VALUES ('d117e57bf9e644b79ac9e36f2f4993e4', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a2', 'a2', 'a2', 'a2', 'a2', 'null\\null', '2', 'da8c252c6672450db9a4af267aa5e6ad', 'fe95fb3626cf4e2a8c9a9373894777b5', null);
