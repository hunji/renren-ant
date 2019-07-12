/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : sendrepair

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 12/07/2019 17:42:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'ZQ7889900-Pad1562904976558', 1562924530890, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:58:55');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:59:05');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:59:15');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:59:25');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:59:35');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:59:45');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 14:59:55');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'test', 0, NULL, 1, '2019-06-26 15:00:05');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 15:00:15');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'test', 0, NULL, 1, '2019-06-26 15:00:25');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 15:00:35');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 15:00:45');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 15:00:55');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'test', 0, NULL, 0, '2019-06-26 15:01:05');

-- ----------------------------
-- Table structure for sr_approval
-- ----------------------------
DROP TABLE IF EXISTS `sr_approval`;
CREATE TABLE `sr_approval`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `created_time` datetime(0) DEFAULT NULL COMMENT '审批时间',
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '审批意见',
  `status` bit(1) DEFAULT NULL COMMENT '审批状态1.通过0.不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sr_approval
-- ----------------------------
INSERT INTO `sr_approval` VALUES (4, 3, 'admin', '2019-06-10 11:32:31', NULL, b'1');
INSERT INTO `sr_approval` VALUES (5, 3, 'admin', '2019-06-10 16:10:55', '同意111', b'1');
INSERT INTO `sr_approval` VALUES (6, 2, 'admin', '2019-06-10 16:16:28', NULL, b'1');
INSERT INTO `sr_approval` VALUES (7, 2, 'admin', '2019-06-10 16:20:57', '不同意111', b'0');
INSERT INTO `sr_approval` VALUES (8, 2, 'admin', '2019-06-10 16:21:33', NULL, b'1');
INSERT INTO `sr_approval` VALUES (9, 2, 'admin', '2019-06-10 16:21:47', '不同意2222不同意2222不同意2222不同意2222不同意2222不同意2222', b'0');
INSERT INTO `sr_approval` VALUES (10, 2, 'admin', '2019-06-11 13:03:45', NULL, b'1');
INSERT INTO `sr_approval` VALUES (11, 2, 'admin', '2019-06-11 13:03:57', '456', b'0');
INSERT INTO `sr_approval` VALUES (12, 4, 'dongcd', '2019-06-11 16:19:42', NULL, b'1');
INSERT INTO `sr_approval` VALUES (13, 4, 'dongcd', '2019-06-11 16:19:42', NULL, b'1');
INSERT INTO `sr_approval` VALUES (14, 4, 'jisk', '2019-06-11 16:20:53', '同意', b'1');
INSERT INTO `sr_approval` VALUES (15, 5, 'dongcd', '2019-06-11 17:20:37', NULL, b'1');
INSERT INTO `sr_approval` VALUES (16, 5, 'jisk', '2019-06-11 17:22:06', '通过', b'1');
INSERT INTO `sr_approval` VALUES (17, 7, 'hunji', '2019-06-14 14:06:22', NULL, b'1');

-- ----------------------------
-- Table structure for sr_order
-- ----------------------------
DROP TABLE IF EXISTS `sr_order`;
CREATE TABLE `sr_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trustee_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '委托单位名称',
  `trustee_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '委托单位编号',
  `contact_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系人电话',
  `contract_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '关联合同主键',
  `contract_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '合同号',
  `wheel_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '轮对型号',
  `workshop` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '送修车间（所）',
  `send_date` date DEFAULT NULL COMMENT '送修日期',
  `send_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '维修地点',
  `created_date` date DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `serial_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '序列号',
  `status` int(8) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sr_order
-- ----------------------------
INSERT INTO `sr_order` VALUES (1, '青岛四方庞巴迪', '3001', '雷羽', '13934526673', '1', 'QDBST1M2501503', 'CRH1A250', '转向架车间', '2019-06-04', '太原智奇公司', '2019-06-04', 1, 'SRNO201906050001', 0);
INSERT INTO `sr_order` VALUES (3, '安杰达精密机械(苏州)有限公司太原分公司', '3054', '张三', '1223456', '', '123456', '123456', '123456', '2019-06-05', '太原智奇', '2019-06-06', 1, 'SRNO201906060001', 20);
INSERT INTO `sr_order` VALUES (4, '中国铁道科学研究院集团有限公司铁道科学技术研究发展中心', '3056', '11', '11', '', '11', '11', '11', '2019-06-11', '11', '2019-06-11', 3, 'SRNO201906110001', 20);
INSERT INTO `sr_order` VALUES (5, '山西海洛斯铸锻件有限公司', '3055', '22', '22', '', '22', '22', '22', '2019-06-10', '22', '2019-06-11', 3, 'SRNO201906110002', 20);
INSERT INTO `sr_order` VALUES (6, '中国铁路沈阳局集团有限公司沈阳动车段', '3069', '333', '33', '', 'sydcd[2018]0037', '33', '33', '2019-06-12', '33', '2019-06-12', 3, 'SRNO201906120001', 0);
INSERT INTO `sr_order` VALUES (7, '中国铁路沈阳局集团有限公司沈阳动车段', '3069', '1', '1', '', 'sydcd[2017]0024', '1', '1', '2019-06-14', '1', '2019-06-14', 2, 'SRNO201906140001', 10);

