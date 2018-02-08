-- ----------------------------
-- Table structure for bond_disposal
-- ----------------------------
DROP TABLE IF EXISTS `bond_disposal`;
CREATE TABLE `bond_disposal` (
  `bond_disposal_id` VARCHAR(255) NOT NULL COMMENT '主键',
  `bond_company_name` VARCHAR(255) DEFAULT '''NULL''' COMMENT '企业名称',
  `bond_asset_number` VARCHAR(255) DEFAULT '''NULL''' COMMENT '资产编号',
  `bond_disposal_arrears` VARCHAR(255) DEFAULT '''NULL''' COMMENT '欠款',
  `bond_listing_start_time` DATETIME DEFAULT NULL COMMENT '挂牌开始时间',
  `bond_listing_end_time` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '挂牌结束时间',
  `bond_transfer_ratio`VARCHAR(255) DEFAULT '''NULL''' COMMENT '转让比例',
  `bond_disposal_state`  tinyint(4) DEFAULT NULL COMMENT '状态:1_待签约,2_已发布',
  `bond_release_time` DATETIME DEFAULT NULL COMMENT '发布时间',
  `bond_product_solutions` tinyint(4) DEFAULT NULL COMMENT '状态:1_金融国资,2_不良资产,3_非国有资产,4_招商',
  `bond_ownership_amount` VARCHAR(255) DEFAULT '''NULL''' COMMENT '权属金额',
  `bond_bidding_cycle` int(11) DEFAULT NULL COMMENT '期限（自动计算天数）',
  `bond_classify` tinyint(4) DEFAULT NULL COMMENT '状态:1_处置方接单,2_处置方竞单',
  `bond_location` VARCHAR(255) DEFAULT '''NULL''' COMMENT '地址',
  PRIMARY KEY (`bond_disposal_id`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产委外信息';








INSERT INTO `bond_disposal` VALUES ('1', '东方红新动力', '000480', '1.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:25', '91%', 1, '2017-11-2 16:16:42', 2, '3', 89, 1, '2', '六某某', '\'NULL\'', '\'NULL\'', '2');
INSERT INTO `bond_disposal` VALUES ('10', '东方红睿逸定期开放', '001309', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:26', '89%', 1, '2017-11-2 16:03:09', 2, '2', 89, 2, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2');
INSERT INTO `bond_disposal` VALUES ('11', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:27', '89%', 1, '2017-8-4 00:00:00', 2, '3', 100, 1, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('1148ecc497da47cf9d4f316931dc81d2', '雪佛兰集团', '4654231', '1036100112', '2017-11-5 00:00:00', '2017-11-30 00:00:00', '78%', 1, '2017-11-3 09:37:47', 1, '4', 25, 1, '1', '李某某', '13454543211', 'files/2017/11/01/14\\1d03208d-9407-43c7-906c-bc1d0ec7a92e.jpg', '1');
INSERT INTO `bond_disposal` VALUES ('12', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:27', '89%', 2, '2017-8-4 00:00:00', 2, '4', 190, 2, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('13', '	东方蓝睿丰', '001205', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:27', '89%', 1, '2017-8-4 00:00:00', 2, '4', 300, 2, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('14', '东方黄睿丰', '001206', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:49:06', '89%', 2, '2017-8-4 00:00:00', 2, '1', 500, 1, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('15', '东方红京东大数据', '001564', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:28', '89%', 2, '2017-8-4 00:00:00', 2, '2', 600, 2, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('2', '东方红新动力', '000480', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:28', '89%', 2, '2017-8-4 00:00:00', 2, '2', 170, 2, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('3', '东方红睿丰', '169101', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:28', '89%', 1, '2017-8-4 00:00:00', 2, '3', 300, 1, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('4', '东方红睿阳', '169201', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:28', '89%', 1, '2017-11-2 14:32:49', 2, '4', 89, 2, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2');
INSERT INTO `bond_disposal` VALUES ('5', '东方红睿元', '000970', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:49:06', '89%', 2, '2017-8-4 00:00:00', 2, '1', 20, 1, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('55f7b4f8f6014a1d905cb7f5c9c85272', '东方一气大众', '10011', '2500000', '2017-10-3 00:00:00', '2017-11-1 13:49:04', '75%', 1, '2017-11-1 15:06:26', 2, '4', 29, 1, '1', '刘某某', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('6', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:49:03', '89%', 1, '2017-8-4 00:00:00', 2, '2', 170, 2, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('636bb1d2745f4f92bc50688c282fd422', '36524连锁餐饮', '1234567', '600000', '2017-10-11 00:00:00', '2017-11-1 13:48:30', '76%', 1, '2017-11-1 15:39:50', 3, '2', 21, 1, '1', '林某某', '13334561236', 'files/2017/10/23/11\\1e12d6f8-c2ba-4882-955d-d1a7c6d613aa.jpg', '2');
INSERT INTO `bond_disposal` VALUES ('7', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:30', '89%', 2, '2017-8-4 00:00:00', 2, '3', 350, 1, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('8', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:31', '89%', 2, '2017-8-4 00:00:00', 2, '4', 710, 2, '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('823994348a064503bbb83eca8047d253', '绿叶子有限公司', '16412121', '800000', '2017-9-12 00:00:00', '2017-11-1 13:48:32', '75%', 1, '2017-11-1 14:57:13', 2, '2', 50, 2, '2', '叶某某', '11215423541', 'files/2017/10/31/10\\45c991a8-6dde-4fd6-aa0d-d885a12e5a1f.jpg', '1');
INSERT INTO `bond_disposal` VALUES ('9', '东方红稳健精选C', '001204', '123.3123.00', '2017-8-4 00:00:00', '2017-11-1 13:48:33', '89%', 1, '2017-8-4 00:00:00', 2, '1', 20, 1, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');
INSERT INTO `bond_disposal` VALUES ('b6b48373db01441c85be78671ce53fb2', '宜而爽有限公司', '123456', '1060000', '2017-10-13 00:00:00', '2017-11-1 13:48:33', '65%', 1, '2017-10-27 15:21:06', 1, '3', 14, 1, '2', '王某某', '15613123151', 'D:\\eclipse-luna\\apache-tomcat-7.0.79\\wtpwebapps\\HhXmj\\files\\2017\\10\\23\\10\\954257e2-0f9e-425b-af44-19c2735b8b4f.jpg', '1');
INSERT INTO `bond_disposal` VALUES ('f55961b299e04dc49f864272668f725b', '东丰日产', '45454', '650000', '2017-11-7 00:00:00', '2017-11-25 00:00:00', '65%', 1, '2017-11-1 15:43:43', 2, '2', 18, 1, '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1');


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
  PRIMARY KEY (`bond_accept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报名的处置方信息表';


INSERT INTO `bond_accept` VALUES ('0c57c42882af44b08cf8d4e949e6510c', '1', '2', '2017-11-2 00:00:00', '1', '1', '1', '12334562139', '1', 'files/2017/11/02/16\\5e1d761c-ff1e-4f2f-b776-cd184cbe2a17.jpg', '2');
INSERT INTO `bond_accept` VALUES ('1', '东方红睿逸定期开放', '001309', '2017-10-3 00:00:00', '板蓝根集团', '国企', '炎某', '13515444564', '外访', NULL, '1');
INSERT INTO `bond_accept` VALUES ('119a89794715408889e357bd9b681eb4', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', '2');
INSERT INTO `bond_accept` VALUES ('1d0a3ba9b4ad447eb4946263353b1c71', '6', '6', '2017-11-2 00:00:00', '6', '6', '6', '6', '6', 'files/2017/11/02/16\\9f6bd800-3008-4106-b180-eaf6262a08af.jpg', '2');
INSERT INTO `bond_accept` VALUES ('443bfaaacf554696a87eb2dbe80c82a2', '东方红睿逸定期开放', '001309', '2017-10-25 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', 'files/2017/10/25/14\\9d4ef5de-f873-4a00-8c78-f914ddba194f.jpg', '2');
INSERT INTO `bond_accept` VALUES ('81d27cd2a0a84b61ba593bab53bb2900', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', 'null\\null', '2');
INSERT INTO `bond_accept` VALUES ('b8f911467c4a4bf3adcd2524db119025', '雪佛兰集团', '4654231', '2017-11-3 00:00:00', '黄蜂集团', '自营', '大先生', '16466321303', '电催', 'files/2017/11/03/09\\8161dda7-96ba-417c-80ab-5a884b36139a.jpg', '1');
INSERT INTO `bond_accept` VALUES ('cd7e07aa03594c2baf2f91a772fc3ea2', '绿叶子有限公司', '16412121', '2017-10-31 10:59:01', '环境保护集团', '国企', '李某某', '12334562139', '电催', 'null\\null', '1');
INSERT INTO `bond_accept` VALUES ('d61058bc2cfd49cd882c0850615ba65b', '12312', '2', '2017-11-2 16:04:33', '1', '1', '1', '12334562139', '1', 'files/2017/11/02/16\\e739b716-a344-40fd-8218-59d8f645c373.jpg', '1');
INSERT INTO `bond_accept` VALUES ('e3b31fa2bbfe4ce89911abaf02fb085f', '123123', '10086', '2017-11-3 00:00:00', '1', '1', '1', '12334562139', '1', 'files/2017/11/03/09\\7b74d41d-cc4a-4f4a-9539-067147cd79f3.jpg', '1');



-- ----------------------------
-- Table structure for bond_sheet
-- ----------------------------
DROP TABLE IF EXISTS `bond_sheet`;
CREATE TABLE `bond_sheet` (
  `bond_sheet_id` varchar(255) NOT NULL COMMENT '主键',
  `bond_company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `bond_asset_number` varchar(255) DEFAULT NULL COMMENT '资产编号',
  `bond_sheet_time` datetime DEFAULT NULL COMMENT '接单时间',
  `bond_accept_name` varchar(255) NOT NULL COMMENT '接单处置方',
  `bond_accept_property` varchar(255) DEFAULT NULL COMMENT '处置方性质',
  `bond_deal_name` varchar(255) DEFAULT NULL COMMENT '处置方名称',
  `bond_deal_phone` varchar(255) DEFAULT NULL COMMENT '处置方电话',
  `bond_deal_type` varchar(255) DEFAULT NULL COMMENT '处置方式',
  `bond_deal_img` varchar(255) DEFAULT NULL COMMENT '处置方信息图片',
  PRIMARY KEY (`bond_sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最终订单的表';


INSERT INTO `bond_sheet` VALUES ('4326aeb6bfab4581bc4950e45dffd02d', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', NULL);
INSERT INTO `bond_sheet` VALUES ('4ffd4d4bf6d1460ca7f2d4c311ff3ae2', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null');
INSERT INTO `bond_sheet` VALUES ('540ac9b9d26a412e85763506a1aea648', '东方一气大众', '10011', '2017-10-30 00:00:00', '双汇王中王', '自营', '江某某', '13642649133', '电催', 'files/2017/10/30/15\\af2b2ecc-e092-47e4-ab65-c14540dca0f0.jpg');
INSERT INTO `bond_sheet` VALUES ('5f2af2770c64450b9233a2ebe787bfc2', '东方黄睿丰', '001206', '2017-10-30 00:00:00', '太平洋投资公司', '国企', '海某某', '12334562139', '外访', 'null\\null');
INSERT INTO `bond_sheet` VALUES ('5fa527afc4544742a3c76a078d84f6dc', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', NULL);
INSERT INTO `bond_sheet` VALUES ('9bd035c4a95d421b9da72b5c9beb0ece', '123', '123456', '2017-10-25 00:00:00', '新东方烹饪技术学院', '1', '范某某', '15341361324', '外访', NULL);
INSERT INTO `bond_sheet` VALUES ('da4f1f38ad324f5c9b69eea6d50d64f4', '东方红新动力', '000480', '2017-10-25 00:00:00', '蓝翔高级汽修学校', '自营', '林某某', '15341361324', '电催', 'files/2017/10/25/14\\39ba290b-ba4c-4fb1-8348-72639673c689.jpg');
INSERT INTO `bond_sheet` VALUES ('e6dd8fb8a13e4d188e470cf38c0aacd1', '东方红睿逸定期开放', '001309', '2017-10-31 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', NULL);
INSERT INTO `bond_sheet` VALUES ('ef1ffe0e5ede43afbd870dc44bd85522', '东方红睿逸定期开放', '001309', '2017-10-30 00:00:00', '板蓝根集团', '国企', '炎某', '13515444564', '外访', 'null\\null');
INSERT INTO `bond_sheet` VALUES ('f67b39fbc21646ec80a548925f9f1e2b', '东方黄睿丰123', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null');
INSERT INTO `bond_sheet` VALUES ('fcfccdcfd33e4f5d971ebad3c6fd1700', '2', '2', '2017-11-2 00:00:00', '2', '2', '2', '2', '2', 'files/2017/11/02/11\\3a348e5f-42a1-455a-b4c3-3449dd13b370.jpg');


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




INSERT INTO `dict_assets` VALUES ('1', 'auction_product_solutions', 1, '金融国资', 0);
INSERT INTO `dict_assets` VALUES ('10', 'auction_ownership_amount', 3, '100万-200万', 0);
INSERT INTO `dict_assets` VALUES ('11', 'auction_ownership_amount', 4, '200万以上', 0);
INSERT INTO `dict_assets` VALUES ('12', 'auction_location', 1, '石家庄市', 0);
INSERT INTO `dict_assets` VALUES ('13', 'auction_location', 2, '邢台', 0);
INSERT INTO `dict_assets` VALUES ('14', 'auction_bidding_cycle', 90, '3个月', 0);
INSERT INTO `dict_assets` VALUES ('15', 'auction_bidding_cycle', 180, '6个月', 0);
INSERT INTO `dict_assets` VALUES ('16', 'auction_bidding_cycle', 360, '12个月', 0);
INSERT INTO `dict_assets` VALUES ('17', 'auction_bidding_cycle', 720, '24个月', 0);
INSERT INTO `dict_assets` VALUES ('2', 'auction_product_solutions', 2, '不良资产', 0);
INSERT INTO `dict_assets` VALUES ('21', 'bond_product_solutions', 1, '金融国资', 0);
INSERT INTO `dict_assets` VALUES ('22', 'bond_product_solutions', 2, '不良资产', 0);
INSERT INTO `dict_assets` VALUES ('23', 'bond_product_solutions', 3, '非国有资产', 0);
INSERT INTO `dict_assets` VALUES ('24', 'bond_product_solutions', 4, '招商', 0);
INSERT INTO `dict_assets` VALUES ('25', 'bond_classify', 1, '处置方接单', 0);
INSERT INTO `dict_assets` VALUES ('26', 'bond_classify', 2, '处置方竞单', 0);
INSERT INTO `dict_assets` VALUES ('27', 'bond_ownership_amount', 1, '10万-50万', 0);
INSERT INTO `dict_assets` VALUES ('28', 'bond_ownership_amount', 2, '50万-100万', 0);
INSERT INTO `dict_assets` VALUES ('29', 'bond_ownership_amount', 3, '100万-200万', 0);
INSERT INTO `dict_assets` VALUES ('3', 'auction_product_solutions', 3, '非国有资产', 0);
INSERT INTO `dict_assets` VALUES ('30', 'bond_ownership_amount', 4, '200万以上', 0);
INSERT INTO `dict_assets` VALUES ('31', 'bond_location', 1, '石家庄市', 0);
INSERT INTO `dict_assets` VALUES ('32', 'bond_location', 2, '邢台', 0);
INSERT INTO `dict_assets` VALUES ('33', 'bond_bidding_cycle', 90, '3个月', 0);
INSERT INTO `dict_assets` VALUES ('34', 'bond_bidding_cycle', 180, '6个月', 0);
INSERT INTO `dict_assets` VALUES ('35', 'bond_bidding_cycle', 360, '12个月', 0);
INSERT INTO `dict_assets` VALUES ('36', 'bond_bidding_cycle', 720, '24个月', 0);
INSERT INTO `dict_assets` VALUES ('4', 'auction_product_solutions', 4, '招商', 0);
INSERT INTO `dict_assets` VALUES ('40', 'bond_disposal_state', 1, '待签约', 0);
INSERT INTO `dict_assets` VALUES ('41', 'bond_disposal_state', 2, '已发布', 0);
INSERT INTO `dict_assets` VALUES ('44', 'bond_verify', 1, '待审核', 0);
INSERT INTO `dict_assets` VALUES ('45', 'bond_verify', 2, '已审核', 0);
INSERT INTO `dict_assets` VALUES ('46', 'bond_verify', 3, '退回', 0);
INSERT INTO `dict_assets` VALUES ('47', 'bond_choose', 1, '未完成订单', 0);
INSERT INTO `dict_assets` VALUES ('48', 'bond_choose', 2, '已完成订单', 0);
INSERT INTO `dict_assets` VALUES ('5', 'auction_classify', 1, '股权', 0);
INSERT INTO `dict_assets` VALUES ('6', 'auction_classify', 2, '债权', 0);
INSERT INTO `dict_assets` VALUES ('7', 'auction_classify', 3, '实物', 0);
INSERT INTO `dict_assets` VALUES ('8', 'auction_ownership_amount', 1, '10万-50万', 0);
INSERT INTO `dict_assets` VALUES ('9', 'auction_ownership_amount', 2, '50万-100万', 0);



