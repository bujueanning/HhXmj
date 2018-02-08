/*
Navicat MySQL Data Transfer

Source Server         : adminltemy
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-04 12:51:05
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
  `bond_product_solutions` tinyint(4) DEFAULT NULL COMMENT '状态:1_金融国资,2_不良资产,3_非国有资产,4_招商',
  `bond_ownership_amount` varchar(255) DEFAULT '''NULL''' COMMENT '权属金额',
  `bond_bidding_cycle` int(11) DEFAULT NULL COMMENT '期限（自动计算天数）',
  `bond_classify` tinyint(4) DEFAULT NULL COMMENT '状态:1_处置方接单,2_处置方竞单',
  `bond_location` varchar(255) DEFAULT '''NULL''' COMMENT '地址',
  `bond_contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `bond_contact_number` varchar(255) DEFAULT NULL COMMENT '联系人电话',
  `bond_disposal_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `bond_verify` varchar(255) DEFAULT NULL COMMENT '是否审核',
  PRIMARY KEY (`bond_disposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产委外信息';
