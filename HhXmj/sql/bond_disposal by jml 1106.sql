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
  `bond_product_solutions` tinyint(4) DEFAULT NULL COMMENT '状态:1_金融国资,2_不良资产,3_非国有资产,4_招商',
  `bond_ownership_amount` varchar(255) DEFAULT '''NULL''' COMMENT '权属金额',
  `bond_bidding_cycle` int(11) DEFAULT NULL COMMENT '期限（自动计算天数）',
  `bond_classify` tinyint(4) DEFAULT NULL COMMENT '状态:1_处置方接单,2_处置方竞单',
  `bond_location` varchar(255) DEFAULT '''NULL''' COMMENT '地址',
  `bond_contacts` varchar(255) DEFAULT '''NULL''' COMMENT '联系人',
  `bond_contact_number` varchar(255) DEFAULT '''NULL''' COMMENT '联系人电话',
  `bond_disposal_img` varchar(255) DEFAULT '''NULL''' COMMENT '展示图片',
  `bond_verify` varchar(255) DEFAULT NULL COMMENT '审核状态：1_待审核 2_已审核  3_退回',
  `bond_disposal_createuid` varchar(255) DEFAULT NULL COMMENT '创建人',
  `bond_disposal_updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `bond_unable` tinyint(4) DEFAULT NULL COMMENT '0_可接单报名、1_不可操作',
  PRIMARY KEY (`bond_disposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产委外信息';

