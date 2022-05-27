/*
 Navicat Premium Data Transfer

 Source Server         : xiye
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : emos

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 27/05/2022 13:14:17
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
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

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
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

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
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名',
  `param_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `status` tinyint UNSIGNED NOT NULL COMMENT '状态',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_param_key`(`param_key`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'attendance_start_time', '06:00', 1, '上班考勤开始时间');
INSERT INTO `sys_config` VALUES (2, 'attendance_time', '08:30', 1, '上班时间');
INSERT INTO `sys_config` VALUES (3, 'attendance_end_time', '09:30', 1, '上班考勤截止时间');
INSERT INTO `sys_config` VALUES (4, 'closing_start_time', '16:30', 1, '下班考勤开始时间');
INSERT INTO `sys_config` VALUES (5, 'closing_time', '17:30', 1, '下班时间');
INSERT INTO `sys_config` VALUES (6, 'closing_end_time', '23:59', 1, '下班考勤截止时间');

-- ----------------------------
-- Table structure for tb_action
-- ----------------------------
DROP TABLE IF EXISTS `tb_action`;
CREATE TABLE `tb_action`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为编号',
  `action_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_action_name`(`action_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行为表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_action
-- ----------------------------
INSERT INTO `tb_action` VALUES (1, 'INSERT', '添加');
INSERT INTO `tb_action` VALUES (2, 'DELETE', '删除');
INSERT INTO `tb_action` VALUES (3, 'UPDATE', '修改');
INSERT INTO `tb_action` VALUES (4, 'SELECT', '查询');
INSERT INTO `tb_action` VALUES (5, 'APPROVAL', '审批');
INSERT INTO `tb_action` VALUES (6, 'EXPORT', '导出');
INSERT INTO `tb_action` VALUES (7, 'BACKUP', '备份');

-- ----------------------------
-- Table structure for tb_checkin
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkin`;
CREATE TABLE `tb_checkin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL COMMENT '用户ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到地址',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区划',
  `status` tinyint UNSIGNED NOT NULL COMMENT '考勤结果',
  `risk` int UNSIGNED NULL DEFAULT 0 COMMENT '风险等级',
  `date` date NOT NULL COMMENT '签到日期',
  `create_time` datetime NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_user_id`(`user_id`, `date`) USING BTREE,
  INDEX `idx_date`(`date`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_checkin
-- ----------------------------
INSERT INTO `tb_checkin` VALUES (1, 22, '艰难大学', '中国', '江苏省', '无锡市', '滨湖区', 1, 1, '2022-05-23', '2022-05-23 08:57:55');

-- ----------------------------
-- Table structure for tb_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `city` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼音简称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_city`(`city`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 329 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '疫情城市列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_city
-- ----------------------------
INSERT INTO `tb_city` VALUES (1, '阿坝市', 'ab');
INSERT INTO `tb_city` VALUES (2, '安康市', 'ak');
INSERT INTO `tb_city` VALUES (3, '阿克苏市', 'aks');
INSERT INTO `tb_city` VALUES (4, '阿拉善市', 'alsm');
INSERT INTO `tb_city` VALUES (5, '安顺市', 'anshun');
INSERT INTO `tb_city` VALUES (6, '安庆市', 'aq');
INSERT INTO `tb_city` VALUES (7, '鞍山市', 'as');
INSERT INTO `tb_city` VALUES (8, '安阳市', 'ay');
INSERT INTO `tb_city` VALUES (9, '百色市', 'baise');
INSERT INTO `tb_city` VALUES (10, '白山市', 'baishan');
INSERT INTO `tb_city` VALUES (11, '宝鸡市', 'baoji');
INSERT INTO `tb_city` VALUES (12, '巴中市', 'bazhong');
INSERT INTO `tb_city` VALUES (13, '蚌埠市', 'bb');
INSERT INTO `tb_city` VALUES (14, '白城市', 'bc');
INSERT INTO `tb_city` VALUES (15, '保定市', 'bd');
INSERT INTO `tb_city` VALUES (16, '博尔塔拉市', 'betl');
INSERT INTO `tb_city` VALUES (17, '北海市', 'bh');
INSERT INTO `tb_city` VALUES (18, '毕节市', 'bijie');
INSERT INTO `tb_city` VALUES (19, '北京市', 'bj');
INSERT INTO `tb_city` VALUES (20, '西双版纳市', 'bn');
INSERT INTO `tb_city` VALUES (21, '亳州市', 'bozhou');
INSERT INTO `tb_city` VALUES (22, '保山市', 'bs');
INSERT INTO `tb_city` VALUES (23, '包头市', 'bt');
INSERT INTO `tb_city` VALUES (24, '本溪市', 'bx');
INSERT INTO `tb_city` VALUES (25, '白银市', 'by');
INSERT INTO `tb_city` VALUES (26, '巴彦淖尔市', 'bycem');
INSERT INTO `tb_city` VALUES (27, '巴音郭楞市', 'bygl');
INSERT INTO `tb_city` VALUES (28, '滨州市', 'bz');
INSERT INTO `tb_city` VALUES (29, '沧州市', 'cangzhou');
INSERT INTO `tb_city` VALUES (30, '长春市', 'cc');
INSERT INTO `tb_city` VALUES (31, '成都市', 'cd');
INSERT INTO `tb_city` VALUES (32, '赤峰市', 'cf');
INSERT INTO `tb_city` VALUES (33, '常德市', 'changde');
INSERT INTO `tb_city` VALUES (34, '长治市', 'changzhi');
INSERT INTO `tb_city` VALUES (35, '潮州市', 'chaozhou');
INSERT INTO `tb_city` VALUES (36, '承德市', 'chengde');
INSERT INTO `tb_city` VALUES (37, '郴州市', 'chenzhou');
INSERT INTO `tb_city` VALUES (38, '池州市', 'chizhou');
INSERT INTO `tb_city` VALUES (39, '崇左市', 'chongzuo');
INSERT INTO `tb_city` VALUES (40, '滁州市', 'chuzhou');
INSERT INTO `tb_city` VALUES (41, '昌吉市', 'cj');
INSERT INTO `tb_city` VALUES (42, '重庆市', 'cq');
INSERT INTO `tb_city` VALUES (43, '长沙市', 'cs');
INSERT INTO `tb_city` VALUES (44, '楚雄市', 'cx');
INSERT INTO `tb_city` VALUES (45, '朝阳市', 'cy');
INSERT INTO `tb_city` VALUES (46, '常州市', 'cz');
INSERT INTO `tb_city` VALUES (47, '大理市', 'dali');
INSERT INTO `tb_city` VALUES (48, '达州市', 'dazhou');
INSERT INTO `tb_city` VALUES (49, '丹东市', 'dd');
INSERT INTO `tb_city` VALUES (50, '德阳市', 'deyang');
INSERT INTO `tb_city` VALUES (51, '东莞市', 'dg');
INSERT INTO `tb_city` VALUES (52, '德宏市', 'dh');
INSERT INTO `tb_city` VALUES (53, '迪庆市', 'diqing');
INSERT INTO `tb_city` VALUES (54, '大连市', 'dl');
INSERT INTO `tb_city` VALUES (55, '大庆市', 'dq');
INSERT INTO `tb_city` VALUES (56, '大同市', 'dt');
INSERT INTO `tb_city` VALUES (57, '定西市', 'dx');
INSERT INTO `tb_city` VALUES (58, '大兴安岭市', 'dxal');
INSERT INTO `tb_city` VALUES (59, '东营市', 'dy');
INSERT INTO `tb_city` VALUES (60, '德州市', 'dz');
INSERT INTO `tb_city` VALUES (61, '鄂尔多斯市', 'erds');
INSERT INTO `tb_city` VALUES (62, '恩施市', 'es');
INSERT INTO `tb_city` VALUES (63, '鄂州市', 'ez');
INSERT INTO `tb_city` VALUES (64, '防城港市', 'fcg');
INSERT INTO `tb_city` VALUES (65, '佛山市', 'fs');
INSERT INTO `tb_city` VALUES (66, '抚顺市', 'fushun');
INSERT INTO `tb_city` VALUES (67, '抚州市', 'fuzhou');
INSERT INTO `tb_city` VALUES (68, '阜新市', 'fx');
INSERT INTO `tb_city` VALUES (69, '阜阳市', 'fy');
INSERT INTO `tb_city` VALUES (70, '福州市', 'fz');
INSERT INTO `tb_city` VALUES (71, '广安市', 'ga');
INSERT INTO `tb_city` VALUES (72, '赣州市', 'ganzhou');
INSERT INTO `tb_city` VALUES (73, '甘孜市', 'ganzi');
INSERT INTO `tb_city` VALUES (74, '贵港市', 'gg');
INSERT INTO `tb_city` VALUES (75, '桂林市', 'gl');
INSERT INTO `tb_city` VALUES (76, '广元市', 'guangyuan');
INSERT INTO `tb_city` VALUES (77, '果洛市', 'guoluo');
INSERT INTO `tb_city` VALUES (78, '固原市', 'guyuan');
INSERT INTO `tb_city` VALUES (79, '贵阳市', 'gy');
INSERT INTO `tb_city` VALUES (80, '广州市', 'gz');
INSERT INTO `tb_city` VALUES (81, '淮安市', 'ha');
INSERT INTO `tb_city` VALUES (82, '海北市', 'haibei');
INSERT INTO `tb_city` VALUES (83, '海东市', 'haidong');
INSERT INTO `tb_city` VALUES (84, '海南市', 'hainan');
INSERT INTO `tb_city` VALUES (85, '汉中市', 'hanzhong');
INSERT INTO `tb_city` VALUES (86, '鹤壁市', 'hb');
INSERT INTO `tb_city` VALUES (87, '河池市', 'hc');
INSERT INTO `tb_city` VALUES (88, '邯郸市', 'hd');
INSERT INTO `tb_city` VALUES (89, '哈尔滨市', 'heb');
INSERT INTO `tb_city` VALUES (90, '鹤岗市', 'hegang');
INSERT INTO `tb_city` VALUES (91, '黑河市', 'heihe');
INSERT INTO `tb_city` VALUES (92, '河源市', 'heyuan');
INSERT INTO `tb_city` VALUES (93, '菏泽市', 'heze');
INSERT INTO `tb_city` VALUES (94, '贺州市', 'hezhou');
INSERT INTO `tb_city` VALUES (95, '合肥市', 'hf');
INSERT INTO `tb_city` VALUES (96, '黄冈市', 'hg');
INSERT INTO `tb_city` VALUES (97, '怀化市', 'hh');
INSERT INTO `tb_city` VALUES (98, '呼伦贝尔市', 'hlbe');
INSERT INTO `tb_city` VALUES (99, '葫芦岛市', 'hld');
INSERT INTO `tb_city` VALUES (100, '哈密市', 'hm');
INSERT INTO `tb_city` VALUES (101, '淮南市', 'hn');
INSERT INTO `tb_city` VALUES (102, '红河市', 'honghe');
INSERT INTO `tb_city` VALUES (103, '衡水市', 'hs');
INSERT INTO `tb_city` VALUES (104, '黄石市', 'hshi');
INSERT INTO `tb_city` VALUES (105, '和田市', 'ht');
INSERT INTO `tb_city` VALUES (106, '呼和浩特市', 'hu');
INSERT INTO `tb_city` VALUES (107, '淮北市', 'huaibei');
INSERT INTO `tb_city` VALUES (108, '黄南市', 'huangnan');
INSERT INTO `tb_city` VALUES (109, '黄山市', 'huangshan');
INSERT INTO `tb_city` VALUES (110, '惠州市', 'huizhou');
INSERT INTO `tb_city` VALUES (111, '湖州市', 'huzhou');
INSERT INTO `tb_city` VALUES (112, '海西市', 'hx');
INSERT INTO `tb_city` VALUES (113, '衡阳市', 'hy');
INSERT INTO `tb_city` VALUES (114, '杭州市', 'hz');
INSERT INTO `tb_city` VALUES (115, '吉安市', 'ja');
INSERT INTO `tb_city` VALUES (116, '晋城市', 'jc');
INSERT INTO `tb_city` VALUES (117, '景德镇市', 'jdz');
INSERT INTO `tb_city` VALUES (118, '金华市', 'jh');
INSERT INTO `tb_city` VALUES (119, '焦作市', 'jiaozuo');
INSERT INTO `tb_city` VALUES (120, '金昌市', 'jinchang');
INSERT INTO `tb_city` VALUES (121, '荆门市', 'jingmen');
INSERT INTO `tb_city` VALUES (122, '荆州市', 'jingzhou');
INSERT INTO `tb_city` VALUES (123, '济宁市', 'jining');
INSERT INTO `tb_city` VALUES (124, '锦州市', 'jinzhou');
INSERT INTO `tb_city` VALUES (125, '鸡西市', 'jixi');
INSERT INTO `tb_city` VALUES (126, '济源市', 'jiyuan');
INSERT INTO `tb_city` VALUES (127, '九江市', 'jj');
INSERT INTO `tb_city` VALUES (128, '吉林市', 'jl');
INSERT INTO `tb_city` VALUES (129, '江门市', 'jm');
INSERT INTO `tb_city` VALUES (130, '佳木斯市', 'jms');
INSERT INTO `tb_city` VALUES (131, '济南市', 'jn');
INSERT INTO `tb_city` VALUES (132, '酒泉市', 'jq');
INSERT INTO `tb_city` VALUES (133, '嘉兴市', 'jx');
INSERT INTO `tb_city` VALUES (134, '揭阳市', 'jy');
INSERT INTO `tb_city` VALUES (135, '嘉峪关市', 'jyg');
INSERT INTO `tb_city` VALUES (136, '晋中市', 'jz');
INSERT INTO `tb_city` VALUES (137, '喀什市', 'kashi');
INSERT INTO `tb_city` VALUES (138, '开封市', 'kf');
INSERT INTO `tb_city` VALUES (139, '克拉玛依市', 'klmy');
INSERT INTO `tb_city` VALUES (140, '昆明市', 'km');
INSERT INTO `tb_city` VALUES (141, '克孜勒苏市', 'kzls');
INSERT INTO `tb_city` VALUES (142, '六安市', 'la');
INSERT INTO `tb_city` VALUES (143, '来宾市', 'lb');
INSERT INTO `tb_city` VALUES (144, '聊城市', 'lc');
INSERT INTO `tb_city` VALUES (145, '娄底市', 'ld');
INSERT INTO `tb_city` VALUES (146, '乐山市', 'leshan');
INSERT INTO `tb_city` VALUES (147, '廊坊市', 'lf');
INSERT INTO `tb_city` VALUES (148, '漯河市', 'lh');
INSERT INTO `tb_city` VALUES (149, '凉山市', 'liangshan');
INSERT INTO `tb_city` VALUES (150, '辽阳市', 'liaoyang');
INSERT INTO `tb_city` VALUES (151, '辽源市', 'liaoyuan');
INSERT INTO `tb_city` VALUES (152, '临沧市', 'lincang');
INSERT INTO `tb_city` VALUES (153, '临汾市', 'linfen');
INSERT INTO `tb_city` VALUES (154, '临沂市', 'linyi');
INSERT INTO `tb_city` VALUES (155, '丽水市', 'lishui');
INSERT INTO `tb_city` VALUES (156, '柳州市', 'liuzhou');
INSERT INTO `tb_city` VALUES (157, '丽江市', 'lj');
INSERT INTO `tb_city` VALUES (158, '吕梁市', 'll');
INSERT INTO `tb_city` VALUES (159, '陇南市', 'ln');
INSERT INTO `tb_city` VALUES (160, '龙岩市', 'longyan');
INSERT INTO `tb_city` VALUES (161, '六盘水市', 'lps');
INSERT INTO `tb_city` VALUES (162, '泸州市', 'luzhou');
INSERT INTO `tb_city` VALUES (163, '洛阳市', 'ly');
INSERT INTO `tb_city` VALUES (164, '连云港市', 'lyg');
INSERT INTO `tb_city` VALUES (165, '兰州市', 'lz');
INSERT INTO `tb_city` VALUES (166, '马鞍山市', 'mas');
INSERT INTO `tb_city` VALUES (167, '牡丹江市', 'mdj');
INSERT INTO `tb_city` VALUES (168, '茂名市', 'mm');
INSERT INTO `tb_city` VALUES (169, '眉山市', 'ms');
INSERT INTO `tb_city` VALUES (170, '绵阳市', 'my');
INSERT INTO `tb_city` VALUES (171, '梅州市', 'mz');
INSERT INTO `tb_city` VALUES (172, '南充市', 'nanchong');
INSERT INTO `tb_city` VALUES (173, '宁波市', 'nb');
INSERT INTO `tb_city` VALUES (174, '南昌市', 'nc');
INSERT INTO `tb_city` VALUES (175, '宁德市', 'nd');
INSERT INTO `tb_city` VALUES (176, '内江市', 'neijiang');
INSERT INTO `tb_city` VALUES (177, '南京市', 'nj');
INSERT INTO `tb_city` VALUES (178, '南宁市', 'nn');
INSERT INTO `tb_city` VALUES (179, '南平市', 'np');
INSERT INTO `tb_city` VALUES (180, '南通市', 'nt');
INSERT INTO `tb_city` VALUES (181, '怒江市', 'nujiang');
INSERT INTO `tb_city` VALUES (182, '南阳市', 'ny');
INSERT INTO `tb_city` VALUES (183, '平顶山市', 'pds');
INSERT INTO `tb_city` VALUES (184, '普洱市', 'pe');
INSERT INTO `tb_city` VALUES (185, '盘锦市', 'pj');
INSERT INTO `tb_city` VALUES (186, '平凉市', 'pl');
INSERT INTO `tb_city` VALUES (187, '莆田市', 'pt');
INSERT INTO `tb_city` VALUES (188, '萍乡市', 'px');
INSERT INTO `tb_city` VALUES (189, '濮阳市', 'py');
INSERT INTO `tb_city` VALUES (190, '攀枝花市', 'pzh');
INSERT INTO `tb_city` VALUES (191, '青岛市', 'qd');
INSERT INTO `tb_city` VALUES (192, '黔东南市', 'qdn');
INSERT INTO `tb_city` VALUES (193, '秦皇岛市', 'qhd');
INSERT INTO `tb_city` VALUES (194, '潜江市', 'qianjiang');
INSERT INTO `tb_city` VALUES (195, '庆阳市', 'qingyang');
INSERT INTO `tb_city` VALUES (196, '钦州市', 'qinzhou');
INSERT INTO `tb_city` VALUES (197, '曲靖市', 'qj');
INSERT INTO `tb_city` VALUES (198, '黔南市', 'qn');
INSERT INTO `tb_city` VALUES (199, '齐齐哈尔市', 'qqhr');
INSERT INTO `tb_city` VALUES (200, '七台河市', 'qth');
INSERT INTO `tb_city` VALUES (201, '衢州市', 'quzhou');
INSERT INTO `tb_city` VALUES (202, '黔西南市', 'qxn');
INSERT INTO `tb_city` VALUES (203, '清远市', 'qy');
INSERT INTO `tb_city` VALUES (204, '泉州市', 'qz');
INSERT INTO `tb_city` VALUES (205, '日照市', 'rz');
INSERT INTO `tb_city` VALUES (206, '三亚市', 'sanya');
INSERT INTO `tb_city` VALUES (207, '韶关市', 'sg');
INSERT INTO `tb_city` VALUES (208, '上海市', 'sh');
INSERT INTO `tb_city` VALUES (209, '邵阳市', 'shaoyang');
INSERT INTO `tb_city` VALUES (210, '十堰市', 'shiyan');
INSERT INTO `tb_city` VALUES (211, '朔州市', 'shuozhou');
INSERT INTO `tb_city` VALUES (212, '石家庄市', 'sjz');
INSERT INTO `tb_city` VALUES (213, '商洛市', 'sl');
INSERT INTO `tb_city` VALUES (214, '三明市', 'sm');
INSERT INTO `tb_city` VALUES (215, '三门峡市', 'smx');
INSERT INTO `tb_city` VALUES (216, '神农架市', 'snj');
INSERT INTO `tb_city` VALUES (217, '松原市', 'songyuan');
INSERT INTO `tb_city` VALUES (218, '四平市', 'sp');
INSERT INTO `tb_city` VALUES (219, '商丘市', 'sq');
INSERT INTO `tb_city` VALUES (220, '上饶市', 'sr');
INSERT INTO `tb_city` VALUES (221, '汕头市', 'st');
INSERT INTO `tb_city` VALUES (222, '宿州市', 'su');
INSERT INTO `tb_city` VALUES (223, '绥化市', 'suihua');
INSERT INTO `tb_city` VALUES (224, '遂宁市', 'suining');
INSERT INTO `tb_city` VALUES (225, '随州市', 'suizhou');
INSERT INTO `tb_city` VALUES (226, '宿迁市', 'suqian');
INSERT INTO `tb_city` VALUES (227, '苏州市', 'suzhou');
INSERT INTO `tb_city` VALUES (228, '汕尾市', 'sw');
INSERT INTO `tb_city` VALUES (229, '绍兴市', 'sx');
INSERT INTO `tb_city` VALUES (230, '沈阳市', 'sy');
INSERT INTO `tb_city` VALUES (231, '双鸭山市', 'sys');
INSERT INTO `tb_city` VALUES (232, '深圳市', 'bendibao.com/news/yqdengji/');
INSERT INTO `tb_city` VALUES (233, '石嘴山市', 'szs');
INSERT INTO `tb_city` VALUES (234, '泰安市', 'ta');
INSERT INTO `tb_city` VALUES (235, '塔城市', 'tacheng');
INSERT INTO `tb_city` VALUES (236, '泰州市', 'taizhou');
INSERT INTO `tb_city` VALUES (237, '铜川市', 'tc');
INSERT INTO `tb_city` VALUES (238, '通化市', 'th');
INSERT INTO `tb_city` VALUES (239, '天水市', 'tianshui');
INSERT INTO `tb_city` VALUES (240, '天津市', 'tj');
INSERT INTO `tb_city` VALUES (241, '吐鲁番市', 'tlf');
INSERT INTO `tb_city` VALUES (242, '天门市', 'tm');
INSERT INTO `tb_city` VALUES (243, '通辽市', 'tongliao');
INSERT INTO `tb_city` VALUES (244, '铜陵市', 'tongling');
INSERT INTO `tb_city` VALUES (245, '铜仁市', 'tr');
INSERT INTO `tb_city` VALUES (246, '唐山市', 'ts');
INSERT INTO `tb_city` VALUES (247, '太原市', 'ty');
INSERT INTO `tb_city` VALUES (248, '台州市', 'tz');
INSERT INTO `tb_city` VALUES (249, '威海市', 'weihai');
INSERT INTO `tb_city` VALUES (250, '潍坊市', 'wf');
INSERT INTO `tb_city` VALUES (251, '武汉市', 'wh');
INSERT INTO `tb_city` VALUES (252, '乌兰察布市', 'wlcb');
INSERT INTO `tb_city` VALUES (253, '乌鲁木齐市', 'wlmq');
INSERT INTO `tb_city` VALUES (254, '渭南市', 'wn');
INSERT INTO `tb_city` VALUES (255, '文山市', 'ws');
INSERT INTO `tb_city` VALUES (256, '乌海市', 'wuhai');
INSERT INTO `tb_city` VALUES (257, '芜湖市', 'wuhu');
INSERT INTO `tb_city` VALUES (258, '武威市', 'wuwei');
INSERT INTO `tb_city` VALUES (259, '吴忠市', 'wuzhong');
INSERT INTO `tb_city` VALUES (260, '梧州市', 'wuzhou');
INSERT INTO `tb_city` VALUES (261, '无锡市', 'wx');
INSERT INTO `tb_city` VALUES (262, '温州市', 'wz');
INSERT INTO `tb_city` VALUES (263, '五指山市', 'wzs');
INSERT INTO `tb_city` VALUES (264, '西安市', 'xa');
INSERT INTO `tb_city` VALUES (265, '兴安市', 'xam');
INSERT INTO `tb_city` VALUES (266, '许昌市', 'xc');
INSERT INTO `tb_city` VALUES (267, '襄阳市', 'xf');
INSERT INTO `tb_city` VALUES (268, '孝感市', 'xg');
INSERT INTO `tb_city` VALUES (269, '湘潭市', 'xiangtan');
INSERT INTO `tb_city` VALUES (270, '湘西市', 'xiangxi');
INSERT INTO `tb_city` VALUES (271, '咸宁市', 'xianning');
INSERT INTO `tb_city` VALUES (272, '仙桃市', 'xiantao');
INSERT INTO `tb_city` VALUES (273, '咸阳市', 'xianyang');
INSERT INTO `tb_city` VALUES (274, '新余市', 'xinyu');
INSERT INTO `tb_city` VALUES (275, '忻州市', 'xinzhou');
INSERT INTO `tb_city` VALUES (276, '锡林郭勒市', 'xl');
INSERT INTO `tb_city` VALUES (277, '厦门市', 'xm');
INSERT INTO `tb_city` VALUES (278, '西宁市', 'xn');
INSERT INTO `tb_city` VALUES (279, '邢台市', 'xt');
INSERT INTO `tb_city` VALUES (280, '宣城市', 'xuancheng');
INSERT INTO `tb_city` VALUES (281, '新乡市', 'xx');
INSERT INTO `tb_city` VALUES (282, '信阳市', 'xy');
INSERT INTO `tb_city` VALUES (283, '徐州市', 'xz');
INSERT INTO `tb_city` VALUES (284, '雅安市', 'ya');
INSERT INTO `tb_city` VALUES (285, '延边市', 'yanbian');
INSERT INTO `tb_city` VALUES (286, '盐城市', 'yancheng');
INSERT INTO `tb_city` VALUES (287, '阳泉市', 'yangquan');
INSERT INTO `tb_city` VALUES (288, '宜宾市', 'yb');
INSERT INTO `tb_city` VALUES (289, '银川市', 'yc');
INSERT INTO `tb_city` VALUES (290, '云浮市', 'yf');
INSERT INTO `tb_city` VALUES (291, '伊春市', 'yich');
INSERT INTO `tb_city` VALUES (292, '宜昌市', 'yichang');
INSERT INTO `tb_city` VALUES (293, '宜春市', 'yichun');
INSERT INTO `tb_city` VALUES (294, '伊犁市', 'yili');
INSERT INTO `tb_city` VALUES (295, '鹰潭市', 'yingtan');
INSERT INTO `tb_city` VALUES (296, '益阳市', 'yiyang');
INSERT INTO `tb_city` VALUES (297, '阳江市', 'yj');
INSERT INTO `tb_city` VALUES (298, '营口市', 'yk');
INSERT INTO `tb_city` VALUES (299, '榆林市', 'yl');
INSERT INTO `tb_city` VALUES (300, '延安市', 'yn');
INSERT INTO `tb_city` VALUES (301, '永州市', 'yongzhou');
INSERT INTO `tb_city` VALUES (302, '玉树市', 'ys');
INSERT INTO `tb_city` VALUES (303, '烟台市', 'yt');
INSERT INTO `tb_city` VALUES (304, '玉林市', 'yulin');
INSERT INTO `tb_city` VALUES (305, '运城市', 'yuncheng');
INSERT INTO `tb_city` VALUES (306, '玉溪市', 'yx');
INSERT INTO `tb_city` VALUES (307, '岳阳市', 'yy');
INSERT INTO `tb_city` VALUES (308, '扬州市', 'yz');
INSERT INTO `tb_city` VALUES (309, '枣庄市', 'zaozhuang');
INSERT INTO `tb_city` VALUES (310, '淄博市', 'zb');
INSERT INTO `tb_city` VALUES (311, '自贡市', 'zg');
INSERT INTO `tb_city` VALUES (312, '珠海市', 'zh');
INSERT INTO `tb_city` VALUES (313, '张掖市', 'zhangye');
INSERT INTO `tb_city` VALUES (314, '漳州市', 'zhangzhou');
INSERT INTO `tb_city` VALUES (315, '湛江市', 'zhanjiang');
INSERT INTO `tb_city` VALUES (316, '舟山市', 'zhoushan');
INSERT INTO `tb_city` VALUES (317, '株洲市', 'zhuzhou');
INSERT INTO `tb_city` VALUES (318, '镇江市', 'zj');
INSERT INTO `tb_city` VALUES (319, '张家界市', 'zjj');
INSERT INTO `tb_city` VALUES (320, '张家口市', 'zjk');
INSERT INTO `tb_city` VALUES (321, '周口市', 'zk');
INSERT INTO `tb_city` VALUES (322, '驻马店市', 'zmd');
INSERT INTO `tb_city` VALUES (323, '肇庆市', 'zq');
INSERT INTO `tb_city` VALUES (324, '中山市', 'zs');
INSERT INTO `tb_city` VALUES (325, '昭通市', 'zt');
INSERT INTO `tb_city` VALUES (326, '遵义市', 'zunyi');
INSERT INTO `tb_city` VALUES (327, '中卫市', 'zw');
INSERT INTO `tb_city` VALUES (328, '资阳市', 'zy');
INSERT INTO `tb_city` VALUES (329, '郑州市', 'zz');

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_dept_name`(`dept_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
INSERT INTO `tb_dept` VALUES (11, '保安部');
INSERT INTO `tb_dept` VALUES (5, '后勤部');
INSERT INTO `tb_dept` VALUES (4, '市场部');
INSERT INTO `tb_dept` VALUES (3, '技术部');
INSERT INTO `tb_dept` VALUES (1, '管理部');
INSERT INTO `tb_dept` VALUES (2, '行政部');

-- ----------------------------
-- Table structure for tb_face_model
-- ----------------------------
DROP TABLE IF EXISTS `tb_face_model`;
CREATE TABLE `tb_face_model`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键值',
  `user_id` int UNSIGNED NOT NULL COMMENT '用户ID',
  `face_model` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户人脸模型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_face_model
-- ----------------------------

-- ----------------------------
-- Table structure for tb_holidays
-- ----------------------------
DROP TABLE IF EXISTS `tb_holidays`;
CREATE TABLE `tb_holidays`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_date`(`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节假日表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_holidays
-- ----------------------------

-- ----------------------------
-- Table structure for tb_meeting
-- ----------------------------
DROP TABLE IF EXISTS `tb_meeting`;
CREATE TABLE `tb_meeting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'UUID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议题目',
  `creator_id` bigint NOT NULL COMMENT '创建人ID',
  `date` date NOT NULL COMMENT '日期',
  `place` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开会地点',
  `start` time NOT NULL COMMENT '开始时间',
  `end` time NOT NULL COMMENT '结束时间',
  `type` smallint NOT NULL COMMENT '会议类型（1在线会议，2线下会议）',
  `members` json NOT NULL COMMENT '参与者',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议内容',
  `instance_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作流实例ID',
  `status` smallint NOT NULL COMMENT '状态（1未开始，2进行中，3已结束）',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_creator_id`(`creator_id`) USING BTREE,
  INDEX `idx_date`(`date`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 348 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会议表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_meeting
-- ----------------------------
INSERT INTO `tb_meeting` VALUES (249, '94365ca5d4a44fae93ff1254c98d6c24', '测试会议1', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3ac5ea879d534265b0157c75c5ed4b41', 3, '2022-05-16 23:58:37');
INSERT INTO `tb_meeting` VALUES (250, '1574ef0b42af4d398c0f570c8fab8e9f', '测试会议2', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'cad4cf68a7fa49e78c8786cb9fa2d5eb', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (251, '7957fcefcae7451b93ce90ce2ff45c04', '测试会议3', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '6d8328a243904b86aaaab04af7d9464a', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (252, 'ed3f6e4e39854073bd3c1a64988eacec', '测试会议4', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'abea728caadd4c0883e2b4e08537d448', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (253, 'ef0a4dfdcae64f3aaf687adbd356809e', '测试会议5', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '85d3c50f842f44baaf657d5b294bddf9', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (254, '6b071bb7d1b2463bbde35112f101296a', '测试会议6', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '37e719c5a64d406aaa7d52e665620506', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (255, '8e7f443f322548348a4c76142ac9fe72', '测试会议7', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3bd50a590efe4aef98f498b36fce86fe', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (256, '3219652b5881457dafc916122b65001b', '测试会议8', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'daaf14b675d4411086f2007a6d844b11', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (257, '504ac9f558d74245a8c50e01ed2299e3', '测试会议9', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'cee97cc2a2a24690b58ffd7a854d13d9', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (258, '7ef00b79e79a49d0b7553983aeccc05d', '测试会议10', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '7009afbe12ad48618669b2922c606fd9', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (259, '451c247c1a7e424693d60fb4a2bfbb9d', '测试会议11', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'bb89584332384cc4a72c5d5657fef703', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (260, 'db787bd5ec174f309359e33e8bddfbf9', '测试会议12', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '32fef295287d48da86887137e44ce4b3', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (261, '6f774df6ec5d4243a8fe4693437c3459', '测试会议13', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '66bb3f8714d34f1482422099e75fe179', 3, '2022-05-16 23:58:38');
INSERT INTO `tb_meeting` VALUES (262, 'b43ece0348854e4faccfaf246aa72574', '测试会议14', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'b9aef145d4484ab387ec4abfe5ae3424', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (263, '5fb35a8213364ff49be596636cebe1a3', '测试会议15', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'f8a0077f40244cb1aba8f5dc661bbb53', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (264, 'e87598ac6d104e1db74d3baaaf43e8da', '测试会议16', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '9d171b2f326b4459b629808b3a4aaee6', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (265, '83d5536e7e9240ec8ccffa9925395b2b', '测试会议17', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '4d6b5f368c5b43bab8415970e5333385', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (266, '43c2ce8fd983404f9ac7033362257646', '测试会议18', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c0ac7bca7ee34951ac2d640b2cb1be51', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (267, '8ed681e08b654e659f2d8e7e382ad530', '测试会议19', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '336e32efbca1491891e1645e94599b41', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (268, '0d3ebf24bd0548729d2fd95467627cd0', '测试会议20', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '95f329ffebc540f18b16d549f56525db', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (269, '755e25348bbb49599483536e1da1489a', '测试会议21', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '8d635a0a0b6d4a6cbe85a54af5c20b3c', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (270, 'ba5ec9bf0d6245868832865942f82d54', '测试会议22', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'a8462a108f854ef4886940e43819ba01', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (271, '84828cec9c824b8c9a6d117ff75b30fb', '测试会议23', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'a06db6bc7ae74dcfa26a4636b0322576', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (272, 'e2f86480d1154ba686a0962dc92acda6', '测试会议24', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'a45f692fa1d440c7888d294c736ad7fb', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (273, '45eb9dfee87b44c2a8c64091eceacafb', '测试会议25', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '928ae97f624349779bd67eff3bbb6919', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (274, '84eb850175404d3dbc0c57d3d337ac94', '测试会议26', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '585b082e686a4b9893e6ff4033d57cba', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (275, '9f704ef275364ebe8877897d38ca74ae', '测试会议27', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '446111eb59344ceb817f72696e302894', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (276, '6be440c3332048d59a2d3e558396051d', '测试会议28', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c2b02aa6517749548cd64861d83406c8', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (277, '2280ab496bee4c30b21638addae4a1e2', '测试会议29', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'd9cdefb58a8340b591eb8e911ef568b1', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (278, '0af96af1b7a54951ac7c99a2655007ad', '测试会议30', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '51fdecdb3e1943ec89197693ce80d2ef', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (279, '0239f04d36d74b4eb56577239770c25a', '测试会议31', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'ec4a3b3970a64560a05823ae9a94fca7', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (280, '014354ce9af74abca2dd34f5e9a1680c', '测试会议32', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '462313c46c824974ba2bb731b2ccaba4', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (281, '516130ac1cb24b53b53a33749c59f3ff', '测试会议33', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'eb7dd9534cb841a9a19eab0970d7ebf1', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (282, '87b5b149c9cd4a5b927ca3336f54014d', '测试会议34', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3509d9d2570b4a98aad67750e46be37e', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (283, 'bb695e7e2f354fafac80699f46cc9afe', '测试会议35', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c74e7a49c4a041f3b59fbb19e5038e17', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (284, 'fc6de6c514c44df7846c714afc24a1a8', '测试会议36', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '4855c4f69526438cabf03ca17d00ea1f', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (285, '05261facefc647a9a4a84f05ab8715d1', '测试会议37', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '44fd61eecea349d48a703acb34910c6b', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (286, 'b8aab05c463b47ad86f6414383d191da', '测试会议38', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '340a177799b84aa99eb6754b5c6462c3', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (287, '9fda23d394f745c7ae95773d32bb759e', '测试会议39', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'a1333d2c1196465fb31ea4d6c9091d4a', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (288, '93aa75cb12bd4d949d15bf6530707061', '测试会议40', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '96ed5902aef04416993d2167678855d1', 3, '2022-05-16 23:58:39');
INSERT INTO `tb_meeting` VALUES (289, '444d8da3892547cf82d22c6e49bee210', '测试会议41', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'b3b1bc8cea904b719a4c783d1ecad5e0', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (290, '7370ec737008409e990db8585c54625c', '测试会议42', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3799c7dec63c48c19b42e1a47c92748a', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (291, '258caf7475924857835167e9f2e9c839', '测试会议43', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'ce9008b564b7444a82403a3fe36e8a74', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (292, 'aee1dd37eba34dcb9ed4b4de93448611', '测试会议44', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '621c7e767a57453c82087e689dce40c1', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (293, 'a00e37bab12c4f109b737f5444520479', '测试会议45', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '754935607d09437591aa92aa90ebfb71', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (294, '82925d06ba1e4d31b8aa1ffa09576afe', '测试会议46', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c3b3e75543e44243b88ef48a90cbe346', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (295, '01873d7cfa034a7cbdf6e1272b6bac4f', '测试会议47', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c5a8e26a38284a6eb6c30ce8c8ea59c5', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (296, 'de1984e27ca0424bb0518098725f5af3', '测试会议48', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3dbe1f75973b4f58b1f780b88d75d686', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (297, '49d89849f5de49dbae25bb0e3eeb7195', '测试会议49', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '108ad64907db479e9c69a8e2c88caf31', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (298, 'c5e750bab2e24531b4ebdf823f4b28b6', '测试会议50', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '36123885a3464d6e85e7a125a9cea8d9', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (299, '859c9f3264774e86a7ff003d30dac364', '测试会议51', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'd2bee468263b43a9af7573775f683517', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (300, '929cf51385c5485c8d61419e4838cde1', '测试会议52', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '1ec2fa55e7f249f28db02975d630be80', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (301, '1a41e33c70bd4726bf3fc45424be3562', '测试会议53', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '94b8b86d66464b12b33b8995ea03ae19', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (302, '6a1e26f3981a4459bfc07f303a0c0068', '测试会议54', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'f42f2e05d9ab4687bdab12a27f5cf39c', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (303, 'b98b3832d3594e2b92ca50ac0c3a66f2', '测试会议55', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'b6fd84ef67d84911bf2707b5680737ea', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (304, '541fb6fe3fcf4bbd87a0ef437ab5f943', '测试会议56', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '574b857b57a44d01876c894c1019e3b8', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (305, '3019bcb9ce91493db1c236db2452aedf', '测试会议57', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'b6c81dfa29574955abfb164744315378', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (306, '638af9ebde7b4eabad9335a6b517e565', '测试会议58', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c2f64ae75e41451c8c16dc9e2969d859', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (307, '304e23d6cc0d4865be0fa36638b5dfeb', '测试会议59', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3788ae89d5dd45cca2ff1ced5d079e39', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (308, '639d4471157b4d38aa98ae7e793b71b3', '测试会议60', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'd8ba3733b5274039ba60e9ccf6bbaec5', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (309, 'd36857732e49482b884a8b8a298e46d1', '测试会议61', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '4e8a524a14c541419d31d8e377014b83', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (310, 'a7c662b6951a40d4970545978b8b551d', '测试会议62', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '156aa31cd7614d83964182ddf3d190b9', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (311, '7a97dfdb4a9d4e679204e20f910b3b9a', '测试会议63', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'a9fca8b1dfdb4a8a88388da5b96c0944', 3, '2022-05-16 23:58:40');
INSERT INTO `tb_meeting` VALUES (312, '646d521e8a7a4c48baa5caaf3a4bdd9c', '测试会议64', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '660420b12de9496db25010431779535c', 3, '2022-05-16 23:58:41');
INSERT INTO `tb_meeting` VALUES (313, '57c910906f7246a69c4b9804396cbd2e', '测试会议65', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c6abdba3e436469c95bf9e492da91b0c', 3, '2022-05-16 23:58:42');
INSERT INTO `tb_meeting` VALUES (314, '099abfd7eadf42e282c954f99bb29626', '测试会议66', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'abd1da87d1c745b79ddd5f2d468e36d2', 3, '2022-05-16 23:58:43');
INSERT INTO `tb_meeting` VALUES (315, '2c489efe10034f90bc9497bebdd62849', '测试会议67', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '3308fa5af48740109513919511356396', 3, '2022-05-16 23:58:45');
INSERT INTO `tb_meeting` VALUES (316, 'fcf2c2d6150b4eedb950b82495f1baa8', '测试会议68', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'b438aa33af12413fad5395c1e7d652c9', 3, '2022-05-16 23:58:47');
INSERT INTO `tb_meeting` VALUES (317, '58583e6c006d4994a080c59575573bff', '测试会议69', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '0d91253dec6e4e178ef93b9472095db7', 3, '2022-05-16 23:58:50');
INSERT INTO `tb_meeting` VALUES (318, '2f86436de42f41b2a2c363ca76d3f278', '测试会议70', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'f506afe8ecc8412caa6c133562a304f4', 3, '2022-05-16 23:58:52');
INSERT INTO `tb_meeting` VALUES (319, '8ebd73b81a3d4d398b6b144ca3730f8e', '测试会议71', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'f74d6878e5e84436b862d1f9d8c8f81d', 3, '2022-05-16 23:58:52');
INSERT INTO `tb_meeting` VALUES (320, '86b53696813a45f9a13b31fcda4f3c95', '测试会议72', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '1006069a811a4a23938ac8cbc24ca6ea', 3, '2022-05-16 23:58:52');
INSERT INTO `tb_meeting` VALUES (321, '801d3904f22a49da87f4ab88ee958470', '测试会议73', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '6f61b0ffe37e437ebc402386f5ac5821', 3, '2022-05-16 23:58:52');
INSERT INTO `tb_meeting` VALUES (322, '7b7787b3dcf94091aa5f0a73d9373326', '测试会议74', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '0acfa6b4fd2b47da958a6238225aed9a', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (323, 'befda0cc87494cb78fe5546ba9d1b199', '测试会议75', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '8bab8878307b4324ab16204c8372b4f0', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (324, 'c8bbe7592d9d490c8a157b9a9e9688d1', '测试会议76', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'd1d0d6b645f34631b168b65d1ad72903', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (325, 'ec06e97e579f4b1ea674ba011ca4159c', '测试会议77', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '23f6bd8918434adcb65f849113e90388', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (326, 'eb4711bc236b4955920dca1403d5bd71', '测试会议78', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '58100be968d94412815723e1de5e9bd6', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (327, '86489529a8d04cf5938c7c9cd433b0fa', '测试会议79', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '12023ca72588453d84387f3fcba6b012', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (328, '403763746a6442bf842e6fd286661011', '测试会议80', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c77b5302bcae434c8fdb20d480115262', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (329, '2e47f5e1a5164e1295ab4f9aaec3e001', '测试会议81', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '8cb28bb23cfd49539588fec91577983f', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (330, '740836194a374c36909f8fb89a943444', '测试会议82', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'c66158ec877a459bba95d4e4fe60e718', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (331, '19f10ac0d33f429d87cf96b730e84ecd', '测试会议83', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '9758d65d000141fb9dd507301d0a5233', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (332, 'd0da5ee8eb63419d8c0901c27e09041a', '测试会议84', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'ee0a646917714f0a9fb7d8eb0c9cef1e', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (333, '608954679421481f948f0fd9d8ee3b08', '测试会议85', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '2af3bf0832534bf184d0097c7b15d589', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (334, '9007f59290bb41d08be4ef06bbdb9dba', '测试会议86', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '24642a2049e943d98e649ec9069ec6f4', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (335, '59fd98dca9e0440d81d0523535d43550', '测试会议87', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '144e76b3393341a49264d898a11064f0', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (336, '72b3ef8e9ec44487acf0556a211492ef', '测试会议88', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'f592553b1fed445b8465d7bcae9b2101', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (337, '84cb4d75a94f4adfabfd102bc9bba954', '测试会议89', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '5c6206d471cd4282953b9d9d65c755db', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (338, '1d5d61787dbc44e2b7294b77861a6a6b', '测试会议90', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '59cea1a011b54fd9b8e5cb1b9b218593', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (339, '08367ccac126463b95c1d578048359e9', '测试会议91', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '638fb9e6997e4960a8956cfb952bbf0c', 3, '2022-05-16 23:58:53');
INSERT INTO `tb_meeting` VALUES (340, '3bea8cf4c91e4074babf89a1662584ad', '测试会议92', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '781512f26db54499b9e3a51cc9630273', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (341, '02641108fcea45e2aa6fd79d0e309805', '测试会议93', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '5f16c897119e48cb9f4bcc0fc0c32b10', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (342, '5d750ecc1d4d4da4aea42982f4556bd5', '测试会议94', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '5455a93b75a8418ea881e13e478358de', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (343, 'b717e00207cf4b608ff65bd73561b574', '测试会议95', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '81aae92242f447b9810740d9c606b0b2', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (344, '590bc38cdd6b406bb46c1dd667b4ef96', '测试会议96', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'db79b8bafb7640f0b6eb1885e4e4be4e', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (345, '3792f4e50f504f989921403fcb6ae1b4', '测试会议97', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', 'de9098c39ff841a1b5122229dea4901f', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (346, '18f0f820b57e4b1c8f789ce9c41adbf3', '测试会议98', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '2fdf1e5961934de085d4dd2f9319989e', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (347, 'ce74aba7bae74c6b917dd162383fdcd9', '测试会议99', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '0173c4f2a8494b94b1afd735bb386e69', 3, '2022-05-16 23:58:54');
INSERT INTO `tb_meeting` VALUES (348, 'aadf73d3becd40498ea48de5de56e89d', '测试会议100', 12, '2022-05-16', '线上会议室', '08:30:00', '10:30:00', 1, '[12, 15, 16]', '会议研讨Emos项目上线测试', '36466e1d6393444893fdb38ca78c9e8f', 3, '2022-05-16 23:58:54');

-- ----------------------------
-- Table structure for tb_module
-- ----------------------------
DROP TABLE IF EXISTS `tb_module`;
CREATE TABLE `tb_module`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块编号',
  `module_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_module_id`(`module_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_module
-- ----------------------------
INSERT INTO `tb_module` VALUES (1, 'USER', '用户管理');
INSERT INTO `tb_module` VALUES (2, 'EMPLOYEE', '员工管理');
INSERT INTO `tb_module` VALUES (3, 'DEPT', '部门管理');
INSERT INTO `tb_module` VALUES (4, 'MEETING', '会议管理');
INSERT INTO `tb_module` VALUES (5, 'WORKFLOW', '工作流管理');

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `module_id` int UNSIGNED NOT NULL COMMENT '模块ID',
  `action_id` int UNSIGNED NOT NULL COMMENT '行为ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_permission`(`permission_name`) USING BTREE,
  UNIQUE INDEX `unq_complex`(`module_id`, `action_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES (0, 'ROOT', 0, 0);
INSERT INTO `tb_permission` VALUES (1, 'USER:INSERT', 1, 1);
INSERT INTO `tb_permission` VALUES (2, 'USER:DELETE', 1, 2);
INSERT INTO `tb_permission` VALUES (3, 'USER:UPDATE', 1, 3);
INSERT INTO `tb_permission` VALUES (4, 'USER:SELECT', 1, 4);
INSERT INTO `tb_permission` VALUES (5, 'EMPLOYEE:INSERT', 2, 1);
INSERT INTO `tb_permission` VALUES (6, 'EMPLOYEE:DELETE', 2, 2);
INSERT INTO `tb_permission` VALUES (7, 'EMPLOYEE:UPDATE', 2, 3);
INSERT INTO `tb_permission` VALUES (8, 'EMPLOYEE:SELECT', 2, 4);
INSERT INTO `tb_permission` VALUES (9, 'DEPT:INSERT', 3, 1);
INSERT INTO `tb_permission` VALUES (10, 'DEPT:DELETE', 3, 2);
INSERT INTO `tb_permission` VALUES (11, 'DEPT:UPDATE', 3, 3);
INSERT INTO `tb_permission` VALUES (12, 'DEPT:SELECT', 3, 4);
INSERT INTO `tb_permission` VALUES (13, 'MEETING:INSERT', 4, 1);
INSERT INTO `tb_permission` VALUES (14, 'MEETING:DELETE', 4, 2);
INSERT INTO `tb_permission` VALUES (15, 'MEETING:UPDATE', 4, 3);
INSERT INTO `tb_permission` VALUES (16, 'MEETING:SELECT', 4, 4);
INSERT INTO `tb_permission` VALUES (17, 'WORKFLOW:APPROVAL', 5, 5);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `permissions` json NOT NULL COMMENT '权限集合',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (0, '超级管理员', '[0]');
INSERT INTO `tb_role` VALUES (1, '总经理', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]');
INSERT INTO `tb_role` VALUES (2, '部门经理', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]');
INSERT INTO `tb_role` VALUES (3, '普通员工', '[1, 2, 3, 4, 5, 6, 7, 8]');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `open_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长期授权字符串',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像网址',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `hiredate` date NULL DEFAULT NULL COMMENT '入职日期',
  `role` json NOT NULL COMMENT '角色',
  `root` tinyint(1) NOT NULL COMMENT '是否是超级管理员',
  `dept_id` int UNSIGNED NULL DEFAULT NULL COMMENT '部门编号',
  `status` tinyint NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_open_id`(`open_id`) USING BTREE,
  INDEX `unq_email`(`email`) USING BTREE,
  INDEX `idx_dept_id`(`dept_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (22, 'oD4p-5InZyBZ5wX1Dba5Ol56PGZc', '微信用户', 'https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132', '马甲-吴民师', '男', '18726336780', '13567589029@qq.com', '2022-05-10', '[0]', 1, 1, 1, '2022-05-25 14:49:59');

-- ----------------------------
-- Table structure for tb_workday
-- ----------------------------
DROP TABLE IF EXISTS `tb_workday`;
CREATE TABLE `tb_workday`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_date`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_workday
-- ----------------------------
INSERT INTO `tb_workday` VALUES (1, '2022-05-20');
INSERT INTO `tb_workday` VALUES (2, '2022-05-23');
INSERT INTO `tb_workday` VALUES (3, '2022-05-24');

SET FOREIGN_KEY_CHECKS = 1;
