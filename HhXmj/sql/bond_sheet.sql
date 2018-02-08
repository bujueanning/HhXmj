/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-17 16:51:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bond_sheet
-- ----------------------------
DROP TABLE IF EXISTS `bond_sheet`;
CREATE TABLE `bond_sheet` (
  `bond_sheet_id` varchar(255) NOT NULL COMMENT '主键',
  `bond_company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `bond_asset_number` varchar(255) DEFAULT NULL COMMENT '资产编号',
  `bond_sheet_time` datetime DEFAULT NULL COMMENT '接单时间',
  `bond_accept_name` varchar(255) DEFAULT NULL COMMENT '接单处置方',
  `bond_accept_property` varchar(255) DEFAULT NULL COMMENT '处置方性质',
  `bond_deal_name` varchar(255) DEFAULT NULL COMMENT '处置方名称',
  `bond_deal_phone` varchar(255) DEFAULT NULL COMMENT '处置方电话',
  `bond_deal_type` varchar(255) DEFAULT NULL COMMENT '处置方式',
  `bond_deal_img` varchar(255) DEFAULT NULL COMMENT '处置方信息图片',
  `bond_disposal_createuid` varchar(255) DEFAULT NULL COMMENT '发布人',
  `bond_recipientid` varchar(255) DEFAULT NULL COMMENT '接单人',
  `bond_deal` tinyint(4) DEFAULT NULL COMMENT '交易类型:1_单笔委外,2_委外包',
  `bond_sheet_state` tinyint(4) DEFAULT NULL COMMENT '状态:1_未过期,2_已过期',
  `bond_lose_efficacy_time` datetime DEFAULT NULL COMMENT '过期的时间点',
  `bond_disposal_id` varchar(255) DEFAULT '' COMMENT '委外的id',
  PRIMARY KEY (`bond_sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最终订单的表';

-- ----------------------------
-- Records of bond_sheet
-- ----------------------------
INSERT INTO `bond_sheet` VALUES ('00824d4984c045dd9c85ec980633ff24', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a1', 'a1', 'a1', 'a1', 'a1', 'null\\null', null, null, '1', null, null, null);
INSERT INTO `bond_sheet` VALUES ('052e0805f6294b29bc1908d7c6663c0e', '灌灌灌灌灌', '001', '2017-11-10 00:00:00', '111', '个人', '啊', '456', null, 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, '2', null, null, null);
INSERT INTO `bond_sheet` VALUES ('09d2e1b3e1504a729064183c37795892', '需要报名的资产', '3247832423', '2017-11-07 00:00:00', 'b1', 'b1', 'b1', 'b1', 'b1', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, null, null);
INSERT INTO `bond_sheet` VALUES ('0d3dca5806134b0bbcf7e248251f15bc', '饼子', '1232399562331', '2017-11-10 00:00:00', '面', '1', '1', '1', '1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, '2', null, null, null);
INSERT INTO `bond_sheet` VALUES ('0e76f0612248491193a242b30efa58cd', '水木公司', '495453212', '2017-11-03 00:00:00', '太平洋投资公司', '国企', '海某某', '113121312123', '电催', 'files/2017/11/03/10\\9cfcb326-9569-4f3a-b289-891d1426f28b.jpg', null, null, '1', null, null, null);
INSERT INTO `bond_sheet` VALUES ('1dc6576a27124a2bbf0371f2d61f1b57', '紫叶子', '2135432135', '2017-11-06 00:00:00', '3', '3', '3', '3', '3', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, '2', null, null, null);
INSERT INTO `bond_sheet` VALUES ('277473f4ce934a959fa2cc6d16368ebd', '东方红稳健精选C', '001204', '2017-11-09 00:00:00', null, null, null, null, null, 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('2a7089d78a7e458c99152107bf503692', '橘黄', '16568345', '2017-11-07 00:00:00', '桔子', '桔子', '桔子', '桔子', '桔子', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', '620afbf9047442888a8db580baafb839', null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('31df2335186d451fa509d806d8cf088e', '哇哈哈', '12364312312', '2017-11-07 00:00:00', 'W1', 'W1', 'W1', 'W1', 'W1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('3a8b378661a740eda9ad4fa876c8c43e', '西瓜', '5421321852', '2017-11-07 00:00:00', '刨冰', '刨冰', '刨冰', '刨冰', '刨冰', null, '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('4326aeb6bfab4581bc4950e45dffd02d', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', null, null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('4820ba21d94148d18afd2ece54caeb83', '紫叶子', '2135432135', '2017-11-06 00:00:00', '2', '2', '2', '2', '2', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('4ffd4d4bf6d1460ca7f2d4c311ff3ae2', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('540ac9b9d26a412e85763506a1aea648', '东方一气大众', '10011', '2017-10-30 00:00:00', '双汇王中王', '自营', '江某某', '13642649133', '电催', 'files/2017/10/30/15\\af2b2ecc-e092-47e4-ab65-c14540dca0f0.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('5e15bc82b877412eae22dbb8788f62cf', '紫叶子', '2135432135', '2017-11-07 00:00:00', '5', '5', '5', '5', '5', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('5e3c5ad04a97464383e25e7aea2fed78', '灌灌灌灌灌', '001', '2017-11-10 00:00:00', '111', '个人', '啊', '456', null, 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('5f2af2770c64450b9233a2ebe787bfc2', '东方黄睿丰', '001206', '2017-10-30 00:00:00', '太平洋投资公司', '国企', '海某某', '12334562139', '外访', 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('5fa527afc4544742a3c76a078d84f6dc', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', null, null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('6b66573abb51497f880fcd6871ee7f01', '验证发布人id', '1235465', '2017-11-09 00:00:00', null, null, null, null, null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('7cb68b92d66a4401ae6b782d9e179689', '东方红稳健精选C', '001204', '2017-11-09 00:00:00', null, null, null, null, null, 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('7ddfae3fb33448649c446327b08cc7b4', '10号', '1278341', '2017-11-10 00:00:00', '月分', null, null, null, null, 'files/2017/11/10/10\\44019af3-ab81-4aaf-9735-8e9116a63028.jpg', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('8070e82b95444c8aa2b83eb15a8d20e4', '哇哈哈', '12364312312', '2017-11-07 00:00:00', 'W1', 'W1', 'W1', 'W1', 'W1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('841f855784f54d59a12815715208fb4f', '哇哈哈', '12364312312', '2017-11-07 00:00:00', 'W1', 'W1', 'W1', 'W1', 'W1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('857a59c0ce164ce5a562139fd3cf0f35', '紫叶子', '2135432135', '2017-11-07 00:00:00', '6', '6', '6', '6', '6', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('8669436a519b45f28eaa8c4eed580c17', '紫叶子', '2135432135', '2017-11-06 00:00:00', '1', '1', '1', '15341361324', '1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('88963f051f644b1f992cbd1f3fba77c9', '水木公司', '495453212', '2017-11-03 00:00:00', '太平洋保险公司', '国企', '海某某', '123456789987', '电催', 'files/2017/11/03/10\\d891e681-6b9f-43f6-a4a9-bfce1153f639.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('88b55103aac9468eaeaaf003df02ccd7', '水木公司', '495453212', '2017-11-03 00:00:00', '太平洋投资公司', '国企', '林某某', '16422134521321', '电催', 'files/2017/11/03/11\\174644bf-86b0-46f1-a714-3cc7ffdb1a72.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('935fb18a37004f98b2202fbb238b4829', '水木公司', '495453212', '2017-11-03 00:00:00', '太平洋保险公司', '国企', '海某某', '123456789987', '电催', 'files/2017/11/03/10\\6dffa4a2-96fb-42a6-b08f-3d79cb1b38d0.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('93a0f171501d4684b6af6196d5cde79b', '需要报名的资产', '3247832423', '2017-11-07 00:00:00', 'b1', 'b1', 'b1', 'b1', 'b1', null, '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('962e4a30c12c47b08c7916dd09c5f2a6', '11月6日', '97523452', '2017-11-06 00:00:00', '天气有雾', '国家发布', '天气预报', '111111122', '开大风', 'files/2017/11/06/10\\cfb975a2-79e0-4363-93ed-5f366b9ef9df.jpg', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('9a03a7917f1e46aa946decbcd3c1b7cf', '哇哈哈', '12364312312', '2017-11-07 00:00:00', 'W1', 'W1', 'W1', 'W1', 'W1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('9bd035c4a95d421b9da72b5c9beb0ece', '123', '123456', '2017-10-25 00:00:00', '新东方烹饪技术学院', '1', '范某某', '15341361324', '外访', null, null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('a7c643730b414086828360a1aad94981', '芝麻', '6541613212', '2017-11-07 00:00:00', '水母', '水母', '水母', '水母', '水母', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('adbffc4ff7f64bcfa5cd4f02c6c2afe4', '千牛速贷', '95435454', '2017-11-17 00:00:00', '汇海金融', '自营', '王经理', '123456789987', '电催', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', '620afbf9047442888a8db580baafb839', '2', '1', '2018-01-16 00:00:00', '3d833e400920425aba01aa9ea2b31ab9');
INSERT INTO `bond_sheet` VALUES ('c73502a5704e434a8aefa5243858baf1', '1', '10086', '2017-11-03 00:00:00', '1', '1', '1', '15341361324', '1', 'files/2017/11/03/10\\68f7d6f6-11ab-4c26-b451-191604e9c80c.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('c8b5f7281c1743f3ae7a82aa85463aee', '验证发布人id', '1235465', '2017-11-09 00:00:00', null, null, null, null, null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('cfbfec76d222429b8c0f8a1b060504ed', '数码世纪', '8962136782', '2017-11-07 00:00:00', '数码', '数码', '数码', '数码', '数码', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('d7314c485f89467094b00fb5eb2d7540', '哇哈哈', '12364312312', '2017-11-07 00:00:00', 'W1', 'W1', 'W1', 'W1', 'W1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('d76bef43a6da43438fd3ffb656865dc5', '3S健康顾问', '123642723', '2017-11-07 10:24:27', 'a1', 'a1', 'a1', 'a1', 'a1', null, 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('da4f1f38ad324f5c9b69eea6d50d64f4', '东方红新动力', '000480', '2017-10-25 00:00:00', '蓝翔高级汽修学校', '自营', '林某某', '15341361324', '电催', 'files/2017/10/25/14\\39ba290b-ba4c-4fb1-8348-72639673c689.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('ded3a2711e234b4ab7af1176dc9da8c1', '紫叶子', '2135432135', '2017-11-06 00:00:00', '织金企业', '国企', '紫', '135423532214', '国企', 'files/2017/11/06/16\\41142ae6-8f5b-4740-8945-45790a8e7ec7.jpg', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('df8d41ea3f5849df9690253ad52c1b6d', '3S健康顾问', '123642723', '2017-11-07 10:32:32', 'a2', 'a2', 'a2', 'a2', 'a2', null, 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('dffd7f84ea4e42f587b073ec8783f178', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a3', 'a3', 'a3', 'a3', 'a3', null, 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('e2b011541c3a4a32b0696f1e1fb8e9f0', '水木公司', '495453212', '2017-11-03 00:00:00', '太平洋保险公司', '国企', '海某某', '123456789987', '电催', 'files/2017/11/03/10\\93e3dcb4-8bec-4a7c-a8ae-9267573b557a.jpg', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('e6dd8fb8a13e4d188e470cf38c0aacd1', '东方红睿逸定期开放', '001309', '2017-10-31 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', null, null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('e9ea79d04683433c949edaac93794075', '千牛速贷', '95435454', '2017-11-17 00:00:00', '汇海金融', '自营', '王经理', '123456789987', '电催', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', '620afbf9047442888a8db580baafb839', '2', '1', '2017-11-16 00:00:00', '3d833e400920425aba01aa9ea2b31ab9');
INSERT INTO `bond_sheet` VALUES ('eda4aebb593f488fadbd0fa3a95994fe', '发布时创建id', '1651323211', '2017-11-10 00:00:00', '1', '1', '1', '1', '1', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('ef1ffe0e5ede43afbd870dc44bd85522', '东方红睿逸定期开放', '001309', '2017-10-30 00:00:00', '板蓝根集团', '国企', '炎某', '13515444564', '外访', 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('f1ac55ffdd464cd2a8800356589fc2dc', '灌灌灌灌灌', '001', '2017-11-10 00:00:00', '111', '个人', '啊', '456', null, 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('f1f85d827b9c4a438dbb08fe1e0bc12d', '36524连锁餐饮', '1234567', '2017-11-07 00:00:00', '测试接单', '测试接单', '测试接单', '测试接单', '测试接单', 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('f67b39fbc21646ec80a548925f9f1e2b', '东方黄睿丰123', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', null, null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('fc7bf2f73b1749da9b996094987483ee', '需要接单的资产', '1236745843', '2017-11-07 00:00:00', 'x1', 'x1', 'x1', 'x1', 'x1', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', null, null, null, null, null);
INSERT INTO `bond_sheet` VALUES ('fcfccdcfd33e4f5d971ebad3c6fd1700', '2', '2', '2017-11-02 00:00:00', '2', '2', '2', '2', '2', 'files/2017/11/02/11\\3a348e5f-42a1-455a-b4c3-3449dd13b370.jpg', null, null, null, null, null, null);




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
INSERT INTO `dict_assets` VALUES ('21', 'bond_product_solutions', '1', '金融国资', '1');
INSERT INTO `dict_assets` VALUES ('22', 'bond_product_solutions', '2', '不良资产', '1');
INSERT INTO `dict_assets` VALUES ('23', 'bond_product_solutions', '3', '非国有资产', '1');
INSERT INTO `dict_assets` VALUES ('24', 'bond_product_solutions', '4', '招商', '1');
INSERT INTO `dict_assets` VALUES ('25', 'bond_classify', '1', '处置方接单', '0');
INSERT INTO `dict_assets` VALUES ('26', 'bond_classify', '2', '处置方竞单', '0');
INSERT INTO `dict_assets` VALUES ('27', 'bond_ownership_amount', '1', '10万-50万', '0');
INSERT INTO `dict_assets` VALUES ('28', 'bond_ownership_amount', '2', '50万-100万', '0');
INSERT INTO `dict_assets` VALUES ('29', 'bond_ownership_amount', '3', '100万-200万', '0');
INSERT INTO `dict_assets` VALUES ('3', 'auction_product_solutions', '3', '非国有资产', '0');
INSERT INTO `dict_assets` VALUES ('30', 'bond_ownership_amount', '4', '200万以上', '0');
INSERT INTO `dict_assets` VALUES ('31', 'bond_location', '1', '石家庄市', '0');
INSERT INTO `dict_assets` VALUES ('32', 'bond_location', '2', '邢台', '0');
INSERT INTO `dict_assets` VALUES ('33', 'bond_bidding_cycle', '90', '3个月', '0');
INSERT INTO `dict_assets` VALUES ('34', 'bond_bidding_cycle', '180', '6个月', '0');
INSERT INTO `dict_assets` VALUES ('35', 'bond_bidding_cycle', '360', '12个月', '0');
INSERT INTO `dict_assets` VALUES ('36', 'bond_bidding_cycle', '720', '24个月', '0');
INSERT INTO `dict_assets` VALUES ('4', 'auction_product_solutions', '4', '招商', '0');
INSERT INTO `dict_assets` VALUES ('40', 'bond_disposal_state', '1', '待签约', '0');
INSERT INTO `dict_assets` VALUES ('41', 'bond_disposal_state', '2', '已发布', '0');
INSERT INTO `dict_assets` VALUES ('44', 'bond_verify', '1', '待审核', '0');
INSERT INTO `dict_assets` VALUES ('45', 'bond_verify', '2', '已审核', '0');
INSERT INTO `dict_assets` VALUES ('46', 'bond_verify', '3', '退回', '0');
INSERT INTO `dict_assets` VALUES ('47', 'bond_choose', '1', '未完成订单', '0');
INSERT INTO `dict_assets` VALUES ('48', 'bond_choose', '2', '已完成订单', '0');
INSERT INTO `dict_assets` VALUES ('5', 'auction_classify', '1', '股权', '0');
INSERT INTO `dict_assets` VALUES ('50', 'bond_product_solutions', '5', '信誉贷', '0');
INSERT INTO `dict_assets` VALUES ('51', 'bond_product_solutions', '6', '抵押贷', '0');
INSERT INTO `dict_assets` VALUES ('52', 'bond_product_solutions', '7', '担保贷', '0');
INSERT INTO `dict_assets` VALUES ('53', 'bond_deal', '1', '单笔委外', '0');
INSERT INTO `dict_assets` VALUES ('54', 'bond_deal', '2', '委外包', '0');
INSERT INTO `dict_assets` VALUES ('55', 'bond_sheet_state', '1', '未过期', '0');
INSERT INTO `dict_assets` VALUES ('56', 'bond_sheet_state', '2', '已过期', '0');
INSERT INTO `dict_assets` VALUES ('6', 'auction_classify', '2', '债权', '0');
INSERT INTO `dict_assets` VALUES ('7', 'auction_classify', '3', '实物', '0');
INSERT INTO `dict_assets` VALUES ('8', 'auction_ownership_amount', '1', '10万-50万', '0');
INSERT INTO `dict_assets` VALUES ('9', 'auction_ownership_amount', '2', '50万-100万', '0');
