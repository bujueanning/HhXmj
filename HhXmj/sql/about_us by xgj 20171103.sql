/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-11-03 20:04:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for about_us
-- ----------------------------
DROP TABLE IF EXISTS `about_us`;
CREATE TABLE `about_us` (
  `about_us_id` varchar(36) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '标题',
  `text` longtext CHARACTER SET utf8mb4 NOT NULL COMMENT '正文',
  `about_us_createuid` varchar(36) DEFAULT NULL COMMENT '创建者',
  `about_us_createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `about_us_updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`about_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of about_us
-- ----------------------------
INSERT INTO `about_us` VALUES ('924c05d5b7ab42ad9feaf5256c149c31', '联系我们', '<p class=\"padding20\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 20px; color: rgb(40, 40, 40); font-family: 微软雅黑, 仿宋, arial, sans-seri; font-size: 14px; text-indent: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px; line-height: 30px;\">我们一直专注与助力资产交易管理金牌服务领域，从不懈怠。我们期待您的来讯，一起在“互联网+”的经济革命时代合作共赢！</span></p><p class=\"p1 padding20\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 20px; color: rgb(40, 40, 40); font-family: 微软雅黑, 仿宋, arial, sans-seri; font-size: 14px; text-indent: 30px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><ul class=\"gyb-fw list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>公司地址：石家庄市桥西区裕华西路11号</p></li><li><p>服务邮箱：xianmiaoju@163.com</p></li><li><p>公司网站：www.xianmiaoju.com</p></li><li><p>公司邮编：050000</p></li><li><p>咨询电话：0311-88888888</p></li><li><p><img src=\"ueditor/jsp/upload/image/20171021/1508586983437021004.jpg\" title=\"1508586983437021004.jpg\" alt=\"091404A31-0.jpg\"/><br/></p></li></ul><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-21 19:56:25', '2017-10-21 19:56:25');
INSERT INTO `about_us` VALUES ('971a91d9719d4d4cb3f40766a740ce0a', '公司介绍', '<p class=\"padding20\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 20px; color: rgb(40, 40, 40); font-family: 微软雅黑, 仿宋, arial, sans-seri; font-size: 14px; text-indent: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px; line-height: 30px;\">鑫淼聚，是我国金融建设与发展必备的基础性工程，为中国金融资产的登记、托管、结算、清退提供专业化的服务，为金融资产实现标准化奠定了基础，为加速金融产品流转创造了条件。 注册资本3000万元人民币，是继中债登、中证登之后，中国第三家专业性的登记、托管、结算机构。公司本着“安全高效、至诚至信”的服务理念,服务于各交易机构,与交易机构联合运作，为金融资产的流转提供资产登记、发行认购、交易、托管、结算的全方位全流程的专业化服务。</span></p><p class=\"p1 padding20\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 20px; color: rgb(40, 40, 40); font-family: 微软雅黑, 仿宋, arial, sans-seri; font-size: 14px; text-indent: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px; line-height: 30px;\">登记结算公司严格遵循国际国内行业标准，确立了“诚信、服务、专业、效率”的核心价值观，形成了“安全高效、至诚至信”的服务理念。目前，公司已与多家大型金融机构签署合作协议，内容涉及信贷资产、信托资产、租赁资产、基金资产和相关创新金融产品，还按照中国保监会关于保险资产管理产品在天津金融资产交易所交易的批文，被确定为保险资产管理产品的登记、托管、结算机构。</span></p><p class=\"p1 padding20\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 20px; color: rgb(40, 40, 40); font-family: 微软雅黑, 仿宋, arial, sans-seri; font-size: 14px; text-indent: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px; line-height: 30px;\">公司目前主要服务于鑫淼聚，为其产品提供登记、结算和托管服务，各类金融产品发行及其交易的登记、托管、结算；金融创新产品的咨询、研究、开发、设计与相关服务，并不断完善职能、扩展业务范围，力争将其发展成为可为各类金融资本市场配套服务且独立于发行交易的第三方非金融中介机构，建立一个符合规范化、市场化和国际化要求，为保险、银行、各类基金、信托型金融产品提供专业的第三方的登记托管结算服务平台。</span></p><p class=\"p1 padding20\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 20px; color: rgb(40, 40, 40); font-family: 微软雅黑, 仿宋, arial, sans-seri; font-size: 14px; text-indent: 30px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px; line-height: 30px;\"><img src=\"ueditor/jsp/upload/image/20171021/1508586960009019949.png\" title=\"1508586960009019949.png\" alt=\"1488032789_484338.png\"/></span></p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-21 19:56:02', '2017-10-21 19:56:02');
