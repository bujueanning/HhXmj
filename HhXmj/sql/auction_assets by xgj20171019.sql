/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-09-18 22:32:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auction_assets
-- ----------------------------
DROP TABLE IF EXISTS `auction_assets`;
CREATE TABLE `auction_assets` (
  `auction_assets_id` varchar(36) NOT NULL,
  `auction_project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `auction_project_number` varchar(255) NOT NULL  COMMENT '项目编号',
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
-- Table structure for auction_info
-- ----------------------------
DROP TABLE IF EXISTS `auction_info`;
CREATE TABLE `auction_info` (
  `auction_info_id` varchar(36) NOT NULL,
  `projectName` varchar(255) NOT NULL DEFAULT '''''' COMMENT '项目名称',
  `projectNO` varchar(20) NOT NULL COMMENT '项目编号',
  `industryOwned` varchar(255) DEFAULT 'NULL' COMMENT '所属行业',
  `projectLocation` varchar(255) DEFAULT 'NULL' COMMENT '项目所在地',
  `underlyingAssetName` varchar(255) DEFAULT 'NULL' COMMENT '标的资产名称',
  `businessNature` varchar(255) DEFAULT 'NULL' COMMENT '标的企业性质',
  `projectAmount` decimal(10,0) DEFAULT NULL COMMENT '项目金额(万元)',
  `operation` varchar(255) DEFAULT 'NULL' COMMENT '拟采用操作方式',
  `listingQuantity` decimal(10,0) DEFAULT NULL COMMENT '挂牌数量',
  `unitPrice` decimal(10,2) DEFAULT NULL COMMENT '单价（元）',
  `bond` decimal(10,2) DEFAULT NULL COMMENT '保证金',
  `stockRight` decimal(10,2) DEFAULT NULL COMMENT '股权（万元）',
  `biddingCycle` varchar(100) DEFAULT NULL COMMENT '竞价周期(天)',
  `floorPrice` decimal(10,2) DEFAULT NULL COMMENT '最低价格（万元）',
  `creditorPrincipal` decimal(10,2) DEFAULT NULL COMMENT '债权本金（万元）',
  `ensurePrincipal` decimal(10,2) DEFAULT NULL COMMENT '其中保证本金（万元）',
  `mortgagePrincipal` decimal(10,2) DEFAULT NULL COMMENT '其中抵押本金（万元）',
  `pledgePrincipal` decimal(10,2) DEFAULT NULL COMMENT '其中质押本金（万元）',
  `creditorInterest` decimal(10,2) DEFAULT NULL COMMENT '债权利息（万元）',
  `creditorInterest2` decimal(10,2) DEFAULT NULL COMMENT '债权孳生息（万元）',
  `importantInfo` text COMMENT '重要信息',
  `listingStart` datetime DEFAULT NULL COMMENT '挂牌开始时间',
  `listingEnd` datetime DEFAULT NULL COMMENT '挂牌结束日时间',
  `contacts` varchar(20) DEFAULT 'NULL' COMMENT '联系人',
  `contactInformation` varchar(255) DEFAULT 'NULL' COMMENT '联系方式',
  `notice` longtext COMMENT '項目公告',
  `idCardFrontImg` varchar(255) DEFAULT 'NULL' COMMENT '图片地址',
  `status` varchar(10) DEFAULT 'NULL' COMMENT '是否审核：0 否，1 是',
  PRIMARY KEY (`auction_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目详情';

-- ----------------------------
-- Records of auction_info
-- ----------------------------
INSERT INTO `auction_info` VALUES ('0deb7f1f83f7402fbdb5e6d1f87b8ee6', '789', '789', '789', '789', 'NULL', 'NULL', null, '处置方抢单', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'NULL', 'NULL', null, 'files/2017/09/13/23\\c39098d9-862c-4c7f-ad75-e5aeb2f46755.png', '0');
INSERT INTO `auction_info` VALUES ('1bfb5256ce30421facfd54378e9c5979', '52', '525', '5252', 'NULL', 'NULL', 'NULL', null, '处置方抢单', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'NULL', 'NULL', null, 'files/2017/09/13/23\\845cc2b6-1ef7-4479-94b5-307fefaa9b12.jpeg', '0');
INSERT INTO `auction_info` VALUES ('2d2d442d4120464a9dc12aba4985afb9', '666', '666', '666', '666', '666', '金融国资', '666', '处置方抢单', '666', '66.00', '66.00', '66.00', '66', '66.00', '66.00', '66.00', '66.00', '66.00', '66.00', '66.00', '66', '2017-09-27 00:00:00', '2017-09-29 00:00:00', '66', '66', '<p>6666666</p>', 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', '0');
INSERT INTO `auction_info` VALUES ('308959cbe1904d47970c71387f053d38', '11', '11', '11', '11', '11', '11', '11', 'NULL', '11', '11.00', '11.00', '11.00', '3个月', '11.00', '11.00', '11.00', '11.00', '11.00', '11.00', '11.00', '1、我问问', '2017-09-27 00:00:00', '2017-09-25 00:00:00', '娃娃', '15030160623', null, 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', 'NULL');
INSERT INTO `auction_info` VALUES ('5fdcd958134f4294bdde70bfac5f686f', '12', '12', '12', '12', '13', '13', '13', '处置方竞单', '13', '13.00', '13.00', '13.00', '1301', '13.00', '13.00', '13.00', '13.00', '13.00', '13.00', '13.00', '13', '2017-09-26 00:00:00', '2017-09-27 00:00:00', '666', '666', '<p>8888</p>', 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', '0');
INSERT INTO `auction_info` VALUES ('7183b6ef0ae54060a50eed429c4d9453', '666', '666', '666', '666', '666', '666', '666', '处置方抢单', '666', '66.00', '66.00', '66.00', '66', '66.00', '66.00', '66.00', '66.00', '66.00', '66.00', '66.00', '66', '2017-09-27 00:00:00', '2017-09-29 00:00:00', '66', '66', '<p>6666666</p>', 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', '0');
INSERT INTO `auction_info` VALUES ('a4637f66da6f419f9c3f59a562cab49a', '石家庄永昌足球俱乐部230号债权资产包', 'B02017000632', '其他行业', '北京市', '晟元稳赢230号债权资产包', '民营', '350', '处置方竞单', '150000', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1、你是好人吗\r\n2、是呀是呀', '2017-09-08 00:00:00', '2017-09-11 00:00:00', '测试', '15030160923', null, 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', 'NULL');
INSERT INTO `auction_info` VALUES ('ab3a351432254130bbd0967de8edfecb', '52', '525', '5252', 'NULL', 'NULL', 'NULL', null, '处置方抢单', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'NULL', 'NULL', null, 'files/2017/09/13/23\\8bcd93b8-0b03-428b-ba1e-8eb4bec6fadd.jpeg', '0');
INSERT INTO `auction_info` VALUES ('df10184ab22049faa40e2d28dbc18005', '石家庄永昌足球俱乐部230号债权资产包', 'B02017000632', '其他行业', '北京市', '晟元稳赢230号债权资产包', '民营', '350', '处置方竞单', '150000', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1、你是好人吗\r\n2、是呀是呀', '2017-09-08 00:00:00', '2017-09-11 00:00:00', '测试', '15030160923', null, 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', 'NULL');
INSERT INTO `auction_info` VALUES ('e91e223f3a2249cca2fb111362488e5b', '33', '33', '33', '33', '33', '33', '33', '处置方抢单', null, '33.00', '33.00', '33.00', '33', '33.00', '33.00', '33.00', '3.00', '33.00', '333.00', '33.00', '3', '2017-09-13 00:00:00', '2017-09-26 00:00:00', '33', '3', '<p>3&nbsp;&nbsp;&nbsp;&nbsp;33&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;3</p>', 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', '0');
INSERT INTO `auction_info` VALUES ('efd3c076ad9f48b2a2735ab57eed2f56', '12', '12', '12', '12', '13', '13', '13', '处置方竞单', '13', '13.00', '13.00', '13.00', '1301', '13.00', '13.00', '13.00', '13.00', '13.00', '13.00', '13.00', '13', '2017-09-26 00:00:00', '2017-09-27 00:00:00', '666', '666', '<p>666666666</p>', 'files/2017/09/13/20\\a9ea4a04-3107-4bc8-9ad3-5933afecf68c.jpeg', '0');
INSERT INTO `auction_info` VALUES ('f01cd931b47a459bab9e1572a570eab5', '88', '88', '88', '88', '88', '88', '88', '处置方抢单', '88', '88.00', '8.00', '88.00', '8', '88.00', '88.00', '88.00', '8.00', '8.00', '88.00', '88.00', '88', '2017-09-13 00:00:00', '2017-09-19 00:00:00', '88', '88', '<p>88888</p>', '/files/2017/09/13/23\\1bf252d7-92ad-46da-b96d-8fecf8026ca3.png', '0');
INSERT INTO `auction_info` VALUES ('f91182c9df7741f0ad0976a915e3d346', '99', '99', '99', '99', 'NULL', 'NULL', null, '处置方抢单', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'NULL', 'NULL', null, 'files/2017/09/13/23\\fab1019a-5d06-4dc6-aa12-ec89b3f528f0.png', '0');

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

-- ----------------------------
-- Table structure for company_news
-- ----------------------------
DROP TABLE IF EXISTS `company_news`;
CREATE TABLE `company_news` (
  `company_news_id` varchar(36) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '标题',
  `text` longtext CHARACTER SET utf8mb4 NOT NULL COMMENT '正文',
  `company_news_createuid` varchar(36) DEFAULT NULL COMMENT '创建者',
  `company_news_createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `company_news_updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`company_news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manage_notice
-- ----------------------------
DROP TABLE IF EXISTS `manage_notice`;
CREATE TABLE `manage_notice` (
  `manage_notice_id` varchar(36) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '标题',
  `text` longtext CHARACTER SET utf8mb4 NOT NULL COMMENT '正文',
  `manage_notice_createuid` varchar(36) DEFAULT NULL COMMENT '创建者',
  `manage_notice_createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `manage_notice_updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`manage_notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for release_notice
-- ----------------------------
DROP TABLE IF EXISTS `release_notice`;
CREATE TABLE `release_notice` (
  `release_notice_id` varchar(36) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '标题',
  `text` longtext CHARACTER SET utf8mb4 NOT NULL COMMENT '正文',
  `release_notice_createuid` varchar(36) DEFAULT NULL COMMENT '创建者',
  `release_notice_createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `release_notice_updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`release_notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `adminltemy`.`sys_menu` (`sys_menu_id`, `sys_menu_pid`, `sys_menu_name`, `sys_menu_url`, `sys_menu_order`, `sys_menu_icon_url`) VALUES ('06015fb13ca344a7b5519819fd129124', '2b1753b058f1433a8defe794013ecfc8', '处置方公告', 'manage/notice/list', NULL, 'NULL');
INSERT INTO `adminltemy`.`sys_menu` (`sys_menu_id`, `sys_menu_pid`, `sys_menu_name`, `sys_menu_url`, `sys_menu_order`, `sys_menu_icon_url`) VALUES ('220941abb91b457889ac3f9865a1240f', '2b1753b058f1433a8defe794013ecfc8', '发布方公告', 'release/notice/list', NULL, 'NULL');
INSERT INTO `adminltemy`.`sys_menu` (`sys_menu_id`, `sys_menu_pid`, `sys_menu_name`, `sys_menu_url`, `sys_menu_order`, `sys_menu_icon_url`) VALUES ('2b1753b058f1433a8defe794013ecfc8', 'root', '网站信息', 'NULL', NULL, 'NULL');
INSERT INTO `adminltemy`.`sys_menu` (`sys_menu_id`, `sys_menu_pid`, `sys_menu_name`, `sys_menu_url`, `sys_menu_order`, `sys_menu_icon_url`) VALUES ('a459e2be2f8d41a4b9bd0f5b4d441708', '2b1753b058f1433a8defe794013ecfc8', '公司动态', 'company/news/list', NULL, 'NULL');
INSERT INTO `adminltemy`.`sys_menu` (`sys_menu_id`, `sys_menu_pid`, `sys_menu_name`, `sys_menu_url`, `sys_menu_order`, `sys_menu_icon_url`) VALUES ('cbab83a6a81345e4852f3c5e1682a784', '2b1753b058f1433a8defe794013ecfc8', '走进鑫淼聚', 'about/us/list', NULL, 'NULL');

