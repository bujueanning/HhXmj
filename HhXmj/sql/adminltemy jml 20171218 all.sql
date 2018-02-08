/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.146_3306
Source Server Version : 50636
Source Host           : 192.168.1.146:3306
Source Database       : adminltemy

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-12-18 15:52:29
*/

SET FOREIGN_KEY_CHECKS=0;

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
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`)
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
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`)
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
INSERT INTO `auction_assets` VALUES ('0a83c56f2bd9409ab24742b80bd0cd3e', '河北汇海', 'B020171122085138', '4', '1', '50', '8', '110008', '40.00', null, '2017-11-15 00:00:00', '2017-11-22 10:13:34', null, '1111111111111111111111', '111111111111', '1', 'files/2017/11/22/08\\c0f6c66c-8f25-4a84-bacf-01b00480350d.png', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-22 10:13:34', '2017-11-22 10:13:34');
INSERT INTO `auction_assets` VALUES ('11b173f718e947069c2413b8df8feaed', '1', '2017-09-15 22:17:42', '1', '1', '1', '100', '110008', '1.00', '11', '2017-09-14 00:00:00', '2017-11-22 10:13:27', '<p>3</p>', '1', '1', '1', 'files/2017/09/14/23\\e1c4789a-80f5-410c-86ce-1a7745c251f7.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-22 10:13:27', '2017-11-22 10:13:27');
INSERT INTO `auction_assets` VALUES ('13a292ed98dd48e6bb54ee33480f173b', '河北汇海', 'B020171122085343', '4', '1', '50', '8', '110008', '40.00', null, '2017-11-15 00:00:00', '2017-11-22 10:13:27', null, '1111111111111111111111', '111111111111', '1', 'files/2017/11/22/08\\260f801b-8e64-429e-8e54-4dece55005ca.png', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-22 10:13:27', '2017-11-22 10:13:27');
INSERT INTO `auction_assets` VALUES ('143c29cb280846a5a754750fec147835', '我的资产拍卖12112', 'B020171122150105', '1', '1', '1', '6', '170007', '1.00', null, '2017-11-23 00:00:00', '2017-11-29 00:00:00', null, '1', '1', '1', 'files/2017/11/22/15\\514f9b16-fddc-47d4-84b4-87d8fae68568.jpg', '620afbf9047442888a8db580baafb839', '2017-11-22 00:00:00', null);
INSERT INTO `auction_assets` VALUES ('144d40885d804e8bbfc50e4b921b5e6c', '11', 'B020171121145551', '1', '1', '111', '-8', '110008', '111.00', null, '2017-11-23 00:00:00', '2017-11-22 10:13:26', null, '222', '222', '1', 'files/2017/11/21/14\\e3001675-f50a-4172-8a38-7ae4a140b7b9.png', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-22 10:13:26', '2017-11-22 10:13:26');
INSERT INTO `auction_assets` VALUES ('29cbaa548a734f6f9d5b263097686e57', '1215', 'B020171215150131', '1', '1', '1', '10', '110001', '1.00', '1', '2017-12-20 00:00:00', '2017-12-30 00:00:00', null, '1', '1', '2', 'files/2017/12/15/15\\efe3b22d-e789-4d73-a21a-b043144ab459.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-15 15:01:32', '2017-12-15 15:01:31');
INSERT INTO `auction_assets` VALUES ('2deed1558453493393bff92fe5ac81b7', '河北汇海', 'B020171122084945', '4', '1', '50', '8', '110008', '40.00', null, '2017-11-15 00:00:00', '2017-11-22 10:13:25', null, '1111111111111111111111', '111111111111', '1', 'files/2017/11/22/08\\ecc4c5b3-1632-47b4-9cc3-a56a05dbe34d.png', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-22 10:13:25', '2017-11-22 10:13:25');
INSERT INTO `auction_assets` VALUES ('586d0ba50ce24e2caf24c050ec9572d1', '河北汇海', 'B020171122084935', '4', '1', '50', '8', '110008', '40.00', null, '2017-11-15 00:00:00', '2017-11-22 10:13:24', null, '1111111111111111111111', '111111111111', '1', 'files/2017/11/22/08\\c77c87d8-7837-44c2-bbcc-bac068be0f73.png', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-22 10:13:24', '2017-11-22 10:13:24');
INSERT INTO `auction_assets` VALUES ('862d10394be04028a0c77c9d8bd69281', '河北汇海', 'B020171215150328', '4', '1', '50', '7', '150001', '40.00', null, '2017-11-15 00:00:00', '2017-11-22 10:13:23', null, '1111111111111111111111', '111111111111', '2', 'files/2017/12/15/15\\7eecc594-7dc6-49f3-8e9a-67b26aaee846.jpg', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-12-15 15:03:29', '2017-12-15 15:03:28');
INSERT INTO `auction_assets` VALUES ('a005a6cd32e9494aa7b7bae296a4ebab', '绿洲闪贷资产包', 'B020171215150251', '1', '1', '1', '7', '110001', '10.00', '10000', '2017-11-15 00:00:00', '2017-11-22 00:00:00', null, '张', '11111111111', '2', 'files/2017/12/15/15\\9a6b3c6c-07c2-4fcc-bda7-10810ce13c15.jpg', '6a7e6f30d2d44566ab1172569e28416c', '2017-12-15 15:02:52', '2017-12-15 15:02:51');
INSERT INTO `auction_assets` VALUES ('aa0136eae6214d5fa0f6671a261734fd', '1111', 'B020171215150306', '1', '1', '111', '20', '110008', '11.00', '1', '2017-11-02 00:00:00', '2017-11-22 10:13:22', null, '1111', '11111', '2', 'files/2017/12/15/15\\4e21064d-1272-4c42-83b2-b1bd635c24e6.jpg', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-12-15 15:03:07', '2017-12-15 15:03:06');
INSERT INTO `auction_assets` VALUES ('b0f68a09ece94befa9b57e24fddda136', '6', '2017-09-16 23:16:46', '3', '3', '6', '6', '10004', '6.00', null, '2017-09-16 00:00:00', '2017-11-22 10:13:21', '<p>6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;</p>', '6', '6', '1', 'files/2017/09/16/23\\014b344f-307d-409e-82a6-43bbe59e057b.png', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-22 10:13:21', '2017-11-22 10:13:21');
INSERT INTO `auction_assets` VALUES ('bf9b159b112446c6b59438163397797f', '我的资产拍卖', 'B020171215150337', '2', '2', '222', '6', '10006', '1.00', '5', '2017-11-16 00:00:00', '2017-11-22 10:05:20', null, '阿飞', '17', '2', 'files/2017/12/15/15\\44ea68fd-a0dd-402c-b815-185455d540c5.jpg', '620afbf9047442888a8db580baafb839', '2017-12-15 15:03:38', '2017-12-15 15:03:37');
INSERT INTO `auction_assets` VALUES ('c01988df5a374d169c4e4af5d02cf2fb', '22', 'B020171215145520', '1', '1', '222', '44', '110009', '33.00', '20000', '2017-11-01 00:00:00', '2017-12-15 14:54:59', null, '333', '3333', '2', 'files/2017/12/15/14\\59d9577c-662f-432f-a399-4423e0a48d0e.jpg', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-12-15 14:55:21', '2017-12-15 14:55:21');
INSERT INTO `auction_assets` VALUES ('d19e3805f5c64ae7adccf5fc0550ca43', '2', '2017-09-16 20:52:17', '2', '2', '2', '1', '110001', '2.00', '2', '2017-09-15 00:00:00', '2017-12-15 14:55:02', '<p>2&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;</p>', '2', '2', '1', 'files/2017/09/15/21\\97cbefb3-5aa0-43f9-8436-5264ed62733c.png', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-15 14:55:02', '2017-12-15 14:55:02');

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
INSERT INTO `auction_listing` VALUES ('037aed5af67a4d7a9fd746aa3197c3ac', '29cbaa548a734f6f9d5b263097686e57', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('180a5ef84591472b8aa9c12ad3a23bfa', 'd19e3805f5c64ae7adccf5fc0550ca43', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `auction_listing` VALUES ('2b648053168445df88a7a56a2b6cbd00', '51609e8c88ff4a89a066c35efab0571a', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('2e362bbb75464e569264c09f24440020', '87da87c25f044d81adf6e42cb9e94a0d', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('3908ada887ec4dc5a4fcbb61a149dfa4', 'efaae4772c994fb38e91c9912c5b5d54', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('48634416ef4e47ac865706e3d6939314', '907eaa6451e348ae9b3e60c33ec3a481', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('4b7c2891b5c94d818612b8fe74d295bf', '143c29cb280846a5a754750fec147835', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('4d7a9a84e60e42b0a044b26b388976a9', 'f5d66bc58dd543a38cac78f46b8c71dd', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('5cae5b1840974f0ba3f0cdb6b85a3354', 'a8e07ee8f6f1491cb3c318374cc21f5d', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('684b20a533fd4dfaa92baa415ff799c9', '144d40885d804e8bbfc50e4b921b5e6c', '1111', '11', '1111', '11', '111', '1111', '11', '11', '222');
INSERT INTO `auction_listing` VALUES ('6994aa36047f49d1b66712ba098a3723', '6a657b30965449f3bf74e9e16c841188', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('7993ed30612643fe84e339f8b02c1dc4', 'a8157e44f6064791b048f5307ba07eb4', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('7d8cb0d44b274c4a98375cf403c62477', '1b3cb003edb34883860df6db61bf53f0', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('7f83f1fc159c44a2a237efb6f0124717', 'c3f3721e1311445284ec9defbe5cf616', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('94eceed0791345aab6b39373942cd99e', '92529aa36cae4d17a456f7b523ec21b0', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('99c76b00e5704769a0301e81017e4147', '35983d171cd24488b9df5ca31ed21e40', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('a3e7c6531dc84d44bbdecf5980aacd2a', 'a005a6cd32e9494aa7b7bae296a4ebab', '1', '1', '1', '1', '1', '1', '1', '1', '无');
INSERT INTO `auction_listing` VALUES ('aa4e152fd0c947deabc9058d1a5c70d9', 'c01988df5a374d169c4e4af5d02cf2fb', '3', '3', '333', '33', '33', '33', '333', '3', '3333');
INSERT INTO `auction_listing` VALUES ('b0733563d5e34ca1b1165adc11644db3', '862d10394be04028a0c77c9d8bd69281', '1111', '111', '11', '1111', '11', '111', '11', '111', '1111111111111111111111');
INSERT INTO `auction_listing` VALUES ('b21024b2231c4b169ba37661e0d62292', 'aa0136eae6214d5fa0f6671a261734fd', '1111', '1111', '1111', '11111', '111', '1111', '111', '11111', '111111');
INSERT INTO `auction_listing` VALUES ('bfa2f3d85dff44848c3613ee7fe6a3e5', '28e5ab5d46df4b18a0cda2f464ed43d5', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('c343456c11e14362b4af5b23179adec4', '4743485327c14b5ca4f963f2b6759668', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('c3a21afaffd54739a2cff25ba7d05647', '11b173f718e947069c2413b8df8feaed', '11', '1', '1', '1', '1', '1', '11', '1', '1');
INSERT INTO `auction_listing` VALUES ('ca1aa65ac1d143c08840dbf5fb7a710b', 'bf9b159b112446c6b59438163397797f', '1', '1', '1', '1', '1', '1', '1', '1', '代发');
INSERT INTO `auction_listing` VALUES ('e6c63d82f3b34a979807d99efbd74c31', '8e539b0a14b14a1f91748ba1f1c6b953', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `auction_listing` VALUES ('e72a67a54da34ccf98609fbc90365e93', 'b0f68a09ece94befa9b57e24fddda136', '6', '6', '6', '6', '6', '6', '6', '6', '66');
INSERT INTO `auction_listing` VALUES ('f39ab094e8234967a8495f0ab2545f82', 'ca5b3c966ed74eac9f160adf00c30673', '1', '1', '1', '1', '1', '1', '1', '1', '1');

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
INSERT INTO `auction_overview` VALUES ('09b30bf7684345e183b8343a80e81d6b', '1', 'f5d66bc58dd543a38cac78f46b8c71dd', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('0a2fe798e9bd4a578c0201a94ec0fad3', '1', '35983d171cd24488b9df5ca31ed21e40', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('13e8428956034eca9526536cca30b505', '3', 'b0f68a09ece94befa9b57e24fddda136', '6', '26', '6', '6', '6');
INSERT INTO `auction_overview` VALUES ('1b4c8f66d3fa4a83a8ebbed5b5138895', '1', 'c01988df5a374d169c4e4af5d02cf2fb', '33', '222', '33', '222', '33');
INSERT INTO `auction_overview` VALUES ('1c6ec8fb939f45adb4685f1c75d58a6e', null, '11b173f718e947069c2413b8df8feaed', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('2e2363f7ae3f4033a433f213430dc930', '1', '29cbaa548a734f6f9d5b263097686e57', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('3d5f45cec9de4207bb8bab33a7594ec5', '1', '4743485327c14b5ca4f963f2b6759668', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('4b026320d6a64b04aba9dde8d3124c7e', '1', '2deed1558453493393bff92fe5ac81b7', '0000', '111', '111', '111', '11');
INSERT INTO `auction_overview` VALUES ('4bded9d05107444a86dca890545868cd', '1', '8e539b0a14b14a1f91748ba1f1c6b953', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('5497d64b06fc491ea2b292eb74885aa1', '1', 'ca5b3c966ed74eac9f160adf00c30673', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('5fe6d42036024cb4b4b28a73a457f805', '1', 'a8157e44f6064791b048f5307ba07eb4', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('605a2c95cc094006af83ea8a38725cb1', '1', '51609e8c88ff4a89a066c35efab0571a', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('662d124770594c6c9e77aa62fd089571', '1', 'aa0136eae6214d5fa0f6671a261734fd', '11', '11111', '11', '11111', '1');
INSERT INTO `auction_overview` VALUES ('6675e81a06db4ef990705e45cb3711c3', '1', '1b3cb003edb34883860df6db61bf53f0', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('7aa7646aae074ab2a3dfc1a6f9f2a089', '1', '6a657b30965449f3bf74e9e16c841188', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('8a2ade3f3d934280ac03e45e5a7d9a79', '1', '92529aa36cae4d17a456f7b523ec21b0', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('8f00f6760fea4e0eb1acd510686e2368', '1', '143c29cb280846a5a754750fec147835', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('a2208c26b91d4c90914d62e6ce1bdcef', '1', '13a292ed98dd48e6bb54ee33480f173b', '0000', '111', '111', '111', '11');
INSERT INTO `auction_overview` VALUES ('a3c87c97e87a47efab1f7ee87f51515b', '1', '907eaa6451e348ae9b3e60c33ec3a481', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('a817d64b05664cfbbeed4e9290b3ae0a', '1', 'a005a6cd32e9494aa7b7bae296a4ebab', '无', 'p2p不良资产', '1', '网贷', '1');
INSERT INTO `auction_overview` VALUES ('bcf29fa9ed6e4ee28c70a8daa077bbe6', '1', 'c3f3721e1311445284ec9defbe5cf616', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('c5819b66bd6c4cb1868c89e03ad8c7dd', '1', 'efaae4772c994fb38e91c9912c5b5d54', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('c6255ce8571345198033be9635bb08d0', '1', '0a83c56f2bd9409ab24742b80bd0cd3e', '0000', '111', '111', '111', '11');
INSERT INTO `auction_overview` VALUES ('d02ff2bfcd854494adec8106cdb0b085', '1', '144d40885d804e8bbfc50e4b921b5e6c', '111', '11111', '11', '11111', '11');
INSERT INTO `auction_overview` VALUES ('d2b7d296fa6444f094aa47f5626e1ed0', '1', '862d10394be04028a0c77c9d8bd69281', '0000', '111', '111', '111', '11');
INSERT INTO `auction_overview` VALUES ('d69d44fc181248e0bb137099252b21c4', '1', 'bf9b159b112446c6b59438163397797f', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('da73ee347b914a4bb386e4607dab7aa9', '1', '586d0ba50ce24e2caf24c050ec9572d1', '0000', '111', '111', '111', '11');
INSERT INTO `auction_overview` VALUES ('eb4ea45eae204322ae2dddcc1d4fbad5', '1', 'a8e07ee8f6f1491cb3c318374cc21f5d', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('eb53286edcbf46bf8f1fc0cfeb00148f', '1', '28e5ab5d46df4b18a0cda2f464ed43d5', '1', '1', '1', '1', '1');
INSERT INTO `auction_overview` VALUES ('f0140526c5e34a83adc4cf0dd2662ab7', '1', '87da87c25f044d81adf6e42cb9e94a0d', '1', '1', '1', '1', '1');
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
INSERT INTO `auction_price` VALUES ('09bdf5012b6040df8fdd91fb04243a4a', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:36:20');
INSERT INTO `auction_price` VALUES ('0e50d6b61bc44083b6827cb17cd6c8d8', 'c01988df5a374d169c4e4af5d02cf2fb', '80051', '620afbf9047442888a8db580baafb839', '2017-11-22 08:56:13');
INSERT INTO `auction_price` VALUES ('11ce7bf976fc4cfe983f6a6c431a5d86', 'c01988df5a374d169c4e4af5d02cf2fb', '100', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-22 08:56:33');
INSERT INTO `auction_price` VALUES ('1689b7c8a03c4fc7bd2dc6d1ceadb07d', 'aa0136eae6214d5fa0f6671a261734fd', '29', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 16:00:38');
INSERT INTO `auction_price` VALUES ('1a003659304f43eca9e2b07462468d9a', 'aa0136eae6214d5fa0f6671a261734fd', '25', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:57:22');
INSERT INTO `auction_price` VALUES ('1b4e5b0e7fdf4a60b98fa24ea3ef1ea1', 'd19e3805f5c64ae7adccf5fc0550ca43', '8', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:23:12');
INSERT INTO `auction_price` VALUES ('1d697ddebfd34fcabd912544cbc6d843', 'aa0136eae6214d5fa0f6671a261734fd', '17', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 15:01:16');
INSERT INTO `auction_price` VALUES ('1f12b22e79ea4edea4fc337379d030e5', 'bf9b159b112446c6b59438163397797f', '2', '620afbf9047442888a8db580baafb839', '2017-11-22 09:35:03');
INSERT INTO `auction_price` VALUES ('271870a24e734bd4a0ab3fecfd87071e', 'aa0136eae6214d5fa0f6671a261734fd', '21', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:55:47');
INSERT INTO `auction_price` VALUES ('398a00ac018543e4a9e109fe0336a2cc', 'c01988df5a374d169c4e4af5d02cf2fb', '51', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 17:24:19');
INSERT INTO `auction_price` VALUES ('4044405c58044420bb45e10f81d07569', 'd19e3805f5c64ae7adccf5fc0550ca43', '10', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:25:11');
INSERT INTO `auction_price` VALUES ('41e7367f6e824a8b8f7cdf9a9acef5fe', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:36:16');
INSERT INTO `auction_price` VALUES ('4c320cdcb06d4d7b8a087794690f9827', 'c01988df5a374d169c4e4af5d02cf2fb', '240051', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-06 09:51:43');
INSERT INTO `auction_price` VALUES ('546422cfac524d919280dc3e9e574eb3', 'aa0136eae6214d5fa0f6671a261734fd', '25', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:57:25');
INSERT INTO `auction_price` VALUES ('548b4344cbce4a65bd2bc4ba62d2616f', 'aa0136eae6214d5fa0f6671a261734fd', '21', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:55:50');
INSERT INTO `auction_price` VALUES ('5ce161cb0f1a486190d31dc1d3eaff2d', 'aa0136eae6214d5fa0f6671a261734fd', '18', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 16:44:47');
INSERT INTO `auction_price` VALUES ('742701cd4de744558f00e040827b0127', 'd19e3805f5c64ae7adccf5fc0550ca43', '6', 'da8c252c6672450db9a4af267aa5e6ad', '2017-09-16 20:13:18');
INSERT INTO `auction_price` VALUES ('74583b44751f441f885bd6aa0f649200', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:39:19');
INSERT INTO `auction_price` VALUES ('75a081d5418e472f9b7dbf403aba589f', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:37:30');
INSERT INTO `auction_price` VALUES ('7b750bd71c01454e89844d2f767a1e0e', 'aa0136eae6214d5fa0f6671a261734fd', '25', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:57:16');
INSERT INTO `auction_price` VALUES ('8e612ad54fcd48469a34425193a4445c', 'aa0136eae6214d5fa0f6671a261734fd', '21', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:55:56');
INSERT INTO `auction_price` VALUES ('8feb2a6b976a44938ca8006bb2d8e5c1', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:37:35');
INSERT INTO `auction_price` VALUES ('909027012178401b97ec40c31f37207e', 'aa0136eae6214d5fa0f6671a261734fd', '19', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 16:44:52');
INSERT INTO `auction_price` VALUES ('920caf7bee4845419f7dc5aa3e5ff73f', 'c01988df5a374d169c4e4af5d02cf2fb', '50', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 17:19:55');
INSERT INTO `auction_price` VALUES ('948b76a6e15a42cf8b2a840e7b7a250d', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:37:55');
INSERT INTO `auction_price` VALUES ('956e42e241e049cd9301669885873c95', 'aa0136eae6214d5fa0f6671a261734fd', '25', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:57:13');
INSERT INTO `auction_price` VALUES ('9a8e98c0d046497093278506fab0bda9', 'bf9b159b112446c6b59438163397797f', '3', '620afbf9047442888a8db580baafb839', '2017-11-22 09:35:06');
INSERT INTO `auction_price` VALUES ('a1bba6ec435a44de92559fe3426a7ec8', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:36:01');
INSERT INTO `auction_price` VALUES ('ab301092833b47f59c0b660fe5ba99cc', 'aa0136eae6214d5fa0f6671a261734fd', '25', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 15:57:19');
INSERT INTO `auction_price` VALUES ('ac02c67b25714335a966385f4b9b490c', 'c01988df5a374d169c4e4af5d02cf2fb', '100051', '620afbf9047442888a8db580baafb839', '2017-11-22 09:01:09');
INSERT INTO `auction_price` VALUES ('c2100abbeb99446292ebc9cf4f3bb4e9', 'c01988df5a374d169c4e4af5d02cf2fb', '260051', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-07 11:40:27');
INSERT INTO `auction_price` VALUES ('c897ac1013024a41a9abd3e14e99c9d3', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:36:05');
INSERT INTO `auction_price` VALUES ('cd7913e1e18340018d9d5fdc6216fd25', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:37:32');
INSERT INTO `auction_price` VALUES ('ce3764b8a1224252a64bd71654041322', 'c01988df5a374d169c4e4af5d02cf2fb', '200051', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-23 16:56:37');
INSERT INTO `auction_price` VALUES ('dc2b435b163249f2911047aae3fe8202', 'd19e3805f5c64ae7adccf5fc0550ca43', '4', 'da8c252c6672450db9a4af267aa5e6ad', null);
INSERT INTO `auction_price` VALUES ('df35bd2f441f48fda02ec0fed324eec5', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:35:55');
INSERT INTO `auction_price` VALUES ('e58caffb83ec487487f4404cf518821f', 'c01988df5a374d169c4e4af5d02cf2fb', '220051', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 16:10:31');
INSERT INTO `auction_price` VALUES ('e61d00b9f74b4e4e9722ad729b81f2ca', 'c01988df5a374d169c4e4af5d02cf2fb', '120051', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-23 16:38:26');
INSERT INTO `auction_price` VALUES ('e9accc791401411fa8b00c91f64757e7', 'c01988df5a374d169c4e4af5d02cf2fb', '160051', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-23 16:38:59');
INSERT INTO `auction_price` VALUES ('f3118ccf8d8b4ee3bd5d3a64c6f4908d', 'aa0136eae6214d5fa0f6671a261734fd', '20', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 16:44:53');
INSERT INTO `auction_price` VALUES ('fcd7dbe1d7eb4aaeba17bb8996051c88', 'aa0136eae6214d5fa0f6671a261734fd', '29', 'a8a003597b784f7cacfa188f64b4418f', '2017-12-05 16:10:09');
INSERT INTO `auction_price` VALUES ('ffbff57d8c5b455e97cd76c5ad022e18', 'a005a6cd32e9494aa7b7bae296a4ebab', '30010', 'a8a003597b784f7cacfa188f64b4418f', '2017-11-23 16:36:08');

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
INSERT INTO `bond_accept` VALUES ('1ea5d01762bd4364a27eeb6f6f981e4c', '人人追', '1654651', '2017-12-12 14:24:54', '3', '1', '3', null, null, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', '4f7349d83ad84184979256e4ca8988a2', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_accept` VALUES ('22805f1853be483899fc21c3b983557d', '西瓜', '5421321852', '2017-11-07 00:00:00', '刨冰', '刨冰', '刨冰', '刨冰', '刨冰', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', 'bf1a882414984d6ab031140cc8e7b756', null);
INSERT INTO `bond_accept` VALUES ('2e68b460c6f24bbd9c5f7cdcc25b8861', '人人追', '1654651', '2017-12-12 14:21:12', '1', '1', '1', null, null, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', '4f7349d83ad84184979256e4ca8988a2', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_accept` VALUES ('3f2d419b143846be88a3d1a27cd9d1ff', '绿洲闪贷资产包', '12365555', '2017-11-21 00:00:00', '1', '1', '1', '1', null, 'null\\null', '1', 'b7494ab7e2244db7971ab6ac62966b7d', 'ba1df9ed15f247d6a771cd0df9c5d2ce', null);
INSERT INTO `bond_accept` VALUES ('43b8ae4c4b96461881ab51e77ce73172', '东方红睿轩沪港深', '169103', '2017-11-09 00:00:00', null, null, null, null, null, 'null\\null', '1', null, '11', null);
INSERT INTO `bond_accept` VALUES ('443bfaaacf554696a87eb2dbe80c82a2', '东方红睿逸定期开放', '001309', '2017-10-25 00:00:00', '江西药业', '自营', '何某某', '13644239456', '电催', 'files/2017/10/25/14\\9d4ef5de-f873-4a00-8c78-f914ddba194f.jpg', '2', null, '10', null);
INSERT INTO `bond_accept` VALUES ('53f251eedbb44729ad7f1e4a5b2f2e69', '11月6号', '964223842', '2017-11-06 00:00:00', '紫色', '国企', '江', '16354789354', '外访', 'files/2017/11/06/11\\4ede13d6-9dfc-4861-9f2d-12f6193094df.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', 'eb834d3dc41d43da916f9d46f0385636', null);
INSERT INTO `bond_accept` VALUES ('548eb885ddba45bfa46b44a224378bcb', '瓶子', '99999999', '2017-11-10 00:00:00', '啤酒', 'ho', '萨', '9883332214', null, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', '552731f2d6704e9c8c49684073cf332a', null);
INSERT INTO `bond_accept` VALUES ('69b000a9286c48288687d78e2fe8412a', '绿洲闪贷资产包', '12365555', '2017-11-21 00:00:00', '12', '1', '1', '1', null, 'null\\null', '1', 'b7494ab7e2244db7971ab6ac62966b7d', 'ba1df9ed15f247d6a771cd0df9c5d2ce', null);
INSERT INTO `bond_accept` VALUES ('70ec58935f5246a78b1bfc4917eb6523', '绿洲闪贷资产包', '12365555', '2017-11-22 14:45:49', null, '1', null, null, null, 'null\\null', '1', 'b7494ab7e2244db7971ab6ac62966b7d', 'ba1df9ed15f247d6a771cd0df9c5d2ce', null);
INSERT INTO `bond_accept` VALUES ('715bd1cb5fb24337b69720e9a4a72d74', '人人追', '1654651', '2017-12-12 14:41:19', '5', '1', '5', '5', null, 'files/2017/12/12/14\\302ad9b4-d794-449c-8566-665228c310d3.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', '4f7349d83ad84184979256e4ca8988a2', 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `bond_accept` VALUES ('7827bd2116504c5aa7a76604d0a362af', '需要报名的资产', '3247832423', '2017-11-07 00:00:00', 'b1', 'b1', 'b1', 'b1', 'b1', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '3bd3ba4068eb4d97974be60048b471e7', null);
INSERT INTO `bond_accept` VALUES ('7c51532cf5ba42479186e7588d546712', '芝麻', '6541613212', '2017-11-07 00:00:00', '水母', '水母', '水母', '水母', '水母', 'null\\null', '2', '5d04c8a7a9994a5eb647e91b719cee66', '6359879020494fc5a211cad0c0867e33', null);
INSERT INTO `bond_accept` VALUES ('7d22b20a45ef40dcbc8acefa0b13ae53', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a3', 'a3', 'a3', 'a3', 'a3', 'null\\null', '2', 'da8c252c6672450db9a4af267aa5e6ad', 'fe95fb3626cf4e2a8c9a9373894777b5', null);
INSERT INTO `bond_accept` VALUES ('7e75f13ad7f34adbba9ba9b73f80b0a2', '人人追', '1654651', '2017-12-12 14:21:21', '2', '1', '2', null, null, 'null\\null', '1', 'da8c252c6672450db9a4af267aa5e6ad', '4f7349d83ad84184979256e4ca8988a2', 'da8c252c6672450db9a4af267aa5e6ad');
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
  `bond_transfer_ratio` varchar(255) DEFAULT '''NULL''' COMMENT '佣金比例',
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
  `bond_unable` tinyint(4) DEFAULT NULL COMMENT '0_可接单报名、1_正在审核、2_已签约',
  `bond_disposal_accessory` varchar(255) DEFAULT NULL COMMENT '附件',
  `bond_overdue` varchar(255) DEFAULT '1月' COMMENT '逾期时间',
  `bond_case` varchar(255) DEFAULT NULL COMMENT '资产包案件数量',
  `bond_deadline` varchar(255) DEFAULT NULL COMMENT '委外期限',
  `bond_deal` tinyint(4) DEFAULT NULL COMMENT '交易类型:1_单笔委外,2_委外包',
  `bond_debt_location` varchar(255) DEFAULT NULL COMMENT '债务人地址',
  `bond_show` tinyint(4) DEFAULT NULL COMMENT '加盟方是否接单:0_不优先接单,1_优先接单',
  `bond_auditor` varchar(255) DEFAULT NULL COMMENT '加盟方审核人',
  `bond_major_issues` longtext COMMENT '重要信息',
  `bond_project_announcement` longtext COMMENT '项目公告',
  PRIMARY KEY (`bond_disposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产委外信息';

-- ----------------------------
-- Records of bond_disposal
-- ----------------------------
INSERT INTO `bond_disposal` VALUES ('0506e5b2f72e4d6d99f5dd0ad0fe6010', '水木公司', '495453212', '1110000', '2017-11-09 00:00:00', '2017-12-13 15:57:16', '65%', '1', '2017-11-03 10:36:01', '5', '3', '21', '2', '110001', '林某某', '111111111111', 'files/2017/11/03/10\\21ca0294-21cc-43b8-8bfe-78983259356a.jpg', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('0830d5c797854c53b6550d7e271f7daf', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:16', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '110001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('0ddce74f07764ff9849bdf342bb7a041', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:16', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '110001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('1', '东方红新动力', '000480', '1.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '91%', '1', '2017-11-02 16:16:42', '5', '3', '89', '1', '110001', '六某某', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('10', '东方红睿逸定期开放', '001309', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '1', '2017-11-02 16:03:09', '5', '2', '89', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('11', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '1', '2017-08-04 00:00:00', '5', '3', '100', '1', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('1148ecc497da47cf9d4f316931dc81d2', '雪佛兰集团', '4654231', '1036100112', '2017-11-05 00:00:00', '2017-12-13 15:57:16', '78%', '1', '2017-11-09 17:26:41', '6', '4', '1', '1', '110001', '李某某', '13454543211', 'files/2017/11/01/14\\1d03208d-9407-43c7-906c-bc1d0ec7a92e.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('12', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '2', '2017-08-04 00:00:00', '5', '4', '190', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('13', '	东方蓝睿丰', '001205', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '1', '2017-08-04 00:00:00', '5', '4', '300', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('13437df1bd1849f4abe83b31213105b8', '三亚', 'A1000006', '2220', null, '2017-12-15 15:53:39', '69%', '1', '2017-12-08 10:58:48', '5', '1', null, '1', '110001', '秦', '5', 'files/2017/12/15/15\\7712c3a9-c932-4e0d-a32e-eac3c5becfd9.jpg', '1', '52d11d4a62004aaaa2b43e432ecfaf89', '2017-12-15 15:53:38', '0', null, '9天', '1份', '1月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('14', '东方黄睿丰', '001206', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '2', '2017-08-04 00:00:00', '5', '1', '500', '1', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('15', '东方红京东大数据', '001564', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '2', '2017-08-04 00:00:00', '5', '2', '600', '2', '110001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('2', '东方红新动力', '000480', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '2', '2017-08-04 00:00:00', '5', '2', '170', '2', '110002', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('24966c3f678b45be83b90b7a41157502', '河北汇海', '01', '632000', null, null, '12%', '1', '2017-11-30 09:03:29', '5', '1', null, '1', '110001', '李', '123', '\'NULL\'', '1', '6a7e6f30d2d44566ab1172569e28416c', null, '0', null, '12', '10', '3', '1', '150001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('2a0bf4c0a2ae496d8644d8a3af1b96c8', '中国电信', '1387931275', '220000', null, '2017-12-13 17:21:56', '2%', '1', '2017-11-24 11:01:40', '5', '1', null, '1', '150001', '王', '18762688773', 'files/2017/12/13/17\\45aa1130-4d24-4b48-8e9a-b8c40ea5971c.jpg', '3', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-13 17:21:49', '0', 'D:/apache-tomcat-7.0.79/webapps/XMJ/uploadFile/haozip_v5.9.5.exe', '3天', '1份', '3月', '1', '110012', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('2f62aff95c3348329a08dba7569545be', '发布时创建id', '1651323211', '12', '2017-10-31 00:00:00', '2017-12-01 15:54:26', '5%', '1', '2017-11-10 00:00:00', '5', '1', '8', '1', '110002', '伊', '10666668792', 'files/2017/11/29/17\\a863418d-be57-4873-8540-45f4b3e8c0df.jpg', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-29 17:19:47', '2', null, '65天', null, '1个月', '1', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, null);
INSERT INTO `bond_disposal` VALUES ('3', '东方红睿丰', '169101', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '1', '2017-08-04 00:00:00', '5', '3', '300', '1', '110002', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('3281feea6ad243fa9bb9d2cce391e7ca', '一想金融服务有限公司', 'A1000003', '256320', null, '2017-12-12 15:40:42', '12%', '1', '2017-12-08 09:14:33', '5', '1', null, '1', '110009', '张', '15933333333', '\'NULL\'', '2', '52d11d4a62004aaaa2b43e432ecfaf89', '2017-12-08 09:22:15', '2', null, '4', '120', '2', '1', '110010', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('36844f4d5c1644e595b7fe4594e6a8e2', '紫叶子', '2135432135', '167', '2017-11-01 00:00:00', '2017-12-13 15:57:16', '76%', '1', '2017-11-06 16:40:36', '5', '3', '29', '1', '110001', '陆', '1234446873', 'files/2017/11/06/15\\60b4a93e-21d2-46ed-819f-af0ae8535da5.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('3874dfc93c6d4315bccb075ff7fd126b', '11月6日', '97523452', '300', '2017-11-07 00:00:00', '2017-12-13 15:57:16', '89%', '1', '2017-11-06 00:00:00', '5', '4', '23', '1', '110001', '江一一', '13546632546', 'files/2017/11/06/09\\66f15baf-e496-4ed8-9a2b-c3dd1f09a3ff.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('3bd3ba4068eb4d97974be60048b471e7', '需要报名的资产', '3247832423', '65', '2017-11-21 00:00:00', '2017-12-13 15:57:16', '97%', '1', '2017-11-07 11:24:54', '5', '2', '11', '2', '110008', '浩', '1354889642', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('3cf02638e9aa4b0e96b4bdd85320eac7', 'aa1', 'qq', 'qq', '2017-11-16 00:00:00', '2017-12-13 15:57:16', 'qq%', '1', '2017-11-09 00:00:00', '6', '1', '14', '1', '110005', 'qqq', 'qq', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/委外表.xlsx', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('3d833e400920425aba01aa9ea2b31ab9', '千牛速贷', '95435454', '560000', null, '2017-12-11 10:28:32', '9%', '1', '2017-11-15 16:48:06', '7', '2', null, '1', '110001', '钱', '1', '\'NULL\'', '2', '620afbf9047442888a8db580baafb839', '2017-11-20 16:30:45', '1', null, '2-3个月', '59份', '2个月', '2', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('3e797c8423994650beb5f281e4d8c633', '河北汇海竞单', '001', '150000', null, '2017-12-06 10:44:04', '7%', '1', '2017-12-04 09:44:17', '5', '1', null, '2', '110007', '22222222', '3333333333333', '\'NULL\'', '2', '6a7e6f30d2d44566ab1172569e28416c', '2017-12-06 10:43:33', '0', null, '3', '15', '1', '1', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, null);
INSERT INTO `bond_disposal` VALUES ('3eb81824a932421d8296d16870e81a83', '哇哈哈', '12364312312', '65', '2017-11-20 00:00:00', '2017-12-13 15:57:16', '87%', '1', '2017-11-07 11:06:15', '6', '2', '-13', '2', '110004', '王', '17321373242', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('4', '东方红睿阳', '169201', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '1', '2017-11-02 14:32:49', '5', '4', '89', '2', '110006', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('48dd5aa1e20e4648a30414b7af97e978', '发布一条资产', 'A000001', '10000', null, null, '3%', '1', '2017-12-04 09:28:15', '5', '1', null, '1', '110001', '齐', '1222368456886654', '\'NULL\'', '1', '3eec968c9d47425cbd2d7f826bbf02ae', null, '0', null, '35天', '1份', '2个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('4cef9e18902d4d64a04dc6d4fe764d7d', '3A健康', '1231010123', '111', '2017-11-17 00:00:00', '2017-12-13 15:57:16', '87%', '1', '2017-11-06 16:40:07', '5', '3', '13', '2', '110006', '伊', '1336465746', 'files/2017/11/06/15\\6c8efb98-6499-4b08-b81e-76a39af51bf1.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('4f7349d83ad84184979256e4ca8988a2', '人人追', '1654651', '650000', null, '2017-11-29 16:44:51', '5%', '1', '2017-11-15 11:29:56', '6', '2', null, '2', '10005', '常', '135468794645', 'files/2017/11/29/16\\dd17d845-d4c2-4a22-93fb-ba6b298c10b2.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-29 16:44:51', '0', null, '65天', '1份', '3个月', '1', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, null);
INSERT INTO `bond_disposal` VALUES ('4fb75dbb8e7544138fbad0a60e3203c5', '自由舰管理', '00003', '132550', null, '2017-12-06 11:17:07', '10%', '1', '2017-12-06 09:53:50', '5', '1', null, '1', '160001', '张', '15698753698', 'files/2017/12/06/09\\e13cf55e-cc99-44d3-9be4-86e74a561f06.jpg', '2', '6a7e6f30d2d44566ab1172569e28416c', '2017-12-06 11:15:08', '1', 'D:\\apache-tomcat-7.0.79\\webapps\\XMJ/uploadFile/9375bc126382f1523d1ae21b11b16674.jpg', '7', '47', '2', '1', '110009', '0', '295d567846ac4e94a64a0e080e62ab4b', null, null);
INSERT INTO `bond_disposal` VALUES ('4ff10cc0179949a48575c0806fa792fd', '无', 'A1000008', '1350100', null, '2017-12-12 15:21:17', '20%', '1', '2017-12-12 15:06:47', '6', '2', null, '1', '20004', '吴', '13366666666', 'files/2017/12/12/15\\a2d499b8-13a7-4497-a3e0-31f20435256b.jpg', '2', '09bd15529b6a48d8a061f01e1ce211ba', '2017-12-12 15:07:31', '2', 'D:\\apache-tomcat-7.0.79\\webapps\\XMJ/uploadFile/b7bae37a5ffd6e50c98234d0f41a151b.jpg', '47天', '1', '1月', '1', '110015', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('5', '东方红睿元', '000970', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:16', '89%', '2', '2017-08-04 00:00:00', '5', '1', '20', '1', '110006', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('552731f2d6704e9c8c49684073cf332a', '瓶子', '99999999', '164', '2017-11-08 00:00:00', '2017-12-13 15:57:17', '78%', '1', '2017-11-10 00:00:00', '5', '3', '1', '2', '110006', '齐', '125463987', 'files/2017/11/30/08\\03ae0d0a-a804-4e17-9e50-3952f687bdc9.jpg', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-30 08:44:01', '0', null, '1月', null, '1个月', '1', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, null);
INSERT INTO `bond_disposal` VALUES ('556ed8d424864d739a025f76a4d757a8', '3S健康顾问', '123642723', '169', '2017-11-13 00:00:00', '2017-12-13 15:57:17', '85%', '1', '2017-11-07 09:23:34', '6', '3', '9', '2', '110006', '齐', '15643332546', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('55f7b4f8f6014a1d905cb7f5c9c85272', '东方一气大众', '10011', '2500000', '2017-10-03 00:00:00', '2017-12-13 15:57:17', '75%', '1', '2017-11-01 15:06:26', '5', '4', '29', '1', '110006', '刘某某', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('5a45dab3531e417f8fe498b4ca7d3ae9', '147369', 'A000002', '1', null, '2017-12-04 10:04:53', '1%', '1', '2017-12-04 09:50:44', '5', '1', null, '1', '110001', '22222222222', '111111111', '\'NULL\'', '2', '6a7e6f30d2d44566ab1172569e28416c', '2017-12-04 09:50:59', '2', null, '25天', '1份', '2月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('5da449ff82694c2e84dcbe48840bee2f', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '300001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('5e4644a5c8a442f7b43a2240c39db881', '饼子', '1232399562331', '63', '2017-11-02 00:00:00', '2017-12-13 15:57:17', '98%', '1', '2017-11-10 09:04:11', '5', '2', '21', '1', '300001', '那', '1231561', 'files/2017/11/10/09\\e06aca66-f548-47f3-9c1d-602e33dc793d.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:17', '89%', '1', '2017-08-04 00:00:00', '5', '2', '170', '2', '300001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6359879020494fc5a211cad0c0867e33', '芝麻', '6541613212', '11', '2017-10-29 00:00:00', '2017-12-13 15:57:17', '96%', '1', '2017-11-07 00:00:00', '5', '1', '25', '2', '300001', '候', '1354896532', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('636bb1d2745f4f92bc50688c282fd422', '36524连锁餐饮', '1234567', '600000', '2017-10-11 00:00:00', '2017-12-13 15:57:17', '76%', '1', '2017-11-01 15:39:50', '5', '2', '21', '1', '300001', '林某某', '13334561236', 'files/2017/10/23/11\\1e12d6f8-c2ba-4882-955d-d1a7c6d613aa.jpg', '2', null, null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('662a97021a744b5fb43f7d97952f3965', '黄金季节', '123121', '132', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '67%', '1', '2017-11-06 00:00:00', '5', '3', '9', '1', '300001', '尽', '136563226912', 'files/2017/11/06/15\\f3d7ccc2-e1de-41ec-9497-1c8488c51125.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('680cf07acb8b4191a47063db501c4735', '3A健康', '1231010123', '111', '2017-11-17 00:00:00', '2017-12-13 15:57:17', '87%', '1', '2017-11-06 16:39:18', '5', '3', '13', '2', '300001', '伊', '1336465746', 'files/2017/11/06/15\\9e95cc81-dc7d-4b6f-a7f6-80b56e46a073.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6ab67dc082204101883baf36d05921d3', '芝麻', '6541613212', '11', '2017-10-29 00:00:00', '2017-12-13 15:57:17', '96%', '1', '2017-11-07 00:00:00', '5', '1', '25', '2', '300001', '候', '1354896532', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6bc860636da948209da5b3895aa0015a', 'aa3', 'a', 'a', '2017-11-05 00:00:00', '2017-12-13 15:57:17', 'a%', '1', '2017-11-09 00:00:00', '6', '1', '25', '1', '300001', 'a', 'a', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/问题描述.docx', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6cce6ab3fbb04255842423c70e6ca9da', '2', '2', '2', '2017-11-07 00:00:00', '2017-12-13 15:57:17', '2%', '1', '2017-11-08 00:00:00', '6', '1', '7', '1', '300001', '2', '2', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/新建文本文档.txt', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6d9e0dc7f2224955bc36689f8a4deca4', 'aa2', 'ww', 'ww', '2017-11-10 00:00:00', '2017-12-13 15:57:17', 'ww%', '1', '2017-11-09 00:00:00', '6', '1', '13', '1', '300001', 'ww', 'ww', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/jquery兄弟节点.txt', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6dd844c709064ce5be0b8011a37cb18b', '发布时创建id', '1651323211', '12', '2017-10-31 00:00:00', '2017-12-13 15:57:17', '54%', '1', '2017-11-10 00:00:00', '6', '1', '8', '1', '300001', '伊', '10666668792', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('6f349680cf2c4a37b284cb4b08483afc', '安安', '2354352', 'aa', '2017-11-15 00:00:00', '2017-12-07 16:08:43', 'aa%', '1', '2017-11-09 00:00:00', '6', '1', '15', '1', '300001', 'aa', 'aa', 'files/2017/12/07/16\\8b1f2be9-5bdd-498b-8afd-d05d8c698843.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-07 16:08:15', '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/位面电梯.zip', '32天', '1份', '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('7', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:17', '89%', '2', '2017-08-04 00:00:00', '5', '3', '350', '1', '300001', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('70144f1f1a9643f0bdcf73c4919ec7b0', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '300001', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('7e57bc0785aa46edaf0710c8ace7b55b', '湖南发财金融', 'A1000009', '1713250', null, '2017-12-14 14:24:49', '15%', '1', '2017-12-14 14:24:11', '5', '1', null, '1', '160008', '李', '17722222222', '\'NULL\'', '2', '29829c5cf32a4ee8895a57131beb93f3', '2017-12-14 14:24:45', '0', null, '49天', '47', '5月', '1', '110003', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('7f6b11a28d604f70831579a7456768cf', '需要接单的资产', '1236745843', '110', '2017-11-07 00:00:00', '2017-12-13 15:57:17', '76%', '1', '2017-11-07 11:25:03', '5', '3', '17', '1', '30012', '江', '136544329555', '\'NULL\'', '2', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('8', '东方红睿轩沪港深', '169103', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:17', '89%', '2', '2017-08-04 00:00:00', '5', '4', '710', '2', '30012', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('8133ff3a3b9f461fb0171209d3e93431', '安安', '2354352', 'aa', '2017-11-15 00:00:00', '2017-12-13 15:57:17', 'aa%', '1', '2017-11-09 00:00:00', '6', '1', '15', '1', '30012', 'aa', 'aa', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/位面电梯.zip', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('823994348a064503bbb83eca8047d253', '绿叶子有限公司', '16412121', '800000', '2017-09-12 00:00:00', '2017-12-13 15:57:17', '76%', '1', '2017-11-01 14:57:13', '5', '2', '63', '2', '30012', '叶某某', '11215423541', 'files/2017/10/31/10\\45c991a8-6dde-4fd6-aa0d-d885a12e5a1f.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-14 14:48:35', '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('8df2581d5e80484c98d40d6aa49603a1', '1', '1', '1', '2017-11-09 00:00:00', '2017-12-13 15:57:17', '1%', '1', '2017-11-08 00:00:00', '6', '1', '-2', '1', '30012', '1', '1', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'files/2017/11/08/16\\23b2a3e9-f7a0-4b60-af2d-9334bce3f4a0.txt', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('8f8e96d5bb434309aeb79ed4d7667905', '数码世纪', '8962136782', '154', '2017-11-07 00:00:00', '2017-12-13 15:57:17', '69%', '1', '2017-11-07 00:00:00', '5', '3', '22', '1', '30012', '金', '1568453132131', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('9', '东方红稳健精选C', '001204', '123.3123.00', '2017-08-04 00:00:00', '2017-12-13 15:57:17', '89%', '1', '2017-08-04 00:00:00', '5', '1', '20', '1', '30012', '\'NULL\'', '\'NULL\'', '\'NULL\'', '2', null, null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('98449b4db0814f2ca8a482fcb741668e', '石家庄农业银行资产包', '1221221135421', '25000', null, '2017-11-29 16:53:13', '7%', '1', '2017-11-24 08:55:35', '5', '1', null, '1', '30012', '刘经理', '12559876543212', 'files/2017/11/29/14\\bb7eba42-bd07-4a6d-adaa-d96d01775806.jpg', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-29 14:44:27', '1', null, '1-2个月', '60份', '3个月', '2', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, null);
INSERT INTO `bond_disposal` VALUES ('a29df537174e485b92e33486d5ed7e0e', '时间进去', '4456', '48', '2017-12-01 00:30:00', '2017-12-13 15:57:17', '65%', '1', '2017-11-10 00:00:00', '6', '1', '7', '1', '30012', '12', '12', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('a92e0e743a39433ea8a24086a3163187', '工商', '39644561231', '110000', null, '2017-12-01 09:28:42', '5%', '1', '2017-11-24 09:02:13', '5', '1', null, '1', '130004', '何经理', '13546879542', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-24 09:11:07', '2', null, '1个月', '1份', '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('b0ecd8e24414495294d6629dafc92fdc', '需要报名的资产', '3247832423', '65', '2017-11-21 00:00:00', '2017-12-13 15:57:17', '97%', '1', '2017-11-07 00:00:00', '5', '2', '11', '2', '30012', '浩', '1354889642', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('b2c16ebd84c54e16a37f708c16ff9f42', '货到付款资产包', '123987785', '560000', null, '2017-11-29 16:47:32', '6%', '1', '2017-11-16 09:50:47', '5', '2', null, '2', '110004', '仓', '1234569', 'files/2017/11/29/16\\a9ebafb7-ed12-4dc8-90e1-0384e5fa2ee6.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', '2017-11-29 16:47:32', '0', null, '2-4个月', '56份', '2个月', '2', '110001', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, null);
INSERT INTO `bond_disposal` VALUES ('b3406a26b3f54d319d2128e156598a02', 'aa3', 'ee', 'ee', '2017-11-02 00:00:00', '2017-12-13 15:57:17', 'ee%', '1', '2017-11-09 00:00:00', '6', '1', '8', '1', '30012', 'ee', 'ee', '\'NULL\'', '1', '620afbf9047442888a8db580baafb839', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/资产包.xls', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('b6b48373db01441c85be78671ce53fb2', '宜而爽有限公司', '123456', '1060000', '2017-10-13 00:00:00', '2017-12-13 15:57:17', '65%', '1', '2017-10-27 15:21:06', '6', '3', '14', '1', '40009', '王某某', '15613123151', 'D:\\eclipse-luna\\apache-tomcat-7.0.79\\wtpwebapps\\HhXmj\\files\\2017\\10\\23\\10\\954257e2-0f9e-425b-af44-19c2735b8b4f.jpg', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('b9279ecc21344940b52591dd7213749a', '灌灌灌灌灌', '001', '50', '2017-11-16 00:00:00', '2017-12-13 15:57:17', '10%', '1', '2017-11-10 00:00:00', '5', '3', '14', '1', '40009', '啧啧啧', '123', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('ba1df9ed15f247d6a771cd0df9c5d2ce', '绿洲闪贷资产包', '12365555', '30000', null, '2017-11-28 16:44:32', '4%', '1', '2017-11-15 10:33:28', '7', '2', null, '2', '10004', '开', '13565548754', '\'NULL\'', '2', 'b7494ab7e2244db7971ab6ac62966b7d', '2017-11-21 10:06:07', '0', null, '2~3个月', '105份', '3个月', '2', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('bf1a882414984d6ab031140cc8e7b756', '西瓜', '5421321852', '75', '2017-11-08 00:00:00', '2017-12-13 15:57:17', '90%', '1', '2017-11-07 00:00:00', '5', '2', '22', '2', '40009', '洪', '135788888965', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, '1月', null, '1个月', '2', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('c41d9df6073d46c481276a07a1f47fb5', '蒙牛集团', '62341232434', '45', '2017-11-07 00:00:00', '2017-12-13 16:51:47', '98%', '1', '2017-11-14 14:49:47', '5', '1', '7', '1', '140002', '王', '15000000000', 'files/2017/12/13/16\\6ab982da-0bec-412d-aea6-8853f30de4c2.jpg', '2', 'da8c252c6672450db9a4af267aa5e6ad', '2017-12-13 16:51:40', '1', 'D:/apache-tomcat-7.0.79/webapps/XMJ/uploadFile/新建文本文档.txt', '1天', '1份', '1月', '2', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('c4952624d7e24edba241f77d7caedf2c', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '40009', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '2', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('c774723894e945cbb382b972a7d5fa36', '信息付', '001', '1000000', null, '2017-11-30 14:30:11', '10%', '1', '2017-11-29 11:03:19', '5', '1', null, '1', '110001', '姚', '123', '\'NULL\'', '1', '6a7e6f30d2d44566ab1172569e28416c', '2017-11-30 14:29:20', '0', null, '30', '1份', '3个月', '1', '150001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('caa0191a5f1b46bba72d07e943f47044', '中国银行', '1245648', '120000', null, '2017-11-28 16:44:32', '8%', '1', '2017-11-24 09:46:26', '5', '1', null, '1', '110001', '周', '15324745454', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', '2017-11-24 11:58:28', '1', null, '2个月', '1份', '3个月', '1', '120006', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('cb04ea3d332f484b90c10b9447679192', '表', '11111', '32', '2017-11-08 00:00:00', '2017-12-13 15:57:17', '76%', '1', '2017-11-08 00:00:00', '6', '1', '8', '2', '40009', '机', '13694545', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('e046b38b48e54a9f894033f70a383de7', '汇海金融', 'A1000007', '1', null, '2017-12-15 14:39:48', '1%', '1', '2017-12-12 14:32:19', '5', '1', null, '1', '10001', '1', '13000000000', 'files/2017/12/15/14\\172f8a21-e3a0-4590-84f8-61177571049b.jpg', '1', 'b77de81542834a6aa659616d3487e367', '2017-12-15 14:39:47', '0', null, '89天', '1份', '1月', '1', '10001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('e16d5d7b6bef4b51b96a61982d2e39d4', '啊', '8343245', '123', '2017-10-30 00:00:00', '2017-12-13 15:57:17', '43%', '1', '2017-11-10 00:00:00', '6', '1', '16', '1', '40009', '山东省', ' ', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', 'D:\\apache-tomcat-7.0.79\\webapps\\HhXmj/uploadFile/577ccb8012597.jpg', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('e343845df63c48abae9e0ddbd6014fed', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '40009', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', 'files/2017/11/08/16\\147e2484-0550-49cf-8bd0-bd0a68cd31e5.txt', '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('e60d3f949ef54031b087d1408dcfc146', '附件', '12312161', '59', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '94%', '1', '2017-11-08 00:00:00', '6', '2', '10', '1', '40009', '克', '13669994522', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('e9edc62e84f34b44a6b541c4a6179863', '河北汇海', '001', '150000', null, '2017-12-04 09:44:46', '7%', '1', '2017-12-04 09:43:26', '5', '1', null, '1', '110007', '22222222', '3333333333333', '\'NULL\'', '2', '6a7e6f30d2d44566ab1172569e28416c', '2017-12-04 09:44:08', '0', null, '3', '15', '1', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('eac1a016b1b448f6bd0aa80678fd2928', '橘黄', '16568345', '34', '2017-11-16 00:00:00', '2017-12-13 15:57:17', '95%', '1', '2017-11-07 00:00:00', '5', '1', '8', '1', '40009', '炎', '13255874521', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('eb834d3dc41d43da916f9d46f0385636', '11月6号', '964223842', '160', '2017-11-15 00:00:00', '2017-12-13 15:57:17', '68%', '1', '2017-11-06 00:00:00', '5', '3', '15', '2', '40009', '历某某', '16354786322', 'files/2017/11/06/10\\b6e4856c-7866-476b-a0ea-b8506acb637d.jpg', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('eb94e2d54a7e421ca0bd726e2451e4de', '验证发布人id', '1235465', '64', '2017-11-14 00:00:00', '2017-12-13 15:57:17', '75%', '1', '2017-11-07 00:00:00', '5', '2', '2', '1', '40009', '伊', '161123644554', '\'NULL\'', '2', '5d04c8a7a9994a5eb647e91b719cee66', null, '1', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('f55961b299e04dc49f864272668f725b', '东丰日产', '45454', '650000', '2017-11-07 00:00:00', '2017-12-13 15:57:17', '65%', '1', '2017-11-01 15:43:43', '5', '2', '18', '1', '40009', '\'NULL\'', '\'NULL\'', '\'NULL\'', '1', null, null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('fbdf4899d5df4c599a89bcd5ff9e10e6', '西瓜', '5421321852', '75', '2017-11-08 00:00:00', '2017-12-13 15:57:17', '90%', '1', '2017-11-07 00:00:00', '5', '2', '22', '2', '40009', '洪', '135788888965', '\'NULL\'', '1', '5d04c8a7a9994a5eb647e91b719cee66', null, '0', null, '1月', null, '1个月', '1', '110001', null, null, null, null);
INSERT INTO `bond_disposal` VALUES ('fe95fb3626cf4e2a8c9a9373894777b5', '3S健康顾问', '123642723', '169', '2017-11-13 00:00:00', '2017-12-13 15:57:17', '85%', '1', '2017-11-07 00:00:00', '6', '3', '9', '2', '40009', '齐', '15643332546', '\'NULL\'', '1', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', null, '1月', null, '1个月', '2', '110005', null, null, null, null);

-- ----------------------------
-- Table structure for bond_number
-- ----------------------------
DROP TABLE IF EXISTS `bond_number`;
CREATE TABLE `bond_number` (
  `bond_asset_number_id` int(11) NOT NULL,
  `bond_deal` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bond_asset_number_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bond_number
-- ----------------------------
INSERT INTO `bond_number` VALUES ('1', '单笔资产', '10');
INSERT INTO `bond_number` VALUES ('2', '资产包', '3');

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
INSERT INTO `bond_sheet` VALUES ('00824d4984c045dd9c85ec980633ff24', '3S健康顾问', '123642723', '2017-11-07 00:00:00', 'a1', 'a1', 'a1', 'a1', 'a1', 'null\\null', null, 'db5f327f80ff41a8b1d5536d83d816ef', '1', null, null, 'fe95fb3626cf4e2a8c9a9373894777b5');
INSERT INTO `bond_sheet` VALUES ('052e0805f6294b29bc1908d7c6663c0e', '灌灌灌灌灌', '001', '2017-11-10 00:00:00', '111', '个人', '啊', '456', null, 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', 'db5f327f80ff41a8b1d5536d83d816ef', '2', null, null, 'b9279ecc21344940b52591dd7213749a');
INSERT INTO `bond_sheet` VALUES ('0d3dca5806134b0bbcf7e248251f15bc', '饼子', '1232399562331', '2017-11-10 00:00:00', '面', '1', '1', '1', '1', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', 'db5f327f80ff41a8b1d5536d83d816ef', '2', null, null, '5e4644a5c8a442f7b43a2240c39db881');
INSERT INTO `bond_sheet` VALUES ('0e76f0612248491193a242b30efa58cd', '水木公司', '495453212', '2017-11-03 00:00:00', '太平洋投资公司', '国企', '海某某', '113121312123', '电催', 'files/2017/11/03/10\\9cfcb326-9569-4f3a-b289-891d1426f28b.jpg', null, 'db5f327f80ff41a8b1d5536d83d816ef', '1', null, null, '0506e5b2f72e4d6d99f5dd0ad0fe6010');
INSERT INTO `bond_sheet` VALUES ('1234567', '人人追123', '1654651', '2017-11-29 16:45:42', '超人', '公司', '超人', 'admin', '', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '2', '1', '2018-02-27 00:00:00', '4f7349d83ad84184979256e4ca8988a2');
INSERT INTO `bond_sheet` VALUES ('1597753155', '人人追asd', '1654651', '2017-11-29 16:45:42', '超人', '公司', '超人', 'admin', '', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '1', '1', '2018-02-27 00:00:00', '');
INSERT INTO `bond_sheet` VALUES ('277473f4ce934a959fa2cc6d16368ebd', '东方红稳健精选C', '001204', '2017-11-09 00:00:00', '征信', null, '李', '123', null, 'null\\null', null, 'db5f327f80ff41a8b1d5536d83d816ef', null, null, null, '9');
INSERT INTO `bond_sheet` VALUES ('2819cac6cb9d47a4bf0866aaa13d73a4', '中国联通', '135465213', '2017-11-28 00:00:00', '111111111111', '1', '11111111111', '2222', null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', 'a8a003597b784f7cacfa188f64b4418f', '1', '1', '2018-01-27 00:00:00', 'c950f06ac2974832a7812e7377a15acf');
INSERT INTO `bond_sheet` VALUES ('3522c92850e3482c9ca9916037413856', '工商', '39644561231', '2017-11-30 00:00:00', '22222222', '1', '222222222', '22222222222222', null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', 'a8a003597b784f7cacfa188f64b4418f', '1', '1', '2017-12-30 00:00:00', 'a92e0e743a39433ea8a24086a3163187');
INSERT INTO `bond_sheet` VALUES ('3f0c72a1ab3a43658e9e5e524ae99644', '健康饮品', '4154211', '2017-11-21 00:00:00', '6', '1', '7', '8', null, 'files/2017/11/21/14\\460cf18c-7227-47b3-a0e5-60ba62b13806.jpg', 'da8c252c6672450db9a4af267aa5e6ad', '620afbf9047442888a8db580baafb839', null, '1', '2018-02-19 00:00:00', '43fefcc3e5a641ffa82eea1a29b08ac0');
INSERT INTO `bond_sheet` VALUES ('3f2926ea2f9446198996dba518fa67b9', '自由舰管理', '00003', '2017-12-06 11:16:36', '廊坊加盟方', '公司', '廊坊加盟方', 'langfang123', null, 'null\\null', '6a7e6f30d2d44566ab1172569e28416c', '295d567846ac4e94a64a0e080e62ab4b', '1', '1', '2018-02-04 00:00:00', '4fb75dbb8e7544138fbad0a60e3203c5');
INSERT INTO `bond_sheet` VALUES ('4326aeb6bfab4581bc4950e45dffd02d', '绿叶子有限公司', '16412121', '2017-10-31 00:00:00', '绿色健康集团', '国企', '洪某某', '13646521359', '电催', null, null, 'db5f327f80ff41a8b1d5536d83d816ef', null, null, null, '823994348a064503bbb83eca8047d253');
INSERT INTO `bond_sheet` VALUES ('4820ba21d94148d18afd2ece54caeb83', '紫叶子', '2135432135', '2017-11-06 00:00:00', '2', '2', '2', '2', '2', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', 'db5f327f80ff41a8b1d5536d83d816ef', null, null, null, '36844f4d5c1644e595b7fe4594e6a8e2');
INSERT INTO `bond_sheet` VALUES ('7ae24e5da7524da4a11c8f1f6f21ff72', '石家庄农业银行资产包', '1221221135421', '2017-11-29 00:00:00', 'QQ群', '1', '王', '44444444444444', null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', 'a8a003597b784f7cacfa188f64b4418f', '2', '1', '2018-02-27 00:00:00', '98449b4db0814f2ca8a482fcb741668e');
INSERT INTO `bond_sheet` VALUES ('7b5caa6f2fbb4e1cb8fb108238e1dd90', '1111', '111', '2017-11-22 00:00:00', '征信2', '1', '李', '123', null, 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', '9c16bab259d24e8ba64f0374bb8d3bb0', '1', '1', '2018-01-21 00:00:00', '0e90be671efb4025844677087d60107b');
INSERT INTO `bond_sheet` VALUES ('ad486a4a9999460ba399656e28f7709c', '发布时创建id', '1651323211', '2017-11-29 17:20:25', '超人', '公司', '超人', 'admin', null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', 'da8c252c6672450db9a4af267aa5e6ad', null, '1', '2017-12-29 00:00:00', '2f62aff95c3348329a08dba7569545be');
INSERT INTO `bond_sheet` VALUES ('adbffc4ff7f64bcfa5cd4f02c6c2afe4', '千牛速贷', '95435454', '2017-11-17 00:00:00', '汇海金融', '自营', '王经理', '123456789987', '电催', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', '620afbf9047442888a8db580baafb839', '2', '1', '2018-01-16 00:00:00', '3d833e400920425aba01aa9ea2b31ab9');
INSERT INTO `bond_sheet` VALUES ('b15eb2d076334adea261684fb8ad1f01', '货到付款', '65488996324', '2017-11-17 00:00:00', '河北会海', '自营', '王经理', '1', '电催', 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', '620afbf9047442888a8db580baafb839', '1', '1', '2018-01-16 00:00:00', '68728d285eea4baaa38cac1a67c65851');
INSERT INTO `bond_sheet` VALUES ('b67c52c202e3403f9517631737a566ad', '中国银行', '1245648', '2017-11-28 00:00:00', '22222222', '1', '22222222', '22222222222', null, 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', 'a8a003597b784f7cacfa188f64b4418f', '1', '1', '2018-02-26 00:00:00', 'caa0191a5f1b46bba72d07e943f47044');
INSERT INTO `bond_sheet` VALUES ('bb88e2d9798d431b9919b596c8a705ce', '3S健康顾问', '123642723', '2017-11-23 16:03:33', 'a1', 'a1', 'a1', 'a1', null, 'null\\null', 'da8c252c6672450db9a4af267aa5e6ad', 'db5f327f80ff41a8b1d5536d83d816ef', '2', '1', '2017-12-23 00:00:00', 'fe95fb3626cf4e2a8c9a9373894777b5');
INSERT INTO `bond_sheet` VALUES ('c26d00e6d3434f2e801f2dde989f4acc', '147369', 'A000002', '2017-12-04 00:00:00', '1111111111', '1', '22222222222', '2233333333333', null, 'null\\null', '6a7e6f30d2d44566ab1172569e28416c', 'a8a003597b784f7cacfa188f64b4418f', '1', '1', '2018-02-02 00:00:00', '5a45dab3531e417f8fe498b4ca7d3ae9');
INSERT INTO `bond_sheet` VALUES ('efa3e81543c34868bd240a88df9d9edf', '无', 'A1000008', '2017-12-12 00:00:00', '光明律师事务所', '1', '魏', '13755555555', null, 'files/2017/12/12/15\\a9a4777a-197e-4a7b-95c7-bf39a67d51f7.jpg', '09bd15529b6a48d8a061f01e1ce211ba', '9382137e350442dfadd04787a1187e45', '1', '1', '2018-01-11 00:00:00', '4ff10cc0179949a48575c0806fa792fd');
INSERT INTO `bond_sheet` VALUES ('fc6f9289e3a34628a4efd1db6f04a018', '一想金融服务有限公司', 'A1000003', '2017-12-12 00:00:00', '2', '1', '2', '2', null, 'files/2017/12/12/13\\686d79cd-dc84-46a4-b534-6396f4c6ce62.jpg', '52d11d4a62004aaaa2b43e432ecfaf89', 'da8c252c6672450db9a4af267aa5e6ad', '1', '1', '2018-02-10 00:00:00', '3281feea6ad243fa9bb9d2cce391e7ca');
INSERT INTO `bond_sheet` VALUES ('fc7bf2f73b1749da9b996094987483ee', '需要接单的资产', '1236745843', '2017-11-07 00:00:00', 'x1', 'x1', 'x1', 'x1', 'x1', 'null\\null', '5d04c8a7a9994a5eb647e91b719cee66', 'db5f327f80ff41a8b1d5536d83d816ef', null, null, null, '7f6b11a28d604f70831579a7456768cf');
INSERT INTO `bond_sheet` VALUES ('fcfccdcfd33e4f5d971ebad3c6fd1700', '2', '2', '2017-11-02 00:00:00', '2', '2', '2', '2', '2', 'files/2017/11/02/11\\3a348e5f-42a1-455a-b4c3-3449dd13b370.jpg', null, 'db5f327f80ff41a8b1d5536d83d816ef', null, null, null, '6cce6ab3fbb04255842423c70e6ca9da');

-- ----------------------------
-- Table structure for bond_site
-- ----------------------------
DROP TABLE IF EXISTS `bond_site`;
CREATE TABLE `bond_site` (
  `bond_site_id` varchar(36) NOT NULL COMMENT '地址本身的id',
  `bond_site_pid` varchar(36) NOT NULL COMMENT '上一级的id',
  `bond_location_name` varchar(255) DEFAULT NULL COMMENT '地址名',
  `bond_site_state` tinyint(4) DEFAULT NULL COMMENT '状态：0有效 1无效',
  `join_site` tinyint(4) DEFAULT '0' COMMENT '加盟：0_未被加盟,1_已经加盟',
  PRIMARY KEY (`bond_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bond_site
-- ----------------------------
INSERT INTO `bond_site` VALUES ('10000', '0', ' 北京市', '0', '0');
INSERT INTO `bond_site` VALUES ('100000', '0', ' 海南省', '0', '0');
INSERT INTO `bond_site` VALUES ('100001', '100000', '海口', '0', '0');
INSERT INTO `bond_site` VALUES ('100002', '100000', '儋县', '0', '0');
INSERT INTO `bond_site` VALUES ('100003', '100000', '陵水', '0', '0');
INSERT INTO `bond_site` VALUES ('100004', '100000', '琼海', '0', '0');
INSERT INTO `bond_site` VALUES ('100005', '100000', '三亚', '0', '0');
INSERT INTO `bond_site` VALUES ('100006', '100000', '通什', '0', '0');
INSERT INTO `bond_site` VALUES ('100007', '100000', '万宁', '0', '0');
INSERT INTO `bond_site` VALUES ('10001', '10000', '东城', '0', '0');
INSERT INTO `bond_site` VALUES ('10002', '10000', '西城', '0', '0');
INSERT INTO `bond_site` VALUES ('10003', '10000', '崇文', '0', '0');
INSERT INTO `bond_site` VALUES ('10004', '10000', '宣武', '0', '0');
INSERT INTO `bond_site` VALUES ('10005', '10000', '朝阳', '0', '0');
INSERT INTO `bond_site` VALUES ('10006', '10000', '丰台', '0', '0');
INSERT INTO `bond_site` VALUES ('10007', '10000', '石景山', '0', '0');
INSERT INTO `bond_site` VALUES ('10008', '10000', '海淀', '0', '0');
INSERT INTO `bond_site` VALUES ('10009', '10000', '门头沟', '0', '0');
INSERT INTO `bond_site` VALUES ('10010', '10000', '房山', '0', '0');
INSERT INTO `bond_site` VALUES ('10011', '10000', '通州', '0', '0');
INSERT INTO `bond_site` VALUES ('10012', '10000', '顺义', '0', '0');
INSERT INTO `bond_site` VALUES ('10013', '10000', '昌平', '0', '0');
INSERT INTO `bond_site` VALUES ('10014', '10000', '大兴', '0', '0');
INSERT INTO `bond_site` VALUES ('10015', '10000', '平谷', '0', '0');
INSERT INTO `bond_site` VALUES ('10016', '10000', '怀柔', '0', '0');
INSERT INTO `bond_site` VALUES ('10017', '10000', '密云', '0', '0');
INSERT INTO `bond_site` VALUES ('10018', '10000', '延庆', '0', '0');
INSERT INTO `bond_site` VALUES ('1002', '1', '没填地址', '0', '0');
INSERT INTO `bond_site` VALUES ('110000', '0', ' 河北省', '0', '0');
INSERT INTO `bond_site` VALUES ('110001', '110000', '石家庄', '0', '1');
INSERT INTO `bond_site` VALUES ('110002', '110000', '唐山', '0', '0');
INSERT INTO `bond_site` VALUES ('110003', '110000', '秦皇岛', '0', '0');
INSERT INTO `bond_site` VALUES ('110004', '110000', '邯郸', '0', '0');
INSERT INTO `bond_site` VALUES ('110005', '110000', '邢台', '0', '1');
INSERT INTO `bond_site` VALUES ('110006', '110000', '保定', '0', '0');
INSERT INTO `bond_site` VALUES ('110007', '110000', '张家口', '0', '0');
INSERT INTO `bond_site` VALUES ('110008', '110000', '承德', '0', '0');
INSERT INTO `bond_site` VALUES ('110009', '110000', '沧州', '0', '0');
INSERT INTO `bond_site` VALUES ('110010', '110000', '廊坊', '0', '1');
INSERT INTO `bond_site` VALUES ('110011', '110000', '衡水', '0', '0');
INSERT INTO `bond_site` VALUES ('120000', '0', ' 黑龙江', '0', '0');
INSERT INTO `bond_site` VALUES ('120001', '120000', '哈尔滨', '0', '0');
INSERT INTO `bond_site` VALUES ('120002', '120000', '齐齐哈尔', '0', '0');
INSERT INTO `bond_site` VALUES ('120003', '120000', '佳木斯', '0', '0');
INSERT INTO `bond_site` VALUES ('120004', '120000', '鹤岗', '0', '0');
INSERT INTO `bond_site` VALUES ('120005', '120000', '大庆', '0', '0');
INSERT INTO `bond_site` VALUES ('120006', '120000', '鸡西', '0', '0');
INSERT INTO `bond_site` VALUES ('120007', '120000', '双鸭山', '0', '0');
INSERT INTO `bond_site` VALUES ('120008', '120000', '伊春', '0', '0');
INSERT INTO `bond_site` VALUES ('120009', '120000', '牡丹江', '0', '0');
INSERT INTO `bond_site` VALUES ('120010', '120000', '黑河', '0', '0');
INSERT INTO `bond_site` VALUES ('120011', '120000', '七台河', '0', '0');
INSERT INTO `bond_site` VALUES ('120012', '120000', '绥化', '0', '0');
INSERT INTO `bond_site` VALUES ('120013', '120000', '大兴安岭地区', '0', '0');
INSERT INTO `bond_site` VALUES ('130000', '0', ' 河南省', '0', '0');
INSERT INTO `bond_site` VALUES ('130001', '130000', '郑州', '0', '1');
INSERT INTO `bond_site` VALUES ('130002', '130000', '安阳', '0', '0');
INSERT INTO `bond_site` VALUES ('130003', '130000', '鹤壁', '0', '0');
INSERT INTO `bond_site` VALUES ('130004', '130000', '潢川', '0', '0');
INSERT INTO `bond_site` VALUES ('130005', '130000', '焦作', '0', '0');
INSERT INTO `bond_site` VALUES ('130006', '130000', '济源', '0', '0');
INSERT INTO `bond_site` VALUES ('130007', '130000', '开封', '0', '0');
INSERT INTO `bond_site` VALUES ('130008', '130000', '漯河', '0', '0');
INSERT INTO `bond_site` VALUES ('130009', '130000', '洛阳', '0', '0');
INSERT INTO `bond_site` VALUES ('130010', '130000', '南阳', '0', '0');
INSERT INTO `bond_site` VALUES ('130011', '130000', '平顶山', '0', '0');
INSERT INTO `bond_site` VALUES ('130012', '130000', '濮阳', '0', '0');
INSERT INTO `bond_site` VALUES ('130013', '130000', '三门峡', '0', '0');
INSERT INTO `bond_site` VALUES ('130014', '130000', '商丘', '0', '0');
INSERT INTO `bond_site` VALUES ('130015', '130000', '新乡', '0', '0');
INSERT INTO `bond_site` VALUES ('130016', '130000', '信阳', '0', '0');
INSERT INTO `bond_site` VALUES ('130017', '130000', '许昌', '0', '0');
INSERT INTO `bond_site` VALUES ('130018', '130000', '周口', '0', '0');
INSERT INTO `bond_site` VALUES ('130019', '130000', '驻马店', '0', '0');
INSERT INTO `bond_site` VALUES ('140000', '0', ' 香港', '0', '0');
INSERT INTO `bond_site` VALUES ('140001', '140000', '香港', '0', '0');
INSERT INTO `bond_site` VALUES ('140002', '140000', '九龙', '0', '0');
INSERT INTO `bond_site` VALUES ('140003', '140000', '新界', '0', '0');
INSERT INTO `bond_site` VALUES ('150000', '0', ' 湖北省', '0', '0');
INSERT INTO `bond_site` VALUES ('150001', '150000', '武汉', '0', '1');
INSERT INTO `bond_site` VALUES ('150002', '150000', '恩施', '0', '0');
INSERT INTO `bond_site` VALUES ('150003', '150000', '鄂州', '0', '0');
INSERT INTO `bond_site` VALUES ('150004', '150000', '黄冈', '0', '0');
INSERT INTO `bond_site` VALUES ('150005', '150000', '黄石', '0', '0');
INSERT INTO `bond_site` VALUES ('150006', '150000', '荆门', '0', '0');
INSERT INTO `bond_site` VALUES ('150007', '150000', '荆州', '0', '0');
INSERT INTO `bond_site` VALUES ('150008', '150000', '潜江', '0', '0');
INSERT INTO `bond_site` VALUES ('150009', '150000', '十堰', '0', '0');
INSERT INTO `bond_site` VALUES ('150010', '150000', '随州', '0', '0');
INSERT INTO `bond_site` VALUES ('150011', '150000', '武穴', '0', '0');
INSERT INTO `bond_site` VALUES ('150012', '150000', '仙桃', '0', '0');
INSERT INTO `bond_site` VALUES ('150013', '150000', '咸宁', '0', '0');
INSERT INTO `bond_site` VALUES ('150014', '150000', '襄阳', '0', '0');
INSERT INTO `bond_site` VALUES ('150015', '150000', '襄樊', '0', '0');
INSERT INTO `bond_site` VALUES ('150016', '150000', '孝感', '0', '0');
INSERT INTO `bond_site` VALUES ('150017', '150000', '宜昌', '0', '0');
INSERT INTO `bond_site` VALUES ('160000', '0', ' 湖南省', '0', '0');
INSERT INTO `bond_site` VALUES ('160001', '160000', '长沙', '0', '0');
INSERT INTO `bond_site` VALUES ('160002', '160000', '常德', '0', '0');
INSERT INTO `bond_site` VALUES ('160003', '160000', '郴州', '0', '0');
INSERT INTO `bond_site` VALUES ('160004', '160000', '衡阳', '0', '0');
INSERT INTO `bond_site` VALUES ('160005', '160000', '怀化', '0', '0');
INSERT INTO `bond_site` VALUES ('160006', '160000', '吉首', '0', '0');
INSERT INTO `bond_site` VALUES ('160007', '160000', '娄底', '0', '0');
INSERT INTO `bond_site` VALUES ('160008', '160000', '邵阳', '0', '0');
INSERT INTO `bond_site` VALUES ('160009', '160000', '湘潭', '0', '0');
INSERT INTO `bond_site` VALUES ('160010', '160000', '益阳', '0', '0');
INSERT INTO `bond_site` VALUES ('160011', '160000', '岳阳', '0', '0');
INSERT INTO `bond_site` VALUES ('160012', '160000', '永州', '0', '0');
INSERT INTO `bond_site` VALUES ('160013', '160000', '张家界', '0', '0');
INSERT INTO `bond_site` VALUES ('160014', '160000', '株洲', '0', '0');
INSERT INTO `bond_site` VALUES ('170000', '0', ' 江苏省', '0', '0');
INSERT INTO `bond_site` VALUES ('170001', '170000', '南京', '0', '0');
INSERT INTO `bond_site` VALUES ('170002', '170000', '常熟', '0', '0');
INSERT INTO `bond_site` VALUES ('170003', '170000', '常州', '0', '0');
INSERT INTO `bond_site` VALUES ('170004', '170000', '海门', '0', '0');
INSERT INTO `bond_site` VALUES ('170005', '170000', '淮安', '0', '0');
INSERT INTO `bond_site` VALUES ('170006', '170000', '江都', '0', '0');
INSERT INTO `bond_site` VALUES ('170007', '170000', '江阴', '0', '0');
INSERT INTO `bond_site` VALUES ('170008', '170000', '昆山', '0', '0');
INSERT INTO `bond_site` VALUES ('170009', '170000', '连云港', '0', '0');
INSERT INTO `bond_site` VALUES ('170010', '170000', '南通', '0', '0');
INSERT INTO `bond_site` VALUES ('170011', '170000', '启东', '0', '0');
INSERT INTO `bond_site` VALUES ('170012', '170000', '沭阳', '0', '0');
INSERT INTO `bond_site` VALUES ('170013', '170000', '宿迁', '0', '0');
INSERT INTO `bond_site` VALUES ('170014', '170000', '苏州', '0', '0');
INSERT INTO `bond_site` VALUES ('170015', '170000', '太仓', '0', '0');
INSERT INTO `bond_site` VALUES ('170016', '170000', '泰州', '0', '0');
INSERT INTO `bond_site` VALUES ('170017', '170000', '同里', '0', '0');
INSERT INTO `bond_site` VALUES ('170018', '170000', '无锡', '0', '0');
INSERT INTO `bond_site` VALUES ('170019', '170000', '徐州', '0', '0');
INSERT INTO `bond_site` VALUES ('170020', '170000', '盐城', '0', '0');
INSERT INTO `bond_site` VALUES ('170021', '170000', '扬州', '0', '0');
INSERT INTO `bond_site` VALUES ('170022', '170000', '宜兴', '0', '0');
INSERT INTO `bond_site` VALUES ('170023', '170000', '仪征', '0', '0');
INSERT INTO `bond_site` VALUES ('170024', '170000', '张家港', '0', '0');
INSERT INTO `bond_site` VALUES ('170025', '170000', '镇江', '0', '0');
INSERT INTO `bond_site` VALUES ('170026', '170000', '周庄', '0', '0');
INSERT INTO `bond_site` VALUES ('180000', '0', ' 江西省', '0', '0');
INSERT INTO `bond_site` VALUES ('180001', '180000', '南昌', '0', '0');
INSERT INTO `bond_site` VALUES ('180002', '180000', '抚州', '0', '0');
INSERT INTO `bond_site` VALUES ('180003', '180000', '赣州', '0', '0');
INSERT INTO `bond_site` VALUES ('180004', '180000', '吉安', '0', '0');
INSERT INTO `bond_site` VALUES ('180005', '180000', '景德镇', '0', '0');
INSERT INTO `bond_site` VALUES ('180006', '180000', '井冈山', '0', '0');
INSERT INTO `bond_site` VALUES ('180007', '180000', '九江', '0', '0');
INSERT INTO `bond_site` VALUES ('180008', '180000', '庐山', '0', '0');
INSERT INTO `bond_site` VALUES ('180009', '180000', '萍乡', '0', '0');
INSERT INTO `bond_site` VALUES ('180010', '180000', '上饶', '0', '0');
INSERT INTO `bond_site` VALUES ('180011', '180000', '新余', '0', '0');
INSERT INTO `bond_site` VALUES ('180012', '180000', '宜春', '0', '0');
INSERT INTO `bond_site` VALUES ('180013', '180000', '鹰潭', '0', '0');
INSERT INTO `bond_site` VALUES ('190000', '0', ' 吉林省', '0', '0');
INSERT INTO `bond_site` VALUES ('190001', '190000', '长春', '0', '0');
INSERT INTO `bond_site` VALUES ('190002', '190000', '白城', '0', '0');
INSERT INTO `bond_site` VALUES ('190003', '190000', '白山', '0', '0');
INSERT INTO `bond_site` VALUES ('190004', '190000', '珲春', '0', '0');
INSERT INTO `bond_site` VALUES ('190005', '190000', '辽源', '0', '0');
INSERT INTO `bond_site` VALUES ('190006', '190000', '梅河', '0', '0');
INSERT INTO `bond_site` VALUES ('190007', '190000', '吉林', '0', '0');
INSERT INTO `bond_site` VALUES ('190008', '190000', '四平', '0', '0');
INSERT INTO `bond_site` VALUES ('190009', '190000', '松原', '0', '0');
INSERT INTO `bond_site` VALUES ('190010', '190000', '通化', '0', '0');
INSERT INTO `bond_site` VALUES ('190011', '190000', '延吉', '0', '0');
INSERT INTO `bond_site` VALUES ('20000', '0', ' 上海市', '0', '0');
INSERT INTO `bond_site` VALUES ('200000', '0', ' 辽宁省', '0', '0');
INSERT INTO `bond_site` VALUES ('200001', '200000', '沈阳', '0', '0');
INSERT INTO `bond_site` VALUES ('200002', '200000', '鞍山', '0', '0');
INSERT INTO `bond_site` VALUES ('200003', '200000', '本溪', '0', '0');
INSERT INTO `bond_site` VALUES ('200004', '200000', '朝阳', '0', '0');
INSERT INTO `bond_site` VALUES ('200005', '200000', '大连', '0', '0');
INSERT INTO `bond_site` VALUES ('200006', '200000', '丹东', '0', '0');
INSERT INTO `bond_site` VALUES ('200007', '200000', '抚顺', '0', '0');
INSERT INTO `bond_site` VALUES ('200008', '200000', '阜新', '0', '0');
INSERT INTO `bond_site` VALUES ('200009', '200000', '葫芦岛', '0', '0');
INSERT INTO `bond_site` VALUES ('20001', '20000', '崇明', '0', '0');
INSERT INTO `bond_site` VALUES ('200010', '200000', '锦州', '0', '0');
INSERT INTO `bond_site` VALUES ('200011', '200000', '辽阳', '0', '0');
INSERT INTO `bond_site` VALUES ('200012', '200000', '盘锦', '0', '0');
INSERT INTO `bond_site` VALUES ('200013', '200000', '铁岭', '0', '0');
INSERT INTO `bond_site` VALUES ('200014', '200000', '营口', '0', '0');
INSERT INTO `bond_site` VALUES ('20002', '20000', '黄浦', '0', '0');
INSERT INTO `bond_site` VALUES ('20003', '20000', '卢湾', '0', '0');
INSERT INTO `bond_site` VALUES ('20004', '20000', '徐汇', '0', '0');
INSERT INTO `bond_site` VALUES ('20005', '20000', '长宁', '0', '0');
INSERT INTO `bond_site` VALUES ('20006', '20000', '静安', '0', '0');
INSERT INTO `bond_site` VALUES ('20007', '20000', '普陀', '0', '0');
INSERT INTO `bond_site` VALUES ('20008', '20000', '闸北', '0', '0');
INSERT INTO `bond_site` VALUES ('20009', '20000', '虹口', '0', '0');
INSERT INTO `bond_site` VALUES ('20010', '20000', '杨浦', '0', '0');
INSERT INTO `bond_site` VALUES ('20011', '20000', '闵行', '0', '0');
INSERT INTO `bond_site` VALUES ('20012', '20000', '宝山', '0', '0');
INSERT INTO `bond_site` VALUES ('20013', '20000', '嘉定', '0', '0');
INSERT INTO `bond_site` VALUES ('20014', '20000', '浦东', '0', '0');
INSERT INTO `bond_site` VALUES ('20015', '20000', '金山', '0', '0');
INSERT INTO `bond_site` VALUES ('20016', '20000', '松江', '0', '0');
INSERT INTO `bond_site` VALUES ('20017', '20000', '青浦', '0', '0');
INSERT INTO `bond_site` VALUES ('20018', '20000', '南汇', '0', '0');
INSERT INTO `bond_site` VALUES ('20019', '20000', '奉贤', '0', '0');
INSERT INTO `bond_site` VALUES ('210000', '0', ' 澳门', '0', '0');
INSERT INTO `bond_site` VALUES ('210001', '210000', '澳门', '0', '0');
INSERT INTO `bond_site` VALUES ('220000', '0', ' 内蒙古', '0', '0');
INSERT INTO `bond_site` VALUES ('220001', '220000', '呼和浩特', '0', '0');
INSERT INTO `bond_site` VALUES ('220002', '220000', '阿拉善盟', '0', '0');
INSERT INTO `bond_site` VALUES ('220003', '220000', '包头', '0', '0');
INSERT INTO `bond_site` VALUES ('220004', '220000', '赤峰', '0', '0');
INSERT INTO `bond_site` VALUES ('220005', '220000', '东胜', '0', '0');
INSERT INTO `bond_site` VALUES ('220006', '220000', '海拉尔', '0', '0');
INSERT INTO `bond_site` VALUES ('220007', '220000', '集宁', '0', '0');
INSERT INTO `bond_site` VALUES ('220008', '220000', '临河', '0', '0');
INSERT INTO `bond_site` VALUES ('220009', '220000', '通辽', '0', '0');
INSERT INTO `bond_site` VALUES ('220010', '220000', '乌海', '0', '0');
INSERT INTO `bond_site` VALUES ('220011', '220000', '乌兰浩特', '0', '0');
INSERT INTO `bond_site` VALUES ('220012', '220000', '锡林浩特', '0', '0');
INSERT INTO `bond_site` VALUES ('230000', '0', ' 宁夏', '0', '0');
INSERT INTO `bond_site` VALUES ('230001', '230000', '银川', '0', '0');
INSERT INTO `bond_site` VALUES ('230002', '230000', '固源', '0', '0');
INSERT INTO `bond_site` VALUES ('230003', '230000', '石嘴山', '0', '0');
INSERT INTO `bond_site` VALUES ('230004', '230000', '吴忠', '0', '0');
INSERT INTO `bond_site` VALUES ('240000', '0', ' 青海省', '0', '0');
INSERT INTO `bond_site` VALUES ('240001', '240000', '西宁', '0', '0');
INSERT INTO `bond_site` VALUES ('240002', '240000', '德令哈', '0', '0');
INSERT INTO `bond_site` VALUES ('240003', '240000', '格尔木', '0', '0');
INSERT INTO `bond_site` VALUES ('240004', '240000', '共和', '0', '0');
INSERT INTO `bond_site` VALUES ('240005', '240000', '海东', '0', '0');
INSERT INTO `bond_site` VALUES ('240006', '240000', '海晏', '0', '0');
INSERT INTO `bond_site` VALUES ('240007', '240000', '玛沁', '0', '0');
INSERT INTO `bond_site` VALUES ('240008', '240000', '同仁', '0', '0');
INSERT INTO `bond_site` VALUES ('240009', '240000', '玉树', '0', '0');
INSERT INTO `bond_site` VALUES ('250000', '0', ' 山东省', '0', '0');
INSERT INTO `bond_site` VALUES ('250001', '250000', '济南', '0', '0');
INSERT INTO `bond_site` VALUES ('250002', '250000', '滨州', '0', '0');
INSERT INTO `bond_site` VALUES ('250003', '250000', '兖州', '0', '0');
INSERT INTO `bond_site` VALUES ('250004', '250000', '德州', '0', '0');
INSERT INTO `bond_site` VALUES ('250005', '250000', '东营', '0', '0');
INSERT INTO `bond_site` VALUES ('250006', '250000', '菏泽', '0', '0');
INSERT INTO `bond_site` VALUES ('250007', '250000', '济宁', '0', '0');
INSERT INTO `bond_site` VALUES ('250008', '250000', '莱芜', '0', '0');
INSERT INTO `bond_site` VALUES ('250009', '250000', '聊城', '0', '0');
INSERT INTO `bond_site` VALUES ('250010', '250000', '临沂', '0', '0');
INSERT INTO `bond_site` VALUES ('250011', '250000', '蓬莱', '0', '0');
INSERT INTO `bond_site` VALUES ('250012', '250000', '青岛', '0', '0');
INSERT INTO `bond_site` VALUES ('250013', '250000', '曲阜', '0', '0');
INSERT INTO `bond_site` VALUES ('250014', '250000', '日照', '0', '0');
INSERT INTO `bond_site` VALUES ('250015', '250000', '泰安', '0', '0');
INSERT INTO `bond_site` VALUES ('250016', '250000', '潍坊', '0', '0');
INSERT INTO `bond_site` VALUES ('250017', '250000', '威海', '0', '0');
INSERT INTO `bond_site` VALUES ('250018', '250000', '烟台', '0', '0');
INSERT INTO `bond_site` VALUES ('250019', '250000', '枣庄', '0', '0');
INSERT INTO `bond_site` VALUES ('250020', '250000', '淄博', '0', '0');
INSERT INTO `bond_site` VALUES ('260000', '0', ' 山西省', '0', '0');
INSERT INTO `bond_site` VALUES ('260001', '260000', '太原', '0', '0');
INSERT INTO `bond_site` VALUES ('260002', '260000', '长治', '0', '0');
INSERT INTO `bond_site` VALUES ('260003', '260000', '大同', '0', '0');
INSERT INTO `bond_site` VALUES ('260004', '260000', '候马', '0', '0');
INSERT INTO `bond_site` VALUES ('260005', '260000', '晋城', '0', '0');
INSERT INTO `bond_site` VALUES ('260006', '260000', '离石', '0', '0');
INSERT INTO `bond_site` VALUES ('260007', '260000', '临汾', '0', '0');
INSERT INTO `bond_site` VALUES ('260008', '260000', '宁武', '0', '0');
INSERT INTO `bond_site` VALUES ('260009', '260000', '朔州', '0', '0');
INSERT INTO `bond_site` VALUES ('260010', '260000', '忻州', '0', '0');
INSERT INTO `bond_site` VALUES ('260011', '260000', '阳泉', '0', '0');
INSERT INTO `bond_site` VALUES ('260012', '260000', '榆次', '0', '0');
INSERT INTO `bond_site` VALUES ('260013', '260000', '运城', '0', '0');
INSERT INTO `bond_site` VALUES ('270000', '0', ' 陕西省', '0', '0');
INSERT INTO `bond_site` VALUES ('270001', '270000', '西安', '0', '0');
INSERT INTO `bond_site` VALUES ('270002', '270000', '安康', '0', '0');
INSERT INTO `bond_site` VALUES ('270003', '270000', '宝鸡', '0', '0');
INSERT INTO `bond_site` VALUES ('270004', '270000', '汉中', '0', '0');
INSERT INTO `bond_site` VALUES ('270005', '270000', '渭南', '0', '0');
INSERT INTO `bond_site` VALUES ('270006', '270000', '商州', '0', '0');
INSERT INTO `bond_site` VALUES ('270007', '270000', '绥德', '0', '0');
INSERT INTO `bond_site` VALUES ('270008', '270000', '铜川', '0', '0');
INSERT INTO `bond_site` VALUES ('270009', '270000', '咸阳', '0', '0');
INSERT INTO `bond_site` VALUES ('270010', '270000', '延安', '0', '0');
INSERT INTO `bond_site` VALUES ('270011', '270000', '榆林', '0', '0');
INSERT INTO `bond_site` VALUES ('280000', '0', ' 四川省', '0', '0');
INSERT INTO `bond_site` VALUES ('280001', '280000', '成都', '0', '0');
INSERT INTO `bond_site` VALUES ('280002', '280000', '巴中', '0', '0');
INSERT INTO `bond_site` VALUES ('280003', '280000', '达川', '0', '0');
INSERT INTO `bond_site` VALUES ('280004', '280000', '德阳', '0', '0');
INSERT INTO `bond_site` VALUES ('280005', '280000', '都江堰', '0', '0');
INSERT INTO `bond_site` VALUES ('280006', '280000', '峨眉山', '0', '0');
INSERT INTO `bond_site` VALUES ('280007', '280000', '涪陵', '0', '0');
INSERT INTO `bond_site` VALUES ('280008', '280000', '广安', '0', '0');
INSERT INTO `bond_site` VALUES ('280009', '280000', '广元', '0', '0');
INSERT INTO `bond_site` VALUES ('280010', '280000', '九寨沟', '0', '0');
INSERT INTO `bond_site` VALUES ('280011', '280000', '康定', '0', '0');
INSERT INTO `bond_site` VALUES ('280012', '280000', '乐山', '0', '0');
INSERT INTO `bond_site` VALUES ('280013', '280000', '泸州', '0', '0');
INSERT INTO `bond_site` VALUES ('280014', '280000', '马尔康', '0', '0');
INSERT INTO `bond_site` VALUES ('280015', '280000', '绵阳', '0', '0');
INSERT INTO `bond_site` VALUES ('280016', '280000', '眉山', '0', '0');
INSERT INTO `bond_site` VALUES ('280017', '280000', '南充', '0', '0');
INSERT INTO `bond_site` VALUES ('280018', '280000', '内江', '0', '0');
INSERT INTO `bond_site` VALUES ('280019', '280000', '攀枝花', '0', '0');
INSERT INTO `bond_site` VALUES ('280020', '280000', '遂宁', '0', '0');
INSERT INTO `bond_site` VALUES ('280021', '280000', '汶川', '0', '0');
INSERT INTO `bond_site` VALUES ('280022', '280000', '西昌', '0', '0');
INSERT INTO `bond_site` VALUES ('280023', '280000', '雅安', '0', '0');
INSERT INTO `bond_site` VALUES ('280024', '280000', '宜宾', '0', '0');
INSERT INTO `bond_site` VALUES ('280025', '280000', '自贡', '0', '0');
INSERT INTO `bond_site` VALUES ('280026', '280000', '资阳', '0', '0');
INSERT INTO `bond_site` VALUES ('290000', '0', ' 台湾', '0', '0');
INSERT INTO `bond_site` VALUES ('290001', '290000', '台北', '0', '0');
INSERT INTO `bond_site` VALUES ('290002', '290000', '基隆', '0', '0');
INSERT INTO `bond_site` VALUES ('290003', '290000', '台南', '0', '0');
INSERT INTO `bond_site` VALUES ('290004', '290000', '台中', '0', '0');
INSERT INTO `bond_site` VALUES ('290005', '290000', '高雄', '0', '0');
INSERT INTO `bond_site` VALUES ('290006', '290000', '屏东', '0', '0');
INSERT INTO `bond_site` VALUES ('290007', '290000', '南投', '0', '0');
INSERT INTO `bond_site` VALUES ('290008', '290000', '云林', '0', '0');
INSERT INTO `bond_site` VALUES ('290009', '290000', '新竹', '0', '0');
INSERT INTO `bond_site` VALUES ('290010', '290000', '彰化', '0', '0');
INSERT INTO `bond_site` VALUES ('290011', '290000', '苗栗', '0', '0');
INSERT INTO `bond_site` VALUES ('290012', '290000', '嘉义', '0', '0');
INSERT INTO `bond_site` VALUES ('290013', '290000', '花莲', '0', '0');
INSERT INTO `bond_site` VALUES ('290014', '290000', '桃园', '0', '0');
INSERT INTO `bond_site` VALUES ('290015', '290000', '宜兰', '0', '0');
INSERT INTO `bond_site` VALUES ('290016', '290000', '台东', '0', '0');
INSERT INTO `bond_site` VALUES ('290017', '290000', '金门', '0', '0');
INSERT INTO `bond_site` VALUES ('290018', '290000', '马祖', '0', '0');
INSERT INTO `bond_site` VALUES ('290019', '290000', '澎湖', '0', '0');
INSERT INTO `bond_site` VALUES ('30000', '0', ' 重庆市', '0', '0');
INSERT INTO `bond_site` VALUES ('300000', '0', ' 天津市', '0', '0');
INSERT INTO `bond_site` VALUES ('300001', '300000', '天津', '0', '0');
INSERT INTO `bond_site` VALUES ('300002', '300000', '和平', '0', '0');
INSERT INTO `bond_site` VALUES ('300003', '300000', '东丽', '0', '0');
INSERT INTO `bond_site` VALUES ('300004', '300000', '河东', '0', '0');
INSERT INTO `bond_site` VALUES ('300005', '300000', '西青', '0', '0');
INSERT INTO `bond_site` VALUES ('300006', '300000', '河西', '0', '0');
INSERT INTO `bond_site` VALUES ('300007', '300000', '津南', '0', '0');
INSERT INTO `bond_site` VALUES ('300008', '300000', '南开', '0', '0');
INSERT INTO `bond_site` VALUES ('300009', '300000', '北辰', '0', '0');
INSERT INTO `bond_site` VALUES ('30001', '30000', '万州', '0', '0');
INSERT INTO `bond_site` VALUES ('300010', '300000', '河北', '0', '0');
INSERT INTO `bond_site` VALUES ('300011', '300000', '武清', '0', '0');
INSERT INTO `bond_site` VALUES ('300012', '300000', '红挢', '0', '0');
INSERT INTO `bond_site` VALUES ('300013', '300000', '塘沽', '0', '0');
INSERT INTO `bond_site` VALUES ('300014', '300000', '汉沽', '0', '0');
INSERT INTO `bond_site` VALUES ('300015', '300000', '大港', '0', '0');
INSERT INTO `bond_site` VALUES ('300016', '300000', '宁河', '0', '0');
INSERT INTO `bond_site` VALUES ('300017', '300000', '静海', '0', '0');
INSERT INTO `bond_site` VALUES ('300018', '300000', '宝坻', '0', '0');
INSERT INTO `bond_site` VALUES ('300019', '300000', '蓟县', '0', '0');
INSERT INTO `bond_site` VALUES ('30002', '30000', '涪陵', '0', '0');
INSERT INTO `bond_site` VALUES ('30003', '30000', '渝中', '0', '0');
INSERT INTO `bond_site` VALUES ('30004', '30000', '大渡口', '0', '0');
INSERT INTO `bond_site` VALUES ('30005', '30000', '江北', '0', '0');
INSERT INTO `bond_site` VALUES ('30006', '30000', '沙坪坝', '0', '0');
INSERT INTO `bond_site` VALUES ('30007', '30000', '九龙坡', '0', '0');
INSERT INTO `bond_site` VALUES ('30008', '30000', '南岸', '0', '0');
INSERT INTO `bond_site` VALUES ('30009', '30000', '北碚', '0', '0');
INSERT INTO `bond_site` VALUES ('30010', '30000', '万盛', '0', '0');
INSERT INTO `bond_site` VALUES ('30011', '30000', '双挢', '0', '0');
INSERT INTO `bond_site` VALUES ('30012', '30000', '渝北', '0', '0');
INSERT INTO `bond_site` VALUES ('30013', '30000', '巴南', '0', '0');
INSERT INTO `bond_site` VALUES ('30014', '30000', '黔江', '0', '0');
INSERT INTO `bond_site` VALUES ('30015', '30000', '长寿', '0', '0');
INSERT INTO `bond_site` VALUES ('30016', '30000', '綦江', '0', '0');
INSERT INTO `bond_site` VALUES ('30017', '30000', '潼南', '0', '0');
INSERT INTO `bond_site` VALUES ('30018', '30000', '铜梁', '0', '0');
INSERT INTO `bond_site` VALUES ('30019', '30000', '大足', '0', '0');
INSERT INTO `bond_site` VALUES ('30020', '30000', '荣昌', '0', '0');
INSERT INTO `bond_site` VALUES ('30021', '30000', '壁山', '0', '0');
INSERT INTO `bond_site` VALUES ('30022', '30000', '梁平', '0', '0');
INSERT INTO `bond_site` VALUES ('30023', '30000', '城口', '0', '0');
INSERT INTO `bond_site` VALUES ('30024', '30000', '丰都', '0', '0');
INSERT INTO `bond_site` VALUES ('30025', '30000', '垫江', '0', '0');
INSERT INTO `bond_site` VALUES ('30026', '30000', '武隆', '0', '0');
INSERT INTO `bond_site` VALUES ('30027', '30000', '忠县', '0', '0');
INSERT INTO `bond_site` VALUES ('30028', '30000', '开县', '0', '0');
INSERT INTO `bond_site` VALUES ('30029', '30000', '云阳', '0', '0');
INSERT INTO `bond_site` VALUES ('30030', '30000', '奉节', '0', '0');
INSERT INTO `bond_site` VALUES ('30031', '30000', '巫山', '0', '0');
INSERT INTO `bond_site` VALUES ('30032', '30000', '巫溪', '0', '0');
INSERT INTO `bond_site` VALUES ('30033', '30000', '石柱', '0', '0');
INSERT INTO `bond_site` VALUES ('30034', '30000', '秀山', '0', '0');
INSERT INTO `bond_site` VALUES ('30035', '30000', '酉阳', '0', '0');
INSERT INTO `bond_site` VALUES ('30036', '30000', '彭水', '0', '0');
INSERT INTO `bond_site` VALUES ('30037', '30000', '江津', '0', '0');
INSERT INTO `bond_site` VALUES ('30038', '30000', '合川', '0', '0');
INSERT INTO `bond_site` VALUES ('30039', '30000', '永川', '0', '0');
INSERT INTO `bond_site` VALUES ('30040', '30000', '南川', '0', '0');
INSERT INTO `bond_site` VALUES ('310000', '0', ' 新疆', '0', '0');
INSERT INTO `bond_site` VALUES ('310001', '310000', '乌鲁木齐', '0', '0');
INSERT INTO `bond_site` VALUES ('310002', '310000', '阿克苏', '0', '0');
INSERT INTO `bond_site` VALUES ('310003', '310000', '阿勒泰', '0', '0');
INSERT INTO `bond_site` VALUES ('310004', '310000', '阿图什', '0', '0');
INSERT INTO `bond_site` VALUES ('310005', '310000', '博乐', '0', '0');
INSERT INTO `bond_site` VALUES ('310006', '310000', '昌吉', '0', '0');
INSERT INTO `bond_site` VALUES ('310007', '310000', '东山', '0', '0');
INSERT INTO `bond_site` VALUES ('310008', '310000', '哈密', '0', '0');
INSERT INTO `bond_site` VALUES ('310009', '310000', '和田', '0', '0');
INSERT INTO `bond_site` VALUES ('310010', '310000', '喀什', '0', '0');
INSERT INTO `bond_site` VALUES ('310011', '310000', '克拉玛依', '0', '0');
INSERT INTO `bond_site` VALUES ('310012', '310000', '库车', '0', '0');
INSERT INTO `bond_site` VALUES ('310013', '310000', '库尔勒', '0', '0');
INSERT INTO `bond_site` VALUES ('310014', '310000', '奎屯', '0', '0');
INSERT INTO `bond_site` VALUES ('310015', '310000', '石河子', '0', '0');
INSERT INTO `bond_site` VALUES ('310016', '310000', '塔城', '0', '0');
INSERT INTO `bond_site` VALUES ('310017', '310000', '吐鲁番', '0', '0');
INSERT INTO `bond_site` VALUES ('310018', '310000', '伊宁', '0', '0');
INSERT INTO `bond_site` VALUES ('320000', '0', ' 西藏', '0', '0');
INSERT INTO `bond_site` VALUES ('320001', '320000', '拉萨', '0', '0');
INSERT INTO `bond_site` VALUES ('320002', '320000', '阿里', '0', '0');
INSERT INTO `bond_site` VALUES ('320003', '320000', '昌都', '0', '0');
INSERT INTO `bond_site` VALUES ('320004', '320000', '林芝', '0', '0');
INSERT INTO `bond_site` VALUES ('320005', '320000', '那曲', '0', '0');
INSERT INTO `bond_site` VALUES ('320006', '320000', '日喀则', '0', '0');
INSERT INTO `bond_site` VALUES ('320007', '320000', '山南', '0', '0');
INSERT INTO `bond_site` VALUES ('330000', '0', ' 云南省', '0', '0');
INSERT INTO `bond_site` VALUES ('330001', '330000', '昆明', '0', '0');
INSERT INTO `bond_site` VALUES ('330002', '330000', '大理', '0', '0');
INSERT INTO `bond_site` VALUES ('330003', '330000', '保山', '0', '0');
INSERT INTO `bond_site` VALUES ('330004', '330000', '楚雄', '0', '0');
INSERT INTO `bond_site` VALUES ('330005', '330000', '大理', '0', '0');
INSERT INTO `bond_site` VALUES ('330006', '330000', '东川', '0', '0');
INSERT INTO `bond_site` VALUES ('330007', '330000', '个旧', '0', '0');
INSERT INTO `bond_site` VALUES ('330008', '330000', '景洪', '0', '0');
INSERT INTO `bond_site` VALUES ('330009', '330000', '开远', '0', '0');
INSERT INTO `bond_site` VALUES ('330010', '330000', '临沧', '0', '0');
INSERT INTO `bond_site` VALUES ('330011', '330000', '丽江', '0', '0');
INSERT INTO `bond_site` VALUES ('330012', '330000', '六库', '0', '0');
INSERT INTO `bond_site` VALUES ('330013', '330000', '潞西', '0', '0');
INSERT INTO `bond_site` VALUES ('330014', '330000', '曲靖', '0', '0');
INSERT INTO `bond_site` VALUES ('330015', '330000', '思茅', '0', '0');
INSERT INTO `bond_site` VALUES ('330016', '330000', '文山', '0', '0');
INSERT INTO `bond_site` VALUES ('330017', '330000', '西双版纳', '0', '0');
INSERT INTO `bond_site` VALUES ('330018', '330000', '玉溪', '0', '0');
INSERT INTO `bond_site` VALUES ('330019', '330000', '中甸', '0', '0');
INSERT INTO `bond_site` VALUES ('330020', '330000', '昭通', '0', '0');
INSERT INTO `bond_site` VALUES ('340000', '0', ' 浙江省', '0', '0');
INSERT INTO `bond_site` VALUES ('340001', '340000', '杭州', '0', '0');
INSERT INTO `bond_site` VALUES ('340002', '340000', '安吉', '0', '0');
INSERT INTO `bond_site` VALUES ('340003', '340000', '慈溪', '0', '0');
INSERT INTO `bond_site` VALUES ('340004', '340000', '定海', '0', '0');
INSERT INTO `bond_site` VALUES ('340005', '340000', '奉化', '0', '0');
INSERT INTO `bond_site` VALUES ('340006', '340000', '海盐', '0', '0');
INSERT INTO `bond_site` VALUES ('340007', '340000', '黄岩', '0', '0');
INSERT INTO `bond_site` VALUES ('340008', '340000', '湖州', '0', '0');
INSERT INTO `bond_site` VALUES ('340009', '340000', '嘉兴', '0', '0');
INSERT INTO `bond_site` VALUES ('340010', '340000', '金华', '0', '0');
INSERT INTO `bond_site` VALUES ('340011', '340000', '临安', '0', '0');
INSERT INTO `bond_site` VALUES ('340012', '340000', '临海', '0', '0');
INSERT INTO `bond_site` VALUES ('340013', '340000', '丽水', '0', '0');
INSERT INTO `bond_site` VALUES ('340014', '340000', '宁波', '0', '0');
INSERT INTO `bond_site` VALUES ('340015', '340000', '瓯海', '0', '0');
INSERT INTO `bond_site` VALUES ('340016', '340000', '平湖', '0', '0');
INSERT INTO `bond_site` VALUES ('340017', '340000', '千岛湖', '0', '0');
INSERT INTO `bond_site` VALUES ('340018', '340000', '衢州', '0', '0');
INSERT INTO `bond_site` VALUES ('340019', '340000', '江山', '0', '0');
INSERT INTO `bond_site` VALUES ('340020', '340000', '瑞安', '0', '0');
INSERT INTO `bond_site` VALUES ('340021', '340000', '绍兴', '0', '0');
INSERT INTO `bond_site` VALUES ('340022', '340000', '嵊州', '0', '0');
INSERT INTO `bond_site` VALUES ('340023', '340000', '台州', '0', '0');
INSERT INTO `bond_site` VALUES ('340024', '340000', '温岭', '0', '0');
INSERT INTO `bond_site` VALUES ('340025', '340000', '温州', '0', '0');
INSERT INTO `bond_site` VALUES ('350000', '0', ' 海外', '0', '0');
INSERT INTO `bond_site` VALUES ('350001', '350000', '欧洲', '0', '0');
INSERT INTO `bond_site` VALUES ('350002', '350000', '北美', '0', '0');
INSERT INTO `bond_site` VALUES ('350003', '350000', '南美', '0', '0');
INSERT INTO `bond_site` VALUES ('350004', '350000', '亚洲', '0', '0');
INSERT INTO `bond_site` VALUES ('350005', '350000', '非洲', '0', '0');
INSERT INTO `bond_site` VALUES ('350006', '350000', '大洋洲', '0', '0');
INSERT INTO `bond_site` VALUES ('40000', '0', ' 安徽省', '0', '0');
INSERT INTO `bond_site` VALUES ('40001', '40000', '合肥', '0', '0');
INSERT INTO `bond_site` VALUES ('40002', '40000', '安庆', '0', '0');
INSERT INTO `bond_site` VALUES ('40003', '40000', '蚌埠', '0', '0');
INSERT INTO `bond_site` VALUES ('40004', '40000', '亳州', '0', '0');
INSERT INTO `bond_site` VALUES ('40005', '40000', '巢湖', '0', '0');
INSERT INTO `bond_site` VALUES ('40006', '40000', '滁州', '0', '0');
INSERT INTO `bond_site` VALUES ('40007', '40000', '阜阳', '0', '0');
INSERT INTO `bond_site` VALUES ('40008', '40000', '贵池', '0', '0');
INSERT INTO `bond_site` VALUES ('40009', '40000', '淮北', '0', '0');
INSERT INTO `bond_site` VALUES ('40010', '40000', '淮化', '0', '0');
INSERT INTO `bond_site` VALUES ('40011', '40000', '淮南', '0', '0');
INSERT INTO `bond_site` VALUES ('40012', '40000', '黄山', '0', '0');
INSERT INTO `bond_site` VALUES ('40013', '40000', '九华山', '0', '0');
INSERT INTO `bond_site` VALUES ('40014', '40000', '六安', '0', '0');
INSERT INTO `bond_site` VALUES ('40015', '40000', '马鞍山', '0', '0');
INSERT INTO `bond_site` VALUES ('40016', '40000', '宿州', '0', '0');
INSERT INTO `bond_site` VALUES ('40017', '40000', '铜陵', '0', '0');
INSERT INTO `bond_site` VALUES ('40018', '40000', '屯溪', '0', '0');
INSERT INTO `bond_site` VALUES ('40019', '40000', '芜湖', '0', '0');
INSERT INTO `bond_site` VALUES ('40020', '40000', '宣城', '0', '0');
INSERT INTO `bond_site` VALUES ('50000', '0', ' 福建省', '0', '0');
INSERT INTO `bond_site` VALUES ('50001', '50000', '福州', '0', '0');
INSERT INTO `bond_site` VALUES ('50002', '50000', '福安', '0', '0');
INSERT INTO `bond_site` VALUES ('50003', '50000', '龙岩', '0', '0');
INSERT INTO `bond_site` VALUES ('50004', '50000', '南平', '0', '0');
INSERT INTO `bond_site` VALUES ('50005', '50000', '宁德', '0', '0');
INSERT INTO `bond_site` VALUES ('50006', '50000', '莆田', '0', '0');
INSERT INTO `bond_site` VALUES ('50007', '50000', '泉州', '0', '0');
INSERT INTO `bond_site` VALUES ('50008', '50000', '三明', '0', '0');
INSERT INTO `bond_site` VALUES ('50009', '50000', '邵武', '0', '0');
INSERT INTO `bond_site` VALUES ('50010', '50000', '石狮', '0', '0');
INSERT INTO `bond_site` VALUES ('50011', '50000', '永安', '0', '0');
INSERT INTO `bond_site` VALUES ('50012', '50000', '武夷山', '0', '0');
INSERT INTO `bond_site` VALUES ('50013', '50000', '厦门', '0', '0');
INSERT INTO `bond_site` VALUES ('50014', '50000', '漳州', '0', '0');
INSERT INTO `bond_site` VALUES ('60000', '0', ' 甘肃省', '0', '0');
INSERT INTO `bond_site` VALUES ('60001', '60000', '兰州', '0', '0');
INSERT INTO `bond_site` VALUES ('60002', '60000', '白银', '0', '0');
INSERT INTO `bond_site` VALUES ('60003', '60000', '定西', '0', '0');
INSERT INTO `bond_site` VALUES ('60004', '60000', '敦煌', '0', '0');
INSERT INTO `bond_site` VALUES ('60005', '60000', '甘南', '0', '0');
INSERT INTO `bond_site` VALUES ('60006', '60000', '金昌', '0', '0');
INSERT INTO `bond_site` VALUES ('60007', '60000', '酒泉', '0', '0');
INSERT INTO `bond_site` VALUES ('60008', '60000', '临夏', '0', '0');
INSERT INTO `bond_site` VALUES ('60009', '60000', '平凉', '0', '0');
INSERT INTO `bond_site` VALUES ('60010', '60000', '天水', '0', '0');
INSERT INTO `bond_site` VALUES ('60011', '60000', '武都', '0', '0');
INSERT INTO `bond_site` VALUES ('60012', '60000', '武威', '0', '0');
INSERT INTO `bond_site` VALUES ('60013', '60000', '西峰', '0', '0');
INSERT INTO `bond_site` VALUES ('60014', '60000', '张掖', '0', '0');
INSERT INTO `bond_site` VALUES ('70000', '0', ' 广东省', '0', '0');
INSERT INTO `bond_site` VALUES ('70001', '70000', '广州', '0', '0');
INSERT INTO `bond_site` VALUES ('70002', '70000', '潮阳', '0', '0');
INSERT INTO `bond_site` VALUES ('70003', '70000', '潮州', '0', '0');
INSERT INTO `bond_site` VALUES ('70004', '70000', '澄海', '0', '0');
INSERT INTO `bond_site` VALUES ('70005', '70000', '东莞', '0', '0');
INSERT INTO `bond_site` VALUES ('70006', '70000', '佛山', '0', '0');
INSERT INTO `bond_site` VALUES ('70007', '70000', '河源', '0', '0');
INSERT INTO `bond_site` VALUES ('70008', '70000', '惠州', '0', '0');
INSERT INTO `bond_site` VALUES ('70009', '70000', '江门', '0', '0');
INSERT INTO `bond_site` VALUES ('70010', '70000', '揭阳', '0', '0');
INSERT INTO `bond_site` VALUES ('70011', '70000', '开平', '0', '0');
INSERT INTO `bond_site` VALUES ('70012', '70000', '茂名', '0', '0');
INSERT INTO `bond_site` VALUES ('70013', '70000', '梅州', '0', '0');
INSERT INTO `bond_site` VALUES ('70014', '70000', '清远', '0', '0');
INSERT INTO `bond_site` VALUES ('70015', '70000', '汕头', '0', '0');
INSERT INTO `bond_site` VALUES ('70016', '70000', '汕尾', '0', '0');
INSERT INTO `bond_site` VALUES ('70017', '70000', '韶关', '0', '0');
INSERT INTO `bond_site` VALUES ('70018', '70000', '深圳', '0', '0');
INSERT INTO `bond_site` VALUES ('70019', '70000', '顺德', '0', '0');
INSERT INTO `bond_site` VALUES ('70020', '70000', '阳江', '0', '0');
INSERT INTO `bond_site` VALUES ('70021', '70000', '英德', '0', '0');
INSERT INTO `bond_site` VALUES ('70022', '70000', '云浮', '0', '0');
INSERT INTO `bond_site` VALUES ('70023', '70000', '增城', '0', '0');
INSERT INTO `bond_site` VALUES ('70024', '70000', '湛江', '0', '0');
INSERT INTO `bond_site` VALUES ('70025', '70000', '肇庆', '0', '0');
INSERT INTO `bond_site` VALUES ('70026', '70000', '中山', '0', '0');
INSERT INTO `bond_site` VALUES ('70027', '70000', '珠海', '0', '0');
INSERT INTO `bond_site` VALUES ('80000', '0', ' 广西省', '0', '0');
INSERT INTO `bond_site` VALUES ('80001', '80000', '南宁', '0', '0');
INSERT INTO `bond_site` VALUES ('80002', '80000', '百色', '0', '0');
INSERT INTO `bond_site` VALUES ('80003', '80000', '北海', '0', '0');
INSERT INTO `bond_site` VALUES ('80004', '80000', '桂林', '0', '0');
INSERT INTO `bond_site` VALUES ('80005', '80000', '防城港', '0', '0');
INSERT INTO `bond_site` VALUES ('80006', '80000', '河池', '0', '0');
INSERT INTO `bond_site` VALUES ('80007', '80000', '贺州', '0', '0');
INSERT INTO `bond_site` VALUES ('80008', '80000', '柳州', '0', '0');
INSERT INTO `bond_site` VALUES ('80009', '80000', '钦州', '0', '0');
INSERT INTO `bond_site` VALUES ('80010', '80000', '梧州', '0', '0');
INSERT INTO `bond_site` VALUES ('80011', '80000', '玉林', '0', '0');
INSERT INTO `bond_site` VALUES ('90000', '0', ' 贵州省', '0', '0');
INSERT INTO `bond_site` VALUES ('90001', '90000', '贵阳', '0', '0');
INSERT INTO `bond_site` VALUES ('90002', '90000', '安顺', '0', '0');
INSERT INTO `bond_site` VALUES ('90003', '90000', '毕节', '0', '0');
INSERT INTO `bond_site` VALUES ('90004', '90000', '都匀', '0', '0');
INSERT INTO `bond_site` VALUES ('90005', '90000', '凯里', '0', '0');
INSERT INTO `bond_site` VALUES ('90006', '90000', '六盘水', '0', '0');
INSERT INTO `bond_site` VALUES ('90007', '90000', '铜仁', '0', '0');
INSERT INTO `bond_site` VALUES ('90008', '90000', '兴义', '0', '0');
INSERT INTO `bond_site` VALUES ('90009', '90000', '玉屏', '0', '0');
INSERT INTO `bond_site` VALUES ('90010', '90000', '遵义', '0', '0');

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
INSERT INTO `dict_assets` VALUES ('57', 'bond_unable', '0', '未签约', '0');
INSERT INTO `dict_assets` VALUES ('58', 'bond_unable', '1', '正在审核', '0');
INSERT INTO `dict_assets` VALUES ('59', 'bond_accept_property', '1', '个人', '0');
INSERT INTO `dict_assets` VALUES ('6', 'auction_classify', '2', '债权', '0');
INSERT INTO `dict_assets` VALUES ('60', 'bond_accept_property', '2', '公司', '0');
INSERT INTO `dict_assets` VALUES ('61', 'auction_verify', '1', '待审核', '0');
INSERT INTO `dict_assets` VALUES ('62', 'auction_verify', '2', '已审核', '0');
INSERT INTO `dict_assets` VALUES ('63', 'auction_verify', '3', '退回', '0');
INSERT INTO `dict_assets` VALUES ('64', 'bond_show', '0', '不优先接单', '0');
INSERT INTO `dict_assets` VALUES ('65', 'bond_show', '1', '优先接单', '0');
INSERT INTO `dict_assets` VALUES ('66', 'bond_unable', '2', '已签约', '0');
INSERT INTO `dict_assets` VALUES ('7', 'auction_classify', '3', '实物', '0');
INSERT INTO `dict_assets` VALUES ('8', 'auction_ownership_amount', '1', '10万-50万', '0');
INSERT INTO `dict_assets` VALUES ('9', 'auction_ownership_amount', '2', '50万-100万', '0');

-- ----------------------------
-- Table structure for kill_process
-- ----------------------------
DROP TABLE IF EXISTS `kill_process`;
CREATE TABLE `kill_process` (
  `kill_id` varchar(255) NOT NULL COMMENT 'id',
  `kill_time` datetime NOT NULL COMMENT '在这个时间无法使用',
  `kill_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kill_process
-- ----------------------------
INSERT INTO `kill_process` VALUES ('1', '2018-11-18 00:00:00', '');

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
INSERT INTO `sys_dict` VALUES ('0932c0e43db44bab9c7b4b56d7370647', 'root', 'bond_disposal', 'bond_disposal', '0', '0', '2017-10-18 17:27:07', '2017-10-18 17:27:07', 'NULL', 'NULL');
INSERT INTO `sys_dict` VALUES ('0b34577203734a9b94ea5dade26879ca', '04dba99e3d784e878b5e7a2ec2262a96', '审核通过', '1', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:42:49', null, null);
INSERT INTO `sys_dict` VALUES ('1541c21c54954230b3a04ec4fc22c656', 'a09bb601ea5e445e88b883b1d5c03680', '金融', '1', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('29e1ec45542b4082af0aa16a1142a9c1', '431cf88631ca47dda0e1ddd4d514f5af', '用户标记', 'flag_c', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('318c95adf813498a8fa6c5066ef4ea54', '6c7e136007c54ddc83a567e10f370b36', '通过', '1', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('37b73a43f23a42edb6bef45a96628217', 'c3867713ee74484da5e13675002ed2f2', '普通用户', '1', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:41:47', null, null);
INSERT INTO `sys_dict` VALUES ('3bc4cc6596a04fe0a2cc1fa2ccd485bf', 'root', 'sys_buy', 'sys_buy', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);
INSERT INTO `sys_dict` VALUES ('3c1c9c7485d846d8aac093eb443549aa', 'c562eaea0c374397b54db80381712a3e', '男', '1', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('431cf88631ca47dda0e1ddd4d514f5af', 'root', '共用', 'common', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('5659c944954540cebaf099843acf5d1a', 'd809b08967234ea18b9c5dd233efccb8', '成功', '1', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);
INSERT INTO `sys_dict` VALUES ('57f2343bb1714badbd379200de170abd', 'c562eaea0c374397b54db80381712a3e', '女', '2', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('6243f1eafd9a4d2093e8a3265714efab', 'root', 'sys_user', 'sys_user', '0', '0', '2017-04-21 18:39:14', '2017-04-21 18:39:14', null, null);
INSERT INTO `sys_dict` VALUES ('6c7e136007c54ddc83a567e10f370b36', '915e0c030de04bf08e5bc6761a7c8c2d', '资产审核', 'sys_goods_audit_d', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('7a6690b8a46c49c58ca808ce5336fac6', 'a95ef83cb5df4ab69c2f111cd268045b', '待签约、2', '1', '0', '0', '2017-10-18 17:27:07', '2017-10-18 17:27:07', 'NULL', 'NULL');
INSERT INTO `sys_dict` VALUES ('880d185f11794395a9439705eab558e0', '04dba99e3d784e878b5e7a2ec2262a96', '待审核', '0', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:43:01', null, null);
INSERT INTO `sys_dict` VALUES ('8901dac3d4f047259869010aa8e4c1bc', '29e1ec45542b4082af0aa16a1142a9c1', '注册用户', '1', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('915e0c030de04bf08e5bc6761a7c8c2d', 'root', 'sys_goods', 'sys_goods', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('a09bb601ea5e445e88b883b1d5c03680', '915e0c030de04bf08e5bc6761a7c8c2d', '产品类型', 'sys_goods_type_d', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('a21d1190c70545c6a8fe63916c72b0d4', 'root', 'sys_role', 'sys_role', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('a52bc1e447e640a9a7a8ece5b675eab0', '6c7e136007c54ddc83a567e10f370b36', '不通过', '2', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('a55c6e261e774082bbd5521130c5c1e6', 'c3867713ee74484da5e13675002ed2f2', '加盟方', '2', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:41:55', null, null);
INSERT INTO `sys_dict` VALUES ('a6a5b5dffe754fd5901698bf10cf2f15', '29e1ec45542b4082af0aa16a1142a9c1', '双身份', '2', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('a77fda4f171f45f1b089f0dd18221e22', 'c3867713ee74484da5e13675002ed2f2', '企业发布方', '0', '0', '0', '2017-04-21 18:39:14', '2017-08-14 03:42:23', null, null);
INSERT INTO `sys_dict` VALUES ('a95ef83cb5df4ab69c2f111cd268045b', '0932c0e43db44bab9c7b4b56d7370647', '状态', 'bond_disposal_state', '0', '0', '2017-10-18 17:27:07', '2017-10-18 17:27:07', 'NULL', 'NULL');
INSERT INTO `sys_dict` VALUES ('ac2995fcb30942a1a3a459b03f030649', '29e1ec45542b4082af0aa16a1142a9c1', '系统用户', '0', '0', '0', '2017-04-21 03:10:23', '2017-04-21 03:10:23', null, null);
INSERT INTO `sys_dict` VALUES ('c3867713ee74484da5e13675002ed2f2', '6243f1eafd9a4d2093e8a3265714efab', '用户来源', 'sys_user_reg_type_d', '0', '0', '2017-04-21 18:39:14', '2017-04-21 18:39:14', null, null);
INSERT INTO `sys_dict` VALUES ('c562eaea0c374397b54db80381712a3e', '431cf88631ca47dda0e1ddd4d514f5af', '性别', 'sex_c', null, null, null, null, null, null);
INSERT INTO `sys_dict` VALUES ('cc9770cee62c4b8fa4fd4539e2e8a1fb', 'a21d1190c70545c6a8fe63916c72b0d4', '测试', 'sys_role_test_d', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('d809b08967234ea18b9c5dd233efccb8', '3bc4cc6596a04fe0a2cc1fa2ccd485bf', '成功状态', 'sys_buy_succ_d', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);
INSERT INTO `sys_dict` VALUES ('d8f8be8e778a477c93ae2fd272f7932b', 'a09bb601ea5e445e88b883b1d5c03680', '国资', '2', '0', '0', '2017-09-09 00:59:31', '2017-09-09 00:59:31', null, null);
INSERT INTO `sys_dict` VALUES ('e481ad7d632b48b1b964263c3238038a', 'cc9770cee62c4b8fa4fd4539e2e8a1fb', 'test0', '0', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('f93f88d8c8c94d9a9ec4b79300b074ba', 'cc9770cee62c4b8fa4fd4539e2e8a1fb', 'test1', '1', '0', '0', '2017-04-21 18:53:35', '2017-04-21 18:53:35', null, null);
INSERT INTO `sys_dict` VALUES ('fdede2f6d5d34dcc9ab6a13345ef206c', 'd809b08967234ea18b9c5dd233efccb8', '不成功', '0', '0', '0', '2017-08-21 01:45:44', '2017-08-21 01:45:44', null, null);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `sys_file_id` varchar(255) NOT NULL COMMENT ' 主键',
  `sys_file1_name` varchar(255) DEFAULT 'NULL' COMMENT '文件名',
  `sys_file1_addr` varchar(255) DEFAULT 'NULL' COMMENT '文件地址',
  `sys_file_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_file_createdate` varchar(255) DEFAULT 'NULL' COMMENT '创建时间',
  `sys_file_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '修改人',
  `sys_file_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人',
  `sys_user_id` varchar(255) NOT NULL COMMENT '用户的id',
  `sys_file2_name` varchar(255) DEFAULT NULL COMMENT '第二个图片的名字',
  `sys_file2_addr` varchar(255) DEFAULT NULL COMMENT '图片的地址',
  PRIMARY KEY (`sys_file_id`,`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC COMMENT='系统文件';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('0a1a2fe3c04040ebb13c6f592d58309b', '577ccb8012597.jpg', 'dist/sysfiles/178e3a6d19c14e5e8da9dcf4fcb89286/1', '2017-12-14 14:02:16', '2017/12/08 17:10:24', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '178e3a6d19c14e5e8da9dcf4fcb89286', null, 'dist/sysfiles/178e3a6d19c14e5e8da9dcf4fcb89286/2');
INSERT INTO `sys_file` VALUES ('20a68308b2fe458488d05f541bd44953', 'NULL', 'dist/sysfiles/295d567846ac4e94a64a0e080e62ab4b/1', '2017-12-14 14:01:35', '2017/12/14 11:28:48', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '295d567846ac4e94a64a0e080e62ab4b', null, 'dist/sysfiles/295d567846ac4e94a64a0e080e62ab4b/2');
INSERT INTO `sys_file` VALUES ('2252aa5b03564582836a61977be9a977', 'QQ截图20171204165105.png', 'dist/sysfiles/52d11d4a62004aaaa2b43e432ecfaf89/1QQ截图20171204165105.png', '2017-12-08 09:27:48', '2017/12/08 09:12:06', '52d11d4a62004aaaa2b43e432ecfaf89', '52d11d4a62004aaaa2b43e432ecfaf89', '52d11d4a62004aaaa2b43e432ecfaf89', 'QQ截图20171204165105.png', 'dist/sysfiles/52d11d4a62004aaaa2b43e432ecfaf89/2QQ截图20171204165105.png');
INSERT INTO `sys_file` VALUES ('229daf174dd64388a861e4b1084619ee', 'NULL', 'dist/sysfiles/9382137e350442dfadd04787a1187e45/1', '2017-12-14 14:14:46', '2017/12/12 15:17:04', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '9382137e350442dfadd04787a1187e45', null, 'dist/sysfiles/9382137e350442dfadd04787a1187e45/2');
INSERT INTO `sys_file` VALUES ('298390ef54a0430aa5d5c1e817b4d9d2', '577ccb8180e08.jpg', 'dist/sysfiles/040712112071462ba9a92482b0a083d4/1', '2017-12-09 14:52:05', '2017/12/08 15:57:38', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '040712112071462ba9a92482b0a083d4', '73e109e6a94488251278cab11bdf0a4f.jpg', 'dist/sysfiles/040712112071462ba9a92482b0a083d4/2');
INSERT INTO `sys_file` VALUES ('2c07af7a26db45c988a65d187334fc35', 'NULL', 'dist/sysfiles/6dcc30540982437aa3852e0437a2b8fd/1', null, '2017/12/14 14:16:17', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '6dcc30540982437aa3852e0437a2b8fd', null, 'dist/sysfiles/6dcc30540982437aa3852e0437a2b8fd/2');
INSERT INTO `sys_file` VALUES ('379ec9f4a3a24d4b91cafdcf5ac953c0', 'NULL', 'dist/sysfiles/ede6366dc95d4c5b9eb20276c4cf2292/1', null, '2017/12/14 14:11:28', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', 'ede6366dc95d4c5b9eb20276c4cf2292', null, 'dist/sysfiles/ede6366dc95d4c5b9eb20276c4cf2292/2');
INSERT INTO `sys_file` VALUES ('37f936747377420d9e4da3e66ef528e5', 'NULL', 'dist/sysfiles/b77de81542834a6aa659616d3487e367/1', '2017-12-15 13:36:03', '2017/12/15 13:35:39', 'b77de81542834a6aa659616d3487e367', 'da8c252c6672450db9a4af267aa5e6ad', 'b77de81542834a6aa659616d3487e367', null, 'dist/sysfiles/b77de81542834a6aa659616d3487e367/2');
INSERT INTO `sys_file` VALUES ('3aec5620a2c74b8f8c162457dbc6fe53', 'NULL', 'dist/sysfiles/09bd15529b6a48d8a061f01e1ce211ba/1', '2017-12-14 14:14:58', '2017/12/12 09:13:23', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '09bd15529b6a48d8a061f01e1ce211ba', null, 'dist/sysfiles/09bd15529b6a48d8a061f01e1ce211ba/2');
INSERT INTO `sys_file` VALUES ('3f98a3679dcf495aa37309e4255fd282', 'NULL', 'dist/sysfiles/c762c86f83254a6bace00c00dc4eb662/1', null, '2017/12/14 11:21:26', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', 'c762c86f83254a6bace00c00dc4eb662', null, 'dist/sysfiles/c762c86f83254a6bace00c00dc4eb662/2');
INSERT INTO `sys_file` VALUES ('42f127b31ab448b4bebde4d0a44b3a34', '73e109e6a94488251278cab11bdf0a4f.jpg', 'dist/sysfiles/da8c252c6672450db9a4af267aa5e6ad/173e109e6a94488251278cab11bdf0a4f.jpg', '2017-12-14 14:33:44', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', 'a1009ee46b060d31f489ef81b02f4d4a.jpg', 'dist/sysfiles/da8c252c6672450db9a4af267aa5e6ad/2a1009ee46b060d31f489ef81b02f4d4a.jpg');
INSERT INTO `sys_file` VALUES ('5c72c536949642ce911c5edf7a349def', 'd4752d21b001d2d99f2f769d7d4b5600.jpg', 'dist/sysfiles/6a7e6f30d2d44566ab1172569e28416c/1d4752d21b001d2d99f2f769d7d4b5600.jpg', null, '2017/12/09 14:38:19', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '6a7e6f30d2d44566ab1172569e28416c', null, 'dist/sysfiles/6a7e6f30d2d44566ab1172569e28416c/2');
INSERT INTO `sys_file` VALUES ('6973b2cb41564bd7a1a42f3782482238', 'NULL', 'dist/sysfiles/53e54a9c94c44351ac0318856c5dc5d1/1', '2017-12-09 14:56:15', '2017/12/09 14:53:04', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '53e54a9c94c44351ac0318856c5dc5d1', null, 'dist/sysfiles/53e54a9c94c44351ac0318856c5dc5d1/2');
INSERT INTO `sys_file` VALUES ('70d7ec363ef044ed8ff814566ab974c4', '招聘帐号.txt', 'E:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/adminltemy/sysfile/招聘帐号.txt', '2017-05-02 10:27:46', '2017-05-02 10:27:46', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '', null, null);
INSERT INTO `sys_file` VALUES ('82be36a040cb4ea9a16aaab14d25c1d4', 'NULL', 'dist/sysfiles/c6e45ae09f124e4bb16679b28e07c3cb/1', '2017-12-14 14:03:14', '2017/12/14 11:52:03', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', 'c6e45ae09f124e4bb16679b28e07c3cb', null, 'dist/sysfiles/c6e45ae09f124e4bb16679b28e07c3cb/2');
INSERT INTO `sys_file` VALUES ('864165eaa4354970a71ce492b5c4e233', 'NULL', 'dist/sysfiles/9a5d0d95271048188937031210f89212/1', '2017-12-14 14:16:12', '2017/12/09 14:58:30', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '9a5d0d95271048188937031210f89212', null, 'dist/sysfiles/9a5d0d95271048188937031210f89212/2');
INSERT INTO `sys_file` VALUES ('8ad7dc34d1904918880176c1df56cc54', 'QQ截图20171204165105.png', 'dist/sysfiles/29829c5cf32a4ee8895a57131beb93f3/1QQ截图20171204165105.png', '2017-12-14 14:21:20', '2017/12/14 11:20:43', '29829c5cf32a4ee8895a57131beb93f3', 'da8c252c6672450db9a4af267aa5e6ad', '29829c5cf32a4ee8895a57131beb93f3', 'QQ截图20171204164900.png', 'dist/sysfiles/29829c5cf32a4ee8895a57131beb93f3/2QQ截图20171204164900.png');
INSERT INTO `sys_file` VALUES ('aa6187a5d1af4cf2b6061112a2db1b7d', 'NULL', 'dist/sysfiles/a8a003597b784f7cacfa188f64b4418f/1', null, '2017/12/09 14:58:43', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', 'a8a003597b784f7cacfa188f64b4418f', null, 'dist/sysfiles/a8a003597b784f7cacfa188f64b4418f/2');
INSERT INTO `sys_file` VALUES ('d14e2e3a609142d3b3b98a20a68dbf3c', 'QQ截图20170918022059.png', 'D:/stsworkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/adminkj/sysfiles/QQ截图20170918022059.png', '2017-09-18 02:21:20', '2017-09-18 02:21:20', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '', null, null);
INSERT INTO `sys_file` VALUES ('e59ce4195f224371ad4ce87b90b586ab', '2691b5854c6d2a3ac76f50d10c3f6013.jpg', 'dist/sysfiles/777e3e3ffc7b48d6b55bf584ce9ded95/1', '2017-12-14 14:13:36', '2017/12/07 16:44:39', 'da8c252c6672450db9a4af267aa5e6ad', '777e3e3ffc7b48d6b55bf584ce9ded95', '777e3e3ffc7b48d6b55bf584ce9ded95', '73e109e6a94488251278cab11bdf0a4f.jpg', 'dist/sysfiles/777e3e3ffc7b48d6b55bf584ce9ded95/2');
INSERT INTO `sys_file` VALUES ('ea4900d85722441a8974f3aff2bccfd3', '76c711887fa18d23e323556607df8eb2.jpg', 'dist/sysfiles/04abbf62fc1048e59ec162ddfea8e087/176c711887fa18d23e323556607df8eb2.jpg', null, '2017/12/08 16:00:51', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '04abbf62fc1048e59ec162ddfea8e087', '76c711887fa18d23e323556607df8eb2.jpg', 'dist/sysfiles/04abbf62fc1048e59ec162ddfea8e087/276c711887fa18d23e323556607df8eb2.jpg');

-- ----------------------------
-- Table structure for sys_filex
-- ----------------------------
DROP TABLE IF EXISTS `sys_filex`;
CREATE TABLE `sys_filex` (
  `sys_filex_id` varchar(255) NOT NULL COMMENT ' 主键',
  `sys_filex_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `sys_filex_addr` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `sys_filex_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_filex_createdate` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `sys_filex_updateuid` varchar(255) DEFAULT NULL COMMENT '修改人',
  `sys_filex_createuid` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`sys_filex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_filex
-- ----------------------------
INSERT INTO `sys_filex` VALUES ('1', '577ccb8012597.jpg', 'dist/sysfiles/178e3a6d19c14e5e8da9dcf4fcb89286/1577ccb8012597.jpg', null, null, null, null);
INSERT INTO `sys_filex` VALUES ('40a50f8f4e394cc592c96144c83950b0', '12月12.txt', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/12月12.txt', null, '2017/12/13 15:01:55', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_filex` VALUES ('6967ae5a54564ed8a4fb228fc2e91e11', '110110112.xlsx', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/110110112.xlsx', null, '2017/12/13 14:25:33', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_filex` VALUES ('9a515d4857064da6ad3a026b1961db79', '鑫淼聚平台测试2 20171204.xlsx', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/鑫淼聚平台测试2 20171204.xlsx', null, '2017/12/13 13:56:02', null, 'da8c252c6672450db9a4af267aa5e6ad');
INSERT INTO `sys_filex` VALUES ('e601bc59653148df9c809ac6ebd56a68', '鑫淼聚平台测试2 20171204 1441.xlsx', 'D:/apache-tomcat-7.0.79/webapps/XMJ/upload/鑫淼聚平台测试2 20171204 1441.xlsx', null, '2017/12/13 14:03:47', null, 'da8c252c6672450db9a4af267aa5e6ad');

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
  `sys_goods_audit_d` varchar(255) COLLATE utf8_bin DEFAULT '2' COMMENT '资产审核:1_通过,2_不通过',
  `sys_goods_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_goods_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_goods_createuid` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '创建人id',
  `sys_goods_updateuid` varchar(255) COLLATE utf8_bin DEFAULT 'NULL' COMMENT '修改人id',
  PRIMARY KEY (`sys_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC COMMENT='商品信息表';

-- ----------------------------
-- Records of sys_goods
-- ----------------------------
INSERT INTO `sys_goods` VALUES ('4abc8eb9a11a4b269a87d6318915f0a7', '1', 'e', 'e', 'e', 'e', '2017-09-04 00:00:00', '2017-09-05 00:00:00', null, null, null, '2', '2017-09-09 01:15:54', '2017-09-09 01:16:05', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
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
INSERT INTO `sys_menu` VALUES ('b409189f42654fd6a06a7a068113d565', '0ccd416d257246d79231d7db876a9075', '系统文件管理', 'sys/filex/list', null, null);
INSERT INTO `sys_menu` VALUES ('b5a632a7a466441294ca53f93571623c', 'd89d4708bdd7406da6f684e4a8d21f2a', '购买记录', 'sys/buy/list', null, null);
INSERT INTO `sys_menu` VALUES ('b5ec76178e1b4553947e879dae19461f', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('c97112728510447ab130a85b88541d92', 'ccc19d77c84342c69887cd22b8bfd5de', '单笔资产审核', 'sys/bond/list?bond_deal=1', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('ca0481f406074859a9de0cfafe092221', '0ccd416d257246d79231d7db876a9075', '权限管理', 'sys/perm/tree', '', '');
INSERT INTO `sys_menu` VALUES ('cbab83a6a81345e4852f3c5e1682a784', '2b1753b058f1433a8defe794013ecfc8', '走进鑫淼聚', 'about/us/list', null, 'NULL');
INSERT INTO `sys_menu` VALUES ('ccc19d77c84342c69887cd22b8bfd5de', 'root', '资产委外', 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_menu` VALUES ('d005b1898de74061b5fbde648e54dfec', '9e5fb647769b4162b6ba80ad19433741', '节点管理', 'sys/activiti/tree', '', '');
INSERT INTO `sys_menu` VALUES ('d482851118be4674b09fb386a7bdd02c', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('d48e75286b38452897e6e861a9922b1f', '817e76595b5241d386c4a66f0122d599', '加盟方审核', 'sys/user/query?sys_user_reg_type_d=a55c6e261e774082bbd5521130c5c1e6', null, null);
INSERT INTO `sys_menu` VALUES ('d48e75286b38452897e6e861a9924b1f', '817e76595b5241d386c4a66f0122d599', '用户审核', 'sys/user/query?sys_user_reg_type_d=37b73a43f23a42edb6bef45a96628217', null, null);
INSERT INTO `sys_menu` VALUES ('d48e75286b38452897e6e861a9924b9f', '817e76595b5241d386c4a66f0122d599', '用户查询', 'sys/user/query', null, null);
INSERT INTO `sys_menu` VALUES ('d89d4708bdd7406da6f684e4a8d21f2a', 'root', '购买管理', null, null, null);
INSERT INTO `sys_menu` VALUES ('e3e5d57933b84d4b80c7b6dd9860c9d4', '0ccd416d257246d79231d7db876a9075', '角色管理', 'sys/role/tree', '', '');
INSERT INTO `sys_menu` VALUES ('e72d1f637ac940aebbe2a36e0b2e0a88', 'root', '资产管理', null, null, null);
INSERT INTO `sys_menu` VALUES ('e7dc8a885290493fa3283b196d9ee787', '0ccd416d257246d79231d7db876a9075', '菜单管理', 'sys/menu/tree', '', '');
INSERT INTO `sys_menu` VALUES ('f6f3b0334aa646a88f92d059fc9e5ca8', '', '', '', '', '');
INSERT INTO `sys_menu` VALUES ('f7cd6582eb4b47b6b623cd5f29ff751e', 'fdf99edaa39148b7a894881a0a5d1c6f', '请假管理', 'sys/leave/list', '', '');
INSERT INTO `sys_menu` VALUES ('f9bce4469f4447a39c33cd5b3c44827e', 'ccc19d77c84342c69887cd22b8bfd5de', '资产包审核', 'sys/bond/list?bond_deal=2', 'NULL', 'NULL');

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
INSERT INTO `sys_perm` VALUES ('0839124898eb4496878abd63ba79a009', '0d47f47b038e4eb9a29d2360b83cc48f', '查询所有树节点', 'perms[auctionInfo:treenodeall]', '/auction/info/treenodeall', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('0d47f47b038e4eb9a29d2360b83cc48f', 'root', '用户管理', 'perms[auctionInfo:all]', '/auction/info/**', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('0d736d08c24e40b6b7a8022197318057', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '增加页面', 'perms[sysFile:goadd]', '/sys/file/goadd', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('0eae92d5888548b699f3d05a47b6ab1c', '2e3ef8186ff44080897aaa07cbd48adf', '修改页面', 'perms[sysBuy:goedit]', '/sys/buy/goedit', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('113bcf7431f4470c8e7535afc0aff581', '2e3ef8186ff44080897aaa07cbd48adf', '页面', 'perms[sysBuy:pages]', '/pages/sys/buy/**', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('1218e874069144a687aab44cebc234eb', '4dcca247b7134c3ab3156e2dea30860f', '保存', 'perms[sysPerm:save]', '/sys/perm/save', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('1275a9394e8e4154b3ebfa346999bc2e', '0d47f47b038e4eb9a29d2360b83cc48f', '删除', 'perms[auctionInfo:del]', '/auction/info/del', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('12c69d4925c34d399be31fce3037be9a', '14a4ed27e5fb433599a50157b66be691', '删除树节点', 'perms[sysGoods:deltree]', '/sys/buy/deltree', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('14a4ed27e5fb433599a50157b66be691', 'root', '资产管理', 'perms[sysGoods:all]', '/sys/buy/**', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('1528901f1409476ea0b2d3498b9c013a', '6b53d41674374feb9c9fe122c386e62b', '树页面', 'perms[sysDict:tree]', '/sys/dict/tree', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('18226bf4b23d427c9362f6e893407714', 'eeceec9f880d4f7eaa7d255655a1a25a', '修改页面', 'perms[sysMenu:goedit]', '/sys/menu/goedit', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('1ae99746820d4c2882e5cd472d9b52f7', '6b53d41674374feb9c9fe122c386e62b', '页面', 'perms[sysDict:pages]', '/pages/sys/dict/**', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('1c8165c0f4d146acbc381cd1395a5d9f', '4dcca247b7134c3ab3156e2dea30860f', '树页面', 'perms[sysPerm:tree]', '/sys/perm/tree', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('1e77eaad20c74e1c9898dede322a9a12', 'root', '角色管理', 'perms[sysRole:all]', '/sys/role/**', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('20c21c3307d942b99b135e96aa66c725', '0d47f47b038e4eb9a29d2360b83cc48f', '修改', 'perms[auctionInfo:edit]', '/auction/info/edit', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('217c32ca9b974fafa2c8963e4d7d302b', '1e77eaad20c74e1c9898dede322a9a12', '保存树', 'perms[sysRole:savetree]', '/sys/role/savetree', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('2187824e583d49ffbc80c19b55eba26a', '1e77eaad20c74e1c9898dede322a9a12', '树页面', 'perms[sysRole:tree]', '/sys/role/tree', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('2700adcfcece44fea01c7770feac2b81', '4f4ed019e53b4cd3a5f1c74531197a41', '修改页面', 'perms[sysUser:goedit]', '/sys/user/goedit', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('270663f30c8f4b41aeb41b169ff3b783', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '上传', 'perms[sysFile:upload]', '/sys/file/upload', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('288357c2378a4c6082f01d7aeaa4eaac', '4f4ed019e53b4cd3a5f1c74531197a41', '增加', 'perms[sysUser:save]', '/sys/user/save', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('28ebbfdcc4e74a4d9c01e25d99b8b897', '1e77eaad20c74e1c9898dede322a9a12', '修改页面', 'perms[sysRole:goedit]', '/sys/role/goedit', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', 'root', '文件管理', 'perms[sysFile:all]', '/sys/file/**', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('2e3ef8186ff44080897aaa07cbd48adf', 'root', '购买管理', 'perms[sysBuy:all]', '/sys/buy/**', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('38486d00b1d24e4caf7cb845af9c4824', '6b53d41674374feb9c9fe122c386e62b', '修改页面', 'perms[sysDict:goedit]', '/sys/dict/goedit', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('3a49e7a494ab40339d8623abddc226ad', '2e3ef8186ff44080897aaa07cbd48adf', '增加页面', 'perms[sysBuy:goadd]', '/sys/buy/goadd', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('3aa00316db7a48bb908621923d8e0bb7', 'eeceec9f880d4f7eaa7d255655a1a25a', '修改', 'perms[sysMenu:edit]', '/sys/menu/edit', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('3aab72678b7a4582baca33bcdc6feba1', '0d47f47b038e4eb9a29d2360b83cc48f', '保存树', 'perms[auctionInfo:savetree]', '/auction/info/savetree', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('3bb3f4e8af914b03a0289b835ce319db', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '修改页面', 'perms[sysFile:goedit]', '/sys/file/goedit', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('3e1440f0a35144e688d9d07c7464038a', '14a4ed27e5fb433599a50157b66be691', '保存页面', 'perms[sysGoods:goadd]', '/sys/buy/goadd', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('41bfbfaed85743f6b4796e84c71adf0d', '0d47f47b038e4eb9a29d2360b83cc48f', '页面', 'perms[auctionInfo:pages]', '/pages/auction/info/**', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('421f17e29d33496bb22bde2fc8653641', '0d47f47b038e4eb9a29d2360b83cc48f', '批量删除', 'perms[auctionInfo:delall]', '/auction/info/delall', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('43a254960d7c484b8e104ae335eaa3b6', 'eeceec9f880d4f7eaa7d255655a1a25a', '查询树节点', 'perms[sysMenu:treenode]', '/sys/menu/treenode', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
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
INSERT INTO `sys_perm` VALUES ('7c552a0b523440328ee8c93f92183e65', '0d47f47b038e4eb9a29d2360b83cc48f', '树页面', 'perms[auctionInfo:tree]', '/auction/info/tree', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('8221aa26b4cf4f0a8d933a423e1dc77e', 'eeceec9f880d4f7eaa7d255655a1a25a', '删除', 'perms[sysMenu:del]', '/sys/menu/del', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('86cae2a4e1764204aa2bbf8bd002ea9f', '14a4ed27e5fb433599a50157b66be691', '保存树', 'perms[sysGoods:savetree]', '/sys/buy/savetree', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('891b5add919f4275b9970ddca0d8804d', 'eeceec9f880d4f7eaa7d255655a1a25a', '树页面', 'perms[sysMenu:tree]', '/sys/menu/tree', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('89c824a34c314585b038b4ce79054e2d', '14a4ed27e5fb433599a50157b66be691', '修改', 'perms[sysGoods:edit]', '/sys/buy/edit', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('8cc234c931174c25968e96248b7fb8fa', '14a4ed27e5fb433599a50157b66be691', '修改页面', 'perms[sysGoods:goedit]', '/sys/buy/goedit', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('8d4a10775fff4ee183295a3d680482e4', '4f4ed019e53b4cd3a5f1c74531197a41', '增加页面', 'perms[sysUser:goadd]', '/sys/user/goadd', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('8e58200baf134a9cac8ace7052cc3090', '0d47f47b038e4eb9a29d2360b83cc48f', '保存页面', 'perms[auctionInfo:goadd]', '/auction/info/goadd', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('918a6331377248218bf8593be510b7b4', 'eeceec9f880d4f7eaa7d255655a1a25a', '保存', 'perms[sysMenu:save]', '/sys/menu/save', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('9231a4419ae14fa89559cbe2302f8aef', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '删除', 'perms[sysFile:del]', '/sys/file/del', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('93862e931848401f9097d3f77be7e815', '4dcca247b7134c3ab3156e2dea30860f', '修改', 'perms[sysPerm:edit]', '/sys/perm/edit', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('944fe9ec8b2f4aea93db91b3a566d97f', '14a4ed27e5fb433599a50157b66be691', '查询所有树节点', 'perms[sysGoods:treenodeall]', '/sys/buy/treenodeall', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('967ac38941e244cd9e7298f5a57e2666', '2e3ef8186ff44080897aaa07cbd48adf', '树列表', 'perms[sysBuy:listtree]', '/sys/buy/listtree', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('9ec8ea8de44c420eb95bf5a68fd1e875', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '修改', 'perms[sysFile:edit]', '/sys/file/edit', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('9ef5634c9f6149f88999456fb77648a9', '2e3ef8186ff44080897aaa07cbd48adf', '列表', 'perms[sysBuy:list]', '/sys/buy/list', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('a4beee06a7c04b8fa392c7f970d7daf2', '6b53d41674374feb9c9fe122c386e62b', '保存', 'perms[sysDict:save]', '/sys/dict/save', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('aa792c41a66f468eae5b3762fcfbf497', '6b53d41674374feb9c9fe122c386e62b', '保存树', 'perms[sysDict:savetree]', '/sys/dict/savetree', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('acb51fadc0704c29a2eddcd500f94ab7', '1e77eaad20c74e1c9898dede322a9a12', '页面', 'perms[sysRole:pages]', '/pages/sys/role/**', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('b432a46371b5407a8d9392cd62d189ae', '2e3ef8186ff44080897aaa07cbd48adf', '批量删除', 'perms[sysBuy:delall]', '/sys/buy/delall', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('b90379b8fa81432fb3826ea52ac66bc6', '0d47f47b038e4eb9a29d2360b83cc48f', '删除树节点', 'perms[auctionInfo:deltree]', '/auction/info/deltree', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('ba70f014dc6b4f4cb717d2d178bbdab5', '4dcca247b7134c3ab3156e2dea30860f', '批量删除', 'perms[sysPerm:delall]', '/sys/perm/delall', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('bd427a4fd2c64c1cbb8c0fe544043595', 'eeceec9f880d4f7eaa7d255655a1a25a', '保存树', 'perms[sysMenu:savetree]', '/sys/menu/savetree', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('c165d75d64974443a32143fee40f6f52', '6b53d41674374feb9c9fe122c386e62b', '查询树节点', 'perms[sysDict:treenode]', '/sys/dict/treenode', '2017-04-20 17:38:04', '2017-04-20 17:38:04', null, null);
INSERT INTO `sys_perm` VALUES ('c6b73381847c4728a34089fcc7455c13', '4f4ed019e53b4cd3a5f1c74531197a41', '页面', 'perms[sysUser:pages]', '/pages/sys/user/**', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('c6c828011580454e908e5bcb87416b98', '6b53d41674374feb9c9fe122c386e62b', '修改', 'perms[sysDict:edit]', '/sys/dict/edit', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('c82385e9cd4644cb9c5393c280a85d2d', '1e77eaad20c74e1c9898dede322a9a12', '保存', 'perms[sysRole:save]', '/sys/role/save', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('c89bc39427bb46daa90613b5222c7b1e', 'eeceec9f880d4f7eaa7d255655a1a25a', '查询所有树节点', 'perms[sysMenu:treenodeall]', '/sys/menu/treenodeall', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('c9449f278c384dbbacd352affb2cb260', '6b53d41674374feb9c9fe122c386e62b', '删除', 'perms[sysDict:del]', '/sys/dict/del', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('ca19903291e7419ba7a7c4da5e2d9a86', '4dcca247b7134c3ab3156e2dea30860f', '页面', 'perms[sysPerm:pages]', '/pages/sys/perm/**', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('cc0fb413134649dca752d3eb36c66a47', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '树列表', 'perms[sysFile:listtree]', '/sys/file/listtree', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('cc2714fde9fa4fd4967cfb6e006b2777', '4f4ed019e53b4cd3a5f1c74531197a41', '批量删除', 'perms[sysUser:delall]', '/sys/user/delall', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('cec77113b4574977b0425d848a5d4d2f', '4f4ed019e53b4cd3a5f1c74531197a41', '修改', 'perms[sysUser:edit]', '/sys/user/edit', '2017-04-18 15:20:55', '2017-04-18 15:20:55', null, null);
INSERT INTO `sys_perm` VALUES ('d17331a9447e4f58b753707c6179cb27', '4dcca247b7134c3ab3156e2dea30860f', '保存树', 'perms[sysPerm:savetree]', '/sys/perm/savetree', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('d20c82b7a6484f4f992eb9aa533c06c2', 'eeceec9f880d4f7eaa7d255655a1a25a', '保存页面', 'perms[sysMenu:goadd]', '/sys/menu/goadd', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('d4d35ebbfcfc4fac8dccff3970c5cd61', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '批量删除', 'perms[sysFile:delall]', '/sys/file/delall', '2017-05-02 10:27:13', '2017-05-02 10:27:13', null, null);
INSERT INTO `sys_perm` VALUES ('d51929fe10f64ea19db89c1fc1a52d18', '14a4ed27e5fb433599a50157b66be691', '批量删除', 'perms[sysGoods:delall]', '/sys/buy/delall', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('d880108bb2374514b09cff4ed35b0f70', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '上传', 'perms[sysFile:download]', '/sys/file/upload', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('d8c4f16457a8473dbf96f82e6c6e9151', 'eeceec9f880d4f7eaa7d255655a1a25a', '批量删除', 'perms[sysMenu:delall]', '/sys/menu/delall', '2017-04-18 17:10:27', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('db23f33f224e4f7390d8cdae4002c367', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '增加', 'perms[sysFile:save]', '/sys/file/save', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('dc15597f79b749d1b5b2f6fd5208bcb3', '6b53d41674374feb9c9fe122c386e62b', '查询所有树节点', 'perms[sysDict:treenodeall]', '/sys/dict/treenodeall', '2017-04-20 17:38:04', '2017-04-20 17:38:04', null, null);
INSERT INTO `sys_perm` VALUES ('deef91d75c544d26a6cfd2752b44b6cc', '2e3ef8186ff44080897aaa07cbd48adf', '上传', 'perms[sysBuy:download]', '/sys/buy/upload', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('e34359202b614f9188fc5b67470486ee', 'eeceec9f880d4f7eaa7d255655a1a25a', '删除树节点', 'perms[sysMenu:deltree]', '/sys/menu/deltree', '2017-04-22 00:00:00', '2017-04-18 17:10:27', null, null);
INSERT INTO `sys_perm` VALUES ('e67b215082434ff8bc41d16bc73814e7', '6b53d41674374feb9c9fe122c386e62b', '保存页面', 'perms[sysDict:goadd]', '/sys/dict/goadd', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('e77c5249fca5471483db1c8e0ea2427d', '0d47f47b038e4eb9a29d2360b83cc48f', '修改页面', 'perms[auctionInfo:goedit]', '/auction/info/goedit', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('e9a8d2d155c049c783a8409e893656e1', '4dcca247b7134c3ab3156e2dea30860f', '查询树节点', 'perms[sysPerm:treenode]', '/sys/perm/treenode', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('edf0d059976f4c9a8c93f8d239634e64', '1e77eaad20c74e1c9898dede322a9a12', '查询所有树节点', 'perms[sysRole:treenodeall]', '/sys/role/treenodeall', '2017-04-19 09:46:32', '2017-04-19 09:46:32', null, null);
INSERT INTO `sys_perm` VALUES ('eeceec9f880d4f7eaa7d255655a1a25a', 'root', '菜单管理', 'perms[sysMenu:all]', '/sys/menu/**', '2017-04-18 17:10:26', '2017-04-18 17:10:26', null, null);
INSERT INTO `sys_perm` VALUES ('f1e1138c321c4fabbd3bed90d92738f9', '4dcca247b7134c3ab3156e2dea30860f', '保存页面', 'perms[sysPerm:goadd]', '/sys/perm/goadd', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('f200f4fce01d4ff991fac193f078fdb0', '0d47f47b038e4eb9a29d2360b83cc48f', '保存', 'perms[auctionInfo:save]', '/auction/info/save', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('f3318bafc23549ba97ca78ddfeb5626e', '4dcca247b7134c3ab3156e2dea30860f', '删除树节点', 'perms[sysPerm:deltree]', '/sys/perm/deltree', '2017-04-19 09:17:14', '2017-04-19 09:17:14', null, null);
INSERT INTO `sys_perm` VALUES ('f41209db28284ca9a937d4faed265def', '1e77eaad20c74e1c9898dede322a9a12', '删除', 'perms[sysRole:del]', '/sys/role/del', '2017-04-19 09:46:31', '2017-04-19 09:46:31', null, null);
INSERT INTO `sys_perm` VALUES ('f423aa88d85c48e3a00312156428e938', '6b53d41674374feb9c9fe122c386e62b', '批量删除', 'perms[sysDict:delall]', '/sys/dict/delall', '2017-04-20 17:38:03', '2017-04-20 17:38:03', null, null);
INSERT INTO `sys_perm` VALUES ('f52823758639410a9c6d54a5e82743d5', '2e3ef8186ff44080897aaa07cbd48adf', '修改', 'perms[sysBuy:edit]', '/sys/buy/edit', '2017-08-21 01:46:30', '2017-08-21 01:46:30', null, null);
INSERT INTO `sys_perm` VALUES ('f613f43cf16d4915bb9d40711e883c0c', '14a4ed27e5fb433599a50157b66be691', '删除', 'perms[sysGoods:del]', '/sys/buy/del', '2017-09-09 00:58:27', '2017-09-09 00:58:27', null, null);
INSERT INTO `sys_perm` VALUES ('f6e2197b47a6429785fb4c1528d83b1d', '2dcdf7724f8f4d8eaf3c9fce6a0d8e3d', '列表', 'perms[sysFile:list]', '/sys/file/list', '2017-05-02 10:27:12', '2017-05-02 10:27:12', null, null);
INSERT INTO `sys_perm` VALUES ('fb831a390cfe4dcf84f51173840ea41e', '0d47f47b038e4eb9a29d2360b83cc48f', '查询树节点', 'perms[auctionInfo:treenode]', '/auction/info/treenode', '2017-12-13 10:34:53', '2017-12-13 10:34:53', 'NULL', 'NULL');
INSERT INTO `sys_perm` VALUES ('fb9217c06607479d8118fafa89628994', '4f4ed019e53b4cd3a5f1c74531197a41', '列表', 'perms[sysUser:list]', '/sys/user/list', '2017-04-18 15:20:54', '2017-04-18 15:20:54', null, null);
INSERT INTO `sys_perm` VALUES ('fc0c9f0a95b24a80a728f34b3d4981f3', '6b53d41674374feb9c9fe122c386e62b', '删除树节点', 'perms[sysDict:deltree]', '/sys/dict/deltree', '2017-04-20 17:38:04', '2017-04-20 17:38:04', null, null);

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
INSERT INTO `sys_role` VALUES ('06a3d18abf654eee930f5f3056669493', '80ee0f9eb8424b859d34e5f7cba4e27c', '石家庄市加盟商', 'NULL', '2017-11-28 13:38:48', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('2cb56e881c5c43b2ba6169eb06ea78ed', '684da94e41ea44a98570bb184a562439', '一般管理员', 'NULL', '2017-11-22 16:03:18', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('3931c06d05644e3492ddac865e8a476c', '4042c4f046814b22acda898d1aa5754c', '武汉市加盟商', 'NULL', '2017-11-30 09:15:57', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('4042c4f046814b22acda898d1aa5754c', '86edbfafb55c4a48a2821eeb517a581c', '湖北省', 'NULL', '2017-11-30 09:15:17', '2017-11-30 09:16:12', 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('408654c4ea3648769ec5786b1fe6531f', '86edbfafb55c4a48a2821eeb517a581c', '天津市', 'NULL', '2017-11-28 10:46:59', '2017-11-30 09:16:08', 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('42e8da5208cf4d4da4708272a501ed96', 'root', '管理员', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('57ba63d1942c4eea8c939a924409993d', '06a3d18abf654eee930f5f3056669493', '长安区加盟', 'NULL', '2017-11-28 13:50:21', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('684da94e41ea44a98570bb184a562439', '42e8da5208cf4d4da4708272a501ed96', '超级管理员', '', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('6c3b5685a9534f38aee3d56535fb4250', '80ee0f9eb8424b859d34e5f7cba4e27c', '邢台加盟方', 'NULL', '2017-12-04 10:26:40', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('80ee0f9eb8424b859d34e5f7cba4e27c', '86edbfafb55c4a48a2821eeb517a581c', '河北省', 'NULL', '2017-11-22 16:04:06', '2017-11-30 09:16:05', 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('86edbfafb55c4a48a2821eeb517a581c', '684da94e41ea44a98570bb184a562439', '加盟方', 'NULL', '2017-11-22 16:03:44', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('8734e33911d64f87abd7a544168414fe', '80ee0f9eb8424b859d34e5f7cba4e27c', '廊坊市加盟方', 'NULL', '2017-12-06 09:59:40', '2017-12-06 09:59:48', 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('cf34aba72c164f8d92f63467466bd577', 'd0e102e112c64463b4d10fddb6d55614', '郑州市加盟商', 'NULL', '2017-11-28 13:45:31', null, 'NULL', 'NULL', 'NULL');
INSERT INTO `sys_role` VALUES ('d0e102e112c64463b4d10fddb6d55614', '86edbfafb55c4a48a2821eeb517a581c', '河南省', 'NULL', '2017-11-28 13:45:21', '2017-11-30 09:16:02', 'NULL', 'NULL', 'NULL');

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
INSERT INTO `sys_role_menu` VALUES ('05e2feb594ab460cb6376239da8b3196', '8734e33911d64f87abd7a544168414fe', '1212ecbeb8f2439db47d22067fb07a68', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('05e9aafad1fa4da5a2789959dcd0720d', '8734e33911d64f87abd7a544168414fe', '26dc8309b2f8414b924b6166d821a637', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('074812c898734a97a58da9e8effd0b85', 'd0e102e112c64463b4d10fddb6d55614', '19d9e0d3ecff4e339de7d910b6227c67', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('0fefa1913f4348a68b108e4759f0a26a', '6c3b5685a9534f38aee3d56535fb4250', 'd48e75286b38452897e6e861a9922b1f', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('1f8df79c94304fde92f37639bc7f7dad', 'd0e102e112c64463b4d10fddb6d55614', '512faabc2b0141adacbef614220cf7e0', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('22e0edbf791c4c7eb36af9af2bcc80bd', '80ee0f9eb8424b859d34e5f7cba4e27c', '82450024f2de499397da2cedac74fdf8', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('24962af1e68742e68322605c2d00080e', 'd0e102e112c64463b4d10fddb6d55614', 'e7dc8a885290493fa3283b196d9ee787', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('286724dce6314cecbf5ba49f3aadfc9e', '6c3b5685a9534f38aee3d56535fb4250', '817e76595b5241d386c4a66f0122d599', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('34f41d3610664e51a4894791a1babc04', 'd0e102e112c64463b4d10fddb6d55614', '0ccd416d257246d79231d7db876a9075', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('362d05a7703a49b984543a80458d1a86', '8734e33911d64f87abd7a544168414fe', 'e72d1f637ac940aebbe2a36e0b2e0a88', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('3aa5f182bfb64d9695488e07a8f783a4', '8734e33911d64f87abd7a544168414fe', 'ccc19d77c84342c69887cd22b8bfd5de', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('3c9baffa5ae04dd7a60b35bb8ebc160c', 'd0e102e112c64463b4d10fddb6d55614', 'b5a632a7a466441294ca53f93571623c', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('4290472e624f4161a440b9f7b9859f02', '80ee0f9eb8424b859d34e5f7cba4e27c', '2b1753b058f1433a8defe794013ecfc8', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('474deb0b2e40413589f52c71277e0fc3', '8734e33911d64f87abd7a544168414fe', '4730ec04a4fc40d09e1c9f17ce56f9ae', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('57ee1ba4467444f59133fcace429ff03', '80ee0f9eb8424b859d34e5f7cba4e27c', '1cfb5064e86a42b2a3118446ae678bca', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('8052f86466894b7da21d45b6e4bee5fa', '80ee0f9eb8424b859d34e5f7cba4e27c', 'ccc19d77c84342c69887cd22b8bfd5de', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('80c7319fe83b4f379446f214cb2735de', '06a3d18abf654eee930f5f3056669493', 'ccc19d77c84342c69887cd22b8bfd5de', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('908649b1cac9482ba39f25ea84212858', 'd0e102e112c64463b4d10fddb6d55614', 'ca0481f406074859a9de0cfafe092221', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('a0a3e500608047b3a6333597a5e22fd7', '80ee0f9eb8424b859d34e5f7cba4e27c', 'a459e2be2f8d41a4b9bd0f5b4d441708', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('af502dad755847de8bab8fdea681db89', '80ee0f9eb8424b859d34e5f7cba4e27c', '26dc8309b2f8414b924b6166d821a637', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('b0d348f8927142da9e81f0252e41a6da', '408654c4ea3648769ec5786b1fe6531f', '26dc8309b2f8414b924b6166d821a637', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('b212ac9ec4fd480cab4679cf50578f91', '80ee0f9eb8424b859d34e5f7cba4e27c', 'e72d1f637ac940aebbe2a36e0b2e0a88', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('b54f288df60c4f5e839a379a7a6207dd', '3931c06d05644e3492ddac865e8a476c', '1212ecbeb8f2439db47d22067fb07a68', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('b97b465971f74d36b688037a95a1e839', '06a3d18abf654eee930f5f3056669493', '1212ecbeb8f2439db47d22067fb07a68', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('bfaa45dde3434e578bbb14b3c6495024', '80ee0f9eb8424b859d34e5f7cba4e27c', '06015fb13ca344a7b5519819fd129124', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('c204548ba1b94dbaae8896182f435b52', 'd0e102e112c64463b4d10fddb6d55614', '41ab04a45d1847a4aa50235f57a87de1', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('c691a1357c5a460d92a8e0d22be20b55', '408654c4ea3648769ec5786b1fe6531f', 'e72d1f637ac940aebbe2a36e0b2e0a88', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('d004dedb91014417a0537145361c0253', '3931c06d05644e3492ddac865e8a476c', 'ccc19d77c84342c69887cd22b8bfd5de', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('d0b7774bd321401ea08b0922847f91bd', '80ee0f9eb8424b859d34e5f7cba4e27c', 'c97112728510447ab130a85b88541d92', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('e3499ccbce2348bbaad67953dd8f5be1', '80ee0f9eb8424b859d34e5f7cba4e27c', 'f9bce4469f4447a39c33cd5b3c44827e', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('e4bf09f09bf9460eaf1c814c9ab7a8b6', 'd0e102e112c64463b4d10fddb6d55614', 'e3e5d57933b84d4b80c7b6dd9860c9d4', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('e56bcbd8cda24167abc45d711b353c34', 'd0e102e112c64463b4d10fddb6d55614', 'd89d4708bdd7406da6f684e4a8d21f2a', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('ec4e04a4874a470383eb443ecc8b7c25', '8734e33911d64f87abd7a544168414fe', 'b5a632a7a466441294ca53f93571623c', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('f07c419f0a52432daf712cf8dc1ed354', '8734e33911d64f87abd7a544168414fe', 'd89d4708bdd7406da6f684e4a8d21f2a', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('f3ab33a019c64532973968c520721b0b', '80ee0f9eb8424b859d34e5f7cba4e27c', '220941abb91b457889ac3f9865a1240f', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('f40f858a328e43c69457037f46a6459c', '80ee0f9eb8424b859d34e5f7cba4e27c', '4730ec04a4fc40d09e1c9f17ce56f9ae', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('f5a97b7f98664237ba221e4f66e539be', '80ee0f9eb8424b859d34e5f7cba4e27c', 'cbab83a6a81345e4852f3c5e1682a784', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_role_menu` VALUES ('fd9d67d857d94776a598d44c45922105', 'd0e102e112c64463b4d10fddb6d55614', 'b409189f42654fd6a06a7a068113d565', 'selected', null, null, 'NULL', 'NULL');

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
  `sys_user_status_d` varchar(255) DEFAULT '880d185f11794395a9439705eab558e0' COMMENT '用户状态:0_审核通过,1_待审核',
  `sys_user_card` varchar(255) DEFAULT 'NULL' COMMENT '身份证号',
  `sys_user_flag_c` varchar(255) DEFAULT 'NULL' COMMENT '用户标记:0_系统用户,1_注册用户,2_双身份',
  `sys_user_reg_date` datetime DEFAULT NULL COMMENT '注册时间',
  `sys_user_reg_type_d` varchar(255) DEFAULT '37b73a43f23a42edb6bef45a96628217' COMMENT '用户来源:0_企业发布方,1_普通用户,2_加盟方',
  `sys_area_id` varchar(255) DEFAULT '-1' COMMENT '所在地主键',
  `sys_org_id` varchar(255) DEFAULT 'NULL' COMMENT '组织机构主键',
  `sys_user_createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `sys_user_updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `sys_user_createuid` varchar(255) DEFAULT 'NULL' COMMENT '创建人id',
  `sys_user_updateuid` varchar(255) DEFAULT 'NULL' COMMENT '修改人id',
  `sys_company_area` varchar(255) DEFAULT '-1' COMMENT '公司的地址',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('04abbf62fc1048e59ec162ddfea8e087', '河北会海', '1234569875', 'c5bbf79292db6c2c930d0265f42cb606', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '110009', 'NULL', '2017-11-09 09:58:25', '2017-12-08 16:00:51', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '-1');
INSERT INTO `sys_user` VALUES ('09bd15529b6a48d8a061f01e1ce211ba', '吉利科技有限公司', '15533333333', '71453ddb631476c4441bd45394a0cfbe', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '120003', 'NULL', '2017-12-12 09:11:49', '2017-12-14 14:14:58', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '-1');
INSERT INTO `sys_user` VALUES ('159f12e8df134e2997be074a23f817af', '河北催收', '15963215963', 'fdea44f1016d990e67424222ee6cae2a', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '110003', 'NULL', '2017-12-06 10:18:13', '2017-12-06 10:18:54', 'NULL', '159f12e8df134e2997be074a23f817af', '-1');
INSERT INTO `sys_user` VALUES ('178e3a6d19c14e5e8da9dcf4fcb89286', '邢台加盟商', '123456654', '293f6b826f11031de18b0adcd1eb8b0d', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a55c6e261e774082bbd5521130c5c1e6', '110005', 'NULL', '2017-12-04 10:25:58', '2017-12-14 14:02:16', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '110014');
INSERT INTO `sys_user` VALUES ('209922d27af74d85856c2171109f6eaa', '用户管理员', 'useradmin', '56b84c4cd72bc9dc685ea72946c3f963', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '110009', 'NULL', '2017-09-15 01:10:52', '2017-12-01 17:28:53', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '-1');
INSERT INTO `sys_user` VALUES ('295d567846ac4e94a64a0e080e62ab4b', '廊坊加盟方', 'langfang123', '921c43bc659971d33740ade8d79b6cb9', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a55c6e261e774082bbd5521130c5c1e6', '110010', 'NULL', '2017-12-06 09:58:38', '2017-12-14 14:01:35', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '110009');
INSERT INTO `sys_user` VALUES ('29829c5cf32a4ee8895a57131beb93f3', '湖南发财金融', '17722222222', '8c8e0109de7a114840fdf7840c25ebdc', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '160001', '156987456999885666', '2017-12-14 09:20:42', '2017-12-14 14:21:20', 'NULL', '29829c5cf32a4ee8895a57131beb93f3', '-1');
INSERT INTO `sys_user` VALUES ('3eec968c9d47425cbd2d7f826bbf02ae', '我是发布方', '15345678911', '2046b53ff2973fa416cc45ae8943b898', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '150001', 'NULL', '2017-11-24 15:03:17', '2017-11-24 17:23:36', 'NULL', '3eec968c9d47425cbd2d7f826bbf02ae', '130001');
INSERT INTO `sys_user` VALUES ('52d11d4a62004aaaa2b43e432ecfaf89', '一想金融', '15933333333', 'd7a3a29e05f1d5af4b32ca033e00b77a', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '20004', 'NULL', '2017-12-08 09:09:49', '2017-12-08 09:28:49', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '20004');
INSERT INTO `sys_user` VALUES ('6a7e6f30d2d44566ab1172569e28416c', '河北汇海', '11111111111', '8dd09390b9b9d9f3068dae70cd7d79e1', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '110001', '000000', '2017-11-23 16:25:43', '2017-12-09 14:38:19', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '110001');
INSERT INTO `sys_user` VALUES ('6dcc30540982437aa3852e0437a2b8fd', '注册发布方', '15532479301', 'af8eccaa9f2ccd9dbad898c30ea9ab07', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '110001', 'NULL', '2017-12-11 14:36:35', '2017-12-14 14:16:17', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '-1');
INSERT INTO `sys_user` VALUES ('777e3e3ffc7b48d6b55bf584ce9ded95', '石家庄市加盟商', '12345678911', 'cffc8dbe3c0cb9640915625176401f49', '2017-11-01 00:00:00', 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a55c6e261e774082bbd5521130c5c1e6', '110001', '123', '2017-11-27 08:48:21', '2017-12-14 14:13:36', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '110001');
INSERT INTO `sys_user` VALUES ('80a2cd4c33a5417ba0287f4cb8ccdcc4', '石家庄发布方', '15532479300', '30bf04be21c64094744e6edfd0537270', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '300001', 'NULL', '2017-12-01 13:49:39', null, 'NULL', 'NULL', '-1');
INSERT INTO `sys_user` VALUES ('9382137e350442dfadd04787a1187e45', '石家庄催收', '13266666666', '5f56123ae425ed9fb8bde9bd2fed4246', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '110001', 'NULL', '2017-12-12 15:12:54', '2017-12-14 14:14:46', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '-1');
INSERT INTO `sys_user` VALUES ('9a5d0d95271048188937031210f89212', '汇海金融', '98765432111', '314c14c2f70ea78102a676dbbbb046f5', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '300001', 'NULL', '2017-12-09 14:58:30', '2017-12-14 14:16:12', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '110001');
INSERT INTO `sys_user` VALUES ('a8a003597b784f7cacfa188f64b4418f', '鑫淼聚处置', '22222222222', '0a4efee11a30ba110fc9a1d80defb16a', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '110001', '0', '2017-11-23 16:33:35', '2017-12-09 14:58:43', 'NULL', 'da8c252c6672450db9a4af267aa5e6ad', '110001');
INSERT INTO `sys_user` VALUES ('b77de81542834a6aa659616d3487e367', '天津发布方', 'tianjin', '4edd7106126b09b5adbcf452e5eda257', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a77fda4f171f45f1b089f0dd18221e22', '10001', 'NULL', '2017-11-27 14:15:29', '2017-12-15 13:36:03', 'da8c252c6672450db9a4af267aa5e6ad', 'b77de81542834a6aa659616d3487e367', '300001');
INSERT INTO `sys_user` VALUES ('c6e45ae09f124e4bb16679b28e07c3cb', '湖北省加盟方', '123456789123', '74e464cad9ea535f9ed2269f2cbd5a16', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a55c6e261e774082bbd5521130c5c1e6', '150001', 'NULL', '2017-11-30 14:24:50', '2017-12-14 14:03:14', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '150001');
INSERT INTO `sys_user` VALUES ('da8c252c6672450db9a4af267aa5e6ad', '超人', 'admin', 'be98207ac6d9de9ce8f53ada21922be3', null, null, '0b34577203734a9b94ea5dade26879ca', '', 'a6a5b5dffe754fd5901698bf10cf2f15', null, '37b73a43f23a42edb6bef45a96628217', '110001', '123', null, '2017-12-14 14:33:44', null, 'da8c252c6672450db9a4af267aa5e6ad', '110001');
INSERT INTO `sys_user` VALUES ('db5f327f80ff41a8b1d5536d83d816ef', '普通用户', '12345678915', '0f37debfe8434a67f822444c84f0ba4f', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '10001', 'NULL', '2017-11-27 16:21:27', null, 'da8c252c6672450db9a4af267aa5e6ad', 'NULL', '10001');
INSERT INTO `sys_user` VALUES ('e53a23d606014114b72a9c40b3c57bf8', '加盟方', '13346602135', 'c67927cc042e300da015d51477cede1c', null, 'NULL', '880d185f11794395a9439705eab558e0', 'NULL', 'NULL', null, '37b73a43f23a42edb6bef45a96628217', '100006', 'NULL', '2017-11-24 16:01:11', '2017-11-24 16:44:15', 'NULL', 'e53a23d606014114b72a9c40b3c57bf8', '110001');
INSERT INTO `sys_user` VALUES ('ede6366dc95d4c5b9eb20276c4cf2292', '郑州市加盟商', '12345678914', 'b733e3ab07d489fb02596fc0e01b7ff0', null, 'NULL', '0b34577203734a9b94ea5dade26879ca', 'NULL', 'NULL', null, 'a55c6e261e774082bbd5521130c5c1e6', '130001', 'NULL', '2017-11-28 13:46:46', '2017-12-14 14:11:28', 'da8c252c6672450db9a4af267aa5e6ad', 'da8c252c6672450db9a4af267aa5e6ad', '130001');

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
INSERT INTO `sys_user_role` VALUES ('156490996641416fa8538c3693f1951d', '777e3e3ffc7b48d6b55bf584ce9ded95', '06a3d18abf654eee930f5f3056669493', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('1bec0450e0e54fac95db548754618c4a', 'b77de81542834a6aa659616d3487e367', '86edbfafb55c4a48a2821eeb517a581c', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('1d7a1d6a591641e098f0848e0a0579f1', '178e3a6d19c14e5e8da9dcf4fcb89286', '6c3b5685a9534f38aee3d56535fb4250', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('4811e1e6422d4e81ad4a2adb1358f1c4', 'c6e45ae09f124e4bb16679b28e07c3cb', '86edbfafb55c4a48a2821eeb517a581c', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('48ef28784af84cebaad911475c41be13', 'c6e45ae09f124e4bb16679b28e07c3cb', '3931c06d05644e3492ddac865e8a476c', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('4eee453de7e1467ca399c52871e0aac6', 'c6e45ae09f124e4bb16679b28e07c3cb', '684da94e41ea44a98570bb184a562439', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('5e037745ebaf44a5acb2c99b14f0c745', 'b77de81542834a6aa659616d3487e367', '684da94e41ea44a98570bb184a562439', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('7895afaa66904cb3a60ea4f4ba3da8cf', '295d567846ac4e94a64a0e080e62ab4b', '8734e33911d64f87abd7a544168414fe', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('a4e964c5451c4dc99083e3b0fecd133b', 'b77de81542834a6aa659616d3487e367', '42e8da5208cf4d4da4708272a501ed96', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('a989a360d6b2463a95a5634f8b8fdf02', 'c6e45ae09f124e4bb16679b28e07c3cb', '4042c4f046814b22acda898d1aa5754c', 'selected', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('b1b1280070ad48c59cc41258c73f4f28', 'b77de81542834a6aa659616d3487e367', '80ee0f9eb8424b859d34e5f7cba4e27c', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('c834d67574994459901afb2dcfbb720d', 'c6e45ae09f124e4bb16679b28e07c3cb', '42e8da5208cf4d4da4708272a501ed96', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('cd72c05ad80b4ff38c547a4693894288', '04abbf62fc1048e59ec162ddfea8e087', '06a3d18abf654eee930f5f3056669493', 'partsel', null, null, 'NULL', 'NULL');
INSERT INTO `sys_user_role` VALUES ('ce54590cf0b548d894b777b1ee8db66e', '209922d27af74d85856c2171109f6eaa', '42e8da5208cf4d4da4708272a501ed96', 'partsel', null, null, 'NULL', 'NULL');
