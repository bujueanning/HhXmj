/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-29 17:00:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bond_disposal
-- ----------------------------
DROP TABLE IF EXISTS `bond_disposal`;
CREATE TABLE `bond_disposal` (
  `bond_disposal_id` varchar(255) NOT NULL COMMENT '主键',
  `bond_company_name` varchar(255) DEFAULT '''NULL''' COMMENT '企业名称',
  `bond_asset_number` varchar(255) DEFAULT '''NULL''' COMMENT '资产编号',
  `bond_disposal_arrears` varchar(255) DEFAULT '''NULL''' COMMENT '欠款',
  `bond_listing_start_time` datetime DEFAULT NULL COMMENT '挂牌开始时间',
  `bond_listing_end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '挂牌结束时间',
  `bond_transfer_ratio` varchar(255) DEFAULT '''NULL''' COMMENT '转让比例',
  `bond_disposal_state` tinyint(4) DEFAULT NULL COMMENT '状态:1_待签约,2_已发布',
  `bond_release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `bond_product_solutions` tinyint(4) DEFAULT NULL COMMENT '债权类型:5_信誉贷,6_抵押贷,7_担保贷',
  `bond_ownership_amount` varchar(255) DEFAULT '''NULL''' COMMENT '权属金额',
  `bond_bidding_cycle` int(11) DEFAULT NULL COMMENT '期限（自动计算天数）',
  `bond_classify` tinyint(4) DEFAULT NULL COMMENT '处置模式:1_处置方接单,2_处置方竞单',
  `bond_location` varchar(255) DEFAULT '''NULL''' COMMENT '债权人地址',
  `bond_contacts` varchar(255) DEFAULT '''NULL''' COMMENT '联系人',
  `bond_contact_number` varchar(255) DEFAULT '''NULL''' COMMENT '联系人电话',
  `bond_disposal_img` varchar(255) DEFAULT '''NULL''' COMMENT '展示图片',
  `bond_verify` varchar(255) DEFAULT NULL COMMENT '审核状态：1_待审核 2_已审核  3_退回',
  `bond_disposal_createuid` varchar(255) DEFAULT NULL COMMENT '创建人',
  `bond_disposal_updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `bond_unable` tinyint(4) DEFAULT NULL COMMENT '0_可接单报名、1_不可操作',
  `bond_disposal_accessory` varchar(255) DEFAULT NULL COMMENT '附件',
  `bond_overdue` varchar(255) DEFAULT NULL COMMENT '逾期时间',
  `bond_case` varchar(255) DEFAULT NULL COMMENT '资产包案件数量',
  `bond_deadline` varchar(255) DEFAULT NULL COMMENT '委外期限',
  `bond_deal` tinyint(4) DEFAULT NULL COMMENT '交易类型:1_单笔委外,2_委外包',
  `bond_debt_location` varchar(255) DEFAULT NULL COMMENT '债务人地址',
  `bond_show` tinyint(4) DEFAULT NULL COMMENT '加盟方是否接单:0_不优先接单,1_优先接单',
  `bond_auditor` varchar(255) DEFAULT NULL COMMENT '加盟方审核人',
  PRIMARY KEY (`bond_disposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产委外信息';

-- ----------------------------
-- Records of bond_disposal
-- ----------------------------
INSERT INTO `bond_disposal` VALUES ('0506e5b2f72e4d6d99f5dd0ad0fe6010', '水木公司', '495453212', '1110000', '2017-11-09 00:00:00', '2017-11-29 16:50:40', '65%', '1', '2017-11-03 10:36:01', '5', '3', '21', '2', '110001', '林某某', '111111111111', 'files/2017/11/03/10\\21ca0294-21cc-43b8-8bfe-78983259356a.jpg', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('0830d5c797854c53b6550d7e271f7daf', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '110001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('0ddce74f07764ff9849bdf342bb7a041', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '110001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('1', '东方红新动力', '000480', '1.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '91%', '1', '2017-11-02 16:16:42', '5', '3', '89', '1', '110001', '六某某', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('10', '东方红睿逸定期开放', '001309', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-11-02 16:03:09', '5', '2', '89', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('11', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-08-04 00:00:00', '5', '3', '100', '1', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('1148ecc497da47cf9d4f316931dc81d2', '雪佛兰集团', '4654231', '1036100112', '2017-11-05 00:00:00', '2017-11-29 16:50:40', '78%', '1', '2017-11-09 17:26:41', '6', '4', '1', '1', '110001', '李某某', '13454543211', 'files/2017/11/01/14\\1d03208d-9407-43c7-906c-bc1d0ec7a92e.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('12', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '4', '190', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('13', '	东方蓝睿丰', '001205', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-08-04 00:00:00', '5', '4', '300', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('14', '东方黄睿丰', '001206', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '1', '500', '1', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('15', '东方红京东大数据', '001564', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '2', '600', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('2', '东方红新动力', '000480', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '2', '170', '2', '110002', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('2a0bf4c0a2ae496d8644d8a3af1b96c8', '中国电信', '1387931275', '220000', null, '2017-11-28 16:44:32', '9%', '1', '2017-11-24 11:01:40', '5', '1', null, '1', '150001', '王', '187626887733', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-24 11:13:25', '0', null, '3个月', '1份', '3个月', '1', '110012', null, null);
INSERT INTO `bond_disposal` VALUES ('2f62aff95c3348329a08dba7569545be', '发布时创建id', '1651323211', '12', '2017-10-31 00:00:00', '2017-11-28 16:44:32', '5%', '1', '2017-11-10 00:00:00', '5', '1', '8', '1', '110002', '伊', '10666668792', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-16 09:28:35', '0', null, '65天', null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('3', '东方红睿丰', '169101', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-08-04 00:00:00', '5', '3', '300', '1', '110002', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('36844f4d5c1644e595b7fe4594e6a8e2', '紫叶子', '2135432135', '167', '2017-11-01 00:00:00', '2017-11-29 16:50:40', '76%', '1', '2017-11-06 16:40:36', '5', '3', '29', '1', '110001', '陆', '1234446873', 'files/2017/11/06/15\\60b4a93e-21d2-46ed-819f-af0ae8535da5.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('3874dfc93c6d4315bccb075ff7fd126b', '11月6日', '97523452', '300', '2017-11-07 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-11-06 00:00:00', '5', '4', '23', '1', '110001', '江一一', '13546632546', 'files/2017/11/06/09\\66f15baf-e496-4ed8-9a2b-c3dd1f09a3ff.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('38cba9aeba3d46f19a6bb0d79aced57b', '支付保', '0001', '50000', null, '2017-11-29 16:51:26', '10%', '1', '2017-11-24 14:56:29', '5', '1', null, '1', '110002', '张', '15112445889', '\'NULL\'', '2', '6a7e6f30d2d44566ab1172569e28416c', '2017-11-24 14:57:07', '1', null, '45', '1份', '3个月', '1', '110005', null, null);
INSERT INTO `bond_disposal` VALUES ('3bd3ba4068eb4d97974be60048b471e7', '需要报名的资产', '3247832423', '65', '2017-11-21 00:00:00', '2017-11-29 16:50:40', '97%', '1', '2017-11-07 11:24:54', '5', '2', '11', '2', '110008', '浩', '1354889642', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('3cf02638e9aa4b0e96b4bdd85320eac7', 'aa1', 'qq', 'qq', '2017-11-16 00:00:00', '2017-11-29 16:50:40', 'qq%', '1', '2017-11-09 00:00:00', '6', '1', '14', '1', '110005', 'qqq', 'qq', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/委外表.xlsx', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('3d833e400920425aba01aa9ea2b31ab9', '千牛速贷', '95435454', '560000', null, '2017-11-28 16:45:23', '9%', '1', '2017-11-15 16:48:06', '7', '2', null, '1', '110004', '钱', '1', '\'NULL\'', '2', '620afbf9047442888a8db580baafb839', '2017-11-20 16:30:45', '1', null, '2-3个月', '59份', '2个月', '2', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('3eb81824a932421d8296d16870e81a83', '哇哈哈', '12364312312', '65', '2017-11-20 00:00:00', '2017-11-29 16:50:40', '87%', '1', '2017-11-07 11:06:15', '6', '2', '-13', '2', '110004', '王', '17321373242', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('4', '东方红睿阳', '169201', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-11-02 14:32:49', '5', '4', '89', '2', '110006', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('4cef9e18902d4d64a04dc6d4fe764d7d', '3A健康', '1231010123', '111', '2017-11-17 00:00:00', '2017-11-29 16:50:40', '87%', '1', '2017-11-06 16:40:07', '5', '3', '13', '2', '110006', '伊', '1336465746', 'files/2017/11/06/15\\6c8efb98-6499-4b08-b81e-76a39af51bf1.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('4f7349d83ad84184979256e4ca8988a2', '人人追', '1654651', '650000', null, '2017-11-29 16:44:51', '5%', '1', '2017-11-15 11:29:56', '6', '2', null, '2', '10005', '常', '135468794645', 'files/2017/11/29/16\\dd17d845-d4c2-4a22-93fb-ba6b298c10b2.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-29 16:44:51', '0', null, '65天', '1份', '3个月', '1', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_disposal` VALUES ('5', '东方红睿元', '000970', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '1', '20', '1', '110006', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('552731f2d6704e9c8c49684073cf332a', '瓶子', '99999999', '164', '2017-11-08 00:00:00', '2017-11-29 16:50:40', '78%', '1', '2017-11-10 00:00:00', '5', '3', '1', '2', '110006', '齐', '125463987', 'files/2017/11/10/09\\20bde015-b020-4297-924a-a2ab305f7943.jpg', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('556ed8d424864d739a025f76a4d757a8', '3S健康顾问', '123642723', '169', '2017-11-13 00:00:00', '2017-11-29 16:50:40', '85%', '1', '2017-11-07 09:23:34', '6', '3', '9', '2', '110006', '齐', '15643332546', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('55f7b4f8f6014a1d905cb7f5c9c85272', '东方一气大众', '10011', '2500000', '2017-10-03 00:00:00', '2017-11-29 16:50:40', '75%', '1', '2017-11-01 15:06:26', '5', '4', '29', '1', '110006', '刘某某', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('5da449ff82694c2e84dcbe48840bee2f', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '300001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('5e4644a5c8a442f7b43a2240c39db881', '饼子', '1232399562331', '63', '2017-11-02 00:00:00', '2017-11-29 16:50:40', '98%', '1', '2017-11-10 09:04:11', '5', '2', '21', '1', '300001', '那', '1231561', 'files/2017/11/10/09\\e06aca66-f548-47f3-9c1d-602e33dc793d.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-08-04 00:00:00', '5', '2', '170', '2', '300001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6359879020494fc5a211cad0c0867e33', '芝麻', '6541613212', '11', '2017-10-29 00:00:00', '2017-11-29 16:50:40', '96%', '1', '2017-11-07 00:00:00', '5', '1', '25', '2', '300001', '候', '1354896532', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('636bb1d2745f4f92bc50688c282fd422', '36524连锁餐饮', '1234567', '600000', '2017-10-11 00:00:00', '2017-11-29 16:50:40', '76%', '1', '2017-11-01 15:39:50', '5', '2', '21', '1', '300001', '林某某', '13334561236', 'files/2017/10/23/11\\1e12d6f8-c2ba-4882-955d-d1a7c6d613aa.jpg', '2', null, null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('662a97021a744b5fb43f7d97952f3965', '黄金季节', '123121', '132', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '67%', '1', '2017-11-06 00:00:00', '5', '3', '9', '1', '300001', '尽', '136563226912', 'files/2017/11/06/15\\f3d7ccc2-e1de-41ec-9497-1c8488c51125.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('680cf07acb8b4191a47063db501c4735', '3A健康', '1231010123', '111', '2017-11-17 00:00:00', '2017-11-29 16:50:40', '87%', '1', '2017-11-06 16:39:18', '5', '3', '13', '2', '300001', '伊', '1336465746', 'files/2017/11/06/15\\9e95cc81-dc7d-4b6f-a7f6-80b56e46a073.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6ab67dc082204101883baf36d05921d3', '芝麻', '6541613212', '11', '2017-10-29 00:00:00', '2017-11-29 16:50:40', '96%', '1', '2017-11-07 00:00:00', '5', '1', '25', '2', '300001', '候', '1354896532', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6bc860636da948209da5b3895aa0015a', 'aa3', 'a', 'a', '2017-11-05 00:00:00', '2017-11-29 16:50:40', 'a%', '1', '2017-11-09 00:00:00', '6', '1', '25', '1', '300001', 'a', 'a', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/问题描述.docx', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6cce6ab3fbb04255842423c70e6ca9da', '2', '2', '2', '2017-11-07 00:00:00', '2017-11-29 16:50:40', '2%', '1', '2017-11-08 00:00:00', '6', '1', '7', '1', '300001', '2', '2', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/新建文本文档.txt', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6d9e0dc7f2224955bc36689f8a4deca4', 'aa2', 'ww', 'ww', '2017-11-10 00:00:00', '2017-11-29 16:50:40', 'ww%', '1', '2017-11-09 00:00:00', '6', '1', '13', '1', '300001', 'ww', 'ww', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/jquery兄弟节点.txt', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6dd844c709064ce5be0b8011a37cb18b', '发布时创建id', '1651323211', '12', '2017-10-31 00:00:00', '2017-11-29 16:50:40', '54%', '1', '2017-11-10 00:00:00', '6', '1', '8', '1', '300001', '伊', '10666668792', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('6f349680cf2c4a37b284cb4b08483afc', '安安', '2354352', 'aa', '2017-11-15 00:00:00', '2017-11-29 16:50:40', 'aa%', '1', '2017-11-09 00:00:00', '6', '1', '15', '1', '300001', 'aa', 'aa', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/位面电梯.zip', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('7', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '3', '350', '1', '300001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('70144f1f1a9643f0bdcf73c4919ec7b0', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '300001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('7f6b11a28d604f70831579a7456768cf', '需要接单的资产', '1236745843', '110', '2017-11-07 00:00:00', '2017-11-29 16:50:40', '76%', '1', '2017-11-07 11:25:03', '5', '3', '17', '1', '30012', '江', '136544329555', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('8', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '2', '2017-08-04 00:00:00', '5', '4', '710', '2', '30012', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('8133ff3a3b9f461fb0171209d3e93431', '安安', '2354352', 'aa', '2017-11-15 00:00:00', '2017-11-29 16:50:40', 'aa%', '1', '2017-11-09 00:00:00', '6', '1', '15', '1', '30012', 'aa', 'aa', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/位面电梯.zip', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('823994348a064503bbb83eca8047d253', '绿叶子有限公司', '16412121', '800000', '2017-09-12 00:00:00', '2017-11-29 16:50:40', '76%', '1', '2017-11-01 14:57:13', '5', '2', '63', '2', '30012', '叶某某', '11215423541', 'files/2017/10/31/10\\45c991a8-6dde-4fd6-aa0d-d885a12e5a1f.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-14 14:48:35', '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('8df2581d5e80484c98d40d6aa49603a1', '1', '1', '1', '2017-11-09 00:00:00', '2017-11-29 16:50:40', '1%', '1', '2017-11-08 00:00:00', '6', '1', '-2', '1', '30012', '1', '1', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'files/2017/11/08/16\\23b2a3e9-f7a0-4b60-af2d-9334bce3f4a0.txt', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('8f8e96d5bb434309aeb79ed4d7667905', '数码世纪', '8962136782', '154', '2017-11-07 00:00:00', '2017-11-29 16:50:40', '69%', '1', '2017-11-07 00:00:00', '5', '3', '22', '1', '30012', '金', '1568453132131', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('9', '东方红稳健精选C', '001204', '123.3123.00', '2017-08-04 00:00:00', '2017-11-29 16:50:40', '89%', '1', '2017-08-04 00:00:00', '5', '1', '20', '1', '30012', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('98449b4db0814f2ca8a482fcb741668e', '石家庄农业银行资产包', '1221221135421', '25000', null, '2017-11-29 16:53:13', '7%', '1', '2017-11-24 08:55:35', '5', '1', null, '1', '30012', '刘经理', '12559876543212', 'files/2017/11/29/14\\bb7eba42-bd07-4a6d-adaa-d96d01775806.jpg', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-29 14:44:27', '1', null, '1-2个月', '60份', '3个月', '2', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_disposal` VALUES ('a29df537174e485b92e33486d5ed7e0e', '时间进去', '4456', '48', '2017-12-01 00:30:00', '2017-11-29 16:50:40', '65%', '1', '2017-11-10 00:00:00', '6', '1', '7', '1', '30012', '12', '12', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('a92e0e743a39433ea8a24086a3163187', '工商', '39644561231', '110000', null, '2017-11-28 16:44:32', '5%', '1', '2017-11-24 09:02:13', '5', '1', null, '1', '130004', '何经理', '13546879542', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-24 09:11:07', '0', null, '1个月', '1份', '1个月', '1', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('b0ecd8e24414495294d6629dafc92fdc', '需要报名的资产', '3247832423', '65', '2017-11-21 00:00:00', '2017-11-29 16:50:40', '97%', '1', '2017-11-07 00:00:00', '5', '2', '11', '2', '30012', '浩', '1354889642', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('b2c16ebd84c54e16a37f708c16ff9f42', '货到付款资产包', '123987785', '560000', null, '2017-11-29 16:47:32', '6%', '1', '2017-11-16 09:50:47', '5', '2', null, '2', '110004', '仓', '1234569', 'files/2017/11/29/16\\a9ebafb7-ed12-4dc8-90e1-0384e5fa2ee6.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-29 16:47:32', '0', null, '2-4个月', '56份', '2个月', '2', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_disposal` VALUES ('b3406a26b3f54d319d2128e156598a02', 'aa3', 'ee', 'ee', '2017-11-02 00:00:00', '2017-11-29 16:50:40', 'ee%', '1', '2017-11-09 00:00:00', '6', '1', '8', '1', '30012', 'ee', 'ee', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/资产包.xls', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('b40a5cf9e4954af4bc171fbd75214fd5', '借贷保', '0002', '50000', null, '2017-11-29 14:48:13', '15%', '1', '2017-11-27 09:58:54', '5', '1', null, '1', '110002', '王', '13363333355', '\'NULL\'', '2', '6a7e6f30d2d44566ab1172569e28416c', '2017-11-27 10:03:02', '1', null, '2', '1份', '2', '1', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('b6b48373db01441c85be78671ce53fb2', '宜而爽有限公司', '123456', '1060000', '2017-10-13 00:00:00', '2017-11-29 16:50:40', '65%', '1', '2017-10-27 15:21:06', '6', '3', '14', '1', '40009', '王某某', '15613123151', 'D:\\eclipse-luna\\apache-tomcat-7.0.79\\wtpwebapps\\HhXmj\\files\\2017\\10\\23\\10\\954257e2-0f9e-425b-af44-19c2735b8b4f.jpg', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('b9279ecc21344940b52591dd7213749a', '灌灌灌灌灌', '001', '50', '2017-11-16 00:00:00', '2017-11-29 16:50:40', '10%', '1', '2017-11-10 00:00:00', '5', '3', '14', '1', '40009', '啧啧啧', '123', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('ba1df9ed15f247d6a771cd0df9c5d2ce', '绿洲闪贷资产包', '12365555', '30000', null, '2017-11-28 16:44:32', '4%', '1', '2017-11-15 10:33:28', '7', '2', null, '2', '10004', '开', '13565548754', '\'NULL\'', '2', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 10:06:07', '0', null, '2~3个月', '105份', '3个月', '2', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('bf1a882414984d6ab031140cc8e7b756', '西瓜', '5421321852', '75', '2017-11-08 00:00:00', '2017-11-29 16:50:40', '90%', '1', '2017-11-07 00:00:00', '5', '2', '22', '2', '40009', '洪', '135788888965', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null, '1个月', '2', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('bfac6ba438774e2f9e00ee28d3e8da1d', '支付保', '0001', '50000', null, '2017-11-29 16:51:29', '10%', '1', '2017-11-24 14:57:13', '5', '1', null, '1', '110002', '张', '15112445889', '\'NULL\'', '1', '6a7e6f30d2d44566ab1172569e28416c', null, '0', null, '45', '1份', '3个月', '1', '110005', null, null);
INSERT INTO `bond_disposal` VALUES ('c41d9df6073d46c481276a07a1f47fb5', '蒙牛集团', '62341232434', '45', '2017-11-07 00:00:00', '2017-11-29 16:50:40', '98%', '1', '2017-11-14 14:49:47', '5', '1', '7', '1', '140002', '\'NULL\'', '\'NULL\'', 'files/2017/11/06/10\\b6e4856c-7866-476b-a0ea-b8506acb637d.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-15 16:01:07', null, null, null, null, '1个月', '2', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('c4952624d7e24edba241f77d7caedf2c', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '40009', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', '2', '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('c774723894e945cbb382b972a7d5fa36', '信息付', '001', '1000000', null, '2017-11-29 16:51:30', '10%', '1', '2017-11-29 11:03:19', '5', '1', null, '1', '150002', '姚', '123', '\'NULL\'', '3', '6a7e6f30d2d44566ab1172569e28416c', '2017-11-29 11:05:26', '0', null, '30', '1份', '3个月', '1', '150002', null, null);
INSERT INTO `bond_disposal` VALUES ('c950f06ac2974832a7812e7377a15acf', '中国联通', '135465213', '110000', null, '2017-11-28 16:44:32', '9%', '1', '2017-11-24 11:59:41', '5', '1', null, '1', '10001', '钱', '135655959', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-24 13:44:15', '1', null, '1个月', '1份', '2个月', '1', '110015', null, null);
INSERT INTO `bond_disposal` VALUES ('caa0191a5f1b46bba72d07e943f47044', '中国银行', '1245648', '120000', null, '2017-11-28 16:44:32', '8%', '1', '2017-11-24 09:46:26', '5', '1', null, '1', '110001', '周', '15324745454', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-24 11:58:28', '1', null, '2个月', '1份', '3个月', '1', '120006', null, null);
INSERT INTO `bond_disposal` VALUES ('cb04ea3d332f484b90c10b9447679192', '表', '11111', '32', '2017-11-08 00:00:00', '2017-11-29 16:50:40', '76%', '1', '2017-11-08 00:00:00', '6', '1', '8', '2', '40009', '机', '13694545', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('e16d5d7b6bef4b51b96a61982d2e39d4', '啊', '8343245', '123', '2017-10-30 00:00:00', '2017-11-29 16:50:40', '43%', '1', '2017-11-10 00:00:00', '6', '1', '16', '1', '40009', '山东省', ' ', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/577ccb8012597.jpg', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('e343845df63c48abae9e0ddbd6014fed', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '40009', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', 'files/2017/11/08/16\\147e2484-0550-49cf-8bd0-bd0a68cd31e5.txt', null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('e60d3f949ef54031b087d1408dcfc146', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '40009', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('e63e1b0f219940889136ea47c3153c87', '支付保', '0001', '50000', null, '2017-11-29 16:51:31', '10%', '1', '2017-11-24 15:03:09', '5', '1', null, '1', '110002', '张', '15112445889', '\'NULL\'', '1', '6a7e6f30d2d44566ab1172569e28416c', null, '0', null, '45', '1份', '3个月', '1', '110005', null, null);
INSERT INTO `bond_disposal` VALUES ('eac1a016b1b448f6bd0aa80678fd2928', '橘黄', '16568345', '34', '2017-11-16 00:00:00', '2017-11-29 16:50:40', '95%', '1', '2017-11-07 00:00:00', '5', '1', '8', '1', '40009', '炎', '13255874521', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('eb834d3dc41d43da916f9d46f0385636', '11月6号', '964223842', '160', '2017-11-15 00:00:00', '2017-11-29 16:50:40', '68%', '1', '2017-11-06 00:00:00', '5', '3', '15', '2', '40009', '历某某', '16354786322', 'files/2017/11/06/10\\b6e4856c-7866-476b-a0ea-b8506acb637d.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('eb94e2d54a7e421ca0bd726e2451e4de', '验证发布人id', '1235465', '64', '2017-11-14 00:00:00', '2017-11-29 16:50:40', '75%', '1', '2017-11-07 00:00:00', '5', '2', '2', '1', '40009', '伊', '161123644554', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('f55961b299e04dc49f864272668f725b', '东丰日产', '45454', '650000', '2017-11-07 00:00:00', '2017-11-29 16:50:40', '65%', '1', '2017-11-01 15:43:43', '5', '2', '18', '1', '40009', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('fbdf4899d5df4c599a89bcd5ff9e10e6', '西瓜', '5421321852', '75', '2017-11-08 00:00:00', '2017-11-29 16:50:40', '90%', '1', '2017-11-07 00:00:00', '5', '2', '22', '2', '40009', '洪', '135788888965', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, null, null, '1个月', null, '110001', null, null);
INSERT INTO `bond_disposal` VALUES ('fe95fb3626cf4e2a8c9a9373894777b5', '3S健康顾问', '123642723', '169', '2017-11-13 00:00:00', '2017-11-29 11:09:04', '85%', '1', '2017-11-07 00:00:00', '6', '3', '9', '2', '40009', '齐', '15643332546', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, null, null, '1个月', '2', '110005', null, null);



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
INSERT INTO `sys_menu` VALUES ('1212ecbeb8f2439db47d22067fb07a68', 'ccc19d77c84342c69887cd22b8bfd5de', '加盟方审核', 'sys/bond/joinlist?bond_verify=1', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('19d9e0d3ecff4e339de7d910b6227c67', '0ccd416d257246d79231d7db876a9075', '角色配置', 'sys/role/treerolemenupermconf', '', '');
INSERT INTO `sys_menu` VALUES ('1cfb5064e86a42b2a3118446ae678bca', 'ccc19d77c84342c69887cd22b8bfd5de', '委外订单', 'sys/bond/sheetList', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('220941abb91b457889ac3f9865a1240f', '2b1753b058f1433a8defe794013ecfc8', '发布方公告', 'release/notice/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('26dc8309b2f8414b924b6166d821a637', 'e72d1f637ac940aebbe2a36e0b2e0a88', '资产查询', 'sys/goods/list', null, null);
INSERT INTO `sys_menu` VALUES ('2b1753b058f1433a8defe794013ecfc8', 'root', '网站信息', 'NULL', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('31a453c233c8447fa39759b8abefc905', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('3652a1edc49a4972881792d1969ec0f7', '817e76595b5241d386c4a66f0122d599', '发布方查询', 'sys/user/query?sys_user_reg_type_d=a77fda4f171f45f1b089f0dd18221e22', 'NULL', 'NULL');
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
INSERT INTO `sys_menu` VALUES ('c97112728510447ab130a85b88541d92', 'ccc19d77c84342c69887cd22b8bfd5de', '单笔资产审核', 'sys/bond/list?bond_deal=1', 'NULL', 'NULL');
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
INSERT INTO `sys_menu` VALUES ('f9bce4469f4447a39c33cd5b3c44827e', 'ccc19d77c84342c69887cd22b8bfd5de', '资产包审核', 'sys/bond/list?bond_deal=2', 'NULL', 'NULL');