-- ----------------------------
-- Records of bond_disposal
-- ----------------------------
INSERT INTO `bond_disposal` VALUES ('0506e5b2f72e4d6d99f5dd0ad0fe6010', '水木公司', '495453212', '1110000', '2017-11-09 00:00:00', '2017-11-06 16:49:16', '65%', '1', '2017-11-03 10:36:01', '2', '3', '21', '2', '2', '林某某', '111111111111', 'files/2017/11/03/10\\21ca0294-21cc-43b8-8bfe-78983259356a.jpg', '2', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('1', '东方红新动力', '000480', '1.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:17', '91%', '1', '2017-11-02 16:16:42', '2', '3', '89', '1', '2', '六某某', '\'NULL\'', '\'NULL\'', '2', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('10', '东方红睿逸定期开放', '001309', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:18', '89%', '1', '2017-11-02 16:03:09', '2', '2', '89', '2', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('11', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:19', '89%', '1', '2017-08-04 00:00:00', '2', '3', '100', '1', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('1148ecc497da47cf9d4f316931dc81d2', '雪佛兰集团', '4654231', '1036100112', '2017-11-05 00:00:00', '2017-11-06 16:49:19', '78%', '1', '2017-11-03 09:37:47', '1', '4', '25', '1', '1', '李某某', '13454543211', 'files/2017/11/01/14\\1d03208d-9407-43c7-906c-bc1d0ec7a92e.jpg', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('12', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:20', '89%', '2', '2017-08-04 00:00:00', '2', '4', '190', '2', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('13', '	东方蓝睿丰', '001205', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:21', '89%', '1', '2017-08-04 00:00:00', '2', '4', '300', '2', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('14', '东方黄睿丰', '001206', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:21', '89%', '2', '2017-08-04 00:00:00', '2', '1', '500', '1', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('15', '东方红京东大数据', '001564', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:22', '89%', '2', '2017-08-04 00:00:00', '2', '2', '600', '2', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('2', '东方红新动力', '000480', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:22', '89%', '2', '2017-08-04 00:00:00', '2', '2', '170', '2', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('3', '东方红睿丰', '169101', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:23', '89%', '1', '2017-08-04 00:00:00', '2', '3', '300', '1', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('36844f4d5c1644e595b7fe4594e6a8e2', '紫叶子', '2135432135', '167', '2017-11-01 00:00:00', '2017-11-07 09:04:33', '76%', '1', '2017-11-06 16:40:36', '2', '3', '29', '1', '2', '陆', '1234446873', 'files/2017/11/06/15\\60b4a93e-21d2-46ed-819f-af0ae8535da5.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1');
INSERT INTO `bond_disposal` VALUES ('3874dfc93c6d4315bccb075ff7fd126b', '11月6日', '97523452', '300', '2017-11-07 00:00:00', '2017-11-06 16:49:26', '89%', '1', '2017-11-06 00:00:00', '2', '4', '23', '1', '2', '江一一', '13546632546', 'files/2017/11/06/09\\66f15baf-e496-4ed8-9a2b-c3dd1f09a3ff.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0');
INSERT INTO `bond_disposal` VALUES ('3bd3ba4068eb4d97974be60048b471e7', '需要报名的资产', '3247832423', '65', '2017-11-21 00:00:00', '2017-11-07 11:49:48', '97%', '1', '2017-11-07 11:24:54', '2', '2', '11', '2', '2', '浩', '1354889642', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1');
INSERT INTO `bond_disposal` VALUES ('3eb81824a932421d8296d16870e81a83', '哇哈哈', '12364312312', '65', '2017-11-20 00:00:00', '2017-11-07 11:35:47', '87%', '1', '2017-11-07 11:06:15', '1', '2', '-13', '2', '2', '王', '17321373242', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1');
INSERT INTO `bond_disposal` VALUES ('4', '东方红睿阳', '169201', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:26', '89%', '1', '2017-11-02 14:32:49', '2', '4', '89', '2', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('4cef9e18902d4d64a04dc6d4fe764d7d', '3A健康', '1231010123', '111', '2017-11-17 00:00:00', '2017-11-06 16:49:27', '87%', '1', '2017-11-06 16:40:07', '2', '3', '13', '2', '2', '伊', '1336465746', 'files/2017/11/06/15\\6c8efb98-6499-4b08-b81e-76a39af51bf1.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0');
INSERT INTO `bond_disposal` VALUES ('5', '东方红睿元', '000970', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:28', '89%', '2', '2017-08-04 00:00:00', '2', '1', '20', '1', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('556ed8d424864d739a025f76a4d757a8', '3S健康顾问', '123642723', '169', '2017-11-13 00:00:00', '2017-11-07 10:32:32', '85%', '1', '2017-11-07 09:23:34', '1', '3', '9', '2', '2', '齐', '15643332546', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1');
INSERT INTO `bond_disposal` VALUES ('55f7b4f8f6014a1d905cb7f5c9c85272', '东方一气大众', '10011', '2500000', '2017-10-03 00:00:00', '2017-11-06 16:49:28', '75%', '1', '2017-11-01 15:06:26', '2', '4', '29', '1', '1', '刘某某', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('6', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:31', '89%', '1', '2017-08-04 00:00:00', '2', '2', '170', '2', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('6359879020494fc5a211cad0c0867e33', '芝麻', '6541613212', '11', '2017-10-29 00:00:00', '2017-11-07 14:11:50', '96%', '1', '2017-11-07 00:00:00', '2', '1', '25', '2', '2', '候', '1354896532', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1');
INSERT INTO `bond_disposal` VALUES ('636bb1d2745f4f92bc50688c282fd422', '36524连锁餐饮', '1234567', '600000', '2017-10-11 00:00:00', '2017-11-07 11:21:22', '76%', '1', '2017-11-01 15:39:50', '3', '2', '21', '1', '1', '林某某', '13334561236', 'files/2017/10/23/11\\1e12d6f8-c2ba-4882-955d-d1a7c6d613aa.jpg', '2', null, null, '1');
INSERT INTO `bond_disposal` VALUES ('662a97021a744b5fb43f7d97952f3965', '黄金季节', '123121', '132', '2017-11-14 00:00:00', '2017-11-06 16:49:33', '67%', '1', '2017-11-06 00:00:00', '2', '3', '9', '1', '2', '尽', '136563226912', 'files/2017/11/06/15\\f3d7ccc2-e1de-41ec-9497-1c8488c51125.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0');
INSERT INTO `bond_disposal` VALUES ('680cf07acb8b4191a47063db501c4735', '3A健康', '1231010123', '111', '2017-11-17 00:00:00', '2017-11-06 16:49:34', '87%', '1', '2017-11-06 16:39:18', '2', '3', '13', '2', '2', '伊', '1336465746', 'files/2017/11/06/15\\9e95cc81-dc7d-4b6f-a7f6-80b56e46a073.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '0');
INSERT INTO `bond_disposal` VALUES ('6ab67dc082204101883baf36d05921d3', '芝麻', '6541613212', '11', '2017-10-29 00:00:00', '2017-11-23 00:00:00', '96%', '1', '2017-11-07 00:00:00', '2', '1', '25', '2', '2', '候', '1354896532', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0');
INSERT INTO `bond_disposal` VALUES ('7', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:35', '89%', '2', '2017-08-04 00:00:00', '2', '3', '350', '1', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('7f6b11a28d604f70831579a7456768cf', '需要接单的资产', '1236745843', '110', '2017-11-07 00:00:00', '2017-11-07 11:25:57', '76%', '1', '2017-11-07 11:25:03', '2', '3', '17', '1', '2', '江', '136544329555', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1');
INSERT INTO `bond_disposal` VALUES ('8', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:36', '89%', '2', '2017-08-04 00:00:00', '2', '4', '710', '2', '2', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('823994348a064503bbb83eca8047d253', '绿叶子有限公司', '16412121', '800000', '2017-09-12 00:00:00', '2017-11-06 16:49:37', '75%', '1', '2017-11-01 14:57:13', '2', '2', '50', '2', '2', '叶某某', '11215423541', 'files/2017/10/31/10\\45c991a8-6dde-4fd6-aa0d-d885a12e5a1f.jpg', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('8f8e96d5bb434309aeb79ed4d7667905', '数码世纪', '8962136782', '154', '2017-11-07 00:00:00', '2017-11-07 13:39:09', '69%', '1', '2017-11-07 00:00:00', '2', '3', '22', '1', '2', '金', '1568453132131', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1');
INSERT INTO `bond_disposal` VALUES ('9', '东方红稳健精选C', '001204', '123.3123.00', '2017-08-04 00:00:00', '2017-11-06 16:49:37', '89%', '1', '2017-08-04 00:00:00', '2', '1', '20', '1', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('b0ecd8e24414495294d6629dafc92fdc', '需要报名的资产', '3247832423', '65', '2017-11-21 00:00:00', '2017-12-02 00:00:00', '97%', '1', '2017-11-07 00:00:00', '2', '2', '11', '2', '2', '浩', '1354889642', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0');
INSERT INTO `bond_disposal` VALUES ('b6b48373db01441c85be78671ce53fb2', '宜而爽有限公司', '123456', '1060000', '2017-10-13 00:00:00', '2017-11-06 16:49:38', '65%', '1', '2017-10-27 15:21:06', '1', '3', '14', '1', '2', '王某某', '15613123151', 'D:\\eclipse-luna\\apache-tomcat-7.0.79\\wtpwebapps\\HhXmj\\files\\2017\\10\\23\\10\\954257e2-0f9e-425b-af44-19c2735b8b4f.jpg', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('bf1a882414984d6ab031140cc8e7b756', '西瓜', '5421321852', '75', '2017-11-08 00:00:00', '2017-11-07 14:10:58', '90%', '1', '2017-11-07 00:00:00', '2', '2', '22', '2', '2', '洪', '135788888965', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1');
INSERT INTO `bond_disposal` VALUES ('eac1a016b1b448f6bd0aa80678fd2928', '橘黄', '16568345', '34', '2017-11-16 00:00:00', '2017-11-07 14:02:25', '95%', '1', '2017-11-07 00:00:00', '2', '1', '8', '1', '1', '炎', '13255874521', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1');
INSERT INTO `bond_disposal` VALUES ('eb834d3dc41d43da916f9d46f0385636', '11月6号', '964223842', '160', '2017-11-15 00:00:00', '2017-11-06 16:49:39', '68%', '1', '2017-11-06 00:00:00', '2', '3', '15', '2', '1', '历某某', '16354786322', 'files/2017/11/06/10\\b6e4856c-7866-476b-a0ea-b8506acb637d.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0');
INSERT INTO `bond_disposal` VALUES ('eb94e2d54a7e421ca0bd726e2451e4de', '验证发布人id', '1235465', '64', '2017-11-14 00:00:00', '2017-11-07 13:35:27', '75%', '1', '2017-11-07 00:00:00', '2', '2', '2', '1', '2', '伊', '161123644554', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '0');
INSERT INTO `bond_disposal` VALUES ('f55961b299e04dc49f864272668f725b', '东丰日产', '45454', '650000', '2017-11-07 00:00:00', '2017-11-06 16:49:42', '65%', '1', '2017-11-01 15:43:43', '2', '2', '18', '1', '1', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0');
INSERT INTO `bond_disposal` VALUES ('fbdf4899d5df4c599a89bcd5ff9e10e6', '西瓜', '5421321852', '75', '2017-11-08 00:00:00', '2017-11-30 00:00:00', '90%', '1', '2017-11-07 00:00:00', '2', '2', '22', '2', '2', '洪', '135788888965', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0');
INSERT INTO `bond_disposal` VALUES ('fe95fb3626cf4e2a8c9a9373894777b5', '3S健康顾问', '123642723', '169', '2017-11-13 00:00:00', '2017-11-22 00:00:00', '85%', '1', '2017-11-07 00:00:00', '1', '3', '9', '2', '2', '齐', '15643332546', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0');



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
  PRIMARY KEY (`bond_sheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最终订单的表';


INSERT INTO `bond_sheet` VALUES ('0e76f0612248491193a242b30efa58cd', '水木公司', '495453212', '2017-11-3 00:00:00', '太平洋投资公司', '国企', '海某某', '113121312123', '电催', 'files/2017/11/03/10\\9cfcb326-9569-4f3a-b289-891d1426f28b.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('4326aeb6bfab4581bc4950e45dffd02d', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', NULL, NULL);
INSERT INTO `bond_sheet` VALUES ('4ffd4d4bf6d1460ca7f2d4c311ff3ae2', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', NULL);
INSERT INTO `bond_sheet` VALUES ('540ac9b9d26a412e85763506a1aea648', '东方一气大众', '10011', '2017-10-30 00:00:00', '双汇王中王', '自营', '江某某', '13642649133', '电催', 'files/2017/10/30/15\\af2b2ecc-e092-47e4-ab65-c14540dca0f0.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('5f2af2770c64450b9233a2ebe787bfc2', '东方黄睿丰', '001206', '2017-10-30 00:00:00', '太平洋投资公司', '国企', '海某某', '12334562139', '外访', 'null\\null', NULL);
INSERT INTO `bond_sheet` VALUES ('5fa527afc4544742a3c76a078d84f6dc', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', NULL, NULL);
INSERT INTO `bond_sheet` VALUES ('88963f051f644b1f992cbd1f3fba77c9', '水木公司', '495453212', '2017-11-3 00:00:00', '太平洋保险公司', '国企', '海某某', '123456789987', '电催', 'files/2017/11/03/10\\d891e681-6b9f-43f6-a4a9-bfce1153f639.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('88b55103aac9468eaeaaf003df02ccd7', '水木公司', '495453212', '2017-11-3 00:00:00', '太平洋投资公司', '国企', '林某某', '16422134521321', '电催', 'files/2017/11/03/11\\174644bf-86b0-46f1-a714-3cc7ffdb1a72.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('935fb18a37004f98b2202fbb238b4829', '水木公司', '495453212', '2017-11-3 00:00:00', '太平洋保险公司', '国企', '海某某', '123456789987', '电催', 'files/2017/11/03/10\\6dffa4a2-96fb-42a6-b08f-3d79cb1b38d0.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('962e4a30c12c47b08c7916dd09c5f2a6', '11月6日', '97523452', '2017-11-6 00:00:00', '天气有雾', '国家发布', '天气预报', '111111122', '开大风', 'files/2017/11/06/10\\cfb975a2-79e0-4363-93ed-5f366b9ef9df.jpg', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_sheet` VALUES ('9bd035c4a95d421b9da72b5c9beb0ece', '123', '123456', '2017-10-25 00:00:00', '新东方烹饪技术学院', '1', '范某某', '15341361324', '外访', NULL, NULL);
INSERT INTO `bond_sheet` VALUES ('c73502a5704e434a8aefa5243858baf1', '1', '10086', '2017-11-3 00:00:00', '1', '1', '1', '15341361324', '1', 'files/2017/11/03/10\\68f7d6f6-11ab-4c26-b451-191604e9c80c.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('da4f1f38ad324f5c9b69eea6d50d64f4', '东方红新动力', '000480', '2017-10-25 00:00:00', '蓝翔高级汽修学校', '自营', '林某某', '15341361324', '电催', 'files/2017/10/25/14\\39ba290b-ba4c-4fb1-8348-72639673c689.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('e2b011541c3a4a32b0696f1e1fb8e9f0', '水木公司', '495453212', '2017-11-3 00:00:00', '太平洋保险公司', '国企', '海某某', '123456789987', '电催', 'files/2017/11/03/10\\93e3dcb4-8bec-4a7c-a8ae-9267573b557a.jpg', NULL);
INSERT INTO `bond_sheet` VALUES ('e6dd8fb8a13e4d188e470cf38c0aacd1', '东方红睿逸定期开放', '001309', '2017-10-31 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', NULL, NULL);
INSERT INTO `bond_sheet` VALUES ('ef1ffe0e5ede43afbd870dc44bd85522', '东方红睿逸定期开放', '001309', '2017-10-30 00:00:00', '板蓝根集团', '国企', '炎某', '13515444564', '外访', 'null\\null', NULL);
INSERT INTO `bond_sheet` VALUES ('f67b39fbc21646ec80a548925f9f1e2b', '东方黄睿丰123', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', NULL);
INSERT INTO `bond_sheet` VALUES ('fcfccdcfd33e4f5d971ebad3c6fd1700', '2', '2', '2017-11-2 00:00:00', '2', '2', '2', '2', '2', 'files/2017/11/02/11\\3a348e5f-42a1-455a-b4c3-3449dd13b370.jpg', NULL);


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
  PRIMARY KEY (`bond_accept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报名的处置方信息表';



INSERT INTO `bond_accept` VALUES ('0c57c42882af44b08cf8d4e949e6510c', '1', '2', '2017-11-2 00:00:00', '1', '1', '1', '12334562139', '1', 'files/2017/11/02/16\\5e1d761c-ff1e-4f2f-b776-cd184cbe2a17.jpg', '2', NULL);
INSERT INTO `bond_accept` VALUES ('1', '东方红睿逸定期开放', '001309', '2017-10-3 00:00:00', '板蓝根集团', '国企', '炎某', '13515444564', '外访', NULL, '1', NULL);
INSERT INTO `bond_accept` VALUES ('119a89794715408889e357bd9b681eb4', '东方黄睿丰', '001206', '2017-10-31 00:00:00', '周大福珠宝', '自营', '周某某', '13545321677', '外访', 'null\\null', '2', NULL);
INSERT INTO `bond_accept` VALUES ('1d0a3ba9b4ad447eb4946263353b1c71', '6', '6', '2017-11-2 00:00:00', '6', '6', '6', '6', '6', 'files/2017/11/02/16\\9f6bd800-3008-4106-b180-eaf6262a08af.jpg', '2', NULL);
INSERT INTO `bond_accept` VALUES ('443bfaaacf554696a87eb2dbe80c82a2', '东方红睿逸定期开放', '001309', '2017-10-25 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', 'files/2017/10/25/14\\9d4ef5de-f873-4a00-8c78-f914ddba194f.jpg', '2', NULL);
INSERT INTO `bond_accept` VALUES ('53f251eedbb44729ad7f1e4a5b2f2e69', '11月6号', '964223842', '2017-11-6 00:00:00', '紫色', '国企', '江', '16354789354', '外访', 'files/2017/11/06/11\\4ede13d6-9dfc-4861-9f2d-12f6193094df.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_accept` VALUES ('81d27cd2a0a84b61ba593bab53bb2900', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', 'null\\null', '2', NULL);
INSERT INTO `bond_accept` VALUES ('8a89968b14f74519a4788b30ed99c837', '东方红睿轩沪港深', '169103', '2017-11-3 14:51:07', '1', '1', '1', '12334562139', '1', 'files/2017/11/03/14\\16b81552-043d-437d-a034-3bae10fcdd90.jpg', '1', NULL);
INSERT INTO `bond_accept` VALUES ('a4bfeb595d9b473aa29c8fbdf62cc377', '11月6号', '964223842', '2017-11-6 00:00:00', '樱色', '国企', '烟', '123456789987', NULL, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_accept` VALUES ('b8f911467c4a4bf3adcd2524db119025', '雪佛兰集团', '4654231', '2017-11-3 00:00:00', '黄蜂集团', '自营', '大先生', '16466321303', '电催', 'files/2017/11/03/09\\8161dda7-96ba-417c-80ab-5a884b36139a.jpg', '1', NULL);
INSERT INTO `bond_accept` VALUES ('cd7e07aa03594c2baf2f91a772fc3ea2', '绿叶子有限公司', '16412121', '2017-10-31 10:59:01', '环境保护集团', '国企', '李某某', '12334562139', '电催', 'null\\null', '1', NULL);
INSERT INTO `bond_accept` VALUES ('d61058bc2cfd49cd882c0850615ba65b', '12312', '2', '2017-11-2 16:04:33', '1', '1', '1', '12334562139', '1', 'files/2017/11/02/16\\e739b716-a344-40fd-8218-59d8f645c373.jpg', '1', NULL);
INSERT INTO `bond_accept` VALUES ('e3b31fa2bbfe4ce89911abaf02fb085f', '123123', '10086', '2017-11-3 00:00:00', '1', '1', '1', '12334562139', '1', 'files/2017/11/03/09\\7b74d41d-cc4a-4f4a-9539-067147cd79f3.jpg', '1', NULL);