-- ----------------------------
-- Table structure for sr_order_wheel_info
-- ----------------------------
DROP TABLE IF EXISTS `sr_order_wheel_info`;
CREATE TABLE `sr_order_wheel_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operating_interval` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运营区间',
  `train_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '列车编号',
  `train_formation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '列车编组',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所在车、轴、位',
  `wheel_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '轮对号',
  `alxe_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '车轴号',
  `gearbox_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '齿轮箱号',
  `has_four` bit(1) DEFAULT NULL COMMENT '是否有四级修记录',
  `four_mile` int(10) DEFAULT NULL COMMENT '四级修时走行公里数',
  `mile` int(10) DEFAULT NULL COMMENT '轮对运行里程',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '送修原因',
  `suggest` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '建议检修内容',
  `trouble_shooting` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '近期轮对较大故障处理清单',
  `has_left_bearing` bit(1) DEFAULT NULL COMMENT '左端是否带轴承',
  `has_right_bearing` bit(1) DEFAULT NULL COMMENT '右端是否带轴承',
  `lift_bearing_mile` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '左轴承运行里程数',
  `right_bearing_mile` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '右轴承运行里程数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `sr_order_id` bigint(20) DEFAULT NULL COMMENT '关联sr_order表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sr_order_wheel_info
-- ----------------------------
INSERT INTO `sr_order_wheel_info` VALUES (2, '1', '1', '1', '1', '1', '1', '11', b'0', NULL, 1, '1', '1', '1', b'0', b'0', '1', '', '1', NULL, NULL, 1);
INSERT INTO `sr_order_wheel_info` VALUES (3, '2', '2', '2', '2', '2', '2', '22', b'0', NULL, 2, '2', '2', '2', b'0', b'0', '', '', '2', NULL, NULL, 2);
INSERT INTO `sr_order_wheel_info` VALUES (4, '3', '3', '3', '3', '3', '3', '3', b'1', 3, 3, '3', '3', '3', b'1', b'1', '3', '3', '3', NULL, NULL, NULL);
INSERT INTO `sr_order_wheel_info` VALUES (5, '4', '4', '4', '4', '4', '4', '4', b'1', 4, 4, '4', '4', '4', b'1', b'1', '4', '4', '4', NULL, NULL, 1);
INSERT INTO `sr_order_wheel_info` VALUES (6, '广珠线', 'CRH1A-1118', '8', '1118车组06车02轴', 'ZQM1C001700', 'E0900025-0034', '', b'0', NULL, NULL, '齿轮箱吊杆螺纹孔损伤', '四级修+换轮+不压轴承', '齿轮箱吊杆螺纹孔损伤', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 1, '2019-06-11 16:05:46', 2);
INSERT INTO `sr_order_wheel_info` VALUES (7, '广珠线', 'CRH1A-1098', '8', '1098车组00车01轴', 'ZQM1C001914', 'E0901239-0036', '', b'0', NULL, NULL, '齿轮箱油堵有铁屑', '四级修+不压轴承', '无', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 1, '2019-06-11 16:05:46', 2);
INSERT INTO `sr_order_wheel_info` VALUES (8, '广珠线', 'CRH1A-1112', '8', '1112车组07车01轴', 'ZQT1D000530', 'E0900285-0012', '', b'0', NULL, NULL, '五级修', '五级修+不压轴承', '无', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 1, '2019-06-11 16:05:46', 2);
INSERT INTO `sr_order_wheel_info` VALUES (9, '广珠线', 'CRH1A-1118', '8', '1118车组06车02轴', 'ZQM1C001700', 'E0900025-0034', '', b'0', NULL, NULL, '齿轮箱吊杆螺纹孔损伤', '四级修+换轮+不压轴承', '齿轮箱吊杆螺纹孔损伤', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 3, '2019-06-11 16:19:10', 4);
INSERT INTO `sr_order_wheel_info` VALUES (10, '广珠线', 'CRH1A-1098', '8', '1098车组00车01轴', 'ZQM1C001914', 'E0901239-0036', '', b'0', NULL, NULL, '齿轮箱油堵有铁屑', '四级修+不压轴承', '无', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 3, '2019-06-11 16:19:10', 4);
INSERT INTO `sr_order_wheel_info` VALUES (11, '广珠线', 'CRH1A-1112', '8', '1112车组07车01轴', 'ZQT1D000530', 'E0900285-0012', '', b'0', NULL, NULL, '五级修', '五级修+不压轴承', '无', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 3, '2019-06-11 16:19:10', 4);
INSERT INTO `sr_order_wheel_info` VALUES (12, '广珠线', 'CRH1A-1118', '8', '1118车组06车02轴', 'ZQM1C001700', 'E0900025-0034', '', b'0', NULL, NULL, '齿轮箱吊杆螺纹孔损伤', '四级修+换轮+不压轴承', '齿轮箱吊杆螺纹孔损伤', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 3, '2019-06-11 17:19:42', 5);
INSERT INTO `sr_order_wheel_info` VALUES (13, '广珠线', 'CRH1A-1098', '8', '1098车组00车01轴', 'ZQM1C001914', 'E0901239-0036', '', b'0', NULL, NULL, '齿轮箱油堵有铁屑', '四级修+不压轴承', '无', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 3, '2019-06-11 17:19:42', 5);
INSERT INTO `sr_order_wheel_info` VALUES (14, '广珠线', 'CRH1A-1112', '8', '1112车组07车01轴', 'ZQT1D000530', 'E0900285-0012', '', b'0', NULL, NULL, '五级修', '五级修+不压轴承', '无', b'0', b'0', NULL, NULL, '已交履历卡片、技术卡片', 3, '2019-06-11 17:19:42', 5);

-- ----------------------------
-- Table structure for sr_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `sr_serial_number`;
CREATE TABLE `sr_serial_number`  (
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标识：如20190606',
  `serial_number` int(5) NOT NULL COMMENT '当前版本号(当前最大为9999)',
  `version` int(5) DEFAULT NULL COMMENT '乐观锁标志位',
  UNIQUE INDEX `UK_NAME`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sr_serial_number
-- ----------------------------
INSERT INTO `sr_serial_number` VALUES ('SRNO20190605', 2, 2);
INSERT INTO `sr_serial_number` VALUES ('SRNO20190611', 2, 2);
INSERT INTO `sr_serial_number` VALUES ('SRNO20190612', 1, 1);
INSERT INTO `sr_serial_number` VALUES ('SRNO20190614', 1, 1);

-- ----------------------------
-- Table structure for sr_user_occ
-- ----------------------------
DROP TABLE IF EXISTS `sr_user_occ`;
CREATE TABLE `sr_user_occ`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `occ01` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sr_user_occ
-- ----------------------------
INSERT INTO `sr_user_occ` VALUES (178, '3069', 2);
INSERT INTO `sr_user_occ` VALUES (186, '3093', 3);
INSERT INTO `sr_user_occ` VALUES (188, '3093', 4);
INSERT INTO `sr_user_occ` VALUES (189, '3069', 4);

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('0157c92f-8a9a-446d-8d0a-725ea768e1e8', 'n2nwm', '2019-07-08 13:58:02');
INSERT INTO `sys_captcha` VALUES ('030686e0-355f-4ccb-856a-21b6b7f0e089', '8n7nb', '2019-07-04 12:34:42');
INSERT INTO `sys_captcha` VALUES ('0397040e-a25c-4973-859e-0cc67b49b7e5', 'nyfgw', '2019-07-04 14:11:08');
INSERT INTO `sys_captcha` VALUES ('055b8540-837f-11e9-8e24-6b8fd69b3cac', 'n7dme', '2019-05-31 16:40:19');
INSERT INTO `sys_captcha` VALUES ('07b38cc0-8384-11e9-a4c7-d7d85c4d386a', 'bn6fc', '2019-05-31 17:16:10');
INSERT INTO `sys_captcha` VALUES ('084a9084-e9ef-40ed-8ea6-ecb116272f73', '8pm58', '2019-07-08 11:48:47');
INSERT INTO `sys_captcha` VALUES ('08c63530-a014-4549-82d6-d27f7ac2cb07', 'n6fpn', '2019-07-10 10:20:45');
INSERT INTO `sys_captcha` VALUES ('0996bdf0-837f-11e9-8e24-6b8fd69b3cac', 'mea5e', '2019-05-31 16:40:26');
INSERT INTO `sys_captcha` VALUES ('09bb2328-e22c-49eb-8387-9057f098142d', '46yxp', '2019-06-11 11:58:20');
INSERT INTO `sys_captcha` VALUES ('09ce9fc1-ffce-4915-8501-8384dbc3b2f4', 'c58xp', '2019-06-03 15:13:38');
INSERT INTO `sys_captcha` VALUES ('0a1a93f0-837f-11e9-8e24-6b8fd69b3cac', 'dwd42', '2019-05-31 16:40:27');
INSERT INTO `sys_captcha` VALUES ('0a337320-837f-11e9-8e24-6b8fd69b3cac', 'bdany', '2019-05-31 16:40:27');
INSERT INTO `sys_captcha` VALUES ('0a93f060-8384-11e9-b769-f993f9eddcfd', '8dfn8', '2019-05-31 17:16:15');
INSERT INTO `sys_captcha` VALUES ('0ab944f0-837f-11e9-8e24-6b8fd69b3cac', 'fnnen', '2019-05-31 16:40:28');
INSERT INTO `sys_captcha` VALUES ('1007009f-6842-4e45-83d9-1230d2f4f54b', 'efwae', '2019-07-04 12:27:01');
INSERT INTO `sys_captcha` VALUES ('11dc2502-dc88-4620-85a3-f424a80b3c88', 'd6ng2', '2019-07-04 09:10:09');
INSERT INTO `sys_captcha` VALUES ('120f0290-a214-11e9-9299-6de0eafa319c', '5ympf', '2019-07-09 14:42:50');
INSERT INTO `sys_captcha` VALUES ('178f9890-8380-11e9-8490-e375bb19e5d1', '7e6d2', '2019-05-31 16:47:59');
INSERT INTO `sys_captcha` VALUES ('190b8111-fee4-4e51-8742-78cb3fe3d1d3', '72n6p', '2019-07-04 12:21:41');
INSERT INTO `sys_captcha` VALUES ('1d7fe1f2-65a1-44a4-8799-1e4e410758c9', 'pfpgm', '2019-07-05 08:54:16');
INSERT INTO `sys_captcha` VALUES ('20500a48-f50c-40fe-8263-91d870cdf555', 'x6nnb', '2019-07-08 09:03:31');
INSERT INTO `sys_captcha` VALUES ('20afd3f0-837f-11e9-8e24-6b8fd69b3cac', '8dacy', '2019-05-31 16:41:05');
INSERT INTO `sys_captcha` VALUES ('23004030-a216-11e9-9147-338faa2e9237', '4ednx', '2019-07-09 14:57:37');
INSERT INTO `sys_captcha` VALUES ('25426320-8379-11e9-a9d4-5f87d04db960', '72b2w', '2019-05-31 15:58:15');
INSERT INTO `sys_captcha` VALUES ('270455b5-eff1-4a01-8541-8f79dffc6d0e', 'x2pfx', '2019-07-08 18:17:10');
INSERT INTO `sys_captcha` VALUES ('2b3cf3b3-3e33-4a5e-83f8-f572e24a2ae6', 'na3y6', '2019-07-08 14:37:25');
INSERT INTO `sys_captcha` VALUES ('2bfeaed5-fcf7-4cf6-85fc-e67b57aa1265', 'xxm6e', '2019-07-08 11:00:44');
INSERT INTO `sys_captcha` VALUES ('3291c9de-d6eb-467c-8f90-1d03eb84caa4', 'edbg4', '2019-07-04 11:54:20');
INSERT INTO `sys_captcha` VALUES ('369d2f2b-4ff9-4fb1-8a6d-f47ea1d72557', 'd7m52', '2019-07-04 17:29:37');
INSERT INTO `sys_captcha` VALUES ('371deaa0-8384-11e9-b769-f993f9eddcfd', '226m4', '2019-05-31 17:17:30');
INSERT INTO `sys_captcha` VALUES ('389aab79-6d4e-46a1-86eb-22ab8bbcae60', 'ndfnn', '2019-07-08 09:03:31');
INSERT INTO `sys_captcha` VALUES ('3a516466-be57-458f-843b-cd43ce265287', 'ddyw3', '2019-07-08 17:52:29');
INSERT INTO `sys_captcha` VALUES ('3c0bea57-e653-42cb-8bb5-eb16a8537053', 'wgb53', '2019-07-08 13:51:59');
INSERT INTO `sys_captcha` VALUES ('3c2284c4-749a-4a06-8103-0b0c7a2756be', '6p4en', '2019-07-08 17:40:55');
INSERT INTO `sys_captcha` VALUES ('3c611d70-8384-11e9-af00-bb79885fb347', '6a68c', '2019-05-31 17:17:38');
INSERT INTO `sys_captcha` VALUES ('3c97f220-a213-11e9-9855-c1059360189f', '6ay7c', '2019-07-09 14:36:52');
INSERT INTO `sys_captcha` VALUES ('3e2d6470-8f9d-40f8-8e71-2bcf40694258', '7madx', '2019-07-04 12:25:08');
INSERT INTO `sys_captcha` VALUES ('3e445d60-8379-11e9-a47a-393f19df96c2', 'm2x5a', '2019-05-31 15:58:57');
INSERT INTO `sys_captcha` VALUES ('44793a18-a81f-4089-80d8-5855bac9dfb0', 'a3fg8', '2019-06-03 15:12:23');
INSERT INTO `sys_captcha` VALUES ('4a5ec098-1f00-4ff3-8e19-3ea3e28769a9', '5nmwy', '2019-06-02 09:46:19');
INSERT INTO `sys_captcha` VALUES ('4ad9f720-837d-11e9-9bf0-fd8bb593f9d5', 'feda4', '2019-05-31 16:27:56');
INSERT INTO `sys_captcha` VALUES ('4ca93c10-8381-11e9-8490-e375bb19e5d1', 'wd5na', '2019-05-31 16:56:37');
INSERT INTO `sys_captcha` VALUES ('4cb09f43-67b4-4e53-87b0-a225e7ea79fd', 'm6n64', '2019-07-08 17:09:10');
INSERT INTO `sys_captcha` VALUES ('515f1fd0-837d-11e9-8e24-6b8fd69b3cac', 'yefb4', '2019-05-31 16:28:07');
INSERT INTO `sys_captcha` VALUES ('523a0e25-bf5a-4877-8e60-37ace1bc9de2', 'y2n2x', '2019-07-04 09:03:36');
INSERT INTO `sys_captcha` VALUES ('52cfc6d0-837d-11e9-8e24-6b8fd69b3cac', 'w8c4a', '2019-05-31 16:28:10');
INSERT INTO `sys_captcha` VALUES ('534c22c0-837d-11e9-8e24-6b8fd69b3cac', 'pgb6x', '2019-05-31 16:28:10');
INSERT INTO `sys_captcha` VALUES ('53648cc0-837d-11e9-8e24-6b8fd69b3cac', 'wcna6', '2019-05-31 16:28:10');
INSERT INTO `sys_captcha` VALUES ('537ad3e0-837d-11e9-8e24-6b8fd69b3cac', '4xgya', '2019-05-31 16:28:11');
INSERT INTO `sys_captcha` VALUES ('542040e7-6dd2-4ec7-8950-25f02d9d2e76', '6p33d', '2019-07-08 14:02:06');
INSERT INTO `sys_captcha` VALUES ('55efd2e0-837a-11e9-badd-19fa4c5682ed', 'gpygx', '2019-05-31 16:06:46');
INSERT INTO `sys_captcha` VALUES ('56f3fea0-8389-11e9-a2bb-e730fcc54c0e', 'w5n7n', '2019-05-31 17:54:10');
INSERT INTO `sys_captcha` VALUES ('59db06e5-742b-4f38-869f-a8f6788af781', 'pg3nn', '2019-07-08 17:49:58');
INSERT INTO `sys_captcha` VALUES ('5d7c2bf2-9c64-40e4-8c8b-d05ba9d12f3e', 'xmmyf', '2019-07-08 17:39:15');
INSERT INTO `sys_captcha` VALUES ('5e4e6501-867b-4083-8376-a055a549e36b', 'ec47f', '2019-07-04 12:25:17');
INSERT INTO `sys_captcha` VALUES ('5ec05420-d18f-434a-8c7f-913ca7accda1', 'm72n8', '2019-07-08 10:54:54');
INSERT INTO `sys_captcha` VALUES ('60204472-4602-4511-8b6b-0c202ad769f3', '2782a', '2019-07-04 13:05:30');
INSERT INTO `sys_captcha` VALUES ('61823830-8f2c-43e7-89c4-85c3088583d5', 'a5nde', '2019-07-08 12:04:33');
INSERT INTO `sys_captcha` VALUES ('61cc31f0-8382-11e9-8490-e375bb19e5d1', 'd53nw', '2019-05-31 17:04:22');
INSERT INTO `sys_captcha` VALUES ('63c5ec88-d353-4e95-89a4-298f76fc0b54', 'y3awa', '2019-07-05 15:18:17');
INSERT INTO `sys_captcha` VALUES ('6524a710-a213-11e9-a028-a95f54012cb6', 'nng78', '2019-07-09 14:38:00');
INSERT INTO `sys_captcha` VALUES ('671a2afc-6dc7-4054-8b9d-5cb9ee82e002', 'naapx', '2019-07-04 12:24:02');
INSERT INTO `sys_captcha` VALUES ('679d5c75-d0c8-4324-88f2-024dc4f5ab2c', 'gadwm', '2019-07-04 11:54:28');
INSERT INTO `sys_captcha` VALUES ('6a4de09b-69f6-42eb-8339-8df7795a9082', 'nw8nm', '2019-07-08 16:47:15');
INSERT INTO `sys_captcha` VALUES ('6d39c496-2573-4c9f-8967-38abd614e272', '26ew2', '2019-07-09 09:35:29');
INSERT INTO `sys_captcha` VALUES ('6efe4942-6b09-4fd0-8a8c-ef4898296f00', 'gxge2', '2019-07-04 09:03:55');
INSERT INTO `sys_captcha` VALUES ('6f8472e1-fce2-48f2-88dd-4bc758d540df', '3webd', '2019-05-31 14:56:01');
INSERT INTO `sys_captcha` VALUES ('7169b0fc-4e7f-4b8f-8a8a-7fe219ee9f87', 'pd75n', '2019-07-05 14:19:10');
INSERT INTO `sys_captcha` VALUES ('72b77d20-8379-11e9-a47a-393f19df96c2', 'efe2d', '2019-05-31 16:00:25');
INSERT INTO `sys_captcha` VALUES ('73d55734-2703-4279-86c4-2d5098981307', 'ed45d', '2019-07-08 18:05:39');
INSERT INTO `sys_captcha` VALUES ('76fca0e0-8379-11e9-9f0f-976658a475c9', 'cenx4', '2019-05-31 16:00:32');
INSERT INTO `sys_captcha` VALUES ('77833572-42be-44e3-8ab4-f92422b9a906', 'nmyxm', '2019-07-08 11:01:19');
INSERT INTO `sys_captcha` VALUES ('7a613810-a217-11e9-88e3-890d1e384d67', 'ce2fa', '2019-07-09 15:07:13');
INSERT INTO `sys_captcha` VALUES ('7b8c96cd-ce29-4e51-81eb-9dc44c997ac2', '862nc', '2019-07-04 14:04:55');
INSERT INTO `sys_captcha` VALUES ('81bab750-8384-11e9-af00-bb79885fb347', '55cne', '2019-05-31 17:19:35');
INSERT INTO `sys_captcha` VALUES ('84cb64a0-8382-11e9-8928-9b6bad35da4b', 'nmpxn', '2019-05-31 17:05:21');
INSERT INTO `sys_captcha` VALUES ('859786e0-8385-11e9-a8ef-b3225018cf94', 'cpneg', '2019-05-31 17:26:51');
INSERT INTO `sys_captcha` VALUES ('87650943-1151-4b60-84eb-0d3a2df482e2', '7b4be', '2019-07-04 17:28:55');
INSERT INTO `sys_captcha` VALUES ('8b87e9a0-8385-11e9-b928-31262f25f20d', 'fp6ma', '2019-05-31 17:27:01');
INSERT INTO `sys_captcha` VALUES ('91be5969-266b-487a-8d15-30f5167e99fb', 'dxwnf', '2019-06-11 11:58:20');
INSERT INTO `sys_captcha` VALUES ('9317fa00-8382-11e9-a4c7-d7d85c4d386a', 'w5m2g', '2019-05-31 17:05:45');
INSERT INTO `sys_captcha` VALUES ('940a6ea7-83eb-42f8-82d3-5fa49b0a598d', '5pn4g', '2019-07-04 17:31:02');
INSERT INTO `sys_captcha` VALUES ('9532e360-8385-11e9-b928-31262f25f20d', 'aby26', '2019-05-31 17:27:17');
INSERT INTO `sys_captcha` VALUES ('99170da6-e886-4911-8881-f3cd162d130a', '6n53b', '2019-07-04 12:35:31');
INSERT INTO `sys_captcha` VALUES ('9ba05e82-2ea6-4569-84d2-60a6eac907cb', 'cme3x', '2019-07-08 16:14:54');
INSERT INTO `sys_captcha` VALUES ('9c1f8590-16fd-497b-89f4-542c2fffad83', 'y54xe', '2019-07-08 16:19:29');
INSERT INTO `sys_captcha` VALUES ('9c313746-bba8-47df-85a8-deb1b6f2d702', '5p7d6', '2019-07-09 09:16:45');
INSERT INTO `sys_captcha` VALUES ('9ee7fc7c-dedc-4a45-8b99-bdef7b04caf4', 'e7n7w', '2019-07-04 09:15:53');
INSERT INTO `sys_captcha` VALUES ('9f02193f-c95e-425b-8715-3019b16351a2', '8bf4p', '2019-07-04 14:06:02');
INSERT INTO `sys_captcha` VALUES ('9ff49d67-1ddb-4cc7-8968-239199dfb556', 'nywf5', '2019-07-04 17:28:18');
INSERT INTO `sys_captcha` VALUES ('a7cb5b8a-fb32-45c0-8a4e-a91887311038', 'nynay', '2019-07-08 18:05:40');
INSERT INTO `sys_captcha` VALUES ('a8e69ce7-7aac-4817-8bf4-6128ce30a9be', 'x7nbm', '2019-05-31 14:54:38');
INSERT INTO `sys_captcha` VALUES ('ab8cd421-aff5-4020-8d6c-efb50ff44818', '73awd', '2019-07-08 18:01:22');
INSERT INTO `sys_captcha` VALUES ('ac806df4-e169-4f55-8e3f-8241e0e13a4c', 'n7xnn', '2019-07-08 18:00:38');
INSERT INTO `sys_captcha` VALUES ('af4d48e9-14ae-486a-8833-ae9a45acee4c', 'byywc', '2019-07-04 09:15:52');
INSERT INTO `sys_captcha` VALUES ('b504c547-947d-4f88-8c16-162f7853981c', 'pggd3', '2019-07-08 17:47:11');
INSERT INTO `sys_captcha` VALUES ('b622c511-b2d1-4b45-8e2c-102fc9fb6c1c', 'nc437', '2019-07-08 17:45:08');
INSERT INTO `sys_captcha` VALUES ('b6bd44aa-7b01-4ab7-86c3-e7ea85a1a747', 'p6225', '2019-07-04 17:32:03');
INSERT INTO `sys_captcha` VALUES ('b6ef1170-a213-11e9-bf74-1b69d24bc68c', 'db6xx', '2019-07-09 14:40:17');
INSERT INTO `sys_captcha` VALUES ('bb8d74aa-519d-43df-8188-635aca140532', 'an8eb', '2019-07-08 10:22:37');
INSERT INTO `sys_captcha` VALUES ('bbee5f4d-ddf2-4b64-8482-9236e4d972d8', 'fp6ep', '2019-07-04 09:03:46');
INSERT INTO `sys_captcha` VALUES ('bf75a72b-d903-47eb-8aa1-ee9423f06dc5', 'd37n6', '2019-07-05 11:02:57');
INSERT INTO `sys_captcha` VALUES ('c2778e86-6efe-4205-8020-163ba41b998d', 'gaxfm', '2019-07-08 16:30:53');
INSERT INTO `sys_captcha` VALUES ('c4513969-0ff6-4050-8dfc-5dc468b59509', '8yen3', '2019-06-06 10:14:21');
INSERT INTO `sys_captcha` VALUES ('c4665eb0-0511-4295-8124-cf1508bf1d5d', 'gan4w', '2019-07-04 12:22:47');
INSERT INTO `sys_captcha` VALUES ('c8644b04-bb88-4cde-8d92-3627e9900fe4', 'd277p', '2019-07-08 18:01:20');
INSERT INTO `sys_captcha` VALUES ('c919d441-9dfa-4731-8fd2-531bdab7e7fe', 'b57ay', '2019-07-04 14:41:24');
INSERT INTO `sys_captcha` VALUES ('cb697cb2-741d-49ab-8107-602ce4943888', 'y2ma7', '2019-07-04 12:33:58');
INSERT INTO `sys_captcha` VALUES ('cb7038ab-b788-4fb3-8763-e2ebb6707829', 'cgnwd', '2019-07-08 17:55:00');
INSERT INTO `sys_captcha` VALUES ('cb93561f-e2fb-4969-8146-44d39f49749d', '786pg', '2019-07-04 09:15:46');
INSERT INTO `sys_captcha` VALUES ('cd26673d-34b9-4ad3-8de0-a10a53d35acb', 'pgwga', '2019-07-08 11:53:08');
INSERT INTO `sys_captcha` VALUES ('cfa04530-fd0d-4123-8929-b3b4665121ed', 'x5bde', '2019-07-04 09:15:50');
INSERT INTO `sys_captcha` VALUES ('cfd17cb1-979b-49f7-8fcd-b388e2d8a1f7', 'yy5bm', '2019-07-05 14:30:13');
INSERT INTO `sys_captcha` VALUES ('d055d45f-b648-4423-8124-df4ef37e4423', 'gm273', '2019-07-04 14:03:42');
INSERT INTO `sys_captcha` VALUES ('d25b0531-1b33-47c0-8acf-0e38ef687b85', 'nn2mw', '2019-07-08 14:59:13');
INSERT INTO `sys_captcha` VALUES ('d2a58590-a38d-11e9-90d8-1b7f93435fc1', 'ng6cm', '2019-07-11 11:49:05');
INSERT INTO `sys_captcha` VALUES ('d2bd2400-a213-11e9-bb8b-bff39361a8fe', '5b5md', '2019-07-09 14:41:04');
INSERT INTO `sys_captcha` VALUES ('d53e8c5e-522a-4322-8fe4-60c8ae87bc58', '5p8y7', '2019-07-08 17:22:07');
INSERT INTO `sys_captcha` VALUES ('db254f90-a2fa-11e9-b09f-8346bd72124f', 'xcbwb', '2019-07-10 18:14:51');
INSERT INTO `sys_captcha` VALUES ('db332874-052d-4105-8008-aff56d0639a8', 'bnc78', '2019-07-08 18:10:59');
INSERT INTO `sys_captcha` VALUES ('db68f838-65ee-41ed-8769-1d2d6c03f46a', '6w7gx', '2019-07-04 09:15:53');
INSERT INTO `sys_captcha` VALUES ('dd47290b-d3bc-411e-81b1-32814874454c', 'ycwc2', '2019-07-08 12:05:51');
INSERT INTO `sys_captcha` VALUES ('de7c26a1-dff4-4b3f-8ab7-18a79fb5678a', '3ncfe', '2019-07-08 17:41:51');
INSERT INTO `sys_captcha` VALUES ('dfc1537e-75f1-42bf-80d3-0e4fb5380102', '7myn7', '2019-07-04 09:02:37');
INSERT INTO `sys_captcha` VALUES ('dff080cb-a35c-4896-80ce-2e1983c06a5c', 'ga52g', '2019-07-08 13:56:53');
INSERT INTO `sys_captcha` VALUES ('e4742d30-a216-11e9-a696-9ba0d84fe4af', 'dwy7n', '2019-07-09 15:03:02');
INSERT INTO `sys_captcha` VALUES ('e487f1eb-1405-4377-8a96-ae4cd5a102ba', 'npcn4', '2019-07-04 09:15:53');
INSERT INTO `sys_captcha` VALUES ('e84be9dd-9108-455b-83e5-bb177cf98421', '487nb', '2019-07-08 13:47:38');
INSERT INTO `sys_captcha` VALUES ('e9cf87f0-8382-11e9-a4c7-d7d85c4d386a', '3pnmx', '2019-05-31 17:08:10');
INSERT INTO `sys_captcha` VALUES ('ed0a16a5-27dd-45ca-8cd5-59f335e7270a', 'gppxg', '2019-06-12 15:13:36');
INSERT INTO `sys_captcha` VALUES ('ee650f40-837a-11e9-8df9-91d2b07105ae', 'cp4pa', '2019-05-31 16:11:02');
INSERT INTO `sys_captcha` VALUES ('f19d0a70-a213-11e9-9dd0-cfa3ebaed665', 'am6pb', '2019-07-09 14:41:55');
INSERT INTO `sys_captcha` VALUES ('f1b52295-4843-436c-8784-0d4db948cc8f', '245nw', '2019-07-05 15:51:05');
INSERT INTO `sys_captcha` VALUES ('f7389767-7300-4c98-85c7-419d3b789f2f', 'wf437', '2019-07-08 13:46:30');
INSERT INTO `sys_captcha` VALUES ('f7a848d0-b758-41d0-8bde-05bbce94f435', 'py2e5', '2019-06-10 09:37:22');
INSERT INTO `sys_captcha` VALUES ('fcdd63fa-ef03-45b6-8bfe-08cecd61099c', 'gy73f', '2019-07-04 14:49:36');
INSERT INTO `sys_captcha` VALUES ('fe003485-49cd-4135-8069-1e7d37057cac', 'wbe5d', '2019-06-03 15:13:30');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'com.youhualife.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"admin\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Jun 3, 2019 3:22:06 PM\"}]', 124, '0:0:0:0:0:0:0:1', '2019-06-03 15:22:07');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"hunji\",\"password\":\"c45fbfcd7bffc401b42cfb8ef6344937049cb6cd6d0c41363e2a345e636b8def\",\"salt\":\"pDmZGYsQ0Zr2Y7hbfafG\",\"email\":\"guo194194@163.com\",\"mobile\":\"15534993486\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 3, 2019 3:30:37 PM\"}]', 26, '0:0:0:0:0:0:0:1', '2019-06-03 15:30:38');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"轮对送修管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":2}]', 7, '0:0:0:0:0:0:0:1', '2019-06-04 11:34:28');
INSERT INTO `sys_log` VALUES (4, 'admin', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"送修单\",\"url\":\"sendrepair/order\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', 13, '0:0:0:0:0:0:0:1', '2019-06-04 14:29:16');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"送修轮对信息\",\"url\":\"endrepair/orderwheelinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":2}]', 8, '0:0:0:0:0:0:0:1', '2019-06-04 14:30:53');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改菜单', 'com.youhualife.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"送修轮对信息\",\"url\":\"sendrepair/orderwheelinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":2}]', 14, '0:0:0:0:0:0:0:1', '2019-06-04 14:31:28');
INSERT INTO `sys_log` VALUES (7, 'admin', '修改菜单', 'com.youhualife.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":32,\"name\":\"查看\",\"perms\":\"sendrepair:order:list,sendrepair:order:info\",\"type\":2,\"orderNum\":1}]', 24, '0:0:0:0:0:0:0:1', '2019-06-04 14:49:09');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改菜单', 'com.youhualife.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":33,\"name\":\"查看\",\"perms\":\"sendrepair:orderwheelinfo:list,sendrepair:orderwheelinfo:info\",\"type\":2,\"orderNum\":1}]', 13, '0:0:0:0:0:0:0:1', '2019-06-04 14:49:24');
INSERT INTO `sys_log` VALUES (9, 'admin', '保存角色', 'com.youhualife.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"动车段\",\"remark\":\"动车段/运用所\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,33,44,45,46,47,-666666],\"createTime\":\"Jun 6, 2019 2:11:54 PM\"}]', 107, '0:0:0:0:0:0:0:1', '2019-06-06 14:11:55');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":32,\"name\":\"审核\",\"url\":\"\",\"perms\":\"sendrepair:order:review\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 8, '0:0:0:0:0:0:0:1', '2019-06-06 14:13:57');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存角色', 'com.youhualife.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"技术科\",\"remark\":\"技术科\",\"createUserId\":1,\"menuIdList\":[40,48,-666666,31,32],\"createTime\":\"Jun 6, 2019 2:14:17 PM\"}]', 12, '0:0:0:0:0:0:0:1', '2019-06-06 14:14:18');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存角色', 'com.youhualife.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"智奇\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Jun 6, 2019 2:14:53 PM\"}]', 7, '0:0:0:0:0:0:0:1', '2019-06-06 14:14:54');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"dongcd\",\"password\":\"8603874c54755074cfafff3faaf5520961efd63bda1d962e4b24347419f32b4a\",\"salt\":\"KNM1c6Wi4qWBRA2Eb7xI\",\"email\":\"dongcd@zq.com\",\"mobile\":\"13934266543\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 6, 2019 2:16:08 PM\"}]', 35, '0:0:0:0:0:0:0:1', '2019-06-06 14:16:09');
INSERT INTO `sys_log` VALUES (14, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"jisk\",\"password\":\"a298b48d40c543c05dcaa12132c9572dca0ead1382ebe9bfe48318798b56519c\",\"salt\":\"sUhPWuAm4uMQ3AiKbcQ4\",\"email\":\"jisk@zq.com\",\"mobile\":\"13934287656\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Jun 6, 2019 2:16:28 PM\"}]', 10, '0:0:0:0:0:0:0:1', '2019-06-06 14:16:28');
INSERT INTO `sys_log` VALUES (15, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"username\":\"zhiq\",\"password\":\"2f47f98146c72be8add5f4fc804ea7d3f9632388a552edf5e07065b72e2f6bd1\",\"salt\":\"7J81O0txyobBLhEGdmFP\",\"email\":\"zhiq@zq.com\",\"mobile\":\"13934656676\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 6, 2019 2:16:49 PM\"}]', 6, '0:0:0:0:0:0:0:1', '2019-06-06 14:16:50');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改菜单', 'com.youhualife.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":32,\"name\":\"审核\",\"url\":\"\",\"perms\":\"sendrepair:order:approve\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 9, '0:0:0:0:0:0:0:1', '2019-06-10 10:55:25');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":32,\"name\":\"发起\",\"url\":\"\",\"perms\":\"sendrepair:order:initiate\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 11, '0:0:0:0:0:0:0:1', '2019-06-10 10:55:58');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"动车段\",\"remark\":\"动车段/运用所\",\"createUserId\":1,\"menuIdList\":[40,41,42,43,49,33,44,45,46,47,-666666,31,32]}]', 103, '0:0:0:0:0:0:0:1', '2019-06-11 16:10:31');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"技术科\",\"remark\":\"技术科\",\"createUserId\":1,\"menuIdList\":[40,48,-666666,31,32]}]', 23, '0:0:0:0:0:0:0:1', '2019-06-11 16:10:38');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"智奇\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[40,-666666,31,32]}]', 21, '0:0:0:0:0:0:0:1', '2019-06-11 16:10:49');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"技术科\",\"remark\":\"技术科\",\"createUserId\":1,\"menuIdList\":[40,48,44,-666666,31,32,33]}]', 115, '0:0:0:0:0:0:0:1', '2019-06-11 16:22:07');
INSERT INTO `sys_log` VALUES (22, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"智奇\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[40,44,-666666,31,32,33]}]', 29, '0:0:0:0:0:0:0:1', '2019-06-11 16:22:16');
INSERT INTO `sys_log` VALUES (23, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"技术科\",\"remark\":\"技术科\",\"createUserId\":1,\"menuIdList\":[40,42,48,44,-666666,31,32,33]}]', 26, '0:0:0:0:0:0:0:1', '2019-06-11 17:26:25');
INSERT INTO `sys_log` VALUES (24, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"username\":\"2\",\"password\":\"fcc131298f678296dec17ed1021ec31a6875dc87aea345df90560599a4fcd4ff\",\"salt\":\"NPTonzsu39VuuGP6CINO\",\"email\":\"2@123.com\",\"mobile\":\"13944346576\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 12, 2019 11:25:21 AM\",\"realName\":\"2\"}]', 101, '0:0:0:0:0:0:0:1', '2019-06-12 11:25:21');
INSERT INTO `sys_log` VALUES (25, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[6]]', 7, '0:0:0:0:0:0:0:1', '2019-06-12 11:25:38');
INSERT INTO `sys_log` VALUES (26, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"hunji\",\"password\":\"c45fbfcd7bffc401b42cfb8ef6344937049cb6cd6d0c41363e2a345e636b8def\",\"salt\":\"pDmZGYsQ0Zr2Y7hbfafG\",\"email\":\"guo194194@163.com\",\"mobile\":\"15534993486\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"realName\":\"郭文彦\"}]', 89, '0:0:0:0:0:0:0:1', '2019-06-12 12:08:21');
INSERT INTO `sys_log` VALUES (27, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"hunji\",\"password\":\"c45fbfcd7bffc401b42cfb8ef6344937049cb6cd6d0c41363e2a345e636b8def\",\"salt\":\"pDmZGYsQ0Zr2Y7hbfafG\",\"email\":\"guo194194@163.com\",\"mobile\":\"15534993486\",\"status\":1,\"roleIdList\":[2,1],\"createUserId\":1,\"realName\":\"郭文彦\"}]', 131, '0:0:0:0:0:0:0:1', '2019-06-14 09:26:48');
INSERT INTO `sys_log` VALUES (28, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"hunji\",\"password\":\"c45fbfcd7bffc401b42cfb8ef6344937049cb6cd6d0c41363e2a345e636b8def\",\"salt\":\"pDmZGYsQ0Zr2Y7hbfafG\",\"email\":\"guo194194@163.com\",\"mobile\":\"15534993486\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"realName\":\"郭文彦\"}]', 101, '0:0:0:0:0:0:0:1', '2019-06-14 14:03:37');
INSERT INTO `sys_log` VALUES (29, 'admin', '保存定时任务', 'com.youhualife.modules.job.controller.ScheduleJobController.save()', '[{\"jobId\":1,\"beanName\":\"testTask\",\"params\":\"test\",\"cronExpression\":\"5,15,25,35,45,55 * * * * ? *\",\"status\":0,\"remark\":\"测试示例\",\"createTime\":\"Jun 26, 2019 2:58:49 PM\"}]', 119, '0:0:0:0:0:0:0:1', '2019-06-26 14:58:49');
INSERT INTO `sys_log` VALUES (30, 'admin', '暂停定时任务', 'com.youhualife.modules.job.controller.ScheduleJobController.pause()', '[[1]]', 20, '0:0:0:0:0:0:0:1', '2019-06-26 15:01:06');
INSERT INTO `sys_log` VALUES (31, 'admin', '删除定时任务', 'com.youhualife.modules.job.controller.ScheduleJobController.delete()', '[[1]]', 44, '0:0:0:0:0:0:0:1', '2019-06-26 15:01:19');
INSERT INTO `sys_log` VALUES (32, 'admin', '修改菜单', 'com.youhualife.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8081/sendrepair/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]', 5, '0:0:0:0:0:0:0:1', '2019-06-26 15:05:13');
INSERT INTO `sys_log` VALUES (33, 'admin', '修改菜单', 'com.youhualife.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8081/sendrepair/swagger/index.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]', 11, '0:0:0:0:0:0:0:1', '2019-06-26 15:06:31');
INSERT INTO `sys_log` VALUES (34, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"hunji\",\"password\":\"c45fbfcd7bffc401b42cfb8ef6344937049cb6cd6d0c41363e2a345e636b8def\",\"salt\":\"pDmZGYsQ0Zr2Y7hbfafG\",\"email\":\"guo194194@163.com\",\"mobile\":\"15534993486\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"realName\":\"郭文彦\"}]', 405, '0:0:0:0:0:0:0:1', '2019-07-08 14:50:23');
INSERT INTO `sys_log` VALUES (35, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"admin\",\"remark\":\"admin\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,40,41,42,43,48,49,33,44,45,46,47,-666666]}]', 126, '0:0:0:0:0:0:0:1', '2019-07-09 09:17:52');
INSERT INTO `sys_log` VALUES (36, 'hunji', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":0,\"name\":\"基本资料\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]', 9, '0:0:0:0:0:0:0:1', '2019-07-09 10:08:10');
INSERT INTO `sys_log` VALUES (37, 'hunji', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":0,\"name\":\"条码打印\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":4}]', 7, '0:0:0:0:0:0:0:1', '2019-07-09 10:08:45');
INSERT INTO `sys_log` VALUES (38, 'hunji', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":0,\"name\":\"流转卡查询\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":5}]', 8, '0:0:0:0:0:0:0:1', '2019-07-09 10:09:04');
INSERT INTO `sys_log` VALUES (39, 'hunji', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":0,\"name\":\"新造电子化\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":6}]', 8, '0:0:0:0:0:0:0:1', '2019-07-09 10:09:18');
INSERT INTO `sys_log` VALUES (40, 'hunji', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":0,\"name\":\"检修电子化\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":7}]', 14, '0:0:0:0:0:0:0:1', '2019-07-09 10:09:34');
INSERT INTO `sys_log` VALUES (41, 'hunji', '保存菜单', 'com.youhualife.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":0,\"name\":\"分析报表\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":8}]', 7, '0:0:0:0:0:0:0:1', '2019-07-09 10:09:50');
INSERT INTO `sys_log` VALUES (42, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"username\":\"test\",\"password\":\"7dd39b101ddfe9f7fdb920d7a0e329c1a07fdbc06dbc44d4b9b6c808dc8c1cef\",\"salt\":\"FYke7nMD7tcpRfy5nJeB\",\"email\":\"132@123.com\",\"mobile\":\"1234\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 11, 2019 3:34:08 PM\",\"realName\":\"gwy\"}]', 23001, '127.0.0.1', '2019-07-11 15:34:08');
INSERT INTO `sys_log` VALUES (43, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[6]]', 9, '127.0.0.1', '2019-07-11 16:36:07');
INSERT INTO `sys_log` VALUES (44, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":17,\"username\":\"test\",\"password\":\"9228332ca7a3847b9b27ecc63f3d9c07625edb6cdeea7cb167166b3e3f70f595\",\"salt\":\"WytHhGFpaHuWHxl8QWvC\",\"email\":\"123@123.com\",\"mobile\":\"1234\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 11, 2019 4:36:38 PM\",\"realName\":\"ssss\"}]', 100, '127.0.0.1', '2019-07-11 16:36:39');
INSERT INTO `sys_log` VALUES (45, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[17]]', 17, '127.0.0.1', '2019-07-11 16:37:56');
INSERT INTO `sys_log` VALUES (46, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[19]]', 9, '127.0.0.1', '2019-07-11 16:40:17');
INSERT INTO `sys_log` VALUES (47, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[19]]', 3, '127.0.0.1', '2019-07-11 16:40:28');
INSERT INTO `sys_log` VALUES (48, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[18]]', 8, '127.0.0.1', '2019-07-11 16:42:38');
INSERT INTO `sys_log` VALUES (49, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[20]]', 11, '127.0.0.1', '2019-07-11 16:43:18');
INSERT INTO `sys_log` VALUES (50, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[21,22,23]]', 14, '127.0.0.1', '2019-07-11 16:46:31');
INSERT INTO `sys_log` VALUES (51, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[28]]', 7, '127.0.0.1', '2019-07-12 09:41:14');
INSERT INTO `sys_log` VALUES (52, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[24]]', 11, '127.0.0.1', '2019-07-12 09:51:05');
INSERT INTO `sys_log` VALUES (53, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[25]]', 14, '127.0.0.1', '2019-07-12 09:52:38');
INSERT INTO `sys_log` VALUES (54, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"username\":\"3\",\"password\":\"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92\",\"email\":\"123@123.com\",\"mobile\":\"123\",\"status\":1,\"roleIdList\":[2,3,4],\"createUserId\":1,\"realName\":\"gege\"}]', 30, '127.0.0.1', '2019-07-12 11:38:06');
INSERT INTO `sys_log` VALUES (55, 'admin', '保存用户', 'com.youhualife.modules.sys.controller.SysUserController.save()', '[{\"userId\":30,\"username\":\"44\",\"password\":\"df15c98de2474a74bc37a0c4bcca1e6b631ea00bbfcf30d0bcf73caadf3ae18f\",\"salt\":\"zFqKEqqXhUHl1KHMSams\",\"email\":\"123@123.com\",\"mobile\":\"123\",\"status\":1,\"roleIdList\":[1,2,3,4],\"createUserId\":1,\"createTime\":\"Jul 12, 2019 11:38:33 AM\",\"realName\":\"123\"}]', 25, '127.0.0.1', '2019-07-12 11:38:34');
INSERT INTO `sys_log` VALUES (56, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"username\":\"44111\",\"password\":\"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92\",\"email\":\"123@123.com\",\"mobile\":\"123\",\"status\":1,\"roleIdList\":[1,2,3,4],\"createUserId\":1,\"realName\":\"123\"}]', 24, '127.0.0.1', '2019-07-12 11:38:56');
INSERT INTO `sys_log` VALUES (57, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[30]]', 11, '127.0.0.1', '2019-07-12 11:40:54');
INSERT INTO `sys_log` VALUES (58, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[27]]', 9, '127.0.0.1', '2019-07-12 11:41:03');
INSERT INTO `sys_log` VALUES (59, 'admin', '删除用户', 'com.youhualife.modules.sys.controller.SysUserController.delete()', '[[35]]', 316, '127.0.0.1', '2019-07-12 12:16:51');
INSERT INTO `sys_log` VALUES (60, 'admin', '删除角色', 'com.youhualife.modules.sys.controller.SysRoleController.delete()', '[[5]]', 39, '127.0.0.1', '2019-07-12 14:02:19');
INSERT INTO `sys_log` VALUES (61, 'admin', '保存角色', 'com.youhualife.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":8,\"roleName\":\"test\",\"remark\":\"1234\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50],\"createTime\":\"Jul 12, 2019 5:10:43 PM\"}]', 47, '127.0.0.1', '2019-07-12 17:10:43');
INSERT INTO `sys_log` VALUES (62, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleName\":\"test\",\"remark\":\"1234\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,51,52,53,54,55,56,57,58]}]', 171, '127.0.0.1', '2019-07-12 17:10:56');
INSERT INTO `sys_log` VALUES (63, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleName\":\"test\",\"remark\":\"1234\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,56,57,58,55,54,53,52,51]}]', 109, '127.0.0.1', '2019-07-12 17:11:24');
INSERT INTO `sys_log` VALUES (64, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleName\":\"test\",\"remark\":\"1234\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,51,52,53]}]', 72, '127.0.0.1', '2019-07-12 17:15:08');
INSERT INTO `sys_log` VALUES (65, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleName\":\"test\",\"remark\":\"1234\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,51,52]}]', 55, '127.0.0.1', '2019-07-12 17:15:54');
INSERT INTO `sys_log` VALUES (66, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"username\":\"3\",\"password\":\"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92\",\"email\":\"1232@123.com\",\"mobile\":\"123\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"realName\":\"123\"}]', 45, '127.0.0.1', '2019-07-12 17:20:30');
INSERT INTO `sys_log` VALUES (67, 'admin', '修改用户', 'com.youhualife.modules.sys.controller.SysUserController.update()', '[{\"userId\":26,\"username\":\"3\",\"password\":\"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92\",\"email\":\"123@123.com\",\"mobile\":\"123\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"realName\":\"123\"}]', 27, '127.0.0.1', '2019-07-12 17:23:16');
INSERT INTO `sys_log` VALUES (68, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleName\":\"test123\",\"remark\":\"12345\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,51,52,53]}]', 68, '127.0.0.1', '2019-07-12 17:23:32');
INSERT INTO `sys_log` VALUES (69, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleName\":\"test123\",\"remark\":\"1234\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,52,51]}]', 60, '127.0.0.1', '2019-07-12 17:23:47');
INSERT INTO `sys_log` VALUES (70, 'admin', '修改角色', 'com.youhualife.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":8,\"roleName\":\"test123\",\"remark\":\"12345\",\"createUserId\":1,\"menuIdList\":[31,32,40,41,42,43,48,49,33,44,45,46,47,50,51,52]}]', 153, '127.0.0.1', '2019-07-12 17:26:20');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `component` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配合动态路由实现',
  `r_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配合动态路由实现',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'sys', NULL, 0, 'setting', 2, 'PageView', 'sys');
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'user', NULL, 1, '', 1, 'user', 'user');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'role', NULL, 1, '', 2, NULL, 'role');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'menu', NULL, 1, '', 3, NULL, 'menu');
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8081/sendrepair/swagger/index.html', NULL, 1, '', 4, NULL, 'monitor');
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'schedule', NULL, 1, '', 5, NULL, 'schedule');
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, '', 6, NULL, 'config');
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'log', 'sys:log:list', 1, '', 7, NULL, 'log');
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss', 'sys:oss:all', 1, '', 6, NULL, 'oss');
INSERT INTO `sys_menu` VALUES (31, 0, '轮对送修', 'sendrepair', '', 0, 'book', 3, 'PageView', 'sendrepair');
INSERT INTO `sys_menu` VALUES (32, 31, '送修单', 'order', '', 1, '', 1, NULL, 'order');
INSERT INTO `sys_menu` VALUES (33, 31, '送修轮对信息', 'orderwheelinfo', '', 1, '', 2, NULL, 'orderwheelinfo');
INSERT INTO `sys_menu` VALUES (40, 32, '查看', NULL, 'sendrepair:order:list,sendrepair:order:info', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (41, 32, '新增', NULL, 'sendrepair:order:save', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (42, 32, '修改', NULL, 'sendrepair:order:update', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (43, 32, '删除', NULL, 'sendrepair:order:delete', 2, NULL, 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (44, 33, '查看', NULL, 'sendrepair:orderwheelinfo:list,sendrepair:orderwheelinfo:info', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (45, 33, '新增', NULL, 'sendrepair:orderwheelinfo:save', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (46, 33, '修改', NULL, 'sendrepair:orderwheelinfo:update', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (47, 33, '删除', NULL, 'sendrepair:orderwheelinfo:delete', 2, NULL, 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (48, 32, '审核', '', 'sendrepair:order:approve', 2, '', 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (49, 32, '发起', '', 'sendrepair:order:initiate', 2, '', 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (50, 0, '基本资料', 'basic', '', 0, '', 4, NULL, 'basic');
INSERT INTO `sys_menu` VALUES (51, 0, '条码打印', 'print', '', 0, '', 5, NULL, 'print');
INSERT INTO `sys_menu` VALUES (52, 0, '流转卡查询', 'circulation', '', 0, '', 6, NULL, 'circulation');
INSERT INTO `sys_menu` VALUES (53, 0, '新造电子化', 'newcreation', '', 0, '', 7, NULL, 'newcreation');
INSERT INTO `sys_menu` VALUES (54, 0, '检修电子化', 'repair', '', 0, '', 8, NULL, 'repair');
INSERT INTO `sys_menu` VALUES (55, 0, '分析报表', 'report', '', 0, '', 9, NULL, 'report');
INSERT INTO `sys_menu` VALUES (56, 0, '仪表盘', 'dashboard', NULL, 0, 'dashboard', 1, 'RouteView', 'dashboard');
INSERT INTO `sys_menu` VALUES (57, 56, '分析页', 'analysis', NULL, 1, NULL, NULL, 'analysis', 'analysis');
INSERT INTO `sys_menu` VALUES (58, 56, '工作台', 'workplace', NULL, 1, NULL, NULL, 'workplace', 'workplace');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', 'admin', 1, '2019-06-03 15:22:07');
INSERT INTO `sys_role` VALUES (2, '动车段', '动车段/运用所', 1, '2019-06-06 14:11:55');
INSERT INTO `sys_role` VALUES (3, '技术科', '技术科', 1, '2019-06-06 14:14:18');
INSERT INTO `sys_role` VALUES (4, '智奇', '', 1, '2019-06-06 14:14:54');
INSERT INTO `sys_role` VALUES (8, 'test123', '12345', 1, '2019-07-12 17:10:43');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 304 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (49, 2, 40);
INSERT INTO `sys_role_menu` VALUES (50, 2, 41);
INSERT INTO `sys_role_menu` VALUES (51, 2, 42);
INSERT INTO `sys_role_menu` VALUES (52, 2, 43);
INSERT INTO `sys_role_menu` VALUES (53, 2, 49);
INSERT INTO `sys_role_menu` VALUES (54, 2, 33);
INSERT INTO `sys_role_menu` VALUES (55, 2, 44);
INSERT INTO `sys_role_menu` VALUES (56, 2, 45);
INSERT INTO `sys_role_menu` VALUES (57, 2, 46);
INSERT INTO `sys_role_menu` VALUES (58, 2, 47);
INSERT INTO `sys_role_menu` VALUES (60, 2, 31);
INSERT INTO `sys_role_menu` VALUES (61, 2, 32);
INSERT INTO `sys_role_menu` VALUES (78, 4, 40);
INSERT INTO `sys_role_menu` VALUES (79, 4, 44);
INSERT INTO `sys_role_menu` VALUES (81, 4, 31);
INSERT INTO `sys_role_menu` VALUES (82, 4, 32);
INSERT INTO `sys_role_menu` VALUES (83, 4, 33);
INSERT INTO `sys_role_menu` VALUES (84, 3, 40);
INSERT INTO `sys_role_menu` VALUES (85, 3, 42);
INSERT INTO `sys_role_menu` VALUES (86, 3, 48);
INSERT INTO `sys_role_menu` VALUES (87, 3, 44);
INSERT INTO `sys_role_menu` VALUES (89, 3, 31);
INSERT INTO `sys_role_menu` VALUES (90, 3, 32);
INSERT INTO `sys_role_menu` VALUES (91, 3, 33);
INSERT INTO `sys_role_menu` VALUES (92, 1, 1);
INSERT INTO `sys_role_menu` VALUES (93, 1, 2);
INSERT INTO `sys_role_menu` VALUES (94, 1, 15);
INSERT INTO `sys_role_menu` VALUES (95, 1, 16);
INSERT INTO `sys_role_menu` VALUES (96, 1, 17);
INSERT INTO `sys_role_menu` VALUES (97, 1, 18);
INSERT INTO `sys_role_menu` VALUES (98, 1, 3);
INSERT INTO `sys_role_menu` VALUES (99, 1, 19);
INSERT INTO `sys_role_menu` VALUES (100, 1, 20);
INSERT INTO `sys_role_menu` VALUES (101, 1, 21);
INSERT INTO `sys_role_menu` VALUES (102, 1, 22);
INSERT INTO `sys_role_menu` VALUES (103, 1, 4);
INSERT INTO `sys_role_menu` VALUES (104, 1, 23);
INSERT INTO `sys_role_menu` VALUES (105, 1, 24);
INSERT INTO `sys_role_menu` VALUES (106, 1, 25);
INSERT INTO `sys_role_menu` VALUES (107, 1, 26);
INSERT INTO `sys_role_menu` VALUES (108, 1, 5);
INSERT INTO `sys_role_menu` VALUES (109, 1, 6);
INSERT INTO `sys_role_menu` VALUES (110, 1, 7);
INSERT INTO `sys_role_menu` VALUES (111, 1, 8);
INSERT INTO `sys_role_menu` VALUES (112, 1, 9);
INSERT INTO `sys_role_menu` VALUES (113, 1, 10);
INSERT INTO `sys_role_menu` VALUES (114, 1, 11);
INSERT INTO `sys_role_menu` VALUES (115, 1, 12);
INSERT INTO `sys_role_menu` VALUES (116, 1, 13);
INSERT INTO `sys_role_menu` VALUES (117, 1, 14);
INSERT INTO `sys_role_menu` VALUES (118, 1, 27);
INSERT INTO `sys_role_menu` VALUES (119, 1, 29);
INSERT INTO `sys_role_menu` VALUES (120, 1, 30);
INSERT INTO `sys_role_menu` VALUES (121, 1, 31);
INSERT INTO `sys_role_menu` VALUES (122, 1, 32);
INSERT INTO `sys_role_menu` VALUES (123, 1, 40);
INSERT INTO `sys_role_menu` VALUES (124, 1, 41);
INSERT INTO `sys_role_menu` VALUES (125, 1, 42);
INSERT INTO `sys_role_menu` VALUES (126, 1, 43);
INSERT INTO `sys_role_menu` VALUES (127, 1, 48);
INSERT INTO `sys_role_menu` VALUES (128, 1, 49);
INSERT INTO `sys_role_menu` VALUES (129, 1, 33);
INSERT INTO `sys_role_menu` VALUES (130, 1, 44);
INSERT INTO `sys_role_menu` VALUES (131, 1, 45);
INSERT INTO `sys_role_menu` VALUES (132, 1, 46);
INSERT INTO `sys_role_menu` VALUES (133, 1, 47);
INSERT INTO `sys_role_menu` VALUES (149, NULL, 31);
INSERT INTO `sys_role_menu` VALUES (150, NULL, 32);
INSERT INTO `sys_role_menu` VALUES (151, NULL, 40);
INSERT INTO `sys_role_menu` VALUES (152, NULL, 41);
INSERT INTO `sys_role_menu` VALUES (153, NULL, 42);
INSERT INTO `sys_role_menu` VALUES (154, NULL, 43);
INSERT INTO `sys_role_menu` VALUES (155, NULL, 48);
INSERT INTO `sys_role_menu` VALUES (156, NULL, 49);
INSERT INTO `sys_role_menu` VALUES (157, NULL, 33);
INSERT INTO `sys_role_menu` VALUES (158, NULL, 44);
INSERT INTO `sys_role_menu` VALUES (159, NULL, 45);
INSERT INTO `sys_role_menu` VALUES (160, NULL, 46);
INSERT INTO `sys_role_menu` VALUES (161, NULL, 47);
INSERT INTO `sys_role_menu` VALUES (162, NULL, 50);
INSERT INTO `sys_role_menu` VALUES (163, NULL, 1);
INSERT INTO `sys_role_menu` VALUES (164, NULL, 2);
INSERT INTO `sys_role_menu` VALUES (165, NULL, 15);
INSERT INTO `sys_role_menu` VALUES (166, NULL, 16);
INSERT INTO `sys_role_menu` VALUES (167, NULL, 17);
INSERT INTO `sys_role_menu` VALUES (168, NULL, 18);
INSERT INTO `sys_role_menu` VALUES (169, NULL, 3);
INSERT INTO `sys_role_menu` VALUES (170, NULL, 19);
INSERT INTO `sys_role_menu` VALUES (171, NULL, 20);
INSERT INTO `sys_role_menu` VALUES (172, NULL, 21);
INSERT INTO `sys_role_menu` VALUES (173, NULL, 22);
INSERT INTO `sys_role_menu` VALUES (174, NULL, 4);
INSERT INTO `sys_role_menu` VALUES (175, NULL, 23);
INSERT INTO `sys_role_menu` VALUES (176, NULL, 24);
INSERT INTO `sys_role_menu` VALUES (177, NULL, 25);
INSERT INTO `sys_role_menu` VALUES (178, NULL, 26);
INSERT INTO `sys_role_menu` VALUES (179, NULL, 5);
INSERT INTO `sys_role_menu` VALUES (180, NULL, 6);
INSERT INTO `sys_role_menu` VALUES (181, NULL, 7);
INSERT INTO `sys_role_menu` VALUES (182, NULL, 8);
INSERT INTO `sys_role_menu` VALUES (183, NULL, 9);
INSERT INTO `sys_role_menu` VALUES (184, NULL, 10);
INSERT INTO `sys_role_menu` VALUES (185, NULL, 11);
INSERT INTO `sys_role_menu` VALUES (186, NULL, 12);
INSERT INTO `sys_role_menu` VALUES (187, NULL, 13);
INSERT INTO `sys_role_menu` VALUES (188, NULL, 14);
INSERT INTO `sys_role_menu` VALUES (189, NULL, 27);
INSERT INTO `sys_role_menu` VALUES (190, NULL, 29);
INSERT INTO `sys_role_menu` VALUES (191, NULL, 30);
INSERT INTO `sys_role_menu` VALUES (192, NULL, 51);
INSERT INTO `sys_role_menu` VALUES (193, NULL, 52);
INSERT INTO `sys_role_menu` VALUES (194, NULL, 53);
INSERT INTO `sys_role_menu` VALUES (195, NULL, 54);
INSERT INTO `sys_role_menu` VALUES (196, NULL, 55);
INSERT INTO `sys_role_menu` VALUES (197, NULL, 56);
INSERT INTO `sys_role_menu` VALUES (198, NULL, 57);
INSERT INTO `sys_role_menu` VALUES (199, NULL, 58);
INSERT INTO `sys_role_menu` VALUES (200, NULL, 31);
INSERT INTO `sys_role_menu` VALUES (201, NULL, 32);
INSERT INTO `sys_role_menu` VALUES (202, NULL, 40);
INSERT INTO `sys_role_menu` VALUES (203, NULL, 41);
INSERT INTO `sys_role_menu` VALUES (204, NULL, 42);
INSERT INTO `sys_role_menu` VALUES (205, NULL, 43);
INSERT INTO `sys_role_menu` VALUES (206, NULL, 48);
INSERT INTO `sys_role_menu` VALUES (207, NULL, 49);
INSERT INTO `sys_role_menu` VALUES (208, NULL, 33);
INSERT INTO `sys_role_menu` VALUES (209, NULL, 44);
INSERT INTO `sys_role_menu` VALUES (210, NULL, 45);
INSERT INTO `sys_role_menu` VALUES (211, NULL, 46);
INSERT INTO `sys_role_menu` VALUES (212, NULL, 47);
INSERT INTO `sys_role_menu` VALUES (213, NULL, 50);
INSERT INTO `sys_role_menu` VALUES (214, NULL, 56);
INSERT INTO `sys_role_menu` VALUES (215, NULL, 57);
INSERT INTO `sys_role_menu` VALUES (216, NULL, 58);
INSERT INTO `sys_role_menu` VALUES (217, NULL, 55);
INSERT INTO `sys_role_menu` VALUES (218, NULL, 54);
INSERT INTO `sys_role_menu` VALUES (219, NULL, 53);
INSERT INTO `sys_role_menu` VALUES (220, NULL, 52);
INSERT INTO `sys_role_menu` VALUES (221, NULL, 51);
INSERT INTO `sys_role_menu` VALUES (222, NULL, 31);
INSERT INTO `sys_role_menu` VALUES (223, NULL, 32);
INSERT INTO `sys_role_menu` VALUES (224, NULL, 40);
INSERT INTO `sys_role_menu` VALUES (225, NULL, 41);
INSERT INTO `sys_role_menu` VALUES (226, NULL, 42);
INSERT INTO `sys_role_menu` VALUES (227, NULL, 43);
INSERT INTO `sys_role_menu` VALUES (228, NULL, 48);
INSERT INTO `sys_role_menu` VALUES (229, NULL, 49);
INSERT INTO `sys_role_menu` VALUES (230, NULL, 33);
INSERT INTO `sys_role_menu` VALUES (231, NULL, 44);
INSERT INTO `sys_role_menu` VALUES (232, NULL, 45);
INSERT INTO `sys_role_menu` VALUES (233, NULL, 46);
INSERT INTO `sys_role_menu` VALUES (234, NULL, 47);
INSERT INTO `sys_role_menu` VALUES (235, NULL, 50);
INSERT INTO `sys_role_menu` VALUES (236, NULL, 51);
INSERT INTO `sys_role_menu` VALUES (237, NULL, 52);
INSERT INTO `sys_role_menu` VALUES (238, NULL, 53);
INSERT INTO `sys_role_menu` VALUES (239, NULL, 31);
INSERT INTO `sys_role_menu` VALUES (240, NULL, 32);
INSERT INTO `sys_role_menu` VALUES (241, NULL, 40);
INSERT INTO `sys_role_menu` VALUES (242, NULL, 41);
INSERT INTO `sys_role_menu` VALUES (243, NULL, 42);
INSERT INTO `sys_role_menu` VALUES (244, NULL, 43);
INSERT INTO `sys_role_menu` VALUES (245, NULL, 48);
INSERT INTO `sys_role_menu` VALUES (246, NULL, 49);
INSERT INTO `sys_role_menu` VALUES (247, NULL, 33);
INSERT INTO `sys_role_menu` VALUES (248, NULL, 44);
INSERT INTO `sys_role_menu` VALUES (249, NULL, 45);
INSERT INTO `sys_role_menu` VALUES (250, NULL, 46);
INSERT INTO `sys_role_menu` VALUES (251, NULL, 47);
INSERT INTO `sys_role_menu` VALUES (252, NULL, 50);
INSERT INTO `sys_role_menu` VALUES (253, NULL, 51);
INSERT INTO `sys_role_menu` VALUES (254, NULL, 52);
INSERT INTO `sys_role_menu` VALUES (255, NULL, 31);
INSERT INTO `sys_role_menu` VALUES (256, NULL, 32);
INSERT INTO `sys_role_menu` VALUES (257, NULL, 40);
INSERT INTO `sys_role_menu` VALUES (258, NULL, 41);
INSERT INTO `sys_role_menu` VALUES (259, NULL, 42);
INSERT INTO `sys_role_menu` VALUES (260, NULL, 43);
INSERT INTO `sys_role_menu` VALUES (261, NULL, 48);
INSERT INTO `sys_role_menu` VALUES (262, NULL, 49);
INSERT INTO `sys_role_menu` VALUES (263, NULL, 33);
INSERT INTO `sys_role_menu` VALUES (264, NULL, 44);
INSERT INTO `sys_role_menu` VALUES (265, NULL, 45);
INSERT INTO `sys_role_menu` VALUES (266, NULL, 46);
INSERT INTO `sys_role_menu` VALUES (267, NULL, 47);
INSERT INTO `sys_role_menu` VALUES (268, NULL, 50);
INSERT INTO `sys_role_menu` VALUES (269, NULL, 51);
INSERT INTO `sys_role_menu` VALUES (270, NULL, 52);
INSERT INTO `sys_role_menu` VALUES (271, NULL, 53);
INSERT INTO `sys_role_menu` VALUES (272, NULL, 31);
INSERT INTO `sys_role_menu` VALUES (273, NULL, 32);
INSERT INTO `sys_role_menu` VALUES (274, NULL, 40);
INSERT INTO `sys_role_menu` VALUES (275, NULL, 41);
INSERT INTO `sys_role_menu` VALUES (276, NULL, 42);
INSERT INTO `sys_role_menu` VALUES (277, NULL, 43);
INSERT INTO `sys_role_menu` VALUES (278, NULL, 48);
INSERT INTO `sys_role_menu` VALUES (279, NULL, 49);
INSERT INTO `sys_role_menu` VALUES (280, NULL, 33);
INSERT INTO `sys_role_menu` VALUES (281, NULL, 44);
INSERT INTO `sys_role_menu` VALUES (282, NULL, 45);
INSERT INTO `sys_role_menu` VALUES (283, NULL, 46);
INSERT INTO `sys_role_menu` VALUES (284, NULL, 47);
INSERT INTO `sys_role_menu` VALUES (285, NULL, 50);
INSERT INTO `sys_role_menu` VALUES (286, NULL, 52);
INSERT INTO `sys_role_menu` VALUES (287, NULL, 51);
INSERT INTO `sys_role_menu` VALUES (288, 8, 31);
INSERT INTO `sys_role_menu` VALUES (289, 8, 32);
INSERT INTO `sys_role_menu` VALUES (290, 8, 40);
INSERT INTO `sys_role_menu` VALUES (291, 8, 41);
INSERT INTO `sys_role_menu` VALUES (292, 8, 42);
INSERT INTO `sys_role_menu` VALUES (293, 8, 43);
INSERT INTO `sys_role_menu` VALUES (294, 8, 48);
INSERT INTO `sys_role_menu` VALUES (295, 8, 49);
INSERT INTO `sys_role_menu` VALUES (296, 8, 33);
INSERT INTO `sys_role_menu` VALUES (297, 8, 44);
INSERT INTO `sys_role_menu` VALUES (298, 8, 45);
INSERT INTO `sys_role_menu` VALUES (299, 8, 46);
INSERT INTO `sys_role_menu` VALUES (300, 8, 47);
INSERT INTO `sys_role_menu` VALUES (301, 8, 50);
INSERT INTO `sys_role_menu` VALUES (302, 8, 51);
INSERT INTO `sys_role_menu` VALUES (303, 8, 52);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实际姓名',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11', 'admin');
INSERT INTO `sys_user` VALUES (2, 'hunji', 'c45fbfcd7bffc401b42cfb8ef6344937049cb6cd6d0c41363e2a345e636b8def', 'pDmZGYsQ0Zr2Y7hbfafG', 'guo194194@163.com', '15534993486', 1, 1, '2019-06-03 15:30:38', '郭文彦');
INSERT INTO `sys_user` VALUES (3, 'dongcd', '8603874c54755074cfafff3faaf5520961efd63bda1d962e4b24347419f32b4a', 'KNM1c6Wi4qWBRA2Eb7xI', 'dongcd@zq.com', '13934266543', 1, 1, '2019-06-06 14:16:09', '角色1用户');
INSERT INTO `sys_user` VALUES (4, 'jisk', 'a298b48d40c543c05dcaa12132c9572dca0ead1382ebe9bfe48318798b56519c', 'sUhPWuAm4uMQ3AiKbcQ4', 'jisk@zq.com', '13934287656', 1, 1, '2019-06-06 14:16:28', '角色2用户');
INSERT INTO `sys_user` VALUES (5, 'zhiq', '2f47f98146c72be8add5f4fc804ea7d3f9632388a552edf5e07065b72e2f6bd1', '7J81O0txyobBLhEGdmFP', 'zhiq@zq.com', '13934656676', 1, 1, '2019-06-06 14:16:50', '角色3用户');
INSERT INTO `sys_user` VALUES (26, '3', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, '123@123.com', '123', 1, 1, NULL, '123');
INSERT INTO `sys_user` VALUES (31, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (32, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (33, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (34, '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (36, '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (37, '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 3, 2);
INSERT INTO `sys_user_role` VALUES (3, 4, 3);
INSERT INTO `sys_user_role` VALUES (4, 5, 4);
INSERT INTO `sys_user_role` VALUES (10, 2, 1);
INSERT INTO `sys_user_role` VALUES (11, 6, 1);
INSERT INTO `sys_user_role` VALUES (12, 17, 1);
INSERT INTO `sys_user_role` VALUES (16, 30, 1);
INSERT INTO `sys_user_role` VALUES (17, 30, 2);
INSERT INTO `sys_user_role` VALUES (18, 30, 3);
INSERT INTO `sys_user_role` VALUES (19, 30, 4);
INSERT INTO `sys_user_role` VALUES (24, NULL, 2);
INSERT INTO `sys_user_role` VALUES (25, 26, 2);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, 'e6fa79d7e5564717473aa0715a154c7f', '2019-07-13 04:36:17', '2019-07-12 16:36:17');
INSERT INTO `sys_user_token` VALUES (2, '283808d17b9ce35a96183fac47c63c2a', '2019-07-12 04:15:06', '2019-07-11 16:15:06');
INSERT INTO `sys_user_token` VALUES (3, 'fe31717f34eb37c54aea047b43901c73', '2019-06-15 02:31:39', '2019-06-14 14:31:39');
INSERT INTO `sys_user_token` VALUES (4, 'fc4c7ebe982e8defce050602dde0ce1d', '2019-07-12 04:14:23', '2019-07-11 16:14:23');
INSERT INTO `sys_user_token` VALUES (5, '352f52996e8ac31eb9f0f60dae506655', '2019-06-15 02:14:52', '2019-06-14 14:14:52');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
