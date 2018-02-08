/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-09-16 23:42:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auction_assets
-- ----------------------------
DROP TABLE IF EXISTS `auction_assets`;
CREATE TABLE `auction_assets` (
  `auction_assets_id` varchar(36) NOT NULL,
  `auction_project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `auction_project_number` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '项目编号',
  `auction_product_solutions` tinyint(4) DEFAULT NULL COMMENT '产品类: 1、金融国资  2、不良资产 3、非国有资产 4、招商',
  `auction_classify` tinyint(4) DEFAULT NULL COMMENT '分类:1、股权 2、债权 3、实物',
  `auction_bail` decimal(10,0) DEFAULT NULL COMMENT '保证金',
  `auction_bidding_cycle` int(11) DEFAULT NULL COMMENT '竞价周期（自动计算天数）  ',
  `auction_location` varchar(255) DEFAULT NULL COMMENT '所在地',
  `auction_starting_price` decimal(10,2) DEFAULT NULL COMMENT '起拍价（万元） ',
  `auction_fare_increase` decimal(10,0) DEFAULT NULL COMMENT '加价幅度',
  `auction_listing_start_time` datetime DEFAULT NULL COMMENT '挂牌起始时间',
  `auction_listing_end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '挂牌结束时间',
  `auction_project_announcement` longtext COMMENT '项目公告',
  `auction_contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `auction_contact_number` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `auction_verify` tinyint(4) DEFAULT NULL COMMENT '是否审核: 1、待审核  2、已审核  3、退回',
  `auction_assets_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `auction_assets_createuid` varchar(36) DEFAULT NULL COMMENT '创建人',
  `auction_assets_createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `auction_assets_updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`auction_assets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拍卖基本信息';

-- ----------------------------
-- Records of auction_assets
-- ----------------------------
INSERT INTO `auction_assets` VALUES ('11b173f718e947069c2413b8df8feaed', '1', '2017-09-15 22:17:42', '1', '1', '1', '100', '1', '1.00', '11', '2017-09-14 00:00:00', '2017-09-15 22:17:42', '<p>3</p>', '1', '1', '1', 'files/2017/09/14/23\\e1c4789a-80f5-410c-86ce-1a7745c251f7.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-15 22:17:42', '2017-09-15 22:17:42');
INSERT INTO `auction_assets` VALUES ('b0f68a09ece94befa9b57e24fddda136', '6', '2017-09-16 23:16:46', '3', '3', '6', '6', '2', '6.00', null, '2017-09-16 00:00:00', '2017-09-22 00:00:00', '<p>6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;</p>', '6', '6', '1', 'files/2017/09/16/23\\014b344f-307d-409e-82a6-43bbe59e057b.png', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 23:16:46', null);
INSERT INTO `auction_assets` VALUES ('d19e3805f5c64ae7adccf5fc0550ca43', '2', '2017-09-16 20:52:17', '2', '2', '2', '1', '2', '2.00', '2', '2017-09-15 00:00:00', '2017-09-17 00:00:00', '<p>2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/09/15/21\\97cbefb3-5aa0-43f9-8436-5264ed62733c.png', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:52:17', '2017-09-16 20:52:17');

-- ----------------------------
-- Table structure for auction_listing
-- ----------------------------
DROP TABLE IF EXISTS `auction_listing`;
CREATE TABLE `auction_listing` (
  `auction_listing_id` varchar(36) NOT NULL,
  `auction_assets_id` varchar(36) NOT NULL,
  `auction_creditor_capital` decimal(10,0) DEFAULT NULL COMMENT '债权本金（万元）',
  `auction_pledge_capital` decimal(10,0) DEFAULT NULL COMMENT '其中保证本金',
  `auction_mortgage_capital` decimal(10,0) DEFAULT NULL COMMENT '其中抵押本金',
  `auction_impawn_capital` decimal(10,0) DEFAULT NULL COMMENT '其中质押本金（万元） ',
  `auction_creditor_interest` decimal(10,0) DEFAULT NULL COMMENT '债权利息',
  `auction_creditor_yield` decimal(10,0) DEFAULT NULL COMMENT '债权孳生息',
  `auction_real_right` decimal(10,0) DEFAULT NULL COMMENT '物权',
  `auction_stock_right` decimal(10,0) DEFAULT NULL COMMENT '股权',
  `auction_major_issues` longtext COMMENT '重大事项披露',
  PRIMARY KEY (`auction_listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂牌信息：（从表）';

-- ----------------------------
-- Records of auction_listing
-- ----------------------------
INSERT INTO `auction_listing` VALUES ('180a5ef84591472b8aa9c12ad3a23bfa', 'd19e3805f5c64ae7adccf5fc0550ca43', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('c3a21afaffd54739a2cff25ba7d05647', '11b173f718e947069c2413b8df8feaed', '11', '1', '1', '1', '1', '1', '11', '1', '1');
INSERT INTO `auction_listing` VALUES ('e72a67a54da34ccf98609fbc90365e93', 'b0f68a09ece94befa9b57e24fddda136', '6', '6', '6', '6', '6', '6', '6', '6', '66');

-- ----------------------------
-- Table structure for auction_overview
-- ----------------------------
DROP TABLE IF EXISTS `auction_overview`;
CREATE TABLE `auction_overview` (
  `auction_overview_id` varchar(36) NOT NULL,
  `auction_ownership_amount` varchar(255) DEFAULT NULL COMMENT '权属金额',
  `auction_assets_id` varchar(36) NOT NULL,
  `auction_transaction_type` varchar(255) DEFAULT NULL COMMENT '交易类别',
  `auction_target_asset_name` varchar(255) DEFAULT NULL COMMENT '标的资产名称',
  `auction_target_enterprise_nature` varchar(255) DEFAULT NULL COMMENT '标的企业性质',
  `auction_industry` varchar(255) DEFAULT NULL COMMENT '所属行业',
  `auction_law_firm` varchar(255) DEFAULT NULL COMMENT '出具法律意见书的律师机构',
  PRIMARY KEY (`auction_overview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目概况信息';

-- ----------------------------
-- Records of auction_overview
-- ----------------------------
INSERT INTO `auction_overview` VALUES ('13e8428956034eca9526536cca30b505', '3', 'b0f68a09ece94befa9b57e24fddda136', '6', '26', '6', '6', '6');
INSERT INTO `auction_overview` VALUES ('1c6ec8fb939f45adb4685f1c75d58a6e', null, '11b173f718e947069c2413b8df8feaed', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('f6c002462e5341d083dc8528b00c1c45', '4', 'd19e3805f5c64ae7adccf5fc0550ca43', '2', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for auction_price
-- ----------------------------
DROP TABLE IF EXISTS `auction_price`;
CREATE TABLE `auction_price` (
  `auction_price_id` varchar(36) NOT NULL,
  `auction_assets_id` varchar(36) NOT NULL,
  `auction_current_price` decimal(10,0) NOT NULL COMMENT '当前价格',
  `auction_current_people` varchar(255) DEFAULT NULL COMMENT '当前出价人',
  `auction_price_createtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出价时间/创建时间',
  PRIMARY KEY (`auction_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auction_price
-- ----------------------------
INSERT INTO `auction_price` VALUES ('1b4e5b0e7fdf4a60b98fa24ea3ef1ea1', 'd19e3805f5c64ae7adccf5fc0550ca43', '8', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:23:12');
INSERT INTO `auction_price` VALUES ('4044405c58044420bb45e10f81d07569', 'd19e3805f5c64ae7adccf5fc0550ca43', '10', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:25:11');
INSERT INTO `auction_price` VALUES ('742701cd4de744558f00e040827b0127', 'd19e3805f5c64ae7adccf5fc0550ca43', '6', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:13:18');
INSERT INTO `auction_price` VALUES ('dc2b435b163249f2911047aae3fe8202', 'd19e3805f5c64ae7adccf5fc0550ca43', '4', 'da8c252c6672450db9a4af267aa5e6ad', null);

-- ----------------------------
-- Table structure for dict_assets
-- ----------------------------
DROP TABLE IF EXISTS `dict_assets`;
CREATE TABLE `dict_assets` (
  `dict_assets_id` varchar(36) NOT NULL,
  `dict_assets_pid` varchar(36) NOT NULL,
  `dict_assets_key` int(4) DEFAULT NULL,
  `dict_assets_name` varchar(255) DEFAULT NULL,
  `dict_assets_state` tinyint(4) DEFAULT NULL COMMENT '状态：0有效 1无效',
  PRIMARY KEY (`dict_assets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict_assets
-- ----------------------------
INSERT INTO `dict_assets` VALUES ('1', 'auction_product_solutions', '1', '金融国资', '0');
INSERT INTO `dict_assets` VALUES ('10', 'auction_ownership_amount', '3', '100万-200万', '0');
INSERT INTO `dict_assets` VALUES ('11', 'auction_ownership_amount', '4', '200万以上', '0');
INSERT INTO `dict_assets` VALUES ('12', 'auction_location', '1', '石家庄市', '0');
INSERT INTO `dict_assets` VALUES ('13', 'auction_location', '2', '邢台', '0');
INSERT INTO `dict_assets` VALUES ('14', 'auction_bidding_cycle', '90', '3个月', '0');
INSERT INTO `dict_assets` VALUES ('15', 'auction_bidding_cycle', '180', '6个月', '0');
INSERT INTO `dict_assets` VALUES ('16', 'auction_bidding_cycle', '360', '12个月', '0');
INSERT INTO `dict_assets` VALUES ('17', 'auction_bidding_cycle', '720', '24个月', '0');
INSERT INTO `dict_assets` VALUES ('2', 'auction_product_solutions', '2', '不良资产', '0');
INSERT INTO `dict_assets` VALUES ('3', 'auction_product_solutions', '3', '非国有资产', '0');
INSERT INTO `dict_assets` VALUES ('4', 'auction_product_solutions', '4', '招商', '0');
INSERT INTO `dict_assets` VALUES ('5', 'auction_classify', '1', '股权', '0');
INSERT INTO `dict_assets` VALUES ('6', 'auction_classify', '2', '债权', '0');
INSERT INTO `dict_assets` VALUES ('7', 'auction_classify', '3', '实物', '0');
INSERT INTO `dict_assets` VALUES ('8', 'auction_ownership_amount', '1', '10万-50万', '0');
INSERT INTO `dict_assets` VALUES ('9', 'auction_ownership_amount', '2', '50万-100万', '0');
