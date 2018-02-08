/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-10-25 18:48:54
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

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.21.0.0)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.21.0.0', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for auction_assets
-- ----------------------------
DROP TABLE IF EXISTS `auction_assets`;
CREATE TABLE `auction_assets` (
  `auction_assets_id` varchar(36) NOT NULL,
  `auction_project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `auction_project_number` varchar(255) NOT NULL COMMENT '项目编号',
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
INSERT INTO `auction_assets` VALUES ('0713e5cfbea2418cb48246234bb65860', '测试', 'B020171013205416', '1', '1', '1', '30', '1', '1.00', '1', '2017-10-02 00:00:00', '2017-10-16 23:54:02', '<p>22&nbsp;&nbsp;&nbsp;&nbsp;22&nbsp;&nbsp;&nbsp;&nbsp;22&nbsp;&nbsp;&nbsp;&nbsp;</p><p>22&nbsp;&nbsp;&nbsp;&nbsp;22&nbsp;&nbsp;&nbsp;&nbsp;22&nbsp;&nbsp;&nbsp;&nbsp;22</p>', '22', '22', '2', 'files/2017/10/13/20\\fbd429a7-8ba9-4b29-a3e1-9134b1cdf525.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:02', '2017-10-16 23:54:02');
INSERT INTO `auction_assets` VALUES ('19b84a3ef1894fa895e319ec573b8100', '5', 'B020171014231116', '2', '2', '2', '29', '2', '2.00', '2', '2017-10-20 00:00:00', '2017-10-16 23:54:04', '<p>4444 &nbsp;44 &nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\aa6c4000-c781-415e-9e88-face6dee4dfb.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:04', '2017-10-16 23:54:04');
INSERT INTO `auction_assets` VALUES ('6e9025d7d2cf40f1a3d94031bdac2679', '1', 'B020171013213841', '1', '1', '1', '14', '1', '1.00', '5', '2017-09-07 00:00:00', '2017-09-21 21:43:19', '<p>1&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;3</p>', '1', '1', '1', 'files/2017/09/19/22\\6df2301e-2f90-41c5-876a-c23f1593cd06.png', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-13 21:38:41', '2017-10-13 21:38:41');
INSERT INTO `auction_assets` VALUES ('80ecd33415ae4321a816bb6f30025f4e', '4', 'B020171014231012', '2', '2', '2', '-29', '2', '2.00', '5', '2017-10-20 00:00:00', '2017-10-16 23:54:08', '<p>4444 &nbsp;44 &nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\f6b444cb-7637-4156-b43e-783245cee8a9.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:08', '2017-10-16 23:54:08');
INSERT INTO `auction_assets` VALUES ('a6e0d27ee44f4fcfae0871b5311f2c8b', '3', 'B020171014230747', '2', '2', '2', null, '2', '2.00', '3', '2017-10-20 00:00:00', '2017-10-16 23:54:10', '<p>2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\95caedb4-bee3-4e39-b175-d7571b743260.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:10', '2017-10-16 23:54:10');
INSERT INTO `auction_assets` VALUES ('b198dea83377415d91dcb97ff942df26', '4', 'B020171014230931', '2', '2', '2', '-29', '2', '2.00', '3', '2017-10-20 00:00:00', '2017-10-16 23:54:11', '<p>2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\295e073a-c318-4383-9a56-bc4eba2a2e11.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:11', '2017-10-16 23:54:11');
INSERT INTO `auction_assets` VALUES ('b930ca444bb14268a4908b6e8121e83f', '88', 'B020171014232452', '2', '2', '2', '-29', '2', '2.00', '3', '2017-10-20 00:00:00', '2017-10-16 23:54:12', '<p>2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\23b6a181-b267-4976-96ce-f192a15c53b3.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:12', '2017-10-16 23:54:12');
INSERT INTO `auction_assets` VALUES ('d10ed0b734f14ed8ae2934731b164c04', '6', 'B020171014231331', '2', '2', '2', '11', '2', '2.00', '3', '2017-10-20 00:00:00', '2017-10-16 23:54:13', '<p>6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6</p><p>6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6 &nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\83dbf66c-3803-4507-b194-daeb1d640a44.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:13', '2017-10-16 23:54:13');
INSERT INTO `auction_assets` VALUES ('eb2b8d07ff474e778cd0aba840ed6dfc', '333', 'B020171014233149', '2', '2', '2', '34', '2', '2.00', '22', '2017-09-24 00:00:00', '2017-10-28 00:00:00', '<p>2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/10/14/23\\ad5a6f71-0c76-494b-9fe0-52bde4184fef.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-14 23:31:50', '2017-10-14 00:00:00');
INSERT INTO `auction_assets` VALUES ('ee2b9e4ba87a4310b9a2df02900f0778', '99', 'B020171014233005', '1', '1', '99', '14', '1', '99.00', '3', '2017-10-17 00:00:00', '2017-10-16 23:54:15', '<p>66&nbsp;&nbsp;&nbsp;&nbsp;66</p><p>66&nbsp;&nbsp;&nbsp;&nbsp;66</p><p>&nbsp;&nbsp;&nbsp;&nbsp;66&nbsp;&nbsp;&nbsp;&nbsp;66<br/></p>', '66', '66', '1', 'files/2017/10/14/23\\21b398e2-bd78-4526-9a6a-ab153998a661.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:15', '2017-10-16 23:54:15');

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
INSERT INTO `auction_listing` VALUES ('1168f5d7f0c44c6b9a00275bbc5af5e3', 'aec6e299c94c4714a066f937a28e358d', '2', '12', '2', '2', '2', '2', '12', '2', null);
INSERT INTO `auction_listing` VALUES ('180a5ef84591472b8aa9c12ad3a23bfa', 'd19e3805f5c64ae7adccf5fc0550ca43', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('187e27caed9a45c6826713f982bfbb93', 'a6e0d27ee44f4fcfae0871b5311f2c8b', '2', '2', '2', '22', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('2b7aa6d2a1da4d088dde2b4cd8e9e74b', '8b657ddf01a842c0aec82da4e927cf33', '2', null, '2', '2', '2', '2', null, '2', null);
INSERT INTO `auction_listing` VALUES ('3ab6b0dd805d4d22b4b8266a8728dcfe', 'd10ed0b734f14ed8ae2934731b164c04', '2', '2', '2', '22', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('3b987391c3284fe592400b0193a51117', 'b9a6d40c043d4298b2bf0cbee167b04d', '6666', '6666', '6666', '6666', '666', '666', '666', '666', '66\r\n66\r\n66');
INSERT INTO `auction_listing` VALUES ('5202f882df2e4c86a86cf298a8b66a8b', '19b84a3ef1894fa895e319ec573b8100', '2', '2', '2', '22', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('5c948ac51e974ddfb2422103bef21e44', '0713e5cfbea2418cb48246234bb65860', '2', '2', '2', '2', '22', '2', '2', '2', '22');
INSERT INTO `auction_listing` VALUES ('5f314bac60d44f79ac48925f3ff76394', 'b198dea83377415d91dcb97ff942df26', '2', '2', '2', '22', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('8304a4f2253a411caee0ac9bed3dedc6', '4e6c342e103a46a09204e997efdfa328', '2', null, '2', '2', '2', '2', null, '2', null);
INSERT INTO `auction_listing` VALUES ('91636685d48748f699d710110d94889d', '80ecd33415ae4321a816bb6f30025f4e', '2', '2', '2', '22', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('9681e5d22160411fa6ef23cbf2bfc200', 'c3339c7702f04ea1b54913f763c40a99', '2', null, '2', '2', '2', '2', null, '2', '2');
INSERT INTO `auction_listing` VALUES ('ab17f967aefe42909e3f4691332fc904', '026e8d584a4b4ccb9f0bd4d55de86eef', '888', '888', '888', '888', '888', '888', '888', '888', '88');
INSERT INTO `auction_listing` VALUES ('ba0eccaafa73434592338f3558ab05e3', 'ee2b9e4ba87a4310b9a2df02900f0778', '66', '66', '66', '66', '66', '66', '66', '66', '66');
INSERT INTO `auction_listing` VALUES ('bb24d415825d4900975845b3bc5cfa95', '6e9025d7d2cf40f1a3d94031bdac2679', '1', '1', '1', '1', '1', null, '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('bc14e947f47044929bb2d24463325299', 'eb2b8d07ff474e778cd0aba840ed6dfc', '2', '2', '2', '22', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('c1e8f242368f4845a11296edd574be93', '252ff0441a7547008e3d18fb04d4fad9', '3', '3', null, '3', '3', '3', '3', '3', '33');
INSERT INTO `auction_listing` VALUES ('c3a21afaffd54739a2cff25ba7d05647', '11b173f718e947069c2413b8df8feaed', '11', '1', '1', '1', '1', '1', '11', '1', '1');
INSERT INTO `auction_listing` VALUES ('d9e3f3688f8a49b1af860cc6e1994b83', 'b930ca444bb14268a4908b6e8121e83f', '2', '2', '2', '22', '2', '2', '2', '2', '2');
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
INSERT INTO `auction_overview` VALUES ('10b1acea4bac4e98b642e0d1cd0b5118', '1', 'b198dea83377415d91dcb97ff942df26', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('13e8428956034eca9526536cca30b505', '3', 'b0f68a09ece94befa9b57e24fddda136', '6', '26', '6', '6', '6');
INSERT INTO `auction_overview` VALUES ('1c6ec8fb939f45adb4685f1c75d58a6e', null, '11b173f718e947069c2413b8df8feaed', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('279b9f9447cf4df7976742d77153dd50', '2', 'b9a6d40c043d4298b2bf0cbee167b04d', '666', '6666', '6666', '6666', '6666');
INSERT INTO `auction_overview` VALUES ('27b6decd030e4d9c86a0a9fecb64ab51', '1', 'b930ca444bb14268a4908b6e8121e83f', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('309ecd2bf03d4550bbdcd8c5f5ab8166', '1', '0713e5cfbea2418cb48246234bb65860', '测试', '测试', '测试', '测试', '测试');
INSERT INTO `auction_overview` VALUES ('4f7ad29d5621409c95b37ff5cf53a51a', '1', 'ee2b9e4ba87a4310b9a2df02900f0778', '99', '66', '66', '66', '66');
INSERT INTO `auction_overview` VALUES ('4f977d014f534373a05bc49ea2b60d02', '1', 'd10ed0b734f14ed8ae2934731b164c04', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('645c5b83ab32476f9f542a1df9070636', '2', '8b657ddf01a842c0aec82da4e927cf33', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('8175d480a4ad4235b45288b300d89a1e', '1', 'eb2b8d07ff474e778cd0aba840ed6dfc', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('85fd6215d51f4ea09ecf2ad79f4793cf', '2', 'c3339c7702f04ea1b54913f763c40a99', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('9374e71655dd427c8137dbb5478bf19c', '1', '80ecd33415ae4321a816bb6f30025f4e', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('9f8fba940054427dbb7776f520c04eb1', '1', '252ff0441a7547008e3d18fb04d4fad9', '3', '3', '3', '3', '3');
INSERT INTO `auction_overview` VALUES ('a8befd98b04e4e86b6fd110fb607135c', '3', '6e9025d7d2cf40f1a3d94031bdac2679', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('b287bf7d030f4e2daae35eea35e7b08f', '2', '026e8d584a4b4ccb9f0bd4d55de86eef', '888', '8888', '888', '888', '888');
INSERT INTO `auction_overview` VALUES ('c8d947ea47a54699a2aa346314b8cc5d', '2', '4e6c342e103a46a09204e997efdfa328', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('ca8e23b4b3e1496d93b25e16458bc2dc', '1', 'a6e0d27ee44f4fcfae0871b5311f2c8b', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('e2e3209cbde2462190fec0a67408d042', '2', 'aec6e299c94c4714a066f937a28e358d', '2', '2', '2', '2', '2');
INSERT INTO `auction_overview` VALUES ('eb388fdad8444450b810e9b03362211b', '1', '19b84a3ef1894fa895e319ec573b8100', '2', '2', '2', '2', '2');
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
INSERT INTO `auction_price` VALUES ('1d97e699bc4f490da395109905c1129b', '6e9025d7d2cf40f1a3d94031bdac2679', '6', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-20 21:09:04');
INSERT INTO `auction_price` VALUES ('35b9298a967d40a29ed243e1de9d7eaf', '0713e5cfbea2418cb48246234bb65860', '3', '4629ac36f8644d06b2f4c9a44d3315b4', '2017-10-16 23:55:59');
INSERT INTO `auction_price` VALUES ('3fba407129b547d4babe164d34e7d14c', '6e9025d7d2cf40f1a3d94031bdac2679', '16', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-25 21:37:01');
INSERT INTO `auction_price` VALUES ('4044405c58044420bb45e10f81d07569', 'd19e3805f5c64ae7adccf5fc0550ca43', '10', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:25:11');
INSERT INTO `auction_price` VALUES ('65072218969146498a78560f1ba20931', '0713e5cfbea2418cb48246234bb65860', '2', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-16 23:54:23');
INSERT INTO `auction_price` VALUES ('742701cd4de744558f00e040827b0127', 'd19e3805f5c64ae7adccf5fc0550ca43', '6', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:13:18');
INSERT INTO `auction_price` VALUES ('840a239bd729455293605dcd48e5b402', '6e9025d7d2cf40f1a3d94031bdac2679', '21', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-25 22:35:14');
INSERT INTO `auction_price` VALUES ('8937bc1edd054f4eb299de33312ba883', 'b0f68a09ece94befa9b57e24fddda136', '18', '0de9dee853cd468f817d6bcf1a6856f0', '2017-09-19 22:09:35');
INSERT INTO `auction_price` VALUES ('941ead7fba844ba5a7db3231cd466aa4', '6e9025d7d2cf40f1a3d94031bdac2679', '11', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-20 21:17:26');
INSERT INTO `auction_price` VALUES ('dc2b435b163249f2911047aae3fe8202', 'd19e3805f5c64ae7adccf5fc0550ca43', '4', 'da8c252c6672450db9a4af267aa5e6ad', null);

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
-- Records of company_news
-- ----------------------------
INSERT INTO `company_news` VALUES ('23dac3659f3a4c4e8319d755758cdaab', '7', '<p>7</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:49:53', null);
INSERT INTO `company_news` VALUES ('4625777c4b104ceab7b7ffe3b0526e8a', '3', '<p>3333</p><p>3</p><p><br/></p><p><br/></p><p>3</p><p><br/></p><p>3</p><p>3</p><p>3</p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:49:23', null);
INSERT INTO `company_news` VALUES ('5a25ef89bd3a4882813395a8da6a05f6', '9', '<p>9</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:50:07', null);
INSERT INTO `company_news` VALUES ('71ee7365f6da4e7ea74942c6aacb783b', '5', '<p>5555</p><p><br/></p><p>555</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:49:42', null);
INSERT INTO `company_news` VALUES ('76eadc264df543a289f677d8215a9c57', '2', '<p><img src=\"ueditor/jsp/upload/image/20171018/1508335089506068280.png\" title=\"1508335089506068280.png\" alt=\"1488032789_484338.png\"/>hhhhhhjgfdh</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-18 22:00:06', '2017-10-18 22:00:06');
INSERT INTO `company_news` VALUES ('a45db9ffe3ac4b4e95a174a5d0f4aed0', '8', '<p>8</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:50:00', null);
INSERT INTO `company_news` VALUES ('b029d465bbd24d68920989320e499beb', '1', '<p>1<img src=\"ueditor/jsp/upload/image/20171018/1508335224682094828.jpg\" title=\"1508335224682094828.jpg\" alt=\"091404A31-0.jpg\"/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-18 22:00:27', '2017-10-18 22:00:27');
INSERT INTO `company_news` VALUES ('bcb484c0a6c24208bcb4b4f15029542d', '6', '<p>6</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:49:47', null);
INSERT INTO `company_news` VALUES ('c6632a5fcb10428db3bf7e5d1e78c789', '4', '<p>4</p><p>4</p><p>4</p><p>4</p><p>4</p><p>4</p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:49:33', null);
INSERT INTO `company_news` VALUES ('cfeabbc461254571a5035ed5bccf0e82', '关于通联支付交易系统暂停邮储银行快捷开户服务的提示', '<p>接通联支付通知，由于近期风险事件发生频繁，根据监管部门要求，邮储银行启动接口优化升级，将于 2015 年 5 月 8 日 14:00 起，暂停邮储银行快捷开户服务，已有客户的申/认购、赎回、退款等交易不受影响。</p><p>如有疑问，请登陆官方网站：www.dfham.com 或致电我司客户服务热线：4009200808。由此给您带来的不便，敬请谅解。</p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-19 20:38:39', null);
INSERT INTO `company_news` VALUES ('f1b47bed039942fc8038a28f1c734719', '10', '<p>10</p><p>10</p><p><img src=\"ueditor/jsp/upload/image/20171020/1508507769503031121.jpg\" title=\"1508507769503031121.jpg\" alt=\"091404A31-0.jpg\"/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-20 21:56:11', '2017-10-20 21:56:11');

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
INSERT INTO `dict_assets` VALUES ('18', 'auction_verify', '1', '待审核', '0');
INSERT INTO `dict_assets` VALUES ('19', 'auction_verify', '2', '已审核', '0');
INSERT INTO `dict_assets` VALUES ('2', 'auction_product_solutions', '2', '不良资产', '0');
INSERT INTO `dict_assets` VALUES ('20', 'auction_verify', '3', '退回', '0');
INSERT INTO `dict_assets` VALUES ('3', 'auction_product_solutions', '3', '非国有资产', '0');
INSERT INTO `dict_assets` VALUES ('4', 'auction_product_solutions', '4', '招商', '0');
INSERT INTO `dict_assets` VALUES ('5', 'auction_classify', '1', '股权', '0');
INSERT INTO `dict_assets` VALUES ('6', 'auction_classify', '2', '债权', '0');
INSERT INTO `dict_assets` VALUES ('7', 'auction_classify', '3', '实物', '0');
INSERT INTO `dict_assets` VALUES ('8', 'auction_ownership_amount', '1', '10万-50万', '0');
INSERT INTO `dict_assets` VALUES ('9', 'auction_ownership_amount', '2', '50万-100万', '0');

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
-- Records of manage_notice
-- ----------------------------
INSERT INTO `manage_notice` VALUES ('5af2ab1dda96437c8b911e6c5c738b58', '你所在的行业里有哪些少为人知的内幕？', '<p>当你躺在手术台上的时候，<br/>你的爱人未必希望你活下来，<br/>你的子女未必希望你活下来，<br/>你的父母未必希望你活下来，<br/>你的兄弟姐妹未必希望你活下来，<br/>你的公公婆婆岳父岳母未必希望你活下来。</p><p>但是！<br/>但是，我们作为你的主刀医生，<br/>绝对的、确定无疑的、百分百的、强烈的希望你能活下来！！</p><p><br/><br/>作者：王大锤<br/>链接：https://www.zhihu.com/question/31453231/answer/52392786<br/>来源：知乎<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-21 20:16:05', null);
INSERT INTO `manage_notice` VALUES ('6e329260d3bc405ab2718222353c8104', '关于东方红明远4号集合资产管理计划的销售公告', '<p>接通联支付通知，由于近期风险事件发生频繁，根据监管部门要求，邮储银行启动接口优化升级，将于 2015 年 5 月 8 日 14:00 起，暂停邮储银行快捷开户服务，已有客户的申/认购、赎回、退款等交易不受影响。</p><p>如有疑问，请登陆官方网站：www.dfham.com 或致电我司客户服务热线：4009200808。由此给您带来的不便，敬请谅解。</p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-19 21:29:51', null);

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

-- ----------------------------
-- Records of release_notice
-- ----------------------------
INSERT INTO `release_notice` VALUES ('59386ca792524082bc33076505bdc193', '东方红汇利债券型证券投资基金招募说明书（更新）', '<p>接通联支付通知，由于近期风险事件发生频繁，根据监管部门要求，邮储银行启动接口优化升级，将于 2015 年 5 月 8 日 14:00 起，暂停邮储银行快捷开户服务，已有客户的申/认购、赎回、退款等交易不受影响。</p><p>如有疑问，请登陆官方网站：www.dfham.com 或致电我司客户服务热线：4009200808。由此给您带来的不便，敬请谅解。</p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-19 21:30:18', null);
INSERT INTO `release_notice` VALUES ('ad641343e35342a4943a352bd8e64551', '有哪些你知道应该有点贵，但不知道居然可以这么贵的东西？', '<p>作者：匿名用户<br/>链接：https://www.zhihu.com/question/66515446/answer/247649155<br/>来源：知乎<br/>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。<br/><br/></p><p>有一年跨年一个人去了波士顿一家夜店high</p><p>结果那天晚上桃花运爆棚，几十个人送我酒喝，不知不觉喝大了晕了过去，醒来的时候，发现自己躺在了当地一家医院急症室病房里，然后他们告诉我我喝蒙了，有人打电话叫救护车把我送来了医院急症室。</p><p>然后医院的护士来了，我问他们，多少钱，他们说没事儿，账单到时候会寄给你，地址电话报一下。</p><p>我跟他们说我是从加拿大来美国玩的，地址电话都是加拿大的，他们说没关系，然后我就给了他们。然后我马上给我当地朋友打了一个电话，朋友立马赶到医院要接我，我向医院表示我朋友来了要出院，他们强烈反对，要我待到天亮他们要观察，而且医生早上还要再给我检查。</p><p>没办法，只好让朋友先回去，我自己在医院待到早上。</p><p>我问我护士，我是不是唯一一个跨年喝大了被送过来的傻x，护士白了我一眼，指着我周围说，诺这边二十几个都是像你这样喝多了被救护车送过来的，我心想，哈，美国人傻子也那么多。</p><p>中间太冷了我跟护士要求给个毛毯。结果也没人理我，我昏昏沉沉的又睡过去了。</p><p>早上医生来看了我一眼就说我可以出院了，我心想，这就算检查了？这不是坑爹么！</p><p>我爬起来一看我旁边的病人有个毛毯，联想到我哆哆嗦嗦凑合了一晚，更加想骂娘。</p><p>然后医院给了我一杯橙汁就给我打发了。</p><p>朋友已经开了车又来了一次医院接了我（结果我半路还把橙汁给吐掉了）。</p><p><strong>回去的路上我还跟我朋友讨论说，我的账单能有多高，然后我们根据各自的经验各种推测，觉得应该差不多800刀</strong>？由于我还要赶着当天下午飞机回加拿大，也没空思索太多，收拾了东西赶紧就打车去机场回加拿大了。</p><p>神奇的是，我当时喝大的时候还背着我的小挎包，结果醒来在医院的时候发现小挎包也被送过来了（感谢美国人民！），外套寄存了就没送过来，然而我回加拿大后给夜店打电话，他们表示我衣服还在他们那帮我保管着呢，神奇！于是我让我朋友去帮我取了外套再寄了过来）。</p><p><strong>高潮来了！</strong></p><p><strong>我回了加拿大1-2个月后，一直没收到邮件，早就忘记这件事儿了，结果某一天早上一开邮箱，发现了寄过来的账单，高达3000刀！！！其中医生检查费1000刀！</strong></p><p><strong>当时我就怒了，心想医生检查了个毛，也胆敢收1000刀。</strong></p><p>账单我拿回来后我往家里一摆我就忘了，过了一个月开始陆陆续续有个催债公司打电话给我催缴账单，我才想起这茬。</p><p>我问我朋友，这种情况咋办，我朋友说，别理了，你又不在美国他们能拿你咋样。</p><p>然后我问我的同事，我说我在美国喝挂了送去医院结果现在寄给我3000刀账单，咋办?</p><p>同事先一乐，说你这个idiot，我姑姑去美国受伤了送医院都给假名字假地址假电话，你咋还报真的呢（看看淳朴的加拿大人也玩这套!）。然后跟我分析，说算了算了加拿大和美国不联网。</p><p>然后我一想，不对我现在的group insurance好像有个travel insurance的选项，以前从来没留意过，要不问问他们好了。然后我打个电话去travel insurance，我说我在美国喝大了送医院，现在有个3000刀账单，你们cover吗？</p><p>保险公司说那你把我们地址和电话给医院，我们跟他们商量下这怎么解决这事。</p><p>于是下次催账电话来的时候，我就给了他们我的保险公司信息。</p><p>之后我再也没收到催账电话。</p><p>一年后我想起这茬，好奇打了个电话去问我保险公司问情况，结果保险公司告诉我，他们全部搞定了！</p><p><strong>感谢加拿大保险公司！</strong></p><p><br/></p>', 'da8c252c6672450db9a4af267aa5e6ad', '2017-10-21 20:19:51', null);

-- ----------------------------
-- Table structure for sys_activiti
-- ----------------------------
DROP TABLE IF EXISTS `sys_activiti`;
CREATE TABLE `sys_activiti` (
  `sys_activiti_id` varchar(255) NOT NULL DEFAULT '''''' COMMENT '主键',
  `sys_activiti_pid` varchar(255) DEFAULT 'NULL' COMMENT '父主键',
  `sys_activiti_name` varchar(50) DEFAULT 'NULL' COMMENT '名称',
  `sys_activiti_task_key` varchar(255) DEFAULT 'NULL' COMMENT '流程id/节点id',
  `sys_activiti_task_name` varchar(50) DEFAULT 'NULL' COMMENT '流程名称/节点名称',
  PRIMARY KEY (`sys_activiti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_activiti
-- ----------------------------
INSERT INTO `sys_activiti` VALUES ('25ec957398e64e138c968804f3c45246', 'root', '请假流程', 'SysLeave', 'SysLeave');
INSERT INTO `sys_activiti` VALUES ('2ec0bc9be8d442c999054024e0954f39', '25ec957398e64e138c968804f3c45246', '经济人审批', 'SysLeave_usertask2', '经济人审批');
INSERT INTO `sys_activiti` VALUES ('a1a5bae83b734816ae223ef75bb32848', '25ec957398e64e138c968804f3c45246', '提交申请', 'SysLeave_usertask1', '提交申请');
INSERT INTO `sys_activiti` VALUES ('da776ffe989a44f5b0a3af9d5983d0aa', '25ec957398e64e138c968804f3c45246', '老总审批', 'SysLeave_usertask3', '老总审批');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `sys_area_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_area_pid` varchar(255) DEFAULT 'NULL' COMMENT '父主键',
  `sys_area_name` varchar(255) DEFAULT 'NULL' COMMENT '地址名称',
  PRIMARY KEY (`sys_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户所在地表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------

-- ----------------------------
-- Table structure for sys_buy
-- ----------------------------
DROP TABLE IF EXISTS `sys_buy`;
CREATE TABLE `sys_buy` (
  `sys_buy_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '购买主键',
  `sys_user_id` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '购买人',
  `sys_goods_id` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '购买商品',
  `sys_buy_price` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '购买价格',
  `sys_buy_count` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '购买数量',
  `sys_buy_time` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '购买时间',
  `sys_buy_succ_d` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '成功状态:0_不成功,1_成功',
  `sys_buy_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_buy_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_buy_createuid` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '创建人id',
  `sys_buy_updateuid` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '修改人id',
  PRIMARY KEY (`sys_buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='购买管理';

-- ----------------------------
-- Records of sys_buy
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `sys_dict_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_dict_pid` varchar(255) DEFAULT 'NULL' COMMENT '父主键',
  `sys_dict_name` varchar(255) DEFAULT 'NULL' COMMENT '数据名称',
  `sys_dict_value` varchar(255) DEFAULT 'NULL' COMMENT 'value值',
  `sys_dict_seq` int(4) DEFAULT NULL COMMENT '排序',
  `sys_dict_active` varchar(255) DEFAULT 'NULL' COMMENT '有效性',
  `sys_dict_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_dict_updatedate` datetime DEFAULT NULL COMMENT '修改时间',
  `sys_dict_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_dict_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC COMMENT='系统数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('04dba99e3d784e878b5e7a2ec2262a96', '6243f1eafd9a4d2093e8a3265714efab', '用户状态', 'sys_user_status_d', '0', '0', '2017-04-21 18:39:14', '2017-04-21 18:39:14', null, null);
INSERT INTO `sys_dict` VALUES ('0b34577203734a9b94ea5dade26879ca', '04dba99e3d784e878b5e7a2ec2262a96', '审核通过', '1', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:42:49', null, null);
INSERT INTO `sys_dict` VALUES ('29e1ec45542b4082af0aa16a1142a9c1', '431cf88631ca47dda0e1ddd4d514f5af', '用户标记', 'flag_c', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('318c95adf813498a8fa6c5066ef4ea54', '6c7e136007c54ddc83a567e10f370b36', '通过', '1', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('37b73a43f23a42edb6bef45a96628217', 'c3867713ee74484da5e13675002ed2f2', '普通用户', '1', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:41:47', null, null);
INSERT INTO `sys_dict` VALUES ('3bc4cc6596a04fe0a2cc1fa2ccd485bf', 'root', 'sys_buy', 'sys_buy', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);
INSERT INTO `sys_dict` VALUES ('3c1c9c7485d846d8aac093eb443549aa', 'c562eaea0c374397b54db80381712a3e', '男', '1', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('3c596d0f45224160b0319f21ac0cf7d5', '6810e697189d498983d5f1e391363ea1', '金融国资', '1', '0', '0', '2017-09-15 20:47:26', '2017-09-15 00:00:00', '880d185f11794395a9439705eab558e0', 'NULL');
INSERT INTO `sys_dict` VALUES ('431cf88631ca47dda0e1ddd4d514f5af', 'root', '共用', 'common', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('4444d2b4a8db49f2bf69f49eaafd96f9', '6810e697189d498983d5f1e391363ea1', '招商', '4', '0', '0', '2017-09-15 20:48:43', '2017-09-15 00:00:00', '880d185f11794395a9439705eab558e0', 'NULL');
INSERT INTO `sys_dict` VALUES ('447e4cf2d57b4d059d7b2205f2cd2d2c', '6810e697189d498983d5f1e391363ea1', '不良资产', '2', '0', '0', '2017-09-15 20:47:49', '2017-09-15 00:00:00', '880d185f11794395a9439705eab558e0', 'NULL');
INSERT INTO `sys_dict` VALUES ('5659c944954540cebaf099843acf5d1a', 'd809b08967234ea18b9c5dd233efccb8', '成功', '1', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);
INSERT INTO `sys_dict` VALUES ('57f2343bb1714badbd379200de170abd', 'c562eaea0c374397b54db80381712a3e', '女', '2', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('6243f1eafd9a4d2093e8a3265714efab', 'root', 'sys_user', 'sys_user', '0', '0', '2017-04-21 18:39:14', '2017-04-21 18:39:14', null, null);
INSERT INTO `sys_dict` VALUES ('6810e697189d498983d5f1e391363ea1', 'root', 'auction_assets', 'auction_assets', '0', '0', '2017-09-15 20:46:52', '2017-09-15 23:19:56', '880d185f11794395a9439705eab558e0', '880d185f11794395a9439705eab558e0');
INSERT INTO `sys_dict` VALUES ('6c7e136007c54ddc83a567e10f370b36', '915e0c030de04bf08e5bc6761a7c8c2d', '资产审核', 'sys_goods_audit_d', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('880d185f11794395a9439705eab558e0', '04dba99e3d784e878b5e7a2ec2262a96', '待审核', '0', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:43:01', null, null);
INSERT INTO `sys_dict` VALUES ('8901dac3d4f047259869010aa8e4c1bc', '29e1ec45542b4082af0aa16a1142a9c1', '注册用户', '1', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('915e0c030de04bf08e5bc6761a7c8c2d', 'root', 'sys_goods', 'sys_goods', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('a09bb601ea5e445e88b883b1d5c03680', '915e0c030de04bf08e5bc6761a7c8c2d', '产品类型', 'sys_goods_type_d', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('a21d1190c70545c6a8fe63916c72b0d4', 'root', 'sys_role', 'sys_role', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('a52bc1e447e640a9a7a8ece5b675eab0', '6c7e136007c54ddc83a567e10f370b36', '不通过', '2', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('a55c6e261e774082bbd5521130c5c1e6', 'c3867713ee74484da5e13675002ed2f2', '加盟方', '2', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:41:55', null, null);
INSERT INTO `sys_dict` VALUES ('a6a5b5dffe754fd5901698bf10cf2f15', '29e1ec45542b4082af0aa16a1142a9c1', '双身份', '2', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('a77fda4f171f45f1b089f0dd18221e22', 'c3867713ee74484da5e13675002ed2f2', '企业发布方', '0', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:42:23', null, null);
INSERT INTO `sys_dict` VALUES ('ac2995fcb30942a1a3a459b03f030649', '29e1ec45542b4082af0aa16a1142a9c1', '系统用户', '0', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('c3867713ee74484da5e13675002ed2f2', '6243f1eafd9a4d2093e8a3265714efab', '用户来源', 'sys_user_reg_type_d', '0', '0', '2017-04-21 18:39:14', '2017-04-21 18:39:14', null, null);
INSERT INTO `sys_dict` VALUES ('c562eaea0c374397b54db80381712a3e', '431cf88631ca47dda0e1ddd4d514f5af', '性别', 'sex_c', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('cc9770cee62c4b8fa4fd4539e2e8a1fb', 'a21d1190c70545c6a8fe63916c72b0d4', '测试', 'sys_role_test_d', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('d809b08967234ea18b9c5dd233efccb8', '3bc4cc6596a04fe0a2cc1fa2ccd485bf', '成功状态', 'sys_buy_succ_d', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);
INSERT INTO `sys_dict` VALUES ('d8f8be8e778a477c93ae2fd272f7932b', 'a09bb601ea5e445e88b883b1d5c03680', '不良资产', '2', '0', '0', '2017-09-09 00:59:31', '2017-09-15 20:08:31', null, '880d185f11794395a9439705eab558e0');
INSERT INTO `sys_dict` VALUES ('e481ad7d632b48b1b964263c3238038a', 'cc9770cee62c4b8fa4fd4539e2e8a1fb', 'test0', '0', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('f79b8c259c534491afd37e84c370f8b6', '6810e697189d498983d5f1e391363ea1', '非国有资产', '3', '0', '0', '2017-09-15 20:48:13', '2017-09-15 00:00:00', '880d185f11794395a9439705eab558e0', 'NULL');
INSERT INTO `sys_dict` VALUES ('f93f88d8c8c94d9a9ec4b79300b074ba', 'cc9770cee62c4b8fa4fd4539e2e8a1fb', 'test1', '1', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('fdede2f6d5d34dcc9ab6a13345ef206c', 'd809b08967234ea18b9c5dd233efccb8', '不成功', '0', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `sys_file_id` varchar(255) NOT NULL COMMENT ' 主键',
  `sys_file_name` varchar(50) DEFAULT 'NULL' COMMENT '文件名',
  `sys_file_addr` varchar(255) DEFAULT 'NULL' COMMENT '文件地址',
  `sys_file_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_file_createdate` varchar(255) DEFAULT 'NULL' COMMENT '创建时间',
  `sys_file_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '修改人',
  `sys_file_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  PRIMARY KEY (`sys_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC COMMENT='系统文件';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('70d7ec363ef044ed8ff814566ab974c4', '招聘帐号.txt', 'E:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/adminltemy/sysfile/招聘帐号.txt', '2017-05-02 10:27:46', '2017-05-02 10:27:46', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad');

-- ----------------------------
-- Table structure for sys_goods
-- ----------------------------
DROP TABLE IF EXISTS `sys_goods`;
CREATE TABLE `sys_goods` (
  `sys_goods_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '商品编号',
  `sys_goods_name` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '商品名称',
  `sys_goods_description` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '商品描述',
  `sys_goods_price` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '起始价',
  `sys_goods_imagepath` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '图片路径',
  `sys_goods_amount` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '数量',
  `sys_goods_stime` datetime DEFAULT NULL COMMENT '开始时间',
  `sys_goods_etime` datetime DEFAULT NULL COMMENT '结束时间',
  `sys_goods_type_d` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '产品类型:1_金融,2_国资',
  `sys_goods_addr` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '商品地址',
  `sys_user_id` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '拍卖者id',
  `sys_goods_audit_d` varchar(255) COLLATE utf8_bin DEFAULT '''2''' COMMENT '资产审核:1_通过,2_不通过',
  `sys_goods_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_goods_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_goods_createuid` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '创建人id',
  `sys_goods_updateuid` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '修改人id',
  PRIMARY KEY (`sys_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='商品信息表';

-- ----------------------------
-- Records of sys_goods
-- ----------------------------
INSERT INTO `sys_goods` VALUES ('4abc8eb9a11a4b269a87d6318915f0a7', '1', 'e', 'e', 'e', 'e', '2017-09-04 00:00:00', '2017-09-05 00:00:00', null, null, null, '2', '2017-09-09 01:15:54', '2017-09-09 01:16:05', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad');

-- ----------------------------
-- Table structure for sys_leave
-- ----------------------------
DROP TABLE IF EXISTS `sys_leave`;
CREATE TABLE `sys_leave` (
  `sys_leave_id` varchar(64) NOT NULL COMMENT '主键',
  `sys_user_id` varchar(64) DEFAULT 'NULL' COMMENT '请假人主键',
  `sys_leave_reason` varchar(255) DEFAULT 'NULL' COMMENT '请假原因',
  `sys_leave_comment` varchar(255) DEFAULT 'NULL' COMMENT '请假备注',
  `sys_leave_status` varchar(255) DEFAULT 'NULL' COMMENT '请假状态',
  `sys_leave_time` datetime DEFAULT NULL COMMENT '申请时间',
  `sys_leave_begin_time` datetime DEFAULT NULL COMMENT '请假开始时间',
  `sys_leave_end_time` datetime DEFAULT NULL COMMENT '请假结束时间',
  PRIMARY KEY (`sys_leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC COMMENT='请假';

-- ----------------------------
-- Records of sys_leave
-- ----------------------------
INSERT INTO `sys_leave` VALUES ('a546e140a7354e8c9e0d5b8df53d42c2', 'da8c252c6672450db9a4af267aa5e6ad', '1', '1', '1', '2016-10-11 00:00:00', '2016-10-11 00:00:00', '2016-10-06 00:00:00');
INSERT INTO `sys_leave` VALUES ('b647917b19764e89ac04305c56df6dcd', 'a3e6fea5c0cb4efabf1cfd9f0c93fe28', '1', '1', '1', '2016-10-04 00:00:00', '2016-10-04 00:00:00', '2016-10-12 00:00:00');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `sys_menu_id` varchar(32) NOT NULL COMMENT '主键',
  `sys_menu_pid` varchar(32) DEFAULT 'NULL' COMMENT '父主键',
  `sys_menu_name` varchar(50) DEFAULT 'NULL' COMMENT '菜单名称',
  `sys_menu_url` varchar(500) DEFAULT 'NULL' COMMENT '菜单地址',
  `sys_menu_order` varchar(2) DEFAULT NULL COMMENT '菜单排号',
  `sys_menu_icon_url` varchar(50) DEFAULT 'NULL' COMMENT '菜单图标地址',
  PRIMARY KEY (`sys_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=780 ROW_FORMAT=DYNAMIC COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('06015fb13ca344a7b5519819fd129124', '2b1753b058f1433a8defe794013ecfc8', '处置方公告', 'manage/notice/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('0ccd416d257246d79231d7db876a9075', 'root', '系统管理', '', '', '');
INSERT INTO `sys_menu` VALUES ('19d9e0d3ecff4e339de7d910b6227c67', '0ccd416d257246d79231d7db876a9075', '角色配置', 'sys/role/treerolemenupermconf', '', '');
INSERT INTO `sys_menu` VALUES ('220941abb91b457889ac3f9865a1240f', '2b1753b058f1433a8defe794013ecfc8', '发布方公告', 'release/notice/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('26dc8309b2f8414b924b6166d821a637', 'e72d1f637ac940aebbe2a36e0b2e0a88', '资产查询', 'sys/goods/list', null, null);
INSERT INTO `sys_menu` VALUES ('2b1753b058f1433a8defe794013ecfc8', 'root', '网站信息', 'NULL', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('31a453c233c8447fa39759b8abefc905', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('41ab04a45d1847a4aa50235f57a87de1', '0ccd416d257246d79231d7db876a9075', '用户管理', 'sys/user/list', '', '');
INSERT INTO `sys_menu` VALUES ('4956bfb16ac14cb4856abe4a4ebc449d', 'fdf99edaa39148b7a894881a0a5d1c6f', '请假办理', 'sys/task/list?processKey=SysLeave', '', '');
INSERT INTO `sys_menu` VALUES ('4b9c7c37534b481684755e02aaa40fd7', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('512faabc2b0141adacbef614220cf7e0', '0ccd416d257246d79231d7db876a9075', '数据字典', 'sys/dict/tree', null, null);
INSERT INTO `sys_menu` VALUES ('53a3fbe9d0384791b1f9d243487a4922', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('6e4e2a5ccee04c85a991b75a7c14f8dd', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('7cf4df6cb8664d2db99f4bbab5aea44b', '9e5fb647769b4162b6ba80ad19433741', '角色配置', 'sys/role/treeroleactiviticonf', '', '');
INSERT INTO `sys_menu` VALUES ('817e76595b5241d386c4a66f0122d599', 'root', '用户管理', null, null, null);
INSERT INTO `sys_menu` VALUES ('9e5fb647769b4162b6ba80ad19433741', 'root', '流程管理', '', '', '');
INSERT INTO `sys_menu` VALUES ('a459e2be2f8d41a4b9bd0f5b4d441708', '2b1753b058f1433a8defe794013ecfc8', '公司动态', 'company/news/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('b409189f42654fd6a06a7a068113d565', '0ccd416d257246d79231d7db876a9075', '系统文件管理', 'sys/file/list', null, null);
INSERT INTO `sys_menu` VALUES ('b5a632a7a466441294ca53f93571623c', 'd89d4708bdd7406da6f684e4a8d21f2a', '购买记录', 'sys/buy/list', null, null);
INSERT INTO `sys_menu` VALUES ('b5ec76178e1b4553947e879dae19461f', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('ca0481f406074859a9de0cfafe092221', '0ccd416d257246d79231d7db876a9075', '权限管理', 'sys/perm/tree', '', '');
INSERT INTO `sys_menu` VALUES ('cbab83a6a81345e4852f3c5e1682a784', '2b1753b058f1433a8defe794013ecfc8', '走进鑫淼聚', 'about/us/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('ce4a476e9b54400aa1e4da83e6055331', '9e5fb647769b4162b6ba80ad19433741', '流程部署', 'sys/deploy/list', '', '');
INSERT INTO `sys_menu` VALUES ('d005b1898de74061b5fbde648e54dfec', '9e5fb647769b4162b6ba80ad19433741', '节点管理', 'sys/activiti/tree', '', '');
INSERT INTO `sys_menu` VALUES ('d34613d0db6142bda9a675eb7fc9d8e5', '9e5fb647769b4162b6ba80ad19433741', '流程定义', 'sys/procdef/list', '', '');
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
INSERT INTO `sys_menu` VALUES ('fdf99edaa39148b7a894881a0a5d1c6f', 'root', '业务管理', '', '', '');

-- ----------------------------
-- Table structure for sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm`;
CREATE TABLE `sys_perm` (
  `sys_perm_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_perm_pid` varchar(255) DEFAULT 'NULL' COMMENT '父主键',
  `sys_perm_name` varchar(255) DEFAULT 'NULL' COMMENT '权限名称',
  `sys_perm_flag` varchar(255) DEFAULT 'NULL' COMMENT '权限标识',
  `sys_perm_url` varchar(255) DEFAULT 'NULL' COMMENT '权限地址',
  `sys_perm_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_perm_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_perm_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_perm_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 ROW_FORMAT=DYNAMIC COMMENT='系统权限表';

-- ----------------------------
-- Records of sys_perm
-- ----------------------------
INSERT INTO `sys_perm` VALUES ('01af93d9fb2c4e77a3cfab9888cced5b', '1e77eaad20c74e1c9898dede322a9a12', '删除树节点', 'perms[sysRole:deltree]', '/sys/role/deltree', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('03cab5e4e7f5414a9ff91b65485e4468', '1e77eaad20c74e1c9898dede322a9a12', '批量删除', 'perms[sysRole:delall]', '/sys/role/delall', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('046548c1df5e4b868b0961fcae0bef18', '1e77eaad20c74e1c9898dede322a9a12', '保存页面', 'perms[sysRole:goadd]', '/sys/role/goadd', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('061ac5000c5547878fe946094c5342a3', '2e3ef8186ff44080897aaa07cbd48adf', '删除', 'perms[sysBuy:del]', '/sys/buy/del', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('07dbe4e39db548df9e53aa1e4e50e737', '14a4ed27e5fb433599a50157b66be691', '树页面', 'perms[sysGoods:tree]', '/sys/buy/tree', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('0d736d08c24e40b6b7a8022197318057', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '增加页面', 'perms[sysFile:goadd]', '/sys/file/goadd', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('0eae92d5888548b699f3d05a47b6ab1c', '2e3ef8186ff44080897aaa07cbd48adf', '修改页面', 'perms[sysBuy:goedit]', '/sys/buy/goedit', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('113bcf7431f4470c8e7535afc0aff581', '2e3ef8186ff44080897aaa07cbd48adf', '页面', 'perms[sysBuy:pages]', '/pages/sys/buy/**', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('1218e874069144a687aab44cebc234eb', '4dcca247b7134c3ab3156e2dea30860f', '保存', 'perms[sysPerm:save]', '/sys/perm/save', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('12c69d4925c34d399be31fce3037be9a', '14a4ed27e5fb433599a50157b66be691', '删除树节点', 'perms[sysGoods:deltree]', '/sys/buy/deltree', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('14a4ed27e5fb433599a50157b66be691', 'root', '用户管理', 'perms[sysGoods:all]', '/sys/buy/**', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('1528901f1409476ea0b2d3498b9c013a', '6b53d41674374feb9c9fe122c386e62b', '树页面', 'perms[sysDict:tree]', '/sys/dict/tree', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('18226bf4b23d427c9362f6e893407714', 'eeceec9f880d4f7eaa7d255655a1a25a', '修改页面', 'perms[sysMenu:goedit]', '/sys/menu/goedit', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('1ae99746820d4c2882e5cd472d9b52f7', '6b53d41674374feb9c9fe122c386e62b', '页面', 'perms[sysDict:pages]', '/pages/sys/dict/**', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('1c8165c0f4d146acbc381cd1395a5d9f', '4dcca247b7134c3ab3156e2dea30860f', '树页面', 'perms[sysPerm:tree]', '/sys/perm/tree', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('1d1877472cce40adac038782694a9519', 'root', '公司动态', 'perms[company:all]', 'company/news/**', null, null, 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('1e77eaad20c74e1c9898dede322a9a12', 'root', '角色管理', 'perms[sysRole:all]', '/sys/role/**', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('1f98b20cca794e92a3a349409518ad25', 'root', '用户管理', 'perms[sysDict:all]', '/sys/file/**', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('217c32ca9b974fafa2c8963e4d7d302b', '1e77eaad20c74e1c9898dede322a9a12', '保存树', 'perms[sysRole:savetree]', '/sys/role/savetree', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('2187824e583d49ffbc80c19b55eba26a', '1e77eaad20c74e1c9898dede322a9a12', '树页面', 'perms[sysRole:tree]', '/sys/role/tree', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('2700adcfcece44fea01c7770feac2b81', '4f4ed019e53b4cd3a5f1c74531197a41', '修改页面', 'perms[sysUser:goedit]', '/sys/user/goedit', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('270663f30c8f4b41aeb41b169ff3b783', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '上传', 'perms[sysFile:upload]', '/sys/file/upload', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('288357c2378a4c6082f01d7aeaa4eaac', '4f4ed019e53b4cd3a5f1c74531197a41', '增加', 'perms[sysUser:save]', '/sys/user/save', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('28ebbfdcc4e74a4d9c01e25d99b8b897', '1e77eaad20c74e1c9898dede322a9a12', '修改页面', 'perms[sysRole:goedit]', '/sys/role/goedit', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', 'root', '用户管理', 'perms[sysFile:all]', '/sys/file/**', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('2e3ef8186ff44080897aaa07cbd48adf', 'root', '购买管理', 'perms[sysBuy:all]', '/sys/buy/**', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('3399210f4cce4461b5c27c5dceb525b4', 'f153ad366c0c44ce8ab2b66d8a7575b8', '增加页面', 'perms[sysDict:goadd]', '/sys/file/goadd', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('38486d00b1d24e4caf7cb845af9c4824', '6b53d41674374feb9c9fe122c386e62b', '修改页面', 'perms[sysDict:goedit]', '/sys/dict/goedit', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('3950eb3e1352457f9d03767b15d5b08e', 'root', '请假办理', 'perms[sysTask:all]', '/sys/task/**', null, null, null, null);
INSERT INTO `sys_perm` VALUES ('3a49e7a494ab40339d8623abddc226ad', '2e3ef8186ff44080897aaa07cbd48adf', '增加页面', 'perms[sysBuy:goadd]', '/sys/buy/goadd', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('3aa00316db7a48bb908621923d8e0bb7', 'eeceec9f880d4f7eaa7d255655a1a25a', '修改', 'perms[sysMenu:edit]', '/sys/menu/edit', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('3bb3f4e8af914b03a0289b835ce319db', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '修改页面', 'perms[sysFile:goedit]', '/sys/file/goedit', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('3e1440f0a35144e688d9d07c7464038a', '14a4ed27e5fb433599a50157b66be691', '保存页面', 'perms[sysGoods:goadd]', '/sys/buy/goadd', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('43a254960d7c484b8e104ae335eaa3b6', 'eeceec9f880d4f7eaa7d255655a1a25a', '查询树节点', 'perms[sysMenu:treenode]', '/sys/menu/treenode', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('43a5e346fb9b49ab8f482a3c9895ef37', 'root', '请假管理', 'perms[sysLeave:all]', '/sys/leave/**', null, null, null, null);
INSERT INTO `sys_perm` VALUES ('447f1687559b47088aaf0eddcbba9ac2', 'f153ad366c0c44ce8ab2b66d8a7575b8', '列表', 'perms[sysDict:list]', '/sys/file/list', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('4a0ca82beafe41089452c742be284004', '4f4ed019e53b4cd3a5f1c74531197a41', '树列表', 'perms[sysUser:listtree]', '/sys/user/listtree', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('4ba7260f93c04271ac3fa4a01e08207d', '4dcca247b7134c3ab3156e2dea30860f', '查询所有树节点', 'perms[sysPerm:treenodeall]', '/sys/perm/treenodeall', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('4c53bf8b728c4c69b4ee06429b655384', '4f4ed019e53b4cd3a5f1c74531197a41', '上传', 'perms[sysUser:upload]', '/sys/user/upload', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('4dcca247b7134c3ab3156e2dea30860f', 'root', '权限管理', 'perms[sysPerm:all]', '/sys/perm/**', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('4f4ed019e53b4cd3a5f1c74531197a41', 'root', '用户管理', 'perms[sysUser:all]', '/sys/user/**', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('58b17be87b7c44f3851b9552f923f1e0', '4dcca247b7134c3ab3156e2dea30860f', '删除', 'perms[sysPerm:del]', '/sys/perm/del', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('5b62d85911164dff805caafc67a86b46', '14a4ed27e5fb433599a50157b66be691', '页面', 'perms[sysGoods:pages]', '/pages/sys/buy/**', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('5df72d7a06914cd2a379bbe94d0d1647', '2e3ef8186ff44080897aaa07cbd48adf', '上传', 'perms[sysBuy:upload]', '/sys/buy/upload', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('674467a60c0648afaf8d8fe1c1c49a3d', '4dcca247b7134c3ab3156e2dea30860f', '修改页面', 'perms[sysPerm:goedit]', '/sys/perm/goedit', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('67b2a0a8603b4211ab80ae1ca4985993', '14a4ed27e5fb433599a50157b66be691', '保存', 'perms[sysGoods:save]', '/sys/buy/save', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('68458da2f2da4de88b8973f5fc228a73', 'eeceec9f880d4f7eaa7d255655a1a25a', '页面', 'perms[sysMenu:pages]', '/pages/sys/menu/**', '2017-04-18 17:10:26', '2017-04-18 17:10:26', null, null);
INSERT INTO `sys_perm` VALUES ('69ad388c742b4ae6ae1ff3998401b1e5', '1e77eaad20c74e1c9898dede322a9a12', '修改', 'perms[sysRole:edit]', '/sys/role/edit', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('6abd65e456414c53acd905023b3eaf8e', '4f4ed019e53b4cd3a5f1c74531197a41', '删除', 'perms[sysUser:del]', '/sys/user/del', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('6b36f930884041fc90922941d582a900', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '页面', 'perms[sysFile:pages]', '/pages/sys/file/**', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('6b53d41674374feb9c9fe122c386e62b', 'root', '字典管理', 'perms[sysDict:all]', '/sys/dict/**', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('77ae10cf02314b809325648c49cac4fc', '2e3ef8186ff44080897aaa07cbd48adf', '增加', 'perms[sysBuy:save]', '/sys/buy/save', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('780df5bf5b26488e856856b0c3b874ba', '1e77eaad20c74e1c9898dede322a9a12', '查询树节点', 'perms[sysRole:treenode]', '/sys/role/treenode', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('79fab9d83792482d82f173014f37eb29', '14a4ed27e5fb433599a50157b66be691', '查询树节点', 'perms[sysGoods:treenode]', '/sys/buy/treenode', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('7b310ca13c224883b5501e062fd2533e', 'f153ad366c0c44ce8ab2b66d8a7575b8', '增加', 'perms[sysDict:save]', '/sys/file/save', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('8221aa26b4cf4f0a8d933a423e1dc77e', 'eeceec9f880d4f7eaa7d255655a1a25a', '删除', 'perms[sysMenu:del]', '/sys/menu/del', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('86cae2a4e1764204aa2bbf8bd002ea9f', '14a4ed27e5fb433599a50157b66be691', '保存树', 'perms[sysGoods:savetree]', '/sys/buy/savetree', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('891b5add919f4275b9970ddca0d8804d', 'eeceec9f880d4f7eaa7d255655a1a25a', '树页面', 'perms[sysMenu:tree]', '/sys/menu/tree', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('89c824a34c314585b038b4ce79054e2d', '14a4ed27e5fb433599a50157b66be691', '修改', 'perms[sysGoods:edit]', '/sys/buy/edit', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('8cc234c931174c25968e96248b7fb8fa', '14a4ed27e5fb433599a50157b66be691', '修改页面', 'perms[sysGoods:goedit]', '/sys/buy/goedit', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('8d4a10775fff4ee183295a3d680482e4', '4f4ed019e53b4cd3a5f1c74531197a41', '增加页面', 'perms[sysUser:goadd]', '/sys/user/goadd', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('9066a4192864435b9d19e7278cb967e0', '1f98b20cca794e92a3a349409518ad25', '上传', 'perms[sysDict:download]', '/sys/file/upload', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('918a6331377248218bf8593be510b7b4', 'eeceec9f880d4f7eaa7d255655a1a25a', '保存', 'perms[sysMenu:save]', '/sys/menu/save', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('9231a4419ae14fa89559cbe2302f8aef', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '删除', 'perms[sysFile:del]', '/sys/file/del', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('923d97f34a9748f58044ab838b6fa3fc', '1f98b20cca794e92a3a349409518ad25', '列表', 'perms[sysDict:list]', '/sys/file/list', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('93862e931848401f9097d3f77be7e815', '4dcca247b7134c3ab3156e2dea30860f', '修改', 'perms[sysPerm:edit]', '/sys/perm/edit', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('944fe9ec8b2f4aea93db91b3a566d97f', '14a4ed27e5fb433599a50157b66be691', '查询所有树节点', 'perms[sysGoods:treenodeall]', '/sys/buy/treenodeall', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('967ac38941e244cd9e7298f5a57e2666', '2e3ef8186ff44080897aaa07cbd48adf', '树列表', 'perms[sysBuy:listtree]', '/sys/buy/listtree', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('96d1520a4058430a8072f620c0fecaf8', '1f98b20cca794e92a3a349409518ad25', '树列表', 'perms[sysDict:listtree]', '/sys/file/listtree', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('9a2d64aae4a342209ca619520123c736', '1f98b20cca794e92a3a349409518ad25', '增加', 'perms[sysDict:save]', '/sys/file/save', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('9ec8ea8de44c420eb95bf5a68fd1e875', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '修改', 'perms[sysFile:edit]', '/sys/file/edit', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('9ef5634c9f6149f88999456fb77648a9', '2e3ef8186ff44080897aaa07cbd48adf', '列表', 'perms[sysBuy:list]', '/sys/buy/list', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('9f35fdfa00e441ecb343adca7d7b0807', '1f98b20cca794e92a3a349409518ad25', '修改', 'perms[sysDict:edit]', '/sys/file/edit', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('a4beee06a7c04b8fa392c7f970d7daf2', '6b53d41674374feb9c9fe122c386e62b', '保存', 'perms[sysDict:save]', '/sys/dict/save', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('a58c3c0beb824c2ab2a31ead03ac35e8', 'f153ad366c0c44ce8ab2b66d8a7575b8', '删除', 'perms[sysDict:del]', '/sys/file/del', '2017-05-02 09:59:35', '2017-05-02 09:59:35', null, null);
INSERT INTO `sys_perm` VALUES ('aa71bbec77f3467bbbbb31b4cb71084f', '1f98b20cca794e92a3a349409518ad25', '删除', 'perms[sysDict:del]', '/sys/file/del', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('aa792c41a66f468eae5b3762fcfbf497', '6b53d41674374feb9c9fe122c386e62b', '保存树', 'perms[sysDict:savetree]', '/sys/dict/savetree', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('acb51fadc0704c29a2eddcd500f94ab7', '1e77eaad20c74e1c9898dede322a9a12', '页面', 'perms[sysRole:pages]', '/pages/sys/role/**', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('acda55caa6d1499bac552a79bfb41132', 'f153ad366c0c44ce8ab2b66d8a7575b8', '上传', 'perms[sysDict:download]', '/sys/file/upload', '2017-05-02 09:59:35', '2017-05-02 09:59:35', null, null);
INSERT INTO `sys_perm` VALUES ('b432a46371b5407a8d9392cd62d189ae', '2e3ef8186ff44080897aaa07cbd48adf', '批量删除', 'perms[sysBuy:delall]', '/sys/buy/delall', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('b5ecaa670f7b4f07b8bb96f01c8d9ba9', '43a5e346fb9b49ab8f482a3c9895ef37', '页面', 'perms[sysLeave:pages]', '/pages/sys/leave/**', null, null, null, null);
INSERT INTO `sys_perm` VALUES ('b8eb75c05449498b8b4a3069efa52daa', '3950eb3e1352457f9d03767b15d5b08e', '页面', 'perms[sysTask:pages]', '/pages/sys/task/**', null, null, null, null);
INSERT INTO `sys_perm` VALUES ('ba70f014dc6b4f4cb717d2d178bbdab5', '4dcca247b7134c3ab3156e2dea30860f', '批量删除', 'perms[sysPerm:delall]', '/sys/perm/delall', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('bad082c4ca2d47c488f8ef52eadc03db', 'f153ad366c0c44ce8ab2b66d8a7575b8', '页面', 'perms[sysDict:pages]', '/pages/sys/file/**', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('bd427a4fd2c64c1cbb8c0fe544043595', 'eeceec9f880d4f7eaa7d255655a1a25a', '保存树', 'perms[sysMenu:savetree]', '/sys/menu/savetree', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('c165d75d64974443a32143fee40f6f52', '6b53d41674374feb9c9fe122c386e62b', '查询树节点', 'perms[sysDict:treenode]', '/sys/dict/treenode', '2017-04-20 17:38:04', '2017-04-20 17:38:04', null, null);
INSERT INTO `sys_perm` VALUES ('c54024bc903d4ff0b7ccacc22ca16ac3', '1f98b20cca794e92a3a349409518ad25', '修改页面', 'perms[sysDict:goedit]', '/sys/file/goedit', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('c57bfedacb0d4bb2b6cfbb00ea8715ad', 'f153ad366c0c44ce8ab2b66d8a7575b8', '树列表', 'perms[sysDict:listtree]', '/sys/file/listtree', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('c6b73381847c4728a34089fcc7455c13', '4f4ed019e53b4cd3a5f1c74531197a41', '页面', 'perms[sysUser:pages]', '/pages/sys/user/**', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('c6c828011580454e908e5bcb87416b98', '6b53d41674374feb9c9fe122c386e62b', '修改', 'perms[sysDict:edit]', '/sys/dict/edit', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('c6c8dd53a62d41ca8fcfea1d1c0411b9', '1f98b20cca794e92a3a349409518ad25', '上传', 'perms[sysDict:upload]', '/sys/file/upload', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('c82385e9cd4644cb9c5393c280a85d2d', '1e77eaad20c74e1c9898dede322a9a12', '保存', 'perms[sysRole:save]', '/sys/role/save', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('c89bc39427bb46daa90613b5222c7b1e', 'eeceec9f880d4f7eaa7d255655a1a25a', '查询所有树节点', 'perms[sysMenu:treenodeall]', '/sys/menu/treenodeall', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('c9449f278c384dbbacd352affb2cb260', '6b53d41674374feb9c9fe122c386e62b', '删除', 'perms[sysDict:del]', '/sys/dict/del', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('ca19903291e7419ba7a7c4da5e2d9a86', '4dcca247b7134c3ab3156e2dea30860f', '页面', 'perms[sysPerm:pages]', '/pages/sys/perm/**', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('cc0fb413134649dca752d3eb36c66a47', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '树列表', 'perms[sysFile:listtree]', '/sys/file/listtree', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('cc2714fde9fa4fd4967cfb6e006b2777', '4f4ed019e53b4cd3a5f1c74531197a41', '批量删除', 'perms[sysUser:delall]', '/sys/user/delall', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('cd46b5a26bfb4382818e354a14f61b18', '1f98b20cca794e92a3a349409518ad25', '增加页面', 'perms[sysDict:goadd]', '/sys/file/goadd', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('cec77113b4574977b0425d848a5d4d2f', '4f4ed019e53b4cd3a5f1c74531197a41', '修改', 'perms[sysUser:edit]', '/sys/user/edit', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('d17331a9447e4f58b753707c6179cb27', '4dcca247b7134c3ab3156e2dea30860f', '保存树', 'perms[sysPerm:savetree]', '/sys/perm/savetree', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('d1948195d8784fb68361c365565147ce', 'f153ad366c0c44ce8ab2b66d8a7575b8', '批量删除', 'perms[sysDict:delall]', '/sys/file/delall', '2017-05-02 09:59:35', '2017-05-02 09:59:35', null, null);
INSERT INTO `sys_perm` VALUES ('d20c82b7a6484f4f992eb9aa533c06c2', 'eeceec9f880d4f7eaa7d255655a1a25a', '保存页面', 'perms[sysMenu:goadd]', '/sys/menu/goadd', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('d4d35ebbfcfc4fac8dccff3970c5cd61', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '批量删除', 'perms[sysFile:delall]', '/sys/file/delall', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('d51929fe10f64ea19db89c1fc1a52d18', '14a4ed27e5fb433599a50157b66be691', '批量删除', 'perms[sysGoods:delall]', '/sys/buy/delall', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('d5f7e79fbf794482b79cd62717f798db', '1f98b20cca794e92a3a349409518ad25', '批量删除', 'perms[sysDict:delall]', '/sys/file/delall', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('d5f822abaa4b494e80c435710cd62242', 'f153ad366c0c44ce8ab2b66d8a7575b8', '上传', 'perms[sysDict:upload]', '/sys/file/upload', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('d677b3b4a75747948d5d90a11a8de9ad', '1d1877472cce40adac038782694a9519', '添加动态', 'perms[company:goadd]', 'company/news/goadd', null, null, 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('d880108bb2374514b09cff4ed35b0f70', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '上传', 'perms[sysFile:download]', '/sys/file/upload', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('d8c4f16457a8473dbf96f82e6c6e9151', 'eeceec9f880d4f7eaa7d255655a1a25a', '批量删除', 'perms[sysMenu:delall]', '/sys/menu/delall', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('db23f33f224e4f7390d8cdae4002c367', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '增加', 'perms[sysFile:save]', '/sys/file/save', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('dc15597f79b749d1b5b2f6fd5208bcb3', '6b53d41674374feb9c9fe122c386e62b', '查询所有树节点', 'perms[sysDict:treenodeall]', '/sys/dict/treenodeall', '2017-04-20 17:38:04', '2017-04-20 17:38:04', null, null);
INSERT INTO `sys_perm` VALUES ('deef91d75c544d26a6cfd2752b44b6cc', '2e3ef8186ff44080897aaa07cbd48adf', '上传', 'perms[sysBuy:download]', '/sys/buy/upload', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('e2f5952b6aae458da93e2d5967e289c7', 'f153ad366c0c44ce8ab2b66d8a7575b8', '修改', 'perms[sysDict:edit]', '/sys/file/edit', '2017-05-02 09:59:35', '2017-05-02 09:59:35', null, null);
INSERT INTO `sys_perm` VALUES ('e34359202b614f9188fc5b67470486ee', 'eeceec9f880d4f7eaa7d255655a1a25a', '删除树节点', 'perms[sysMenu:deltree]', '/sys/menu/deltree', '2017-04-22 00:00:00', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('e67b215082434ff8bc41d16bc73814e7', '6b53d41674374feb9c9fe122c386e62b', '保存页面', 'perms[sysDict:goadd]', '/sys/dict/goadd', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('e9a8d2d155c049c783a8409e893656e1', '4dcca247b7134c3ab3156e2dea30860f', '查询树节点', 'perms[sysPerm:treenode]', '/sys/perm/treenode', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('edf0d059976f4c9a8c93f8d239634e64', '1e77eaad20c74e1c9898dede322a9a12', '查询所有树节点', 'perms[sysRole:treenodeall]', '/sys/role/treenodeall', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('eeceec9f880d4f7eaa7d255655a1a25a', 'root', '菜单管理', 'perms[sysMenu:all]', '/sys/menu/**', '2017-04-18 17:10:26', '2017-04-18 17:10:26', null, null);
INSERT INTO `sys_perm` VALUES ('f153ad366c0c44ce8ab2b66d8a7575b8', 'root', '用户管理', 'perms[sysDict:all]', '/sys/file/**', '2017-05-02 09:59:34', '2017-05-02 09:59:34', null, null);
INSERT INTO `sys_perm` VALUES ('f1e1138c321c4fabbd3bed90d92738f9', '4dcca247b7134c3ab3156e2dea30860f', '保存页面', 'perms[sysPerm:goadd]', '/sys/perm/goadd', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('f3318bafc23549ba97ca78ddfeb5626e', '4dcca247b7134c3ab3156e2dea30860f', '删除树节点', 'perms[sysPerm:deltree]', '/sys/perm/deltree', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('f41209db28284ca9a937d4faed265def', '1e77eaad20c74e1c9898dede322a9a12', '删除', 'perms[sysRole:del]', '/sys/role/del', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('f423aa88d85c48e3a00312156428e938', '6b53d41674374feb9c9fe122c386e62b', '批量删除', 'perms[sysDict:delall]', '/sys/dict/delall', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('f52823758639410a9c6d54a5e82743d5', '2e3ef8186ff44080897aaa07cbd48adf', '修改', 'perms[sysBuy:edit]', '/sys/buy/edit', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('f613f43cf16d4915bb9d40711e883c0c', '14a4ed27e5fb433599a50157b66be691', '删除', 'perms[sysGoods:del]', '/sys/buy/del', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('f6e2197b47a6429785fb4c1528d83b1d', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '列表', 'perms[sysFile:list]', '/sys/file/list', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('f89644078f6b4f08b5412ec44ab2e982', 'f153ad366c0c44ce8ab2b66d8a7575b8', '修改页面', 'perms[sysDict:goedit]', '/sys/file/goedit', '2017-05-02 09:59:35', '2017-05-02 09:59:35', null, null);
INSERT INTO `sys_perm` VALUES ('fa4d0cac179e44d7b0e1da74b132d9e9', '1f98b20cca794e92a3a349409518ad25', '页面', 'perms[sysDict:pages]', '/pages/sys/file/**', '2017-05-02 10:24:20', '2017-05-02 10:24:20', null, null);
INSERT INTO `sys_perm` VALUES ('fb9217c06607479d8118fafa89628994', '4f4ed019e53b4cd3a5f1c74531197a41', '列表', 'perms[sysUser:list]', '/sys/user/list', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('fc0c9f0a95b24a80a728f34b3d4981f3', '6b53d41674374feb9c9fe122c386e62b', '删除树节点', 'perms[sysDict:deltree]', '/sys/dict/deltree', '2017-04-20 17:38:04', '2017-04-20 17:38:04', null, null);

-- ----------------------------
-- Table structure for sys_procdef
-- ----------------------------
DROP TABLE IF EXISTS `sys_procdef`;
CREATE TABLE `sys_procdef` (
  `sys_procdef_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `version` int(11) DEFAULT NULL COMMENT '版本',
  `category` varchar(255) COLLATE utf8_bin DEFAULT 'NULL',
  `name` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '流程定义名称',
  `deployment_id` varchar(64) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '流程部署ID',
  `resource_name` varchar(4000) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '源文件名称',
  `diagram_resource_name` varchar(4000) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '源文件图片名称',
  `description` varchar(4000) COLLATE utf8_bin DEFAULT 'NULL',
  `has_start_form_key` tinyint(4) DEFAULT NULL,
  `has_graphical_notation` tinyint(4) DEFAULT NULL,
  `suspension_state` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) COLLATE utf8_bin DEFAULT '''''',
  PRIMARY KEY (`sys_procdef_id`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for sys_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `sys_res_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_res_pid` varchar(255) DEFAULT 'NULL' COMMENT '父主键',
  `sys_res_name` varchar(255) DEFAULT 'NULL' COMMENT '资源名称',
  `sys_res_order` varchar(255) DEFAULT 'NULL' COMMENT '资源排号',
  `sys_res_flag` varchar(255) DEFAULT 'NULL' COMMENT '资源标识',
  `sys_res_updatetime` datetime DEFAULT NULL COMMENT '资源创建时间',
  `sys_res_createtime` datetime DEFAULT NULL COMMENT '资源更新时间',
  `sys_res_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_res_createuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=780 ROW_FORMAT=DYNAMIC COMMENT='系统资源表';

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('06b6de17314d4316906db34b4c8c8a33', 'root', 'xxxxxxxxxxxxx', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('08d605af59f6447cb9ed9d78731842f1', 'root', 'xxxxxxxxxxxx', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('0ccd416d257246d79231d7db876a9075', 'root', 'test', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('1dd3eecb69814f0db40d76f7d4185fdd', 'root', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('31a453c233c8447fa39759b8abefc905', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('3f4dcf0709c74741a197d75403efb0f9', 'root', 'DDDDDDDDDDD', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('4b9c7c37534b481684755e02aaa40fd7', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('53a3fbe9d0384791b1f9d243487a4922', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('54ab7d176cda46c89073a8ad2084b8e3', '5fa1c793831e4c3ea76d538466071ee8', 'asd', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('5fa1c793831e4c3ea76d538466071ee8', 'root', 'xx', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('613b490bec144509b0a3cc02f1f47d3d', 'root', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('6e4e2a5ccee04c85a991b75a7c14f8dd', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('88afc7365fb94e0ea73d04a930ada593', 'root', 'asdf', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('8c03278f94c848b79cf0ed397a30a829', 'root', 'asdf', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('99c5b0fe171e420389ce8b4793c9fbe8', 'root', 'aaaaaaaaaaaaaaaaaaa', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('b5ec76178e1b4553947e879dae19461f', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('bb9c7d023546426380749e732b28832c', 'root', 'adsf', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('be6774ff001a4ea097b785f1d29b9f32', 'root', 'adsf', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('ca0481f406074859a9de0cfafe092221', '0ccd416d257246d79231d7db876a9075', 'testtest', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('d482851118be4674b09fb386a7bdd02c', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('e39aac506e1248acbb4a17aadcb21fde', 'root', 'asdf', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('f6f3b0334aa646a88f92d059fc9e5ca8', '', '', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('f81ccfb7af3d49428ba0bf57e13d6d88', '3f4dcf0709c74741a197d75403efb0f9', 'dddd', '', null, null, null, null, null);
INSERT INTO `sys_res` VALUES ('fdb251b3bcab45afaa315d211b45952f', 'root', 'asffasd', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `sys_role_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_role_pid` varchar(255) DEFAULT 'NULL' COMMENT '父主键',
  `sys_role_name` varchar(255) DEFAULT 'NULL' COMMENT '角色名称',
  `sys_role_flag` varchar(255) DEFAULT 'NULL' COMMENT '角色标识',
  `sys_role_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_role_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_role_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_role_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  `sys_role_test_d` varchar(255) DEFAULT 'NULL' COMMENT '测试:0_test0,1_test1',
  PRIMARY KEY (`sys_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('119f86cdcaa44f5ca835946996097f1b', 'root', '1', null, null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('42e8da5208cf4d4da4708272a501ed96', 'root', '管理员', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('61dab51997f642e3900ed22d500cfdd9', '6632d91267154b608f398405c30c82c4', '二级审批2', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('6632d91267154b608f398405c30c82c4', 'root', '流程审批', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('684da94e41ea44a98570bb184a562439', '42e8da5208cf4d4da4708272a501ed96', '超级管理员', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('7f1617d8111a4daca3d512464b067d7a', '6632d91267154b608f398405c30c82c4', '三级审批', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('e5296b542fdc4583aa86af5a1de12983', '6632d91267154b608f398405c30c82c4', '一级审批', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_activiti
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_activiti`;
CREATE TABLE `sys_role_activiti` (
  `sys_role_activiti_id` varchar(255) NOT NULL DEFAULT '''''' COMMENT '主键',
  `sys_role_id` varchar(255) DEFAULT 'NULL' COMMENT '角色主键',
  `sys_activiti_id` varchar(255) DEFAULT 'NULL' COMMENT '流程id',
  `sys_role_activiti_type` varchar(255) DEFAULT 'NULL' COMMENT 'partsel有子节点被选中selected选中的节点',
  PRIMARY KEY (`sys_role_activiti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 ROW_FORMAT=DYNAMIC COMMENT='角色流程表';

-- ----------------------------
-- Records of sys_role_activiti
-- ----------------------------
INSERT INTO `sys_role_activiti` VALUES ('1ae0f3aa1f4f4dc0aa443bbcc7dd045b', 'e5296b542fdc4583aa86af5a1de12983', 'a1a5bae83b734816ae223ef75bb32848', 'selected');
INSERT INTO `sys_role_activiti` VALUES ('4e298f20c55c4367a6086647bb39852d', '61dab51997f642e3900ed22d500cfdd9', '25ec957398e64e138c968804f3c45246', 'partsel');
INSERT INTO `sys_role_activiti` VALUES ('6f5be4f2bec8494caade8baa151a68ac', '61dab51997f642e3900ed22d500cfdd9', '2ec0bc9be8d442c999054024e0954f39', 'selected');
INSERT INTO `sys_role_activiti` VALUES ('95d631285ab447a88d625e70f491788c', '7f1617d8111a4daca3d512464b067d7a', 'da776ffe989a44f5b0a3af9d5983d0aa', 'selected');
INSERT INTO `sys_role_activiti` VALUES ('c60c63d35384429792b9807301ee8284', '7f1617d8111a4daca3d512464b067d7a', '25ec957398e64e138c968804f3c45246', 'partsel');
INSERT INTO `sys_role_activiti` VALUES ('d1b58d7910954603ad0e63311a2a5f73', 'e5296b542fdc4583aa86af5a1de12983', '25ec957398e64e138c968804f3c45246', 'partsel');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `sys_role_menu_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_role_id` varchar(255) DEFAULT 'NULL' COMMENT '角色主键',
  `sys_menu_id` varchar(255) DEFAULT 'NULL' COMMENT '菜单主键',
  `sys_role_menu_type` varchar(255) DEFAULT 'NULL' COMMENT 'partsel有子节点被选中selected选中的节点',
  `sys_role_menu_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_role_menu_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_role_menu_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_role_menu_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('0e54f8cdbb0b4db7b447fdd53e49338a', '42e8da5208cf4d4da4708272a501ed96', 'a459e2be2f8d41a4b9bd0f5b4d441708', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('6213677b94574785a11bf8f01c57e844', '684da94e41ea44a98570bb184a562439', '2b1753b058f1433a8defe794013ecfc8', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('7cd0a38f3dfa41d7ba368de073cc1fb8', '684da94e41ea44a98570bb184a562439', 'a459e2be2f8d41a4b9bd0f5b4d441708', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('aae2023d69ec4d9495e81a4c40540fab', '42e8da5208cf4d4da4708272a501ed96', '220941abb91b457889ac3f9865a1240f', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('de99068526cf4815a3de3d276d8f7c42', '42e8da5208cf4d4da4708272a501ed96', '06015fb13ca344a7b5519819fd129124', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('fb4542aa0b79421bb536867e87b6fa71', '42e8da5208cf4d4da4708272a501ed96', '2b1753b058f1433a8defe794013ecfc8', 'selected', null, null, 'NULL', 'NULL');

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm` (
  `sys_role_perm_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_role_id` varchar(255) DEFAULT 'NULL' COMMENT '角色主键',
  `sys_perm_id` varchar(255) DEFAULT 'NULL' COMMENT '权限主键',
  `sys_role_perm_type` varchar(255) DEFAULT 'NULL' COMMENT 'partsel有子节点被选中,本身是未选中状态;selected选中的节点',
  `sys_role_perm_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_role_perm_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_role_perm_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_role_perm_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_role_perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC COMMENT='角色权限表';

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
INSERT INTO `sys_role_perm` VALUES ('8090fe8d4d5c4b49b91f337c44ac5bcc', '684da94e41ea44a98570bb184a562439', 'd677b3b4a75747948d5d90a11a8de9ad', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_perm` VALUES ('c3d9be9c807f4692b9a42db2e4158361', '684da94e41ea44a98570bb184a562439', '1d1877472cce40adac038782694a9519', 'selected', null, null, 'NULL', 'NULL');

-- ----------------------------
-- Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `sys_role_res_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_role_id` varchar(255) DEFAULT 'NULL' COMMENT '角色主键',
  `sys_res_id` varchar(255) DEFAULT 'NULL' COMMENT '资源主键',
  `sys_role_res_type` varchar(255) DEFAULT 'NULL' COMMENT 'partsel有子节点被选中,selected选中的节点',
  `sys_role_res_createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_role_res_updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_role_res_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_role_res_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_role_res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC COMMENT='角色资源表';

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('a1192f0e19de4226bc9a4fc9778473c4', '55ac34fda1714310824cb7ef5ce38f25', 'bb9c7d023546426380749e732b28832c', null, null, null, null, null);
INSERT INTO `sys_role_res` VALUES ('f0ab202a4ec94a64be1910764e325720', '55ac34fda1714310824cb7ef5ce38f25', '99c5b0fe171e420389ce8b4793c9fbe8', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `sys_user_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_user_name` varchar(255) DEFAULT 'NULL' COMMENT '姓名',
  `sys_user_account` varchar(255) DEFAULT 'NULL' COMMENT '帐号',
  `sys_user_password` varchar(255) DEFAULT 'NULL' COMMENT '密码',
  `sys_user_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `sys_user_login_ip` varchar(255) DEFAULT 'NULL' COMMENT '登陆ip地址',
  `sys_user_status_d` varchar(255) DEFAULT 'NULL' COMMENT '用户状态:0_有效用户,1_无效用户',
  `sys_user_card` varchar(255) DEFAULT 'NULL' COMMENT '身份证号',
  `sys_user_flag_c` varchar(255) DEFAULT 'NULL' COMMENT '用户标记:0_系统用户,1_注册用户,2_双身份',
  `sys_user_reg_date` datetime DEFAULT NULL COMMENT '注册时间',
  `sys_user_reg_type_d` varchar(255) DEFAULT 'NULL' COMMENT '用户来源:0_pc端,1_iso端,2_android端',
  `sys_area_id` varchar(255) DEFAULT 'NULL' COMMENT '所在地主键',
  `sys_org_id` varchar(255) DEFAULT 'NULL' COMMENT '组织机构主键',
  `sys_user_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_user_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_user_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人id',
  `sys_user_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '修改人id',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0de9dee853cd468f817d6bcf1a6856f0', 'test', '123456789', '46a126a153d4bb49a38c02c66caabada', null, 'NULL', 'NULL', 'NULL', 'NULL', null, '0', 'NULL', 'NULL', '2017-09-19 21:51:50', null, 'da8c252c6672450db9a4af267aa5e6ad', 'NULL');
INSERT INTO `sys_user` VALUES ('222403f77e8c411388fd7f50c23974e8', '1', '1', '3a3c6ca24f6e565c26100b01b5c3fc91', null, null, null, null, null, null, 'a55c6e261e774082bbd5521130c5c1e6', null, null, '2017-04-19 15:07:23', '2017-08-14 04:26:36', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_user` VALUES ('4629ac36f8644d06b2f4c9a44d3315b4', '888', '123456', 'dcd163ed5e4e0320ac27625ec38ba001', null, 'NULL', 'NULL', 'NULL', 'NULL', null, '2', 'NULL', 'NULL', '2017-10-16 23:14:58', null, 'NULL', 'NULL');
INSERT INTO `sys_user` VALUES ('b33d2bca4f0c453398bd5fea166d255b', '李楠', '15633841042', 'f1ad93366fcff9892d5f5fd6419c9213', null, 'NULL', 'NULL', 'NULL', 'NULL', null, '0', 'NULL', 'NULL', '2017-09-19 22:03:48', null, 'da8c252c6672450db9a4af267aa5e6ad', 'NULL');
INSERT INTO `sys_user` VALUES ('bae53af74bfb45788bbf706009bd897c', '666', '12589', 'be98207ac6d9de9ce8f53ada21922be3', null, 'NULL', 'NULL', 'NULL', 'NULL', null, '0', 'NULL', 'NULL', '2017-10-16 23:04:22', null, 'NULL', 'NULL');
INSERT INTO `sys_user` VALUES ('da8c252c6672450db9a4af267aa5e6ad', '超人', 'admin', 'be98207ac6d9de9ce8f53ada21922be3', null, null, '880d185f11794395a9439705eab558e0', '', 'a6a5b5dffe754fd5901698bf10cf2f15', null, '37b73a43f23a42edb6bef45a96628217', '', '', null, '2017-08-14 04:12:28', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_user` VALUES ('f7860f5facb344159f0907c409e8bb9c', '1', '1', '3a3c6ca24f6e565c26100b01b5c3fc91', null, null, '3903e4aacde24ecc9bb36868d5b1987a', null, 'a6a5b5dffe754fd5901698bf10cf2f15', null, null, null, null, '2017-04-21 17:09:29', null, 'da8c252c6672450db9a4af267aa5e6ad', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `sys_user_role_id` varchar(255) NOT NULL COMMENT '主键',
  `sys_user_id` varchar(255) DEFAULT 'NULL' COMMENT '用户主键',
  `sys_role_id` varchar(255) DEFAULT 'NULL' COMMENT '角色主键',
  `sys_user_role_type` varchar(255) DEFAULT 'NULL' COMMENT 'partsel有子节点被选中selected选中的节点',
  `sys_user_role_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_user_role_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_user_role_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_user_role_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '更新人',
  PRIMARY KEY (`sys_user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('0d01fea4848a488b960e02841ba4bc22', 'da8c252c6672450db9a4af267aa5e6ad', '42e8da5208cf4d4da4708272a501ed96', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('37901736115e481fa382b73b2462ae70', 'da8c252c6672450db9a4af267aa5e6ad', '684da94e41ea44a98570bb184a562439', 'selected', null, null, 'NULL', 'NULL');
