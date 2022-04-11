/*
 Navicat MySQL Data Transfer

 Source Server         : exam
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : jkfl

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 12/04/2022 01:26:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy`  (
  `academy_id` bigint NOT NULL COMMENT 'rbac装样子的，不用管',
  `academy_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `academy_pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `academy_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `academy_school_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`academy_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES (2890320, '物联网工程学院', '2022-02-24 21:36:29', '2022-02-24 21:36:32', 0, 0, '1', '0-1', 134567829);
INSERT INTO `academy` VALUES (2890398, '人工智能与计算机学院', '2022-02-24 21:34:48', '2022-02-24 21:34:51', 0, 0, '1', '0-0', 134567829);
INSERT INTO `academy` VALUES (2894718, '设计学院', '2022-02-24 21:36:55', '2022-02-24 21:36:58', 0, 0, '1', '0-2', 134567829);
INSERT INTO `academy` VALUES (3782910, '数字媒体学院', '2022-02-24 21:37:25', '2022-02-24 21:37:27', 0, 0, '2', '1-0', 134567898);
INSERT INTO `academy` VALUES (3789810, '机械工程学院', '2022-02-24 21:38:32', '2022-02-24 21:38:34', 0, 0, '2', '1-1', 134567898);

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `action_id` int NOT NULL AUTO_INCREMENT COMMENT '前端页面操作表主键id',
  `action_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '前端操作的名字',
  `action_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面操作的描述',
  `default_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '当前操作是否需要校验,true为1,0为false',
  PRIMARY KEY (`action_id`) USING BTREE,
  UNIQUE INDEX `action_name`(`action_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '前端操作比如增删改查等的权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 'add', '新增', 0);
INSERT INTO `action` VALUES (2, 'query', '查询', 0);
INSERT INTO `action` VALUES (3, 'get', '详情', 0);
INSERT INTO `action` VALUES (4, 'update', '修改', 0);
INSERT INTO `action` VALUES (5, 'delete', '删除', 0);
INSERT INTO `action` VALUES (6, 'import', '导入', 0);
INSERT INTO `action` VALUES (7, 'export', '导出', 0);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` bigint NOT NULL COMMENT '管理员表，不要动',
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `admin_sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `admin_tel` bigint NULL DEFAULT NULL,
  `admin_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `admin_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `admin_identity_card` bigint NULL DEFAULT NULL,
  `admin_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `admin_description` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (21343, '变成光守护乃琳小姐', '男', 18115773855, '1356768966@qq.com', '730428', 320621200107288717, '0', '2022-02-02 17:25:30', '2022-02-07 17:25:33', 0, 0, '第一个诞生的用户！');
INSERT INTO `admin` VALUES (12212231, '管理员', '男', 18115773851, '1234567890@qq.com', '111111', 222312312434312, '0', '2022-02-07 18:15:13', '2022-02-07 18:15:16', 0, 0, '第二个诞生的用户！');

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `point_id` int NULL DEFAULT NULL COMMENT '知识点的表，学生端不需要',
  `point_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `checkin_id` bigint NOT NULL,
  `grade_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`checkin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES (2, 'html', 133231, '2', '1');
INSERT INTO `checkin` VALUES (9, 'Java面向对象', 902123, '2', '1');
INSERT INTO `checkin` VALUES (4, 'js面向对象', 3421311, '2', '1');
INSERT INTO `checkin` VALUES (1, 'js基础', 3423421, '2', '1');
INSERT INTO `checkin` VALUES (5, 'Vue', 4121412, '2', '1');
INSERT INTO `checkin` VALUES (6, 'Angular', 4353232, '2', '1');
INSERT INTO `checkin` VALUES (11, 'C++', 6542478, '2', '1');
INSERT INTO `checkin` VALUES (8, 'Java基础', 9284912, '2', '1');
INSERT INTO `checkin` VALUES (10, 'JavaWeb', 19283922, '2', '1');
INSERT INTO `checkin` VALUES (12, 'Python', 40292184, '2', '1');
INSERT INTO `checkin` VALUES (7, 'React', 92821293, '2', '1');
INSERT INTO `checkin` VALUES (3, 'css', 97812738, '2', '1');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` bigint NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1501180409038512129, '2022-03-08 20:57:55', '2022-03-08 20:57:55', 0, 1, '数媒1901');
INSERT INTO `class` VALUES (1501180422934241281, '2022-03-08 20:57:58', '2022-03-08 20:57:58', 0, 1, '数媒1902');
INSERT INTO `class` VALUES (1501180432992182274, '2022-03-08 20:58:00', '2022-03-08 20:58:00', 0, 1, '数媒1903');
INSERT INTO `class` VALUES (1501180441322070018, '2022-03-08 20:58:02', '2022-03-08 20:58:02', 0, 1, '自动化1804');
INSERT INTO `class` VALUES (1501180450687950849, '2022-03-08 20:58:05', '2022-03-08 20:58:05', 0, 1, '数媒1805');
INSERT INTO `class` VALUES (1501180459605041153, '2022-03-08 20:58:07', '2022-03-08 20:58:07', 0, 1, '数媒1906');
INSERT INTO `class` VALUES (1501180468182392833, '2022-03-08 20:58:09', '2022-03-08 20:58:09', 0, 1, '过程1907');
INSERT INTO `class` VALUES (1501180477372112898, '2022-03-08 20:58:11', '2022-03-08 20:58:11', 0, 1, '数艺2008');
INSERT INTO `class` VALUES (1501180491259453442, '2022-03-08 20:58:14', '2022-03-08 20:58:14', 0, 1, '工设2009');
INSERT INTO `class` VALUES (1501180911373524993, '2022-03-08 20:59:55', '2022-03-08 20:59:55', 0, 1, '数媒2110');

-- ----------------------------
-- Table structure for exam_manage
-- ----------------------------
DROP TABLE IF EXISTS `exam_manage`;
CREATE TABLE `exam_manage`  (
  `exam_id` bigint NOT NULL COMMENT '主键',
  `exam_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '考试描述',
  `exam_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '考试名称！！！对应paper_look中的paper_look_title',
  `paper_id` bigint NULL DEFAULT NULL COMMENT '试卷id，对应paper_manage中的paper_id\r\n',
  `exam_date` datetime NULL DEFAULT NULL COMMENT '考试时间',
  `exam_total_time` int NULL DEFAULT NULL COMMENT '总时间',
  `exam_grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设',
  `exam_term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设\r\n',
  `exam_major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设',
  `exam_institute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设',
  `exam_total_score` int NULL DEFAULT NULL COMMENT '总分',
  `exam_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型，ez简单，nr中等，hd困难',
  `exam_tips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '考试贴士，可以写一些考试须知之类的，一般是固定的纪律性文本',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `deleted` tinyint NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `clazz_id` bigint NULL DEFAULT NULL COMMENT '对应班级id，对应class中的class_id',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_manage
-- ----------------------------
INSERT INTO `exam_manage` VALUES (1501401351320854529, '模拟考试，请认真对待', 'JavaScript基础模拟考试(一)', 4, '2022-04-06 17:00:00', 120, NULL, NULL, NULL, NULL, 125, 'nr', '请将与考试无关物品上交，一旦查到按违规处理。', '2022-03-09 11:35:52', '2022-03-09 11:35:52', 0, 1, 1501180409038512129);
INSERT INTO `exam_manage` VALUES (1501401351320854530, '模拟考试，请认真对待', '前端基础模拟考试(二)', 1, '2022-04-11 15:00:00', 120, NULL, NULL, NULL, NULL, 100, 'nr', '请将与考试无关物品上交，一旦查到按违规处理。', '2022-03-09 11:35:52', '2022-03-09 11:35:52', 0, 1, 1501180422934241281);

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `exam_record_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试记录表的主键',
  `exam_joiner_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试参与者的用户id',
  `exam_join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '参加考试的时间',
  `exam_time_cost` int NULL DEFAULT 0 COMMENT '完成考试所用的时间,单位分钟,摆设',
  `exam_join_score` int NOT NULL DEFAULT 0 COMMENT '参与考试的客观题实际得分',
  `exam_result_level` int NULL DEFAULT 0 COMMENT '考试结果的等级,也是摆设',
  `answer_option_ids` varchar(4096) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '存有客观题答案的字段',
  `exam_id` bigint NOT NULL COMMENT '本场考试记录对应的考试id',
  `exam_sub_score` int NULL DEFAULT NULL COMMENT '考试主观题分数，教师端批阅完后根据id插入',
  `exam_joiner_class` bigint NULL DEFAULT NULL COMMENT '参与考试者的用户班级',
  `exam_input_answer` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '填空题答案',
  `exam_short_answer` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '简答题答案',
  `exam_program_answer` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '程序题答案',
  PRIMARY KEY (`exam_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '考试记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of exam_record
-- ----------------------------
INSERT INTO `exam_record` VALUES ('299fa0aa96184655a0fffeb34bb2768b', '79392778a90d4639a297dbd0bae0f779', '2022-03-28 15:24:29', NULL, 18, NULL, '1501079053837615105@False_B$1501081108157382658@True_A-B-C$1501080994428829698@False_A$1501079482986217473@False_D$1501012550865973249@False_A$1500750277485346818@True_A$1501081838238908418@False_A-C$1501080051897417729@True_A$1501081703027130369@False_B$1501080348417933314@False_A-D$1500759753886126081@True_T$1500749989382799362@True_C$1501080476050604033@True_T$1501080905748660226@False_C$1501080493717012482@False_F$1501080516567580674@True_F$1501078197977300993@False_B$1501078490064437250@True_B$1501080415652626434@False_B-C', 1501401351320854529, 45, 1501180422934241281, '1501086497024327682__dvsadvdsavidasvjoasiv$$1501086829951401985__asdfasdfdasfdasfasdf$$1501086625265172481__jdasofiwoiejfoiwefjnoi', '1501082988568723458__dfasdfasdf\n大撒发射点法大师傅\nfjosdaifjoasfdjoasif$$1501082295459987458__发啊手动阀手动阀手动阀\n撒旦发射点发射点发生\nsdafasdfasdfsad\nff\n', '');
INSERT INTO `exam_record` VALUES ('2bdd9703bbc2415b8e33f8946860ea0e', 'eb04f0bdf777421ab2feec63d56f26c5', '2022-03-28 15:27:36', NULL, 14, NULL, '1501079053837615105@False_B$1501081108157382658@False_B$1501080994428829698@True_B$1501079482986217473@False_B$1501012550865973249@True_A-B-C-D$1500750277485346818@False_B$1501081838238908418@False_A$1501080051897417729@False_B$1501081703027130369@False_B$1501080348417933314@False_D$1500759753886126081@True_T$1500749989382799362@False_B$1501080476050604033@False_F$1501080905748660226@False_B$1501080493717012482@True_T$1501080516567580674@True_F$1501078197977300993@False_B$1501078490064437250@True_B$1501080415652626434@False_C', 1501401351320854529, 18, 1501180491259453442, '1501086755670278145__333$$1501086497024327682__1$$1501086829951401985__44\n44$$1501087322190725122__55555$$1501086625265172481__2', '1501082295459987458__简答题1', '');

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for input_question
-- ----------------------------
DROP TABLE IF EXISTS `input_question`;
CREATE TABLE `input_question`  (
  `iq_id` bigint NOT NULL,
  `iq_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iq_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iq_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iq_score` int NULL DEFAULT NULL,
  `iq_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `iq_section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`iq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of input_question
-- ----------------------------
INSERT INTO `input_question` VALUES (1500765116316344322, 'js基础', 'Typescript式Javascript的________', '超集', '无解析', 3, '1', NULL, '2022-03-07 17:27:41', '2022-03-07 17:27:41', 1, 0);
INSERT INTO `input_question` VALUES (1500766729818959873, 'html', 'HTML是一种_____语言。', '超文本', 'HTML的英文全称是 Hyper Text Markup Language，即超文本标记语言。', 3, '1', NULL, '2022-03-07 17:34:06', '2022-03-07 17:34:06', 1, 0);
INSERT INTO `input_question` VALUES (1501086497024327682, 'html', 'HTML表格标签是', '<table>', '无解析', 3, '1', NULL, '2022-03-08 14:44:44', '2022-03-08 14:44:44', 1, 0);
INSERT INTO `input_question` VALUES (1501086540322127874, 'html', 'HTML表格中的行标签是', '<tr> ', '无解析', 3, '1', NULL, '2022-03-08 14:44:55', '2022-03-08 14:44:55', 1, 0);
INSERT INTO `input_question` VALUES (1501086625265172481, 'html', '为了达到同一组单选按钮的互斥效果，______属性值必须相同。', 'name', '无解析', 3, '1', NULL, '2022-03-08 14:45:15', '2022-03-08 14:45:15', 1, 0);
INSERT INTO `input_question` VALUES (1501086683083653121, 'html', '表示鼠标单击事件的是____', 'onclick', '无解析', 3, '1', NULL, '2022-03-08 14:45:29', '2022-03-08 14:45:29', 1, 0);
INSERT INTO `input_question` VALUES (1501086755670278145, 'css', 'CSS样式中的padding属性表示_____', '内填充距离 ', '无解析', 3, '1', NULL, '2022-03-08 14:45:46', '2022-03-08 14:45:46', 1, 0);
INSERT INTO `input_question` VALUES (1501086829951401985, 'css', 'CSS中类选择符是html标签中_______属性的值。', 'class ', '无解析', 3, '1', NULL, '2022-03-08 14:46:04', '2022-03-08 14:46:04', 1, 0);
INSERT INTO `input_question` VALUES (1501086919512375297, 'html', '无序列表标签是____', '<ul>', '无解析', 3, '1', NULL, '2022-03-08 14:46:25', '2022-03-08 14:46:25', 1, 0);
INSERT INTO `input_question` VALUES (1501086962889867265, 'html', '<img>标签中表示图片地址的属性是______', 'src', '无解析', 3, '1', NULL, '2022-03-08 14:46:35', '2022-03-08 14:46:35', 1, 0);
INSERT INTO `input_question` VALUES (1501087008070909954, 'html', 'onclick事件表示______', '单击按钮事件 ', '无解析', 3, '1', NULL, '2022-03-08 14:46:46', '2022-03-08 14:46:46', 1, 0);
INSERT INTO `input_question` VALUES (1501087077268537346, 'html', '嵌入样式表是在html标签的________属性值中添加CSS规则', 'link', '无解析', 3, '1', NULL, '2022-03-08 14:47:03', '2022-03-08 14:47:03', 1, 0);
INSERT INTO `input_question` VALUES (1501087147070144514, 'css', 'a:visited表示________', '被访问过的链接', '无解析', 3, '1', NULL, '2022-03-08 14:47:19', '2022-03-08 14:47:19', 1, 0);
INSERT INTO `input_question` VALUES (1501087258798014466, 'html', '在表单中，复选框的type值为_______', 'checkbox', '无解析', 3, '1', NULL, '2022-03-08 14:47:46', '2022-03-08 14:47:46', 1, 0);
INSERT INTO `input_question` VALUES (1501087322190725122, 'html', 'page指令中的_________属性是可以使用多次的。', 'import', '无解析', 3, '1', NULL, '2022-03-08 14:48:01', '2022-03-08 14:48:01', 1, 0);
INSERT INTO `input_question` VALUES (1501087375357722625, 'js基础', 'session内置对象的数据保存范围为_____', '一次会话', '无解析', 3, '1', NULL, '2022-03-08 14:48:14', '2022-03-08 14:48:14', 1, 0);

-- ----------------------------
-- Table structure for judge_question
-- ----------------------------
DROP TABLE IF EXISTS `judge_question`;
CREATE TABLE `judge_question`  (
  `jq_id` bigint NOT NULL,
  `jq_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jq_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jq_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jq_score` int NULL DEFAULT NULL,
  `jq_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jq_section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`jq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of judge_question
-- ----------------------------
INSERT INTO `judge_question` VALUES (1500754551791538177, 'css', '在css中通过color属性控制背景颜色', 'F', '无解析', 2, '1', NULL, '2022-03-07 16:45:42', '2022-03-07 16:45:42', 1, 0);
INSERT INTO `judge_question` VALUES (1500758891952459777, 'js基础', 'js中通过===判断值是否相等', 'T', '无解析', 2, '1', NULL, '2022-03-07 17:02:57', '2022-03-07 17:02:57', 1, 0);
INSERT INTO `judge_question` VALUES (1500759753886126081, 'Vue', 'vue中存在路由守卫', 'T', '无解析', 2, '2', NULL, '2022-03-07 17:06:23', '2022-03-07 17:06:23', 1, 0);
INSERT INTO `judge_question` VALUES (1500760257240354818, 'js面向对象', '在React类式编程中可以使用函数式编程中的hook函数“useRef”创造回调', 'T', '无解析', 2, '2', NULL, '2022-03-07 17:08:23', '2022-03-07 17:08:23', 1, 0);
INSERT INTO `judge_question` VALUES (1501079886880915458, 'js基础', '条件运算符的基本语法格式为，条件表达式？表达式1：表达式2，它的含义是先计算条件表达式，若结果为true，计算表达式2，若结果为false，计算表达式1。（  ）', 'F', '无解析', 2, '3', NULL, '2022-03-08 14:18:28', '2022-03-08 14:18:28', 1, 0);
INSERT INTO `judge_question` VALUES (1501079912134819842, 'js基础', '在HTML5中使用JavaScript有两种方法，分别是内嵌式和外链式。（）', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:18:34', '2022-03-08 14:18:34', 1, 0);
INSERT INTO `judge_question` VALUES (1501079933081174018, 'js基础', '无论是编程语言还是脚本语言，程序的基本结构都是顺序结构、选择结构、循环结构。（）', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:18:39', '2022-03-08 14:18:39', 1, 0);
INSERT INTO `judge_question` VALUES (1501080455360102402, 'js基础', '对象就是一组属性与方法的集合。', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:20:44', '2022-03-08 14:20:44', 1, 0);
INSERT INTO `judge_question` VALUES (1501080476050604033, 'js基础', '字符串对象是常用的对象之一，可提供诸多方法实现字符串检查、抽取、连接、分隔等字符串相关操作。', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:20:49', '2022-03-08 14:20:49', 1, 0);
INSERT INTO `judge_question` VALUES (1501080493717012482, 'js基础', '在JavaScript中对象分为内置对象、宿主对象和自定义对象三种。', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:20:53', '2022-03-08 14:20:53', 1, 0);
INSERT INTO `judge_question` VALUES (1501080516567580674, 'js基础', '字符串对象方法toLowerCase()，是将字符串对象转换为大写。', 'F', '无解析', 2, '3', NULL, '2022-03-08 14:20:59', '2022-03-08 14:20:59', 1, 0);
INSERT INTO `judge_question` VALUES (1501081247148228610, 'js基础', '数学对象无需创建，通过把Math作为对象使用就可以调用其所有属性和方法。（）', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:23:53', '2022-03-08 14:23:53', 1, 0);
INSERT INTO `judge_question` VALUES (1501081271483580417, 'js基础', 'JS中数学对象的用法大致可以分为“静态属性”和“静态方法”这两大类，几乎所有的前端运算都可以采取这两种方式解决。（）', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:23:59', '2022-03-08 14:23:59', 1, 0);
INSERT INTO `judge_question` VALUES (1501081299795132417, 'js基础', 'Floor（x）方法可实现对数字进行上取整。（）', 'F', '无解析', 2, '3', NULL, '2022-03-08 14:24:05', '2022-03-08 14:24:05', 1, 0);
INSERT INTO `judge_question` VALUES (1501081955184492546, 'js基础', 'JavaScript脚本内置了本地对象Date，该对象可以表示从毫秒到年的所有时间和日期。', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:26:42', '2022-03-08 14:26:42', 1, 0);
INSERT INTO `judge_question` VALUES (1501081986461417474, 'js基础', 'SetTimeout用于设置一个计时器，在指定的时间间隔后调用函数或计算表达式，可以多次执行。', 'F', '无解析', 2, '3', NULL, '2022-03-08 14:26:49', '2022-03-08 14:26:49', 1, 0);
INSERT INTO `judge_question` VALUES (1501082018715615234, 'js基础', '语句var date=new Date(1000000000000)的返回结果为Sun Sep 09 2001 09:46:40 GMT+0800。', 'T', '无解析', 2, '3', NULL, '2022-03-08 14:26:57', '2022-03-08 14:26:57', 1, 0);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` bigint NOT NULL COMMENT 'rbac用的log表，如果重名请把自己的表名字改了，这个不可以改',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  `deleted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1492336102911373314, '管理员登录', '2022-02-12 11:13:48', '2022-02-12 11:13:48', '0', '1');
INSERT INTO `log` VALUES (1492336807021645825, '管理员登录', '2022-02-12 11:16:36', '2022-02-12 11:16:36', '0', '1');
INSERT INTO `log` VALUES (1492336840160841729, '用户信息查询', '2022-02-12 11:16:44', '2022-02-12 11:16:44', '0', '1');
INSERT INTO `log` VALUES (1492340709913800706, '管理员登录', '2022-02-12 11:32:06', '2022-02-12 11:32:06', '0', '1');
INSERT INTO `log` VALUES (1492340718063333377, '查询-用户信息', '2022-02-12 11:32:08', '2022-02-12 11:32:08', '0', '1');
INSERT INTO `log` VALUES (1492341440985276418, '管理员登录', '2022-02-12 11:35:01', '2022-02-12 11:35:01', '0', '1');
INSERT INTO `log` VALUES (1492341463001178113, '查询-用户信息', '2022-02-12 11:35:06', '2022-02-12 11:35:06', '0', '1');
INSERT INTO `log` VALUES (1492341482550829058, '查询-日志', '2022-02-12 11:35:10', '2022-02-12 11:35:10', '0', '1');
INSERT INTO `log` VALUES (1492341623626244098, '查询-日志', '2022-02-12 11:35:44', '2022-02-12 11:35:44', '0', '1');
INSERT INTO `log` VALUES (1492341640386682882, '查询-日志', '2022-02-12 11:35:48', '2022-02-12 11:35:48', '0', '1');
INSERT INTO `log` VALUES (1492341662100594689, '查询-日志', '2022-02-12 11:35:53', '2022-02-12 11:35:53', '0', '1');
INSERT INTO `log` VALUES (1492341837158260738, '查询-日志', '2022-02-12 11:36:35', '2022-02-12 11:36:35', '0', '1');
INSERT INTO `log` VALUES (1492341858515656706, '查询-日志', '2022-02-12 11:36:40', '2022-02-12 11:36:40', '0', '1');
INSERT INTO `log` VALUES (1492342726195519489, '查询-日志', '2022-02-12 11:40:07', '2022-02-12 11:40:07', '0', '1');
INSERT INTO `log` VALUES (1492342789210742786, '查询-用户信息', '2022-02-12 11:40:22', '2022-02-12 11:40:22', '0', '1');
INSERT INTO `log` VALUES (1492342799457427457, '查询-日志', '2022-02-12 11:40:24', '2022-02-12 11:40:24', '0', '1');
INSERT INTO `log` VALUES (1492343323363762177, '查询-日志', '2022-02-12 11:42:29', '2022-02-12 11:42:29', '0', '1');
INSERT INTO `log` VALUES (1492343411871965185, '查询-日志', '2022-02-12 11:42:50', '2022-02-12 11:42:50', '0', '1');
INSERT INTO `log` VALUES (1492343438400937986, '查询-日志', '2022-02-12 11:42:57', '2022-02-12 11:42:57', '0', '1');
INSERT INTO `log` VALUES (1492343543426310145, '管理员登录', '2022-02-12 11:43:22', '2022-02-12 11:43:22', '0', '1');
INSERT INTO `log` VALUES (1492343561176604674, '查询-日志', '2022-02-12 11:43:26', '2022-02-12 11:43:26', '0', '1');
INSERT INTO `log` VALUES (1492343823341481986, '查询-日志', '2022-02-12 11:44:29', '2022-02-12 11:44:29', '0', '1');
INSERT INTO `log` VALUES (1492343858321977345, '管理员登录', '2022-02-12 11:44:37', '2022-02-12 11:44:37', '0', '1');
INSERT INTO `log` VALUES (1492343879012478978, '查询-日志', '2022-02-12 11:44:42', '2022-02-12 11:44:42', '0', '1');
INSERT INTO `log` VALUES (1492344014484303874, '查询-日志', '2022-02-12 11:45:14', '2022-02-12 11:45:14', '0', '1');
INSERT INTO `log` VALUES (1492344031131496450, '查询-日志', '2022-02-12 11:45:18', '2022-02-12 11:45:18', '0', '1');
INSERT INTO `log` VALUES (1492355507795857410, '管理员登录', '2022-02-12 12:30:54', '2022-02-12 12:30:54', '0', '1');
INSERT INTO `log` VALUES (1492355522568196097, '查询-日志', '2022-02-12 12:30:58', '2022-02-12 12:30:58', '0', '1');
INSERT INTO `log` VALUES (1492355654130929665, '查询-日志', '2022-02-12 12:31:29', '2022-02-12 12:31:29', '0', '1');
INSERT INTO `log` VALUES (1492355682991935490, '查询-日志', '2022-02-12 12:31:36', '2022-02-12 12:31:36', '0', '1');
INSERT INTO `log` VALUES (1492356864586092546, '查询-用户信息', '2022-02-12 12:36:18', '2022-02-12 12:36:18', '0', '1');
INSERT INTO `log` VALUES (1492360008300826625, '查询-用户信息', '2022-02-12 12:48:47', '2022-02-12 12:48:47', '0', '1');
INSERT INTO `log` VALUES (1492360019159879682, '查询-用户信息', '2022-02-12 12:48:50', '2022-02-12 12:48:50', '0', '1');
INSERT INTO `log` VALUES (1492374110574338049, '管理员登录', '2022-02-12 13:44:50', '2022-02-12 13:44:50', '0', '1');
INSERT INTO `log` VALUES (1492374130023325698, '查询-用户信息', '2022-02-12 13:44:54', '2022-02-12 13:44:54', '0', '1');
INSERT INTO `log` VALUES (1492380757984022530, '查询-数据库接口', '2022-02-12 14:11:14', '2022-02-12 14:11:14', '0', '1');
INSERT INTO `log` VALUES (1492380820110053377, '查询-数据库接口', '2022-02-12 14:11:29', '2022-02-12 14:11:29', '0', '1');
INSERT INTO `log` VALUES (1492380820621758466, '查询-数据库接口', '2022-02-12 14:11:29', '2022-02-12 14:11:29', '0', '1');
INSERT INTO `log` VALUES (1492380821791969282, '查询-数据库接口', '2022-02-12 14:11:30', '2022-02-12 14:11:30', '0', '1');
INSERT INTO `log` VALUES (1492381118128041986, '管理员登录', '2022-02-12 14:12:40', '2022-02-12 14:12:40', '0', '1');
INSERT INTO `log` VALUES (1492381144342441986, '查询-用户信息', '2022-02-12 14:12:47', '2022-02-12 14:12:47', '0', '1');
INSERT INTO `log` VALUES (1492381159588737025, '查询-用户信息', '2022-02-12 14:12:50', '2022-02-12 14:12:50', '0', '1');
INSERT INTO `log` VALUES (1492381192534994945, '查询-日志', '2022-02-12 14:12:58', '2022-02-12 14:12:58', '0', '1');
INSERT INTO `log` VALUES (1492381226672435202, '查询-Swagger文档接口', '2022-02-12 14:13:06', '2022-02-12 14:13:06', '0', '1');
INSERT INTO `log` VALUES (1492381260625326082, '查询-数据库接口', '2022-02-12 14:13:14', '2022-02-12 14:13:14', '0', '1');
INSERT INTO `log` VALUES (1492381607968223233, '查询-数据库接口', '2022-02-12 14:14:37', '2022-02-12 14:14:37', '0', '1');
INSERT INTO `log` VALUES (1492381625294893057, '查询-Swagger文档接口', '2022-02-12 14:14:41', '2022-02-12 14:14:41', '0', '1');
INSERT INTO `log` VALUES (1492381628889411585, '查询-数据库接口', '2022-02-12 14:14:42', '2022-02-12 14:14:42', '0', '1');
INSERT INTO `log` VALUES (1492381745474285570, '查询-数据库接口', '2022-02-12 14:15:10', '2022-02-12 14:15:10', '0', '1');
INSERT INTO `log` VALUES (1492391368855937026, '管理员登录', '2022-02-12 14:53:24', '2022-02-12 14:53:24', '0', '1');
INSERT INTO `log` VALUES (1492391397737914369, '查询-数据库接口', '2022-02-12 14:53:31', '2022-02-12 14:53:31', '0', '1');
INSERT INTO `log` VALUES (1492392450260754433, '查询-数据库接口', '2022-02-12 14:57:42', '2022-02-12 14:57:42', '0', '1');
INSERT INTO `log` VALUES (1492392580284178434, '查询-数据库接口', '2022-02-12 14:58:13', '2022-02-12 14:58:13', '0', '1');
INSERT INTO `log` VALUES (1492392598835585025, '查询-Swagger文档接口', '2022-02-12 14:58:18', '2022-02-12 14:58:18', '0', '1');
INSERT INTO `log` VALUES (1492392602425909250, '查询-数据库接口', '2022-02-12 14:58:18', '2022-02-12 14:58:18', '0', '1');
INSERT INTO `log` VALUES (1492394314268274689, '查询-Swagger文档接口', '2022-02-12 15:05:07', '2022-02-12 15:05:07', '0', '1');
INSERT INTO `log` VALUES (1492394369528229890, '管理员登录', '2022-02-12 15:05:20', '2022-02-12 15:05:20', '0', '1');
INSERT INTO `log` VALUES (1492394775519969282, '查询-数据库接口', '2022-02-12 15:06:56', '2022-02-12 15:06:56', '0', '1');
INSERT INTO `log` VALUES (1492394840993054722, '查询-数据库接口', '2022-02-12 15:07:12', '2022-02-12 15:07:12', '0', '1');
INSERT INTO `log` VALUES (1492394852800020481, '查询-数据库接口', '2022-02-12 15:07:15', '2022-02-12 15:07:15', '0', '1');
INSERT INTO `log` VALUES (1492394912405274625, '查询-数据库接口', '2022-02-12 15:07:29', '2022-02-12 15:07:29', '0', '1');
INSERT INTO `log` VALUES (1492397156945170434, '管理员登录', '2022-02-12 15:16:24', '2022-02-12 15:16:24', '0', '1');
INSERT INTO `log` VALUES (1492397182299738113, '查询-数据库接口', '2022-02-12 15:16:30', '2022-02-12 15:16:30', '0', '1');
INSERT INTO `log` VALUES (1492397558931460097, '查询-数据库接口', '2022-02-12 15:18:00', '2022-02-12 15:18:00', '0', '1');
INSERT INTO `log` VALUES (1492397564644102146, '查询-数据库接口', '2022-02-12 15:18:01', '2022-02-12 15:18:01', '0', '1');
INSERT INTO `log` VALUES (1492397785977524225, '查询-Swagger文档接口', '2022-02-12 15:18:54', '2022-02-12 15:18:54', '0', '1');
INSERT INTO `log` VALUES (1492397787151929346, '查询-数据库接口', '2022-02-12 15:18:55', '2022-02-12 15:18:55', '0', '1');
INSERT INTO `log` VALUES (1492397794244497410, '查询-Swagger文档接口', '2022-02-12 15:18:56', '2022-02-12 15:18:56', '0', '1');
INSERT INTO `log` VALUES (1492397807800487938, '查询-日志', '2022-02-12 15:18:59', '2022-02-12 15:18:59', '0', '1');
INSERT INTO `log` VALUES (1492398416322637825, '管理员登录', '2022-02-12 15:21:25', '2022-02-12 15:21:25', '0', '1');
INSERT INTO `log` VALUES (1492398777221525505, '管理员登录', '2022-02-12 15:22:51', '2022-02-12 15:22:51', '0', '1');
INSERT INTO `log` VALUES (1492398792618815489, '查询-用户信息', '2022-02-12 15:22:54', '2022-02-12 15:22:54', '0', '1');
INSERT INTO `log` VALUES (1492398816140472321, '查询-日志', '2022-02-12 15:23:00', '2022-02-12 15:23:00', '0', '1');
INSERT INTO `log` VALUES (1492398843059515393, '查询-Swagger文档接口', '2022-02-12 15:23:06', '2022-02-12 15:23:06', '0', '1');
INSERT INTO `log` VALUES (1492398860054835202, '查询-数据库接口', '2022-02-12 15:23:10', '2022-02-12 15:23:10', '0', '1');
INSERT INTO `log` VALUES (1492398862835658753, '查询-数据库接口', '2022-02-12 15:23:11', '2022-02-12 15:23:11', '0', '1');
INSERT INTO `log` VALUES (1492399020046561282, '查询-数据库接口', '2022-02-12 15:23:48', '2022-02-12 15:23:48', '0', '1');
INSERT INTO `log` VALUES (1492399021816557569, '查询-数据库接口', '2022-02-12 15:23:49', '2022-02-12 15:23:49', '0', '1');
INSERT INTO `log` VALUES (1492402710606249986, '查询-数据库接口', '2022-02-12 15:38:28', '2022-02-12 15:38:28', '0', '1');
INSERT INTO `log` VALUES (1492402712762122242, '查询-数据库接口', '2022-02-12 15:38:29', '2022-02-12 15:38:29', '0', '1');
INSERT INTO `log` VALUES (1492402746450771970, '管理员登录', '2022-02-12 15:38:37', '2022-02-12 15:38:37', '0', '1');
INSERT INTO `log` VALUES (1492402794882400257, '查询-Swagger文档接口', '2022-02-12 15:38:48', '2022-02-12 15:38:48', '0', '1');
INSERT INTO `log` VALUES (1492402796857917442, '查询-数据库接口', '2022-02-12 15:38:49', '2022-02-12 15:38:49', '0', '1');
INSERT INTO `log` VALUES (1492402799080898562, '查询-数据库接口', '2022-02-12 15:38:49', '2022-02-12 15:38:49', '0', '1');
INSERT INTO `log` VALUES (1492403122713522178, '管理员登录', '2022-02-12 15:40:07', '2022-02-12 15:40:07', '0', '1');
INSERT INTO `log` VALUES (1492403129575403521, '查询-用户信息', '2022-02-12 15:40:08', '2022-02-12 15:40:08', '0', '1');
INSERT INTO `log` VALUES (1492403149108277250, '查询-日志', '2022-02-12 15:40:13', '2022-02-12 15:40:13', '0', '1');
INSERT INTO `log` VALUES (1492403164530733057, '查询-Swagger文档接口', '2022-02-12 15:40:17', '2022-02-12 15:40:17', '0', '1');
INSERT INTO `log` VALUES (1492403166753714178, '查询-数据库接口', '2022-02-12 15:40:17', '2022-02-12 15:40:17', '0', '1');
INSERT INTO `log` VALUES (1492403168976695298, '查询-数据库接口', '2022-02-12 15:40:18', '2022-02-12 15:40:18', '0', '1');
INSERT INTO `log` VALUES (1492403183409295361, '查询-数据库接口', '2022-02-12 15:40:21', '2022-02-12 15:40:21', '0', '1');
INSERT INTO `log` VALUES (1492403185384812546, '查询-数据库接口', '2022-02-12 15:40:22', '2022-02-12 15:40:22', '0', '1');
INSERT INTO `log` VALUES (1492403923179626498, '管理员登录', '2022-02-12 15:43:17', '2022-02-12 15:43:17', '0', '1');
INSERT INTO `log` VALUES (1492403953374420994, '查询-用户信息', '2022-02-12 15:43:25', '2022-02-12 15:43:25', '0', '1');
INSERT INTO `log` VALUES (1492403967081406466, '查询-Swagger文档接口', '2022-02-12 15:43:28', '2022-02-12 15:43:28', '0', '1');
INSERT INTO `log` VALUES (1492403975818141697, '查询-数据库接口', '2022-02-12 15:43:30', '2022-02-12 15:43:30', '0', '1');
INSERT INTO `log` VALUES (1492403977260982274, '查询-数据库接口', '2022-02-12 15:43:30', '2022-02-12 15:43:30', '0', '1');
INSERT INTO `log` VALUES (1492404010513424385, '查询-Swagger文档接口', '2022-02-12 15:43:38', '2022-02-12 15:43:38', '0', '1');
INSERT INTO `log` VALUES (1492404012103065602, '查询-数据库接口', '2022-02-12 15:43:39', '2022-02-12 15:43:39', '0', '1');
INSERT INTO `log` VALUES (1492404014061805569, '查询-数据库接口', '2022-02-12 15:43:39', '2022-02-12 15:43:39', '0', '1');
INSERT INTO `log` VALUES (1492404051105898498, '查询-日志', '2022-02-12 15:43:48', '2022-02-12 15:43:48', '0', '1');
INSERT INTO `log` VALUES (1492404123147264001, '查询-用户信息', '2022-02-12 15:44:05', '2022-02-12 15:44:05', '0', '1');
INSERT INTO `log` VALUES (1492405339050749953, '管理员登录', '2022-02-12 15:48:55', '2022-02-12 15:48:55', '0', '1');
INSERT INTO `log` VALUES (1492405365294510081, '查询-用户信息', '2022-02-12 15:49:01', '2022-02-12 15:49:01', '0', '1');
INSERT INTO `log` VALUES (1492405385720770561, '查询-日志', '2022-02-12 15:49:06', '2022-02-12 15:49:06', '0', '1');
INSERT INTO `log` VALUES (1492405413709361154, '查询-Swagger文档接口', '2022-02-12 15:49:13', '2022-02-12 15:49:13', '0', '1');
INSERT INTO `log` VALUES (1492405424018960386, '查询-Swagger文档接口', '2022-02-12 15:49:15', '2022-02-12 15:49:15', '0', '1');
INSERT INTO `log` VALUES (1492405430922784770, '查询-日志', '2022-02-12 15:49:17', '2022-02-12 15:49:17', '0', '1');
INSERT INTO `log` VALUES (1492405531388948481, '查询-日志', '2022-02-12 15:49:41', '2022-02-12 15:49:41', '0', '1');
INSERT INTO `log` VALUES (1492405728080834562, '查询-数据接口文档', '2022-02-12 15:50:28', '2022-02-12 15:50:28', '0', '1');
INSERT INTO `log` VALUES (1492405743180328962, '查询-日志', '2022-02-12 15:50:31', '2022-02-12 15:50:31', '0', '1');
INSERT INTO `log` VALUES (1492405761899507713, '查询-用户信息', '2022-02-12 15:50:36', '2022-02-12 15:50:36', '0', '1');
INSERT INTO `log` VALUES (1492405779234566145, '查询-日志', '2022-02-12 15:50:40', '2022-02-12 15:50:40', '0', '1');
INSERT INTO `log` VALUES (1492405999594909697, '查询-数据库接口', '2022-02-12 15:51:33', '2022-02-12 15:51:33', '0', '1');
INSERT INTO `log` VALUES (1492406002900021249, '查询-数据库接口', '2022-02-12 15:51:33', '2022-02-12 15:51:33', '0', '1');
INSERT INTO `log` VALUES (1492406061167292417, '查询-日志', '2022-02-12 15:51:47', '2022-02-12 15:51:47', '0', '1');
INSERT INTO `log` VALUES (1492406072651296769, '查询-用户信息', '2022-02-12 15:51:50', '2022-02-12 15:51:50', '0', '1');
INSERT INTO `log` VALUES (1492406085947240449, '查询-日志', '2022-02-12 15:51:53', '2022-02-12 15:51:53', '0', '1');
INSERT INTO `log` VALUES (1492406232223592450, '查询-Swagger文档接口', '2022-02-12 15:52:28', '2022-02-12 15:52:28', '0', '1');
INSERT INTO `log` VALUES (1492406235809722370, '查询-数据接口文档', '2022-02-12 15:52:29', '2022-02-12 15:52:29', '0', '1');
INSERT INTO `log` VALUES (1492406239907557378, '查询-用户信息', '2022-02-12 15:52:30', '2022-02-12 15:52:30', '0', '1');
INSERT INTO `log` VALUES (1492406253706817537, '查询-日志', '2022-02-12 15:52:33', '2022-02-12 15:52:33', '0', '1');
INSERT INTO `log` VALUES (1492406266281340930, '查询-用户信息', '2022-02-12 15:52:36', '2022-02-12 15:52:36', '0', '1');
INSERT INTO `log` VALUES (1492406273629761538, '查询-日志', '2022-02-12 15:52:38', '2022-02-12 15:52:38', '0', '1');
INSERT INTO `log` VALUES (1492406293426876417, '查询-用户信息', '2022-02-12 15:52:43', '2022-02-12 15:52:43', '0', '1');
INSERT INTO `log` VALUES (1492406683409068033, '管理员登录', '2022-02-12 15:54:16', '2022-02-12 15:54:16', '0', '1');
INSERT INTO `log` VALUES (1492406690023485442, '查询-用户信息', '2022-02-12 15:54:17', '2022-02-12 15:54:17', '0', '1');
INSERT INTO `log` VALUES (1492406717538119681, '查询-日志', '2022-02-12 15:54:24', '2022-02-12 15:54:24', '0', '1');
INSERT INTO `log` VALUES (1492406749519687681, '查询-Swagger文档接口', '2022-02-12 15:54:31', '2022-02-12 15:54:31', '0', '1');
INSERT INTO `log` VALUES (1492406786379231233, '查询-数据库接口', '2022-02-12 15:54:40', '2022-02-12 15:54:40', '0', '1');
INSERT INTO `log` VALUES (1492406787742380033, '查询-数据库接口', '2022-02-12 15:54:40', '2022-02-12 15:54:40', '0', '1');
INSERT INTO `log` VALUES (1492406813176639490, '查询-数据接口文档', '2022-02-12 15:54:47', '2022-02-12 15:54:47', '0', '1');
INSERT INTO `log` VALUES (1492406995779858434, '管理员登录', '2022-02-12 15:55:30', '2022-02-12 15:55:30', '0', '1');
INSERT INTO `log` VALUES (1492407045364920322, '查询-用户信息', '2022-02-12 15:55:42', '2022-02-12 15:55:42', '0', '1');
INSERT INTO `log` VALUES (1492407091141554178, '查询-日志', '2022-02-12 15:55:53', '2022-02-12 15:55:53', '0', '1');
INSERT INTO `log` VALUES (1492407127866880002, '查询-Swagger文档接口', '2022-02-12 15:56:02', '2022-02-12 15:56:02', '0', '1');
INSERT INTO `log` VALUES (1493108418100342786, '管理员登录', '2022-02-14 14:22:42', '2022-02-14 14:22:42', '0', '1');
INSERT INTO `log` VALUES (1493108429399797762, '查询-用户信息', '2022-02-14 14:22:45', '2022-02-14 14:22:45', '0', '1');
INSERT INTO `log` VALUES (1493108468591374337, '查询-日志', '2022-02-14 14:22:54', '2022-02-14 14:22:54', '0', '1');
INSERT INTO `log` VALUES (1493108495086792706, '查询-日志', '2022-02-14 14:23:01', '2022-02-14 14:23:01', '0', '1');
INSERT INTO `log` VALUES (1493108531191361538, '查询-Swagger文档接口', '2022-02-14 14:23:09', '2022-02-14 14:23:09', '0', '1');
INSERT INTO `log` VALUES (1493108553970626562, '查询-数据库接口', '2022-02-14 14:23:15', '2022-02-14 14:23:15', '0', '1');
INSERT INTO `log` VALUES (1493108554733989890, '查询-数据库接口', '2022-02-14 14:23:15', '2022-02-14 14:23:15', '0', '1');
INSERT INTO `log` VALUES (1493108564590604289, '查询-数据接口文档', '2022-02-14 14:23:17', '2022-02-14 14:23:17', '0', '1');
INSERT INTO `log` VALUES (1496421164545552386, '管理员登录', '2022-02-23 17:46:22', '2022-02-23 17:46:22', '0', '1');
INSERT INTO `log` VALUES (1496421203187675138, '查询-Swagger文档接口', '2022-02-23 17:46:32', '2022-02-23 17:46:32', '0', '1');
INSERT INTO `log` VALUES (1496421212180262914, '查询-数据接口文档', '2022-02-23 17:46:34', '2022-02-23 17:46:34', '0', '1');
INSERT INTO `log` VALUES (1496421249895444481, '查询-数据库接口', '2022-02-23 17:46:43', '2022-02-23 17:46:43', '0', '1');
INSERT INTO `log` VALUES (1496421250751082498, '查询-数据库接口', '2022-02-23 17:46:43', '2022-02-23 17:46:43', '0', '1');
INSERT INTO `log` VALUES (1496421268736258049, '查询-日志', '2022-02-23 17:46:47', '2022-02-23 17:46:47', '0', '1');
INSERT INTO `log` VALUES (1496421301753819138, '查询-用户信息', '2022-02-23 17:46:55', '2022-02-23 17:46:55', '0', '1');
INSERT INTO `log` VALUES (1496428792554254338, '管理员登录', '2022-02-23 18:16:41', '2022-02-23 18:16:41', '0', '1');
INSERT INTO `log` VALUES (1496428801626533889, '查询-用户信息', '2022-02-23 18:16:43', '2022-02-23 18:16:43', '0', '1');
INSERT INTO `log` VALUES (1496428946044809217, '查询-教师列表', '2022-02-23 18:17:18', '2022-02-23 18:17:18', '0', '1');
INSERT INTO `log` VALUES (1496428952957022210, '查询-用户信息', '2022-02-23 18:17:19', '2022-02-23 18:17:19', '0', '1');
INSERT INTO `log` VALUES (1496428975300079618, '查询-教师列表', '2022-02-23 18:17:25', '2022-02-23 18:17:25', '0', '1');
INSERT INTO `log` VALUES (1496429047882510337, '查询-教师列表', '2022-02-23 18:17:42', '2022-02-23 18:17:42', '0', '1');
INSERT INTO `log` VALUES (1496429061736296450, '查询-教师列表', '2022-02-23 18:17:45', '2022-02-23 18:17:45', '0', '1');
INSERT INTO `log` VALUES (1496429206666276866, '查询-教师列表', '2022-02-23 18:18:20', '2022-02-23 18:18:20', '0', '1');
INSERT INTO `log` VALUES (1496429217542107138, '查询-教师列表', '2022-02-23 18:18:22', '2022-02-23 18:18:22', '0', '1');
INSERT INTO `log` VALUES (1496429475659575298, '查询-教师列表', '2022-02-23 18:19:24', '2022-02-23 18:19:24', '0', '1');
INSERT INTO `log` VALUES (1496429487139385346, '查询-教师列表', '2022-02-23 18:19:27', '2022-02-23 18:19:27', '0', '1');
INSERT INTO `log` VALUES (1496429507116855297, '查询-教师列表', '2022-02-23 18:19:31', '2022-02-23 18:19:31', '0', '1');
INSERT INTO `log` VALUES (1496429682312933378, '查询-教师列表', '2022-02-23 18:20:13', '2022-02-23 18:20:13', '0', '1');
INSERT INTO `log` VALUES (1496429881827586049, '查询-教师列表', '2022-02-23 18:21:01', '2022-02-23 18:21:01', '0', '1');
INSERT INTO `log` VALUES (1496429882293153794, '查询-教师列表', '2022-02-23 18:21:01', '2022-02-23 18:21:01', '0', '1');
INSERT INTO `log` VALUES (1496430007958695937, '查询-教师列表', '2022-02-23 18:21:31', '2022-02-23 18:21:31', '0', '1');
INSERT INTO `log` VALUES (1496430039264980993, '查询-教师列表', '2022-02-23 18:21:38', '2022-02-23 18:21:38', '0', '1');
INSERT INTO `log` VALUES (1496430209272705026, '查询-教师列表', '2022-02-23 18:22:19', '2022-02-23 18:22:19', '0', '1');
INSERT INTO `log` VALUES (1496430213118881794, '查询-教师列表', '2022-02-23 18:22:20', '2022-02-23 18:22:20', '0', '1');
INSERT INTO `log` VALUES (1496430228293873665, '查询-教师列表', '2022-02-23 18:22:23', '2022-02-23 18:22:23', '0', '1');
INSERT INTO `log` VALUES (1496430233142489090, '查询-教师列表', '2022-02-23 18:22:25', '2022-02-23 18:22:25', '0', '1');
INSERT INTO `log` VALUES (1496430425224835074, '查询-教师列表', '2022-02-23 18:23:10', '2022-02-23 18:23:10', '0', '1');
INSERT INTO `log` VALUES (1496430548478652418, '查询-教师列表', '2022-02-23 18:23:40', '2022-02-23 18:23:40', '0', '1');
INSERT INTO `log` VALUES (1496431379710013442, '查询-教师列表', '2022-02-23 18:26:58', '2022-02-23 18:26:58', '0', '1');
INSERT INTO `log` VALUES (1496731149313794050, '管理员登录', '2022-02-24 14:18:09', '2022-02-24 14:18:09', '0', '1');
INSERT INTO `log` VALUES (1496731156439916546, '查询-用户信息', '2022-02-24 14:18:10', '2022-02-24 14:18:10', '0', '1');
INSERT INTO `log` VALUES (1496731179575697409, '查询-教师列表', '2022-02-24 14:18:16', '2022-02-24 14:18:16', '0', '1');
INSERT INTO `log` VALUES (1496731335775772673, '查询-教师列表', '2022-02-24 14:18:53', '2022-02-24 14:18:53', '0', '1');
INSERT INTO `log` VALUES (1496731801599369217, '查询-教师列表', '2022-02-24 14:20:44', '2022-02-24 14:20:44', '0', '1');
INSERT INTO `log` VALUES (1496731830686867458, '查询-教师列表', '2022-02-24 14:20:51', '2022-02-24 14:20:51', '0', '1');
INSERT INTO `log` VALUES (1496732086589743106, '查询-教师列表', '2022-02-24 14:21:52', '2022-02-24 14:21:52', '0', '1');
INSERT INTO `log` VALUES (1496732120160952322, '查询-教师列表', '2022-02-24 14:22:00', '2022-02-24 14:22:00', '0', '1');
INSERT INTO `log` VALUES (1496732245998460929, '查询-教师列表', '2022-02-24 14:22:30', '2022-02-24 14:22:30', '0', '1');
INSERT INTO `log` VALUES (1496732599909629953, '管理员登录', '2022-02-24 14:23:54', '2022-02-24 14:23:54', '0', '1');
INSERT INTO `log` VALUES (1496732609665581057, '查询-用户信息', '2022-02-24 14:23:57', '2022-02-24 14:23:57', '0', '1');
INSERT INTO `log` VALUES (1496732652598476801, '查询-教师列表', '2022-02-24 14:24:07', '2022-02-24 14:24:07', '0', '1');
INSERT INTO `log` VALUES (1496739550836088833, '管理员登录', '2022-02-24 14:51:32', '2022-02-24 14:51:32', '0', '1');
INSERT INTO `log` VALUES (1496739582075265026, '查询-教师列表', '2022-02-24 14:51:39', '2022-02-24 14:51:39', '0', '1');
INSERT INTO `log` VALUES (1496745970646200321, '查询-教师列表', '2022-02-24 15:17:02', '2022-02-24 15:17:02', '0', '1');
INSERT INTO `log` VALUES (1496746136845496321, '查询-教师列表', '2022-02-24 15:17:42', '2022-02-24 15:17:42', '0', '1');
INSERT INTO `log` VALUES (1496746299643211778, '查询-教师列表', '2022-02-24 15:18:21', '2022-02-24 15:18:21', '0', '1');
INSERT INTO `log` VALUES (1496746731706855425, '查询-教师列表', '2022-02-24 15:20:04', '2022-02-24 15:20:04', '0', '1');
INSERT INTO `log` VALUES (1496746785922428930, '查询-教师列表', '2022-02-24 15:20:17', '2022-02-24 15:20:17', '0', '1');
INSERT INTO `log` VALUES (1496746965958733826, '查询-教师列表', '2022-02-24 15:21:00', '2022-02-24 15:21:00', '0', '1');
INSERT INTO `log` VALUES (1496747267218812929, '查询-教师列表', '2022-02-24 15:22:11', '2022-02-24 15:22:11', '0', '1');
INSERT INTO `log` VALUES (1496747386303492098, '查询-教师列表', '2022-02-24 15:22:40', '2022-02-24 15:22:40', '0', '1');
INSERT INTO `log` VALUES (1496747846238285826, '查询-教师列表', '2022-02-24 15:24:29', '2022-02-24 15:24:29', '0', '1');
INSERT INTO `log` VALUES (1496748156981686274, '查询-教师列表', '2022-02-24 15:25:44', '2022-02-24 15:25:44', '0', '1');
INSERT INTO `log` VALUES (1496748198215888898, '查询-教师列表', '2022-02-24 15:25:53', '2022-02-24 15:25:53', '0', '1');
INSERT INTO `log` VALUES (1496749283227807745, '查询-教师列表', '2022-02-24 15:30:12', '2022-02-24 15:30:12', '0', '1');
INSERT INTO `log` VALUES (1496749371303997441, '查询-教师列表', '2022-02-24 15:30:33', '2022-02-24 15:30:33', '0', '1');
INSERT INTO `log` VALUES (1496749391914807298, '查询-教师列表', '2022-02-24 15:30:38', '2022-02-24 15:30:38', '0', '1');
INSERT INTO `log` VALUES (1496749512014508034, '查询-教师列表', '2022-02-24 15:31:07', '2022-02-24 15:31:07', '0', '1');
INSERT INTO `log` VALUES (1496749695423033346, '管理员登录', '2022-02-24 15:31:50', '2022-02-24 15:31:50', '0', '1');
INSERT INTO `log` VALUES (1496750103205851138, '查询-教师列表', '2022-02-24 15:33:28', '2022-02-24 15:33:28', '0', '1');
INSERT INTO `log` VALUES (1496750206700302338, '管理员登录', '2022-02-24 15:33:52', '2022-02-24 15:33:52', '0', '1');
INSERT INTO `log` VALUES (1496750212425527297, '查询-教师列表', '2022-02-24 15:33:54', '2022-02-24 15:33:54', '0', '1');
INSERT INTO `log` VALUES (1496750322093993985, '查询-教师列表', '2022-02-24 15:34:20', '2022-02-24 15:34:20', '0', '1');
INSERT INTO `log` VALUES (1496750347893157890, '查询-教师列表', '2022-02-24 15:34:26', '2022-02-24 15:34:26', '0', '1');
INSERT INTO `log` VALUES (1496750503732523010, '查询-教师列表', '2022-02-24 15:35:03', '2022-02-24 15:35:03', '0', '1');
INSERT INTO `log` VALUES (1496750889742708738, '查询-教师列表', '2022-02-24 15:36:35', '2022-02-24 15:36:35', '0', '1');
INSERT INTO `log` VALUES (1496750931446673410, '查询-教师列表', '2022-02-24 15:36:45', '2022-02-24 15:36:45', '0', '1');
INSERT INTO `log` VALUES (1496751802003828737, '查询-教师列表', '2022-02-24 15:40:13', '2022-02-24 15:40:13', '0', '1');
INSERT INTO `log` VALUES (1496751924011937793, '查询-教师列表', '2022-02-24 15:40:42', '2022-02-24 15:40:42', '0', '1');
INSERT INTO `log` VALUES (1496752219345465345, '查询-教师列表', '2022-02-24 15:41:52', '2022-02-24 15:41:52', '0', '1');
INSERT INTO `log` VALUES (1496752299418923010, '查询-教师列表', '2022-02-24 15:42:11', '2022-02-24 15:42:11', '0', '1');
INSERT INTO `log` VALUES (1496752320839233538, '查询-教师列表', '2022-02-24 15:42:16', '2022-02-24 15:42:16', '0', '1');
INSERT INTO `log` VALUES (1496752487214690305, '查询-教师列表', '2022-02-24 15:42:56', '2022-02-24 15:42:56', '0', '1');
INSERT INTO `log` VALUES (1496752688570642433, '查询-教师列表', '2022-02-24 15:43:44', '2022-02-24 15:43:44', '0', '1');
INSERT INTO `log` VALUES (1496752847060807681, '查询-教师列表', '2022-02-24 15:44:22', '2022-02-24 15:44:22', '0', '1');
INSERT INTO `log` VALUES (1496753007480352769, '查询-教师列表', '2022-02-24 15:45:00', '2022-02-24 15:45:00', '0', '1');
INSERT INTO `log` VALUES (1496753413153435650, '查询-教师列表', '2022-02-24 15:46:37', '2022-02-24 15:46:37', '0', '1');
INSERT INTO `log` VALUES (1496753565058543617, '查询-教师列表', '2022-02-24 15:47:13', '2022-02-24 15:47:13', '0', '1');
INSERT INTO `log` VALUES (1496753577616289794, '查询-教师列表', '2022-02-24 15:47:16', '2022-02-24 15:47:16', '0', '1');
INSERT INTO `log` VALUES (1496754123953745922, '查询-教师列表', '2022-02-24 15:49:26', '2022-02-24 15:49:26', '0', '1');
INSERT INTO `log` VALUES (1496754127946723329, '查询-教师列表', '2022-02-24 15:49:27', '2022-02-24 15:49:27', '0', '1');
INSERT INTO `log` VALUES (1496754339369005058, '查询-教师列表', '2022-02-24 15:50:18', '2022-02-24 15:50:18', '0', '1');
INSERT INTO `log` VALUES (1496754457300250625, '查询-教师列表', '2022-02-24 15:50:46', '2022-02-24 15:50:46', '0', '1');
INSERT INTO `log` VALUES (1496754817653878785, '查询-教师列表', '2022-02-24 15:52:12', '2022-02-24 15:52:12', '0', '1');
INSERT INTO `log` VALUES (1496755002094202881, '查询-教师列表', '2022-02-24 15:52:56', '2022-02-24 15:52:56', '0', '1');
INSERT INTO `log` VALUES (1496755137431810050, '查询-教师列表', '2022-02-24 15:53:28', '2022-02-24 15:53:28', '0', '1');
INSERT INTO `log` VALUES (1496755222601347074, '查询-教师列表', '2022-02-24 15:53:48', '2022-02-24 15:53:48', '0', '1');
INSERT INTO `log` VALUES (1496755288279953409, '查询-教师列表', '2022-02-24 15:54:04', '2022-02-24 15:54:04', '0', '1');
INSERT INTO `log` VALUES (1496755366180761602, '查询-教师列表', '2022-02-24 15:54:22', '2022-02-24 15:54:22', '0', '1');
INSERT INTO `log` VALUES (1496755667239514114, '查询-教师列表', '2022-02-24 15:55:34', '2022-02-24 15:55:34', '0', '1');
INSERT INTO `log` VALUES (1496755710898024450, '查询-教师列表', '2022-02-24 15:55:45', '2022-02-24 15:55:45', '0', '1');
INSERT INTO `log` VALUES (1496755829995286529, '查询-教师列表', '2022-02-24 15:56:13', '2022-02-24 15:56:13', '0', '1');
INSERT INTO `log` VALUES (1496755977269882882, '查询-教师列表', '2022-02-24 15:56:48', '2022-02-24 15:56:48', '0', '1');
INSERT INTO `log` VALUES (1496757083517562882, '查询-教师列表', '2022-02-24 16:01:12', '2022-02-24 16:01:12', '0', '1');
INSERT INTO `log` VALUES (1496757161456119809, '查询-教师列表', '2022-02-24 16:01:30', '2022-02-24 16:01:30', '0', '1');
INSERT INTO `log` VALUES (1496757263377707009, '查询-教师列表', '2022-02-24 16:01:55', '2022-02-24 16:01:55', '0', '1');
INSERT INTO `log` VALUES (1496757383590653954, '查询-教师列表', '2022-02-24 16:02:23', '2022-02-24 16:02:23', '0', '1');
INSERT INTO `log` VALUES (1496757457708199937, '查询-教师列表', '2022-02-24 16:02:41', '2022-02-24 16:02:41', '0', '1');
INSERT INTO `log` VALUES (1496758127970562049, '查询-教师列表', '2022-02-24 16:05:21', '2022-02-24 16:05:21', '0', '1');
INSERT INTO `log` VALUES (1496758383290429442, '查询-教师列表', '2022-02-24 16:06:22', '2022-02-24 16:06:22', '0', '1');
INSERT INTO `log` VALUES (1496758395084812289, '查询-教师列表', '2022-02-24 16:06:24', '2022-02-24 16:06:24', '0', '1');
INSERT INTO `log` VALUES (1496758477871984641, '查询-教师列表', '2022-02-24 16:06:44', '2022-02-24 16:06:44', '0', '1');
INSERT INTO `log` VALUES (1496758481437143042, '查询-教师列表', '2022-02-24 16:06:45', '2022-02-24 16:06:45', '0', '1');
INSERT INTO `log` VALUES (1496759636657516546, '查询-教师列表', '2022-02-24 16:11:20', '2022-02-24 16:11:20', '0', '1');
INSERT INTO `log` VALUES (1496759648791638017, '查询-教师列表', '2022-02-24 16:11:23', '2022-02-24 16:11:23', '0', '1');
INSERT INTO `log` VALUES (1496759659046711297, '查询-教师列表', '2022-02-24 16:11:26', '2022-02-24 16:11:26', '0', '1');
INSERT INTO `log` VALUES (1496759762239172609, '查询-教师列表', '2022-02-24 16:11:50', '2022-02-24 16:11:50', '0', '1');
INSERT INTO `log` VALUES (1496759902949683201, '查询-教师列表', '2022-02-24 16:12:24', '2022-02-24 16:12:24', '0', '1');
INSERT INTO `log` VALUES (1496760142712877057, '查询-教师列表', '2022-02-24 16:13:21', '2022-02-24 16:13:21', '0', '1');
INSERT INTO `log` VALUES (1496760306152321025, '查询-教师列表', '2022-02-24 16:14:00', '2022-02-24 16:14:00', '0', '1');
INSERT INTO `log` VALUES (1496762302330646529, '查询-教师列表', '2022-02-24 16:21:56', '2022-02-24 16:21:56', '0', '1');
INSERT INTO `log` VALUES (1496762359457067009, '查询-教师列表', '2022-02-24 16:22:10', '2022-02-24 16:22:10', '0', '1');
INSERT INTO `log` VALUES (1496762411944587265, '查询-教师列表', '2022-02-24 16:22:22', '2022-02-24 16:22:22', '0', '1');
INSERT INTO `log` VALUES (1496771744338096129, '管理员登录', '2022-02-24 16:59:27', '2022-02-24 16:59:27', '0', '1');
INSERT INTO `log` VALUES (1496771748679200769, '查询-教师列表', '2022-02-24 16:59:28', '2022-02-24 16:59:28', '0', '1');
INSERT INTO `log` VALUES (1496772104406511617, '查询-教师列表', '2022-02-24 17:00:53', '2022-02-24 17:00:53', '0', '1');
INSERT INTO `log` VALUES (1496772150535467009, '查询-教师列表', '2022-02-24 17:01:04', '2022-02-24 17:01:04', '0', '1');
INSERT INTO `log` VALUES (1496772180096921602, '查询-教师列表', '2022-02-24 17:01:11', '2022-02-24 17:01:11', '0', '1');
INSERT INTO `log` VALUES (1496772293125025794, '查询-教师列表', '2022-02-24 17:01:38', '2022-02-24 17:01:38', '0', '1');
INSERT INTO `log` VALUES (1496772368614109186, '查询-教师列表', '2022-02-24 17:01:56', '2022-02-24 17:01:56', '0', '1');
INSERT INTO `log` VALUES (1496772813269053442, '查询-教师列表', '2022-02-24 17:03:42', '2022-02-24 17:03:42', '0', '1');
INSERT INTO `log` VALUES (1496773547586826242, '查询-教师列表', '2022-02-24 17:06:37', '2022-02-24 17:06:37', '0', '1');
INSERT INTO `log` VALUES (1496773870170746881, '查询-教师列表', '2022-02-24 17:07:54', '2022-02-24 17:07:54', '0', '1');
INSERT INTO `log` VALUES (1496774061959491586, '查询-教师列表', '2022-02-24 17:08:40', '2022-02-24 17:08:40', '0', '1');
INSERT INTO `log` VALUES (1496774072474611714, '查询-教师列表', '2022-02-24 17:08:42', '2022-02-24 17:08:42', '0', '1');
INSERT INTO `log` VALUES (1496774189114011650, '查询-教师列表', '2022-02-24 17:09:10', '2022-02-24 17:09:10', '0', '1');
INSERT INTO `log` VALUES (1496774359570526210, '查询-教师列表', '2022-02-24 17:09:51', '2022-02-24 17:09:51', '0', '1');
INSERT INTO `log` VALUES (1496774400037171201, '查询-教师列表', '2022-02-24 17:10:00', '2022-02-24 17:10:00', '0', '1');
INSERT INTO `log` VALUES (1496774442433196034, '查询-教师列表', '2022-02-24 17:10:10', '2022-02-24 17:10:10', '0', '1');
INSERT INTO `log` VALUES (1496775308796047362, '查询-教师列表', '2022-02-24 17:13:37', '2022-02-24 17:13:37', '0', '1');
INSERT INTO `log` VALUES (1496775430506360833, '查询-教师列表', '2022-02-24 17:14:06', '2022-02-24 17:14:06', '0', '1');
INSERT INTO `log` VALUES (1496775526413316098, '查询-教师列表', '2022-02-24 17:14:29', '2022-02-24 17:14:29', '0', '1');
INSERT INTO `log` VALUES (1496775610588803074, '查询-教师列表', '2022-02-24 17:14:49', '2022-02-24 17:14:49', '0', '1');
INSERT INTO `log` VALUES (1496775622538375170, '查询-教师列表', '2022-02-24 17:14:52', '2022-02-24 17:14:52', '0', '1');
INSERT INTO `log` VALUES (1496775961341669377, '查询-教师列表', '2022-02-24 17:16:13', '2022-02-24 17:16:13', '0', '1');
INSERT INTO `log` VALUES (1496776415123410946, '查询-教师列表', '2022-02-24 17:18:01', '2022-02-24 17:18:01', '0', '1');
INSERT INTO `log` VALUES (1496779862044381185, '查询-教师列表', '2022-02-24 17:31:43', '2022-02-24 17:31:43', '0', '1');
INSERT INTO `log` VALUES (1496780551730565121, '查询-教师列表', '2022-02-24 17:34:27', '2022-02-24 17:34:27', '0', '1');
INSERT INTO `log` VALUES (1496782032324071426, '查询-日志', '2022-02-24 17:40:20', '2022-02-24 17:40:20', '0', '1');
INSERT INTO `log` VALUES (1496782956790616065, '查询-教师列表', '2022-02-24 17:44:00', '2022-02-24 17:44:00', '0', '1');
INSERT INTO `log` VALUES (1496783053960056833, '查询-教师列表', '2022-02-24 17:44:24', '2022-02-24 17:44:24', '0', '1');
INSERT INTO `log` VALUES (1496783692811276290, '查询-教师列表', '2022-02-24 17:46:56', '2022-02-24 17:46:56', '0', '1');
INSERT INTO `log` VALUES (1496784628568887298, '查询-教师列表', '2022-02-24 17:50:39', '2022-02-24 17:50:39', '0', '1');
INSERT INTO `log` VALUES (1496784914658168834, '查询-教师列表', '2022-02-24 17:51:47', '2022-02-24 17:51:47', '0', '1');
INSERT INTO `log` VALUES (1496785055372873730, '查询-教师列表', '2022-02-24 17:52:21', '2022-02-24 17:52:21', '0', '1');
INSERT INTO `log` VALUES (1496785622610546690, '查询-教师列表', '2022-02-24 17:54:36', '2022-02-24 17:54:36', '0', '1');
INSERT INTO `log` VALUES (1496786435080785921, '查询-教师列表', '2022-02-24 17:57:50', '2022-02-24 17:57:50', '0', '1');
INSERT INTO `log` VALUES (1496786807589507073, '查询-教师列表', '2022-02-24 17:59:19', '2022-02-24 17:59:19', '0', '1');
INSERT INTO `log` VALUES (1496786887478415361, '查询-教师列表', '2022-02-24 17:59:38', '2022-02-24 17:59:38', '0', '1');
INSERT INTO `log` VALUES (1496786976355717122, '查询-教师列表', '2022-02-24 17:59:59', '2022-02-24 17:59:59', '0', '1');
INSERT INTO `log` VALUES (1496787001869668354, '查询-教师列表', '2022-02-24 18:00:05', '2022-02-24 18:00:05', '0', '1');
INSERT INTO `log` VALUES (1496787006152052737, '查询-教师列表', '2022-02-24 18:00:06', '2022-02-24 18:00:06', '0', '1');
INSERT INTO `log` VALUES (1496787007267737602, '查询-教师列表', '2022-02-24 18:00:06', '2022-02-24 18:00:06', '0', '1');
INSERT INTO `log` VALUES (1496787010237304833, '查询-教师列表', '2022-02-24 18:00:07', '2022-02-24 18:00:07', '0', '1');
INSERT INTO `log` VALUES (1496787020341383170, '查询-教师列表', '2022-02-24 18:00:09', '2022-02-24 18:00:09', '0', '1');
INSERT INTO `log` VALUES (1496787021578702849, '查询-教师列表', '2022-02-24 18:00:10', '2022-02-24 18:00:10', '0', '1');
INSERT INTO `log` VALUES (1496791862149390337, '查询-学生列表', '2022-02-24 18:19:24', '2022-02-24 18:19:24', '0', '1');
INSERT INTO `log` VALUES (1496792060984565762, '查询-学生列表', '2022-02-24 18:20:11', '2022-02-24 18:20:11', '0', '1');
INSERT INTO `log` VALUES (1496792148486135809, '查询-学生列表', '2022-02-24 18:20:32', '2022-02-24 18:20:32', '0', '1');
INSERT INTO `log` VALUES (1496792368246693889, '查询-学生列表', '2022-02-24 18:21:24', '2022-02-24 18:21:24', '0', '1');
INSERT INTO `log` VALUES (1496792614490087425, '查询-学生列表', '2022-02-24 18:22:23', '2022-02-24 18:22:23', '0', '1');
INSERT INTO `log` VALUES (1496792983643365377, '查询-学生列表', '2022-02-24 18:23:51', '2022-02-24 18:23:51', '0', '1');
INSERT INTO `log` VALUES (1496793000353472514, '查询-学生列表', '2022-02-24 18:23:55', '2022-02-24 18:23:55', '0', '1');
INSERT INTO `log` VALUES (1496793045912002561, '查询-日志', '2022-02-24 18:24:06', '2022-02-24 18:24:06', '0', '1');
INSERT INTO `log` VALUES (1496793207753416706, '查询-日志', '2022-02-24 18:24:45', '2022-02-24 18:24:45', '0', '1');
INSERT INTO `log` VALUES (1496793235926556673, '查询-用户信息', '2022-02-24 18:24:51', '2022-02-24 18:24:51', '0', '1');
INSERT INTO `log` VALUES (1496793241035218945, '查询-教师列表', '2022-02-24 18:24:52', '2022-02-24 18:24:52', '0', '1');
INSERT INTO `log` VALUES (1496793272257617922, '查询-学生列表', '2022-02-24 18:25:00', '2022-02-24 18:25:00', '0', '1');
INSERT INTO `log` VALUES (1496793281841602561, '查询-学生列表', '2022-02-24 18:25:02', '2022-02-24 18:25:02', '0', '1');
INSERT INTO `log` VALUES (1496793285742305281, '查询-教师列表', '2022-02-24 18:25:03', '2022-02-24 18:25:03', '0', '1');
INSERT INTO `log` VALUES (1496793641763217410, '查询-教师列表', '2022-02-24 18:26:28', '2022-02-24 18:26:28', '0', '1');
INSERT INTO `log` VALUES (1496793649757560834, '查询-学生列表', '2022-02-24 18:26:30', '2022-02-24 18:26:30', '0', '1');
INSERT INTO `log` VALUES (1496793659068915713, '查询-学生列表', '2022-02-24 18:26:32', '2022-02-24 18:26:32', '0', '1');
INSERT INTO `log` VALUES (1496793660113297410, '查询-教师列表', '2022-02-24 18:26:32', '2022-02-24 18:26:32', '0', '1');
INSERT INTO `log` VALUES (1496793746998304769, '查询-教师列表', '2022-02-24 18:26:53', '2022-02-24 18:26:53', '0', '1');
INSERT INTO `log` VALUES (1496794078415429633, '查询-教师列表', '2022-02-24 18:28:12', '2022-02-24 18:28:12', '0', '1');
INSERT INTO `log` VALUES (1496794546281652226, '查询-学生列表', '2022-02-24 18:30:04', '2022-02-24 18:30:04', '0', '1');
INSERT INTO `log` VALUES (1496835361943101441, '管理员登录', '2022-02-24 21:12:15', '2022-02-24 21:12:15', '0', '1');
INSERT INTO `log` VALUES (1496849658479992834, '查询-组织列表', '2022-02-24 22:09:03', '2022-02-24 22:09:03', '0', '1');
INSERT INTO `log` VALUES (1496849812612276226, '查询-组织列表', '2022-02-24 22:09:40', '2022-02-24 22:09:40', '0', '1');
INSERT INTO `log` VALUES (1496849825182605313, '查询-组织列表', '2022-02-24 22:09:43', '2022-02-24 22:09:43', '0', '1');
INSERT INTO `log` VALUES (1496850003243393026, '查询-组织列表', '2022-02-24 22:10:26', '2022-02-24 22:10:26', '0', '1');
INSERT INTO `log` VALUES (1496850280226766850, '查询-组织列表', '2022-02-24 22:11:32', '2022-02-24 22:11:32', '0', '1');
INSERT INTO `log` VALUES (1496850487425478657, '查询-组织列表', '2022-02-24 22:12:21', '2022-02-24 22:12:21', '0', '1');
INSERT INTO `log` VALUES (1496850727553576961, '查询-组织列表', '2022-02-24 22:13:18', '2022-02-24 22:13:18', '0', '1');
INSERT INTO `log` VALUES (1496851050842140673, '查询-组织列表', '2022-02-24 22:14:35', '2022-02-24 22:14:35', '0', '1');
INSERT INTO `log` VALUES (1496851135042715649, '查询-组织列表', '2022-02-24 22:14:55', '2022-02-24 22:14:55', '0', '1');
INSERT INTO `log` VALUES (1496852144548773889, '查询-组织列表', '2022-02-24 22:18:56', '2022-02-24 22:18:56', '0', '1');
INSERT INTO `log` VALUES (1496852202371448834, '查询-用户信息', '2022-02-24 22:19:10', '2022-02-24 22:19:10', '0', '1');
INSERT INTO `log` VALUES (1496852212257423362, '查询-教师列表', '2022-02-24 22:19:12', '2022-02-24 22:19:12', '0', '1');
INSERT INTO `log` VALUES (1496852222202118146, '查询-学生列表', '2022-02-24 22:19:15', '2022-02-24 22:19:15', '0', '1');
INSERT INTO `log` VALUES (1496852241923735553, '查询-组织列表', '2022-02-24 22:19:19', '2022-02-24 22:19:19', '0', '1');
INSERT INTO `log` VALUES (1496852251256061954, '查询-组织列表', '2022-02-24 22:19:22', '2022-02-24 22:19:22', '0', '1');
INSERT INTO `log` VALUES (1496852403828064258, '查询-组织列表', '2022-02-24 22:19:58', '2022-02-24 22:19:58', '0', '1');
INSERT INTO `log` VALUES (1496852404943749122, '查询-学生列表', '2022-02-24 22:19:58', '2022-02-24 22:19:58', '0', '1');
INSERT INTO `log` VALUES (1496852408202723330, '查询-组织列表', '2022-02-24 22:19:59', '2022-02-24 22:19:59', '0', '1');
INSERT INTO `log` VALUES (1496853040737320962, '查询-组织列表', '2022-02-24 22:22:30', '2022-02-24 22:22:30', '0', '1');
INSERT INTO `log` VALUES (1496853043602030594, '查询-教师列表', '2022-02-24 22:22:30', '2022-02-24 22:22:30', '0', '1');
INSERT INTO `log` VALUES (1496853050698792962, '查询-学生列表', '2022-02-24 22:22:32', '2022-02-24 22:22:32', '0', '1');
INSERT INTO `log` VALUES (1496853051940306946, '查询-教师列表', '2022-02-24 22:22:32', '2022-02-24 22:22:32', '0', '1');
INSERT INTO `log` VALUES (1496853056516292610, '查询-学生列表', '2022-02-24 22:22:34', '2022-02-24 22:22:34', '0', '1');
INSERT INTO `log` VALUES (1496853057489371138, '查询-教师列表', '2022-02-24 22:22:34', '2022-02-24 22:22:34', '0', '1');
INSERT INTO `log` VALUES (1496853057879441409, '查询-学生列表', '2022-02-24 22:22:34', '2022-02-24 22:22:34', '0', '1');
INSERT INTO `log` VALUES (1496853060429578242, '查询-教师列表', '2022-02-24 22:22:34', '2022-02-24 22:22:34', '0', '1');
INSERT INTO `log` VALUES (1496853061545263106, '查询-学生列表', '2022-02-24 22:22:35', '2022-02-24 22:22:35', '0', '1');
INSERT INTO `log` VALUES (1496853062321209346, '查询-教师列表', '2022-02-24 22:22:35', '2022-02-24 22:22:35', '0', '1');
INSERT INTO `log` VALUES (1496853065253027841, '查询-学生列表', '2022-02-24 22:22:36', '2022-02-24 22:22:36', '0', '1');
INSERT INTO `log` VALUES (1496853066377101314, '查询-教师列表', '2022-02-24 22:22:36', '2022-02-24 22:22:36', '0', '1');
INSERT INTO `log` VALUES (1496853067018829826, '查询-组织列表', '2022-02-24 22:22:36', '2022-02-24 22:22:36', '0', '1');
INSERT INTO `log` VALUES (1496853069824819201, '查询-教师列表', '2022-02-24 22:22:37', '2022-02-24 22:22:37', '0', '1');
INSERT INTO `log` VALUES (1496853072467230721, '查询-学生列表', '2022-02-24 22:22:37', '2022-02-24 22:22:37', '0', '1');
INSERT INTO `log` VALUES (1496853075260637186, '查询-教师列表', '2022-02-24 22:22:38', '2022-02-24 22:22:38', '0', '1');
INSERT INTO `log` VALUES (1496853076237910017, '查询-学生列表', '2022-02-24 22:22:38', '2022-02-24 22:22:38', '0', '1');
INSERT INTO `log` VALUES (1496853076305018881, '查询-教师列表', '2022-02-24 22:22:38', '2022-02-24 22:22:38', '0', '1');
INSERT INTO `log` VALUES (1496853077877882881, '查询-学生列表', '2022-02-24 22:22:39', '2022-02-24 22:22:39', '0', '1');
INSERT INTO `log` VALUES (1496853080822284289, '查询-教师列表', '2022-02-24 22:22:39', '2022-02-24 22:22:39', '0', '1');
INSERT INTO `log` VALUES (1496853081929580546, '查询-学生列表', '2022-02-24 22:22:40', '2022-02-24 22:22:40', '0', '1');
INSERT INTO `log` VALUES (1496853082395148289, '查询-教师列表', '2022-02-24 22:22:40', '2022-02-24 22:22:40', '0', '1');
INSERT INTO `log` VALUES (1496853086786584577, '查询-学生列表', '2022-02-24 22:22:41', '2022-02-24 22:22:41', '0', '1');
INSERT INTO `log` VALUES (1496853219758604290, '查询-组织列表', '2022-02-24 22:23:12', '2022-02-24 22:23:12', '0', '1');
INSERT INTO `log` VALUES (1496853261307379714, '查询-组织列表', '2022-02-24 22:23:22', '2022-02-24 22:23:22', '0', '1');
INSERT INTO `log` VALUES (1496853262427258881, '查询-学生列表', '2022-02-24 22:23:23', '2022-02-24 22:23:23', '0', '1');
INSERT INTO `log` VALUES (1496853262888632322, '查询-教师列表', '2022-02-24 22:23:23', '2022-02-24 22:23:23', '0', '1');
INSERT INTO `log` VALUES (1496853265690427394, '查询-组织列表', '2022-02-24 22:23:23', '2022-02-24 22:23:23', '0', '1');
INSERT INTO `log` VALUES (1496853271440818177, '查询-日志', '2022-02-24 22:23:25', '2022-02-24 22:23:25', '0', '1');
INSERT INTO `log` VALUES (1496853287907655681, '查询-Swagger文档接口', '2022-02-24 22:23:29', '2022-02-24 22:23:29', '0', '1');
INSERT INTO `log` VALUES (1496853289807675394, '查询-数据接口文档', '2022-02-24 22:23:29', '2022-02-24 22:23:29', '0', '1');
INSERT INTO `log` VALUES (1496853301044215809, '查询-教师列表', '2022-02-24 22:23:32', '2022-02-24 22:23:32', '0', '1');
INSERT INTO `log` VALUES (1496853421345243137, '查询-用户信息', '2022-02-24 22:24:01', '2022-02-24 22:24:01', '0', '1');
INSERT INTO `log` VALUES (1496853595572436993, '查询-学生列表', '2022-02-24 22:24:42', '2022-02-24 22:24:42', '0', '1');
INSERT INTO `log` VALUES (1496853629319806977, '查询-组织列表', '2022-02-24 22:24:50', '2022-02-24 22:24:50', '0', '1');
INSERT INTO `log` VALUES (1496853664086392834, '查询-日志', '2022-02-24 22:24:58', '2022-02-24 22:24:58', '0', '1');
INSERT INTO `log` VALUES (1496853689013141505, '查询-Swagger文档接口', '2022-02-24 22:25:04', '2022-02-24 22:25:04', '0', '1');
INSERT INTO `log` VALUES (1496853707723931650, '查询-数据库接口', '2022-02-24 22:25:09', '2022-02-24 22:25:09', '0', '1');
INSERT INTO `log` VALUES (1496853711129706498, '查询-数据库接口', '2022-02-24 22:25:10', '2022-02-24 22:25:10', '0', '1');
INSERT INTO `log` VALUES (1496853727927894017, '查询-数据接口文档', '2022-02-24 22:25:14', '2022-02-24 22:25:14', '0', '1');
INSERT INTO `log` VALUES (1496853942277799937, '查询-组织列表', '2022-02-24 22:26:05', '2022-02-24 22:26:05', '0', '1');
INSERT INTO `log` VALUES (1496853952599982081, '查询-组织列表', '2022-02-24 22:26:07', '2022-02-24 22:26:07', '0', '1');
INSERT INTO `log` VALUES (1496853955317891074, '查询-学生列表', '2022-02-24 22:26:08', '2022-02-24 22:26:08', '0', '1');
INSERT INTO `log` VALUES (1496853956366467074, '查询-教师列表', '2022-02-24 22:26:08', '2022-02-24 22:26:08', '0', '1');
INSERT INTO `log` VALUES (1496853956634902529, '查询-学生列表', '2022-02-24 22:26:08', '2022-02-24 22:26:08', '0', '1');
INSERT INTO `log` VALUES (1496853959847739393, '查询-组织列表', '2022-02-24 22:26:09', '2022-02-24 22:26:09', '0', '1');
INSERT INTO `log` VALUES (1496853960971812865, '查询-学生列表', '2022-02-24 22:26:09', '2022-02-24 22:26:09', '0', '1');
INSERT INTO `log` VALUES (1496853961428992002, '查询-教师列表', '2022-02-24 22:26:09', '2022-02-24 22:26:09', '0', '1');
INSERT INTO `log` VALUES (1496853963077353473, '查询-组织列表', '2022-02-24 22:26:10', '2022-02-24 22:26:10', '0', '1');
INSERT INTO `log` VALUES (1496853966101446657, '查询-学生列表', '2022-02-24 22:26:10', '2022-02-24 22:26:10', '0', '1');
INSERT INTO `log` VALUES (1496853967212937217, '查询-教师列表', '2022-02-24 22:26:11', '2022-02-24 22:26:11', '0', '1');
INSERT INTO `log` VALUES (1496853969477861377, '查询-学生列表', '2022-02-24 22:26:11', '2022-02-24 22:26:11', '0', '1');
INSERT INTO `log` VALUES (1496853971860226049, '查询-组织列表', '2022-02-24 22:26:12', '2022-02-24 22:26:12', '0', '1');
INSERT INTO `log` VALUES (1496853973261123586, '查询-学生列表', '2022-02-24 22:26:12', '2022-02-24 22:26:12', '0', '1');
INSERT INTO `log` VALUES (1496853992152268802, '查询-教师列表', '2022-02-24 22:26:17', '2022-02-24 22:26:17', '0', '1');
INSERT INTO `log` VALUES (1496854000691871746, '查询-学生列表', '2022-02-24 22:26:19', '2022-02-24 22:26:19', '0', '1');
INSERT INTO `log` VALUES (1496854018614132738, '查询-组织列表', '2022-02-24 22:26:23', '2022-02-24 22:26:23', '0', '1');
INSERT INTO `log` VALUES (1496854073886670849, '查询-组织列表', '2022-02-24 22:26:36', '2022-02-24 22:26:36', '0', '1');
INSERT INTO `log` VALUES (1496854088512208898, '查询-教师列表', '2022-02-24 22:26:40', '2022-02-24 22:26:40', '0', '1');
INSERT INTO `log` VALUES (1496854089615310850, '查询-学生列表', '2022-02-24 22:26:40', '2022-02-24 22:26:40', '0', '1');
INSERT INTO `log` VALUES (1496854091582439426, '查询-教师列表', '2022-02-24 22:26:40', '2022-02-24 22:26:40', '0', '1');
INSERT INTO `log` VALUES (1496854165679013890, '查询-学生列表', '2022-02-24 22:26:58', '2022-02-24 22:26:58', '0', '1');
INSERT INTO `log` VALUES (1496854166811475969, '查询-教师列表', '2022-02-24 22:26:58', '2022-02-24 22:26:58', '0', '1');
INSERT INTO `log` VALUES (1496854168191401986, '查询-学生列表', '2022-02-24 22:26:59', '2022-02-24 22:26:59', '0', '1');
INSERT INTO `log` VALUES (1496854175078449153, '查询-组织列表', '2022-02-24 22:27:00', '2022-02-24 22:27:00', '0', '1');
INSERT INTO `log` VALUES (1496854176194134018, '查询-学生列表', '2022-02-24 22:27:00', '2022-02-24 22:27:00', '0', '1');
INSERT INTO `log` VALUES (1496854177557282817, '查询-教师列表', '2022-02-24 22:27:01', '2022-02-24 22:27:01', '0', '1');
INSERT INTO `log` VALUES (1496854180656873474, '查询-学生列表', '2022-02-24 22:27:02', '2022-02-24 22:27:02', '0', '1');
INSERT INTO `log` VALUES (1496854181629952001, '查询-组织列表', '2022-02-24 22:27:02', '2022-02-24 22:27:02', '0', '1');
INSERT INTO `log` VALUES (1496854191658532866, '查询-日志', '2022-02-24 22:27:04', '2022-02-24 22:27:04', '0', '1');
INSERT INTO `log` VALUES (1496854224156000258, '查询-日志', '2022-02-24 22:27:12', '2022-02-24 22:27:12', '0', '1');
INSERT INTO `log` VALUES (1496854231974182914, '查询-日志', '2022-02-24 22:27:14', '2022-02-24 22:27:14', '0', '1');
INSERT INTO `log` VALUES (1496854637349470209, '查询-日志', '2022-02-24 22:28:50', '2022-02-24 22:28:50', '0', '1');
INSERT INTO `log` VALUES (1496854660992761858, '查询-日志', '2022-02-24 22:28:56', '2022-02-24 22:28:56', '0', '1');
INSERT INTO `log` VALUES (1496854670065041410, '查询-Swagger文档接口', '2022-02-24 22:28:58', '2022-02-24 22:28:58', '0', '1');
INSERT INTO `log` VALUES (1496854778584268802, '查询-Swagger文档接口', '2022-02-24 22:29:24', '2022-02-24 22:29:24', '0', '1');
INSERT INTO `log` VALUES (1499738176780820481, '管理员登录', '2022-03-04 21:27:00', '2022-03-04 21:27:00', '0', '1');
INSERT INTO `log` VALUES (1499738205960593410, '查询-用户信息', '2022-03-04 21:27:07', '2022-03-04 21:27:07', '0', '1');
INSERT INTO `log` VALUES (1499738221559209986, '查询-教师列表', '2022-03-04 21:27:10', '2022-03-04 21:27:10', '0', '1');
INSERT INTO `log` VALUES (1499738370410864641, '查询-学生列表', '2022-03-04 21:27:46', '2022-03-04 21:27:46', '0', '1');
INSERT INTO `log` VALUES (1499738378006749186, '查询-组织列表', '2022-03-04 21:27:48', '2022-03-04 21:27:48', '0', '1');
INSERT INTO `log` VALUES (1499738395186618369, '查询-组织列表', '2022-03-04 21:27:52', '2022-03-04 21:27:52', '0', '1');
INSERT INTO `log` VALUES (1499738644017897474, '查询-教师列表', '2022-03-04 21:28:51', '2022-03-04 21:28:51', '0', '1');
INSERT INTO `log` VALUES (1499739106150506498, '查询-组织列表', '2022-03-04 21:30:41', '2022-03-04 21:30:41', '0', '1');
INSERT INTO `log` VALUES (1499739126799065089, '查询-教师列表', '2022-03-04 21:30:46', '2022-03-04 21:30:46', '0', '1');
INSERT INTO `log` VALUES (1499739327953690625, '查询-日志', '2022-03-04 21:31:34', '2022-03-04 21:31:34', '0', '1');
INSERT INTO `log` VALUES (1499739378650243073, '查询-Swagger文档接口', '2022-03-04 21:31:46', '2022-03-04 21:31:46', '0', '1');
INSERT INTO `log` VALUES (1499739393447747585, '查询-数据库接口', '2022-03-04 21:31:50', '2022-03-04 21:31:50', '0', '1');
INSERT INTO `log` VALUES (1499739395091914754, '查询-数据库接口', '2022-03-04 21:31:50', '2022-03-04 21:31:50', '0', '1');
INSERT INTO `log` VALUES (1499739404881420289, '查询-数据接口文档', '2022-03-04 21:31:53', '2022-03-04 21:31:53', '0', '1');
INSERT INTO `log` VALUES (1499739420110938114, '查询-用户信息', '2022-03-04 21:31:56', '2022-03-04 21:31:56', '0', '1');
INSERT INTO `log` VALUES (1502259294634668034, '管理员登录', '2022-03-11 20:25:01', '2022-03-11 20:25:01', '0', '1');
INSERT INTO `log` VALUES (1502259795589754882, '查询-用户信息', '2022-03-11 20:27:01', '2022-03-11 20:27:01', '0', '1');
INSERT INTO `log` VALUES (1502259803391160322, '查询-教师列表', '2022-03-11 20:27:02', '2022-03-11 20:27:02', '0', '1');
INSERT INTO `log` VALUES (1502259806272647170, '查询-学生列表', '2022-03-11 20:27:03', '2022-03-11 20:27:03', '0', '1');
INSERT INTO `log` VALUES (1502259809355460610, '查询-组织列表', '2022-03-11 20:27:04', '2022-03-11 20:27:04', '0', '1');
INSERT INTO `log` VALUES (1502259816280256514, '查询-日志', '2022-03-11 20:27:06', '2022-03-11 20:27:06', '0', '1');
INSERT INTO `log` VALUES (1502259833426571265, '查询-Swagger文档接口', '2022-03-11 20:27:10', '2022-03-11 20:27:10', '0', '1');
INSERT INTO `log` VALUES (1502259834986852353, '查询-数据接口文档', '2022-03-11 20:27:10', '2022-03-11 20:27:10', '0', '1');
INSERT INTO `log` VALUES (1502259838325518337, '查询-Swagger文档接口', '2022-03-11 20:27:11', '2022-03-11 20:27:11', '0', '1');
INSERT INTO `log` VALUES (1502259849058742273, '查询-教师列表', '2022-03-11 20:27:13', '2022-03-11 20:27:13', '0', '1');
INSERT INTO `log` VALUES (1502259852972027905, '查询-学生列表', '2022-03-11 20:27:14', '2022-03-11 20:27:14', '0', '1');
INSERT INTO `log` VALUES (1502259855740268546, '查询-教师列表', '2022-03-11 20:27:15', '2022-03-11 20:27:15', '0', '1');
INSERT INTO `log` VALUES (1502260176243814401, '查询-学生列表', '2022-03-11 20:28:31', '2022-03-11 20:28:31', '0', '1');
INSERT INTO `log` VALUES (1502260177363693570, '查询-组织列表', '2022-03-11 20:28:32', '2022-03-11 20:28:32', '0', '1');
INSERT INTO `log` VALUES (1502260181155344386, '查询-组织列表', '2022-03-11 20:28:32', '2022-03-11 20:28:32', '0', '1');
INSERT INTO `log` VALUES (1502260283068542978, '查询-组织列表', '2022-03-11 20:28:57', '2022-03-11 20:28:57', '0', '1');
INSERT INTO `log` VALUES (1506946003173195778, '管理员登录', '2022-03-24 18:48:20', '2022-03-24 18:48:20', '0', '1');
INSERT INTO `log` VALUES (1506946045816684545, '查询-用户信息', '2022-03-24 18:48:30', '2022-03-24 18:48:30', '0', '1');
INSERT INTO `log` VALUES (1506946107598782465, '查询-用户信息', '2022-03-24 18:48:44', '2022-03-24 18:48:44', '0', '1');
INSERT INTO `log` VALUES (1506946119258947586, '查询-教师列表', '2022-03-24 18:48:47', '2022-03-24 18:48:47', '0', '1');
INSERT INTO `log` VALUES (1506946143665602562, '查询-学生列表', '2022-03-24 18:48:53', '2022-03-24 18:48:53', '0', '1');
INSERT INTO `log` VALUES (1506946161940185089, '查询-组织列表', '2022-03-24 18:48:57', '2022-03-24 18:48:57', '0', '1');
INSERT INTO `log` VALUES (1506946190713110529, '查询-日志', '2022-03-24 18:49:04', '2022-03-24 18:49:04', '0', '1');
INSERT INTO `log` VALUES (1506946252809781249, '查询-Swagger文档接口', '2022-03-24 18:49:19', '2022-03-24 18:49:19', '0', '1');
INSERT INTO `log` VALUES (1506946265166200834, '查询-数据库接口', '2022-03-24 18:49:22', '2022-03-24 18:49:22', '0', '1');
INSERT INTO `log` VALUES (1506946270396497921, '查询-数据接口文档', '2022-03-24 18:49:23', '2022-03-24 18:49:23', '0', '1');
INSERT INTO `log` VALUES (1506946301648257025, '查询-数据库接口', '2022-03-24 18:49:31', '2022-03-24 18:49:31', '0', '1');
INSERT INTO `log` VALUES (1506946682369425409, '查询-Swagger文档接口', '2022-03-24 18:51:01', '2022-03-24 18:51:01', '0', '1');
INSERT INTO `log` VALUES (1506946706071437314, '查询-数据接口文档', '2022-03-24 18:51:07', '2022-03-24 18:51:07', '0', '1');
INSERT INTO `log` VALUES (1506965562110312450, '管理员登录', '2022-03-24 20:06:03', '2022-03-24 20:06:03', '0', '1');
INSERT INTO `log` VALUES (1506965622080471042, '管理员登录', '2022-03-24 20:06:17', '2022-03-24 20:06:17', '0', '1');
INSERT INTO `log` VALUES (1508408901764808705, '管理员登录', '2022-03-28 19:41:22', '2022-03-28 19:41:22', '0', '1');
INSERT INTO `log` VALUES (1508408916897857538, '查询-教师列表', '2022-03-28 19:41:25', '2022-03-28 19:41:25', '0', '1');
INSERT INTO `log` VALUES (1508408993531985922, '查询-学生列表', '2022-03-28 19:41:44', '2022-03-28 19:41:44', '0', '1');
INSERT INTO `log` VALUES (1508409031310082049, '查询-组织列表', '2022-03-28 19:41:53', '2022-03-28 19:41:53', '0', '1');
INSERT INTO `log` VALUES (1508409068509364226, '查询-日志', '2022-03-28 19:42:01', '2022-03-28 19:42:01', '0', '1');
INSERT INTO `log` VALUES (1508409111484203010, '查询-Swagger文档接口', '2022-03-28 19:42:12', '2022-03-28 19:42:12', '0', '1');
INSERT INTO `log` VALUES (1508409144208162817, '查询-数据库接口', '2022-03-28 19:42:20', '2022-03-28 19:42:20', '0', '1');
INSERT INTO `log` VALUES (1508409206007037953, '查询-数据接口文档', '2022-03-28 19:42:34', '2022-03-28 19:42:34', '0', '1');
INSERT INTO `log` VALUES (1508409227465097218, '查询-用户信息', '2022-03-28 19:42:39', '2022-03-28 19:42:39', '0', '1');
INSERT INTO `log` VALUES (1508417528617668609, '管理员登录', '2022-03-28 20:15:39', '2022-03-28 20:15:39', '0', '1');
INSERT INTO `log` VALUES (1508417535177560066, '查询-用户信息', '2022-03-28 20:15:40', '2022-03-28 20:15:40', '0', '1');
INSERT INTO `log` VALUES (1508417544748961793, '查询-教师列表', '2022-03-28 20:15:42', '2022-03-28 20:15:42', '0', '1');
INSERT INTO `log` VALUES (1508417549413027841, '查询-学生列表', '2022-03-28 20:15:43', '2022-03-28 20:15:43', '0', '1');
INSERT INTO `log` VALUES (1508418104340418562, '查询-学生列表', '2022-03-28 20:17:56', '2022-03-28 20:17:56', '0', '1');
INSERT INTO `log` VALUES (1508418251497574402, '查询-学生列表', '2022-03-28 20:18:31', '2022-03-28 20:18:31', '0', '1');
INSERT INTO `log` VALUES (1508418257315074050, '查询-学生列表', '2022-03-28 20:18:32', '2022-03-28 20:18:32', '0', '1');
INSERT INTO `log` VALUES (1508418296007528449, '查询-学生列表', '2022-03-28 20:18:41', '2022-03-28 20:18:41', '0', '1');
INSERT INTO `log` VALUES (1508418461816754178, '查询-教师列表', '2022-03-28 20:19:21', '2022-03-28 20:19:21', '0', '1');
INSERT INTO `log` VALUES (1508418474823290882, '查询-学生列表', '2022-03-28 20:19:24', '2022-03-28 20:19:24', '0', '1');
INSERT INTO `log` VALUES (1508436430189957121, '管理员登录', '2022-03-28 21:30:45', '2022-03-28 21:30:45', '0', '1');
INSERT INTO `log` VALUES (1508436449571835906, '查询-学生列表', '2022-03-28 21:30:50', '2022-03-28 21:30:50', '0', '1');
INSERT INTO `log` VALUES (1508437281855967233, '查询-教师列表', '2022-03-28 21:34:08', '2022-03-28 21:34:08', '0', '1');
INSERT INTO `log` VALUES (1508441879509405698, '查询-教师列表', '2022-03-28 21:52:24', '2022-03-28 21:52:24', '0', '1');
INSERT INTO `log` VALUES (1508441896731217922, '查询-学生列表', '2022-03-28 21:52:28', '2022-03-28 21:52:28', '0', '1');
INSERT INTO `log` VALUES (1508442417110126594, '查询-组织列表', '2022-03-28 21:54:32', '2022-03-28 21:54:32', '0', '1');
INSERT INTO `log` VALUES (1508442420893388802, '查询-教师列表', '2022-03-28 21:54:33', '2022-03-28 21:54:33', '0', '1');
INSERT INTO `log` VALUES (1508442435334377473, '查询-组织列表', '2022-03-28 21:54:37', '2022-03-28 21:54:37', '0', '1');
INSERT INTO `log` VALUES (1508442451755077633, '查询-组织列表', '2022-03-28 21:54:41', '2022-03-28 21:54:41', '0', '1');
INSERT INTO `log` VALUES (1508442455920021505, '查询-学生列表', '2022-03-28 21:54:42', '2022-03-28 21:54:42', '0', '1');
INSERT INTO `log` VALUES (1508442460110131202, '查询-组织列表', '2022-03-28 21:54:43', '2022-03-28 21:54:43', '0', '1');
INSERT INTO `log` VALUES (1508442494314680322, '查询-学生列表', '2022-03-28 21:54:51', '2022-03-28 21:54:51', '0', '1');
INSERT INTO `log` VALUES (1508442497510739970, '查询-教师列表', '2022-03-28 21:54:52', '2022-03-28 21:54:52', '0', '1');
INSERT INTO `log` VALUES (1508442507006644225, '查询-学生列表', '2022-03-28 21:54:54', '2022-03-28 21:54:54', '0', '1');
INSERT INTO `log` VALUES (1508442510672465922, '查询-教师列表', '2022-03-28 21:54:55', '2022-03-28 21:54:55', '0', '1');
INSERT INTO `log` VALUES (1513184427556352002, '管理员登录', '2022-04-10 23:57:36', '2022-04-10 23:57:36', '0', '1');
INSERT INTO `log` VALUES (1513184437714956290, '查询-教师列表', '2022-04-10 23:57:38', '2022-04-10 23:57:38', '0', '1');
INSERT INTO `log` VALUES (1513184446376194050, '查询-学生列表', '2022-04-10 23:57:40', '2022-04-10 23:57:40', '0', '1');
INSERT INTO `log` VALUES (1513184451522605058, '查询-教师列表', '2022-04-10 23:57:42', '2022-04-10 23:57:42', '0', '1');
INSERT INTO `log` VALUES (1513184456920674306, '查询-组织列表', '2022-04-10 23:57:43', '2022-04-10 23:57:43', '0', '1');
INSERT INTO `log` VALUES (1513184462767534081, '查询-教师列表', '2022-04-10 23:57:44', '2022-04-10 23:57:44', '0', '1');
INSERT INTO `log` VALUES (1513184467423211522, '查询-用户信息', '2022-04-10 23:57:45', '2022-04-10 23:57:45', '0', '1');
INSERT INTO `log` VALUES (1513184727772049409, '查询-学生列表', '2022-04-10 23:58:47', '2022-04-10 23:58:47', '0', '1');
INSERT INTO `log` VALUES (1513184729026146306, '查询-组织列表', '2022-04-10 23:58:48', '2022-04-10 23:58:48', '0', '1');
INSERT INTO `log` VALUES (1513184745060970498, '查询-学生列表', '2022-04-10 23:58:52', '2022-04-10 23:58:52', '0', '1');
INSERT INTO `log` VALUES (1513326590084698114, '管理员登录', '2022-04-11 09:22:30', '2022-04-11 09:22:30', '0', '1');
INSERT INTO `log` VALUES (1513326806326235137, '管理员登录', '2022-04-11 09:23:22', '2022-04-11 09:23:22', '0', '1');
INSERT INTO `log` VALUES (1513326996114296834, '管理员登录', '2022-04-11 09:24:07', '2022-04-11 09:24:07', '0', '1');
INSERT INTO `log` VALUES (1513327001835327490, '查询-用户信息', '2022-04-11 09:24:08', '2022-04-11 09:24:08', '0', '1');
INSERT INTO `log` VALUES (1513327011134099457, '查询-教师列表', '2022-04-11 09:24:10', '2022-04-11 09:24:10', '0', '1');
INSERT INTO `log` VALUES (1513327023788314626, '查询-学生列表', '2022-04-11 09:24:13', '2022-04-11 09:24:13', '0', '1');
INSERT INTO `log` VALUES (1513327042536853506, '查询-组织列表', '2022-04-11 09:24:18', '2022-04-11 09:24:18', '0', '1');
INSERT INTO `log` VALUES (1513327081627766786, '查询-日志', '2022-04-11 09:24:27', '2022-04-11 09:24:27', '0', '1');
INSERT INTO `log` VALUES (1513327120316026881, '查询-日志', '2022-04-11 09:24:36', '2022-04-11 09:24:36', '0', '1');
INSERT INTO `log` VALUES (1513327132903133185, '查询-Swagger文档接口', '2022-04-11 09:24:39', '2022-04-11 09:24:39', '0', '1');
INSERT INTO `log` VALUES (1513327143829295105, '查询-数据接口文档', '2022-04-11 09:24:42', '2022-04-11 09:24:42', '0', '1');
INSERT INTO `log` VALUES (1513327147167961090, '查询-数据库接口', '2022-04-11 09:24:43', '2022-04-11 09:24:43', '0', '1');
INSERT INTO `log` VALUES (1513327150032670722, '查询-用户信息', '2022-04-11 09:24:43', '2022-04-11 09:24:43', '0', '1');

-- ----------------------------
-- Table structure for multiple_question
-- ----------------------------
DROP TABLE IF EXISTS `multiple_question`;
CREATE TABLE `multiple_question`  (
  `mq_id` bigint NOT NULL,
  `mq_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_score` int NULL DEFAULT NULL,
  `mq_answerA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_answerB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_answerC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_answerD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  PRIMARY KEY (`mq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of multiple_question
-- ----------------------------
INSERT INTO `multiple_question` VALUES (1501012550865973249, 'css', '以上均为样式文件', '3', 4, '.css', '.wxss', '.less', '.scss', 'A,B,C,D', '以下哪些文件格式是样式文件', '2022-03-08 09:50:54', '2022-03-08 09:50:54', 1, 0);
INSERT INTO `multiple_question` VALUES (1501079805205233666, 'js基础', '无解析', '3', 4, '要先定义后使用', 'JS函数一般定义在HTML文件的头部或外部JS文件中', '函数的定义可以在HTML文件的主体body标记中的任何位置', '函数需要在每次使用的时候重新定义', 'A,B,C', '下列关于JavaScript函数的描述中，正确的是（  ）', '2022-03-08 14:18:09', '2022-03-08 14:18:09', 1, 0);
INSERT INTO `multiple_question` VALUES (1501080348417933314, 'js基础', '无解析', '3', 4, '字符串对象', '数学对象', '数学对象', '浏览器对象', 'A,B,C', '下列属于内置对象的是（）', '2022-03-08 14:20:18', '2022-03-08 14:20:18', 1, 0);
INSERT INTO `multiple_question` VALUES (1501080415652626434, 'js基础', '无解析', '3', 4, 'constructor', 'length', 'prototype', 'PI', 'A,B,C', '字符串对象的属性包括（）', '2022-03-08 14:20:34', '2022-03-08 14:20:34', 1, 0);
INSERT INTO `multiple_question` VALUES (1501081108157382658, 'js基础', '无解析', '3', 4, 'LN2返回2的自然对数', 'PI返回圆周率', 'E返回算术常量e，即自然对数的底数', 'SQRT2返回2 的平方根的倒数', 'A,B,C', '下列数学对象的属性中描述正确的是（）。', '2022-03-08 14:23:20', '2022-03-08 14:23:20', 1, 0);
INSERT INTO `multiple_question` VALUES (1501081206987767809, 'js基础', '无解析', '3', 4, 'toFixed（x）', 'toPrecision（x）', 'abs（x）', 'floor（x）', 'A,B', 'JS针对数值对象，可实现对数值型小数位数的保留操作的方法有（）。', '2022-03-08 14:23:43', '2022-03-08 14:23:43', 1, 0);
INSERT INTO `multiple_question` VALUES (1501081838238908418, 'js基础', '无解析', '3', 4, 'setDate()设置 Date 对象中月的某一天 (1 ~ 31)', 'setHours()设置 Date 对象中的小时 (0 ~ 23)', 'setFullYear()设置 Date 对象中的年份', 'setSeconds()设置 Date 对象中的秒钟 (0 ~ 59)', 'A,B,C,D', '下列日期对象的设置方法中描述正确的是（）', '2022-03-08 14:26:14', '2022-03-08 14:26:14', 1, 0);
INSERT INTO `multiple_question` VALUES (1501081922120794113, 'js基础', '无解析', '3', 4, 'new Date()', 'new Date(日期字符串)', 'new Date(年,月,日,[时,分,秒,毫秒]);', 'new Date(毫秒)', 'A,B,C,D', '创建日期对象的方法有（）', '2022-03-08 14:26:34', '2022-03-08 14:26:34', 1, 0);

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `page_id` int NOT NULL AUTO_INCREMENT COMMENT '前端页面表主键id',
  `page_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '页面的名称,要唯一',
  `page_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面的功能性描述',
  `action_ids` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面对应的操作权限列表，用-连接action的id',
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE INDEX `page_name`(`page_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '前端页面表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 'dashboard', '仪表盘', '1-2-3-4-5');
INSERT INTO `page` VALUES (2, 'exam-card', '考试列表', '1-6-3-4');
INSERT INTO `page` VALUES (3, 'exam-record-list', '考试记录', '1-6-3-4');
INSERT INTO `page` VALUES (6, 'user', '个人页', '1-6-3-4-5-7');

-- ----------------------------
-- Table structure for paper_look
-- ----------------------------
DROP TABLE IF EXISTS `paper_look`;
CREATE TABLE `paper_look`  (
  `paper_look_id` bigint NOT NULL COMMENT '主键，paper_look表是paper_manage的封装表，以为manage著有对应的题目索引，通过look表封装既方便前端查询也方便阅览。',
  `paper_id` bigint NULL DEFAULT NULL COMMENT '对应paper_manage中的paper_id',
  `paper_look_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '考试名称',
  `paper_look_time` int NULL DEFAULT NULL COMMENT '开始总时间',
  `paper_look_score` int NULL DEFAULT NULL COMMENT '总分',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  `paper_teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建考试的名字,这是设计缺陷，应该是id，但是后端耦合了懒得修，插入的时候注意不要重名',
  PRIMARY KEY (`paper_look_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paper_look
-- ----------------------------
INSERT INTO `paper_look` VALUES (1501121113085038577, 4, 'JavaScript基础模拟考试(一)', 120, 125, '2022-03-08 16:58:06', '2022-03-08 16:58:09', 1, 0, '老师-4');
INSERT INTO `paper_look` VALUES (1501121113085038594, 1, 'JavaScript基础模拟考试(二)', 120, 100, '2022-03-08 17:02:17', '2022-03-08 17:02:17', 1, 0, '老师-4');
INSERT INTO `paper_look` VALUES (1502245782579470337, 5, 'js模拟试卷', 120, 128, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0, '老师-4');
INSERT INTO `paper_look` VALUES (1502248752545161217, 6, 'JavaScript编程期中检测', 120, 100, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0, '老师-4');

-- ----------------------------
-- Table structure for paper_manage
-- ----------------------------
DROP TABLE IF EXISTS `paper_manage`;
CREATE TABLE `paper_manage`  (
  `paper_id` bigint NULL DEFAULT NULL COMMENT '这个不是主键！paperId应该是自增的，但是开发环境没配置好，特定试卷需要到数据库里面手动复制取id！\r\n',
  `paper_question_type` int NULL DEFAULT NULL COMMENT '问题类型，单选1，多选2，判断3，填空4，简答5，程序6',
  `paper_question_id` bigint NULL DEFAULT NULL COMMENT '问题id，到对应的question表查数据的',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL COMMENT '虽然是逻辑删除，但是最好这个表不要随便删除'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paper_manage
-- ----------------------------
INSERT INTO `paper_manage` VALUES (2, 1, 1501080243677773826, '2022-03-08 15:01:22', '2022-03-08 15:01:22', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501079482986217473, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501078490064437250, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501077240866488322, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501080624407330817, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501079170661564418, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501078632997928961, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501077457586176001, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501081703027130369, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501079373758152705, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (3, 1, 1501080740157538306, '2022-03-08 15:02:33', '2022-03-08 15:02:33', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501079053837615105, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501080051897417729, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501078490064437250, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501078197977300993, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501080994428829698, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501081703027130369, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501080905748660226, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1501079482986217473, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1500749989382799362, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 1, 1500750277485346818, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 4, 1501087322190725122, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 4, 1501086625265172481, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 4, 1501086497024327682, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 4, 1501086755670278145, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 4, 1501086829951401985, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 3, 1501080516567580674, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 3, 1501080493717012482, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 3, 1501080476050604033, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 3, 1500759753886126081, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 2, 1501081108157382658, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 2, 1501080415652626434, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 2, 1501080348417933314, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 2, 1501081838238908418, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 2, 1501012550865973249, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 5, 1501082988568723458, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 5, 1501082634951147522, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 5, 1501084774524338178, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (4, 5, 1501082295459987458, '2022-03-08 15:04:34', '2022-03-08 15:04:34', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501078632997928961, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501077457586176001, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501081396348010498, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501079053837615105, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501080051897417729, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501077240866488322, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501080624407330817, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501080740157538306, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501078197977300993, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 1, 1501077111476404226, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1500760257240354818, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501080516567580674, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501079912134819842, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501081955184492546, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501079933081174018, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501081299795132417, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501082018715615234, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501081986461417474, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1500758891952459777, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 3, 1501080455360102402, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 2, 1501081922120794113, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 2, 1501080348417933314, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 2, 1501080415652626434, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 2, 1501079805205233666, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 2, 1501081108157382658, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 5, 1501082988568723458, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (1, 5, 1501082675015139330, '2022-03-08 17:02:18', '2022-03-08 17:02:18', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1500749989382799400, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1500750277485346800, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1500767545791443000, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501077111476404200, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501077240866488300, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501077601215922200, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501079170661564400, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501079282641092600, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501078928138518500, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 1, 1501078788380115000, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 2, 1501079805205233700, '2022-03-11 19:31:20', '2022-03-11 19:31:20', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 2, 1501080348417933300, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 2, 1501080415652626400, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 2, 1501081206987767800, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 2, 1501081838238908400, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1500754551791538200, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1500758891952459800, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1500759753886126000, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1500760257240354800, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1501079886880915500, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1501080455360102400, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1501080476050604000, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1501080493717012500, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1501081247148228600, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 3, 1501081271483580400, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 4, 1500766729818960000, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 4, 1501086497024327700, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 4, 1501086540322128000, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 4, 1501086625265172500, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 4, 1501086683083653000, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 4, 1501086755670278100, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 5, 1500992047539327000, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 5, 1501082295459987500, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 5, 1501082356784906200, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 5, 1501082398845386800, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (5, 5, 1501082440947810300, '2022-03-11 19:31:21', '2022-03-11 19:31:21', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1500750277485346800, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1500767545791443000, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501077111476404200, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501077457586176000, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501077601215922200, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501078197977301000, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501078490064437200, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501080624407330800, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501080818356142000, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 1, 1501080905748660200, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 2, 1501080348417933300, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 2, 1501080415652626400, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 2, 1501081108157382700, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 2, 1501081206987767800, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 2, 1501081922120794000, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1500760257240354800, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501079912134819800, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501079933081174000, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501080493717012500, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501080516567580700, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501081247148228600, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501081271483580400, '2022-03-11 19:43:08', '2022-03-11 19:43:08', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501081299795132400, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501081986461417500, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 3, 1501082018715615200, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 5, 1501082440947810300, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 5, 1501082479145336800, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 6, 1501085582913519600, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);
INSERT INTO `paper_manage` VALUES (6, 6, 1501085745451188200, '2022-03-11 19:43:09', '2022-03-11 19:43:09', 1, 0);

-- ----------------------------
-- Table structure for program_question
-- ----------------------------
DROP TABLE IF EXISTS `program_question`;
CREATE TABLE `program_question`  (
  `pq_id` bigint NOT NULL,
  `pq_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pq_analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `pq_score` int NULL DEFAULT NULL,
  `pq_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  PRIMARY KEY (`pq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of program_question
-- ----------------------------
INSERT INTO `program_question` VALUES (1501002998309232642, 'js基础', '请使用JavaScript语言编写出归并排序，并排序数组 [29, 33, 1 ,99, 2, 56, 11, 89, 23, 12, 45, 6, 0, 234, 11, 22, 12]\n', '使用归并排序即可。', 10, '3', '2022-03-08 09:12:57', '2022-03-08 09:12:57', 1, 0);
INSERT INTO `program_question` VALUES (1501085552945217537, 'Python', '有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数?都是多少?', '无解析', 10, '3', '2022-03-08 14:40:59', '2022-03-08 14:40:59', 1, 0);
INSERT INTO `program_question` VALUES (1501085565494575106, 'Java基础', '有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数?都是多少?', '无解析', 10, '3', '2022-03-08 14:41:02', '2022-03-08 14:41:02', 1, 0);
INSERT INTO `program_question` VALUES (1501085582913519618, 'js基础', '有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数?都是多少?', '无解析', 10, '3', '2022-03-08 14:41:06', '2022-03-08 14:41:06', 1, 0);
INSERT INTO `program_question` VALUES (1501085610944053249, 'C++', '有1、2、3、4个数字，能组成多少个互不相同且无重复数字的三位数?都是多少?', '无解析', 10, '3', '2022-03-08 14:41:13', '2022-03-08 14:41:13', 1, 0);
INSERT INTO `program_question` VALUES (1501085692804284418, 'C++', '企业发放的奖金根据利润提成。利润(I)低于或等于10万元时，奖金可提10%;利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可提成7.5%; 20 万到40万之间时，高于20万元的部分，可提成5%; 40万到60万之间时高于40万元的部分，可提成3%; 60万到100万之间时，高于60万元的部分，可提成1.5%，高于100万元时，超过100万元的部分按1%提成，从键盘输入当月利润，求应发放奖金总数?', '无解析', 10, '3', '2022-03-08 14:41:33', '2022-03-08 14:41:33', 1, 0);
INSERT INTO `program_question` VALUES (1501085708667142145, 'Java基础', '企业发放的奖金根据利润提成。利润(I)低于或等于10万元时，奖金可提10%;利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可提成7.5%; 20 万到40万之间时，高于20万元的部分，可提成5%; 40万到60万之间时高于40万元的部分，可提成3%; 60万到100万之间时，高于60万元的部分，可提成1.5%，高于100万元时，超过100万元的部分按1%提成，从键盘输入当月利润，求应发放奖金总数?', '无解析', 10, '3', '2022-03-08 14:41:36', '2022-03-08 14:41:36', 1, 0);
INSERT INTO `program_question` VALUES (1501085720054677505, 'Python', '企业发放的奖金根据利润提成。利润(I)低于或等于10万元时，奖金可提10%;利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可提成7.5%; 20 万到40万之间时，高于20万元的部分，可提成5%; 40万到60万之间时高于40万元的部分，可提成3%; 60万到100万之间时，高于60万元的部分，可提成1.5%，高于100万元时，超过100万元的部分按1%提成，从键盘输入当月利润，求应发放奖金总数?', '无解析', 10, '3', '2022-03-08 14:41:39', '2022-03-08 14:41:39', 1, 0);
INSERT INTO `program_question` VALUES (1501085745451188226, 'js基础', '企业发放的奖金根据利润提成。利润(I)低于或等于10万元时，奖金可提10%;利润高于10万元，低于20万元时，低于10万元的部分按10%提成，高于10万元的部分，可提成7.5%; 20 万到40万之间时，高于20万元的部分，可提成5%; 40万到60万之间时高于40万元的部分，可提成3%; 60万到100万之间时，高于60万元的部分，可提成1.5%，高于100万元时，超过100万元的部分按1%提成，从键盘输入当月利润，求应发放奖金总数?', '无解析', 10, '3', '2022-03-08 14:41:45', '2022-03-08 14:41:45', 1, 0);
INSERT INTO `program_question` VALUES (1501085773909540866, 'js基础', '一个整数，它加上100后是一-个完全平方数，再加上168又是一个完全平方数，请问该数是多少?', '无解析', 10, '3', '2022-03-08 14:41:52', '2022-03-08 14:41:52', 1, 0);
INSERT INTO `program_question` VALUES (1501085786450509826, 'C++', '一个整数，它加上100后是一-个完全平方数，再加上168又是一个完全平方数，请问该数是多少?', '无解析', 10, '3', '2022-03-08 14:41:55', '2022-03-08 14:41:55', 1, 0);
INSERT INTO `program_question` VALUES (1501085804347604994, 'Java基础', '一个整数，它加上100后是一-个完全平方数，再加上168又是一个完全平方数，请问该数是多少?', '无解析', 10, '3', '2022-03-08 14:41:59', '2022-03-08 14:41:59', 1, 0);
INSERT INTO `program_question` VALUES (1501085813168226306, 'Python', '一个整数，它加上100后是一-个完全平方数，再加上168又是一个完全平方数，请问该数是多少?', '无解析', 10, '3', '2022-03-08 14:42:01', '2022-03-08 14:42:01', 1, 0);
INSERT INTO `program_question` VALUES (1501085834794057730, 'Python', '输入某年某月某日，判断这一天是这一年的第几天?', '无解析', 10, '3', '2022-03-08 14:42:06', '2022-03-08 14:42:06', 1, 0);
INSERT INTO `program_question` VALUES (1501085844285767682, 'Java基础', '输入某年某月某日，判断这一天是这一年的第几天?', '无解析', 10, '3', '2022-03-08 14:42:09', '2022-03-08 14:42:09', 1, 0);
INSERT INTO `program_question` VALUES (1501085852343025666, 'C++', '输入某年某月某日，判断这一天是这一年的第几天?', '无解析', 10, '3', '2022-03-08 14:42:11', '2022-03-08 14:42:11', 1, 0);
INSERT INTO `program_question` VALUES (1501085873163550721, 'js基础', '输入某年某月某日，判断这一天是这一年的第几天?', '无解析', 10, '3', '2022-03-08 14:42:16', '2022-03-08 14:42:16', 1, 0);
INSERT INTO `program_question` VALUES (1501085920739540993, 'js基础', '输入三个整数x,y,z，请把这三个数由小到大输出。', '无解析', 10, '3', '2022-03-08 14:42:27', '2022-03-08 14:42:27', 1, 0);
INSERT INTO `program_question` VALUES (1501085931716034562, 'C++', '输入三个整数x,y,z，请把这三个数由小到大输出。', '无解析', 10, '3', '2022-03-08 14:42:30', '2022-03-08 14:42:30', 1, 0);
INSERT INTO `program_question` VALUES (1501085940834451457, 'Java基础', '输入三个整数x,y,z，请把这三个数由小到大输出。', '无解析', 10, '3', '2022-03-08 14:42:32', '2022-03-08 14:42:32', 1, 0);
INSERT INTO `program_question` VALUES (1501085956042997761, 'Python', '输入三个整数x,y,z，请把这三个数由小到大输出。', '无解析', 10, '3', '2022-03-08 14:42:35', '2022-03-08 14:42:35', 1, 0);
INSERT INTO `program_question` VALUES (1501085982613913602, 'Python', '用*号输出字母C的图案。', '无解析', 10, '3', '2022-03-08 14:42:42', '2022-03-08 14:42:42', 1, 0);
INSERT INTO `program_question` VALUES (1501085992382447618, 'Java基础', '用*号输出字母C的图案。', '无解析', 10, '3', '2022-03-08 14:42:44', '2022-03-08 14:42:44', 1, 0);
INSERT INTO `program_question` VALUES (1501086001735745537, 'C++', '用*号输出字母C的图案。', '无解析', 10, '3', '2022-03-08 14:42:46', '2022-03-08 14:42:46', 1, 0);
INSERT INTO `program_question` VALUES (1501086015652446209, 'js面向对象', '用*号输出字母C的图案。', '无解析', 10, '3', '2022-03-08 14:42:50', '2022-03-08 14:42:50', 1, 0);
INSERT INTO `program_question` VALUES (1501086026599579650, 'js基础', '用*号输出字母C的图案。', '无解析', 10, '3', '2022-03-08 14:42:52', '2022-03-08 14:42:52', 1, 0);
INSERT INTO `program_question` VALUES (1501086054370066434, 'js基础', '将一个正整数分解质因数。例如:输入90,打印出90=233*5。', '无解析', 10, '3', '2022-03-08 14:42:59', '2022-03-08 14:42:59', 1, 0);
INSERT INTO `program_question` VALUES (1501086062335049729, 'Java基础', '将一个正整数分解质因数。例如:输入90,打印出90=233*5。', '无解析', 10, '3', '2022-03-08 14:43:01', '2022-03-08 14:43:01', 1, 0);
INSERT INTO `program_question` VALUES (1501086071843536897, 'C++', '将一个正整数分解质因数。例如:输入90,打印出90=233*5。', '无解析', 10, '3', '2022-03-08 14:43:03', '2022-03-08 14:43:03', 1, 0);
INSERT INTO `program_question` VALUES (1501086082912305153, 'Python', '将一个正整数分解质因数。例如:输入90,打印出90=233*5。', '无解析', 10, '3', '2022-03-08 14:43:06', '2022-03-08 14:43:06', 1, 0);
INSERT INTO `program_question` VALUES (1501086104756240385, 'Python', '输出9*9口诀。', '无解析', 10, '3', '2022-03-08 14:43:11', '2022-03-08 14:43:11', 1, 0);
INSERT INTO `program_question` VALUES (1501086113115488257, 'C++', '输出9*9口诀。', '无解析', 10, '3', '2022-03-08 14:43:13', '2022-03-08 14:43:13', 1, 0);
INSERT INTO `program_question` VALUES (1501086127925575682, 'js基础', '输出9*9口诀。', '无解析', 10, '3', '2022-03-08 14:43:16', '2022-03-08 14:43:16', 1, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色表主键id',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色的描述',
  `role_detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色的详细功能阐述',
  `role_page_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前角色所能访问的页面的id集合',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (3, 'student', '学生', '参与考试，查看分数', '1-2-3-6');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `school_id` bigint NOT NULL COMMENT '这整张表都是摆设，rbac装样子的，不用管',
  `school_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `school_pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `school_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`school_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (134567829, '火星大学', '2022-02-24 21:33:22', '2022-02-24 21:33:24', 0, 0, '0', '0');
INSERT INTO `school` VALUES (134567898, '不知道起啥名学院', '2022-02-24 21:34:00', '2022-02-24 21:34:03', 0, 0, '0', '1');

-- ----------------------------
-- Table structure for select_question
-- ----------------------------
DROP TABLE IF EXISTS `select_question`;
CREATE TABLE `select_question`  (
  `sq_id` bigint NOT NULL,
  `sq_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_answerA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_answerB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_answerC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_answerD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_score` int NULL DEFAULT NULL,
  `sq_section` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sq_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`sq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of select_question
-- ----------------------------
INSERT INTO `select_question` VALUES (1500749989382799362, 'html', 'HTML发展到多少代了', '3代', '4代', '5代', '6代', 'C', '无解析', 2, NULL, '1', '2022-03-07 16:27:35', '2022-03-07 16:27:35', 1, 0);
INSERT INTO `select_question` VALUES (1500750277485346818, 'html', '超文本用什么标签闭合', '<html></html>', '<doc></doc>', '<text></text>', '<script></script>', 'A', '无解析', 2, NULL, '1', '2022-03-07 16:28:43', '2022-03-07 16:28:43', 1, 0);
INSERT INTO `select_question` VALUES (1500767545791442945, 'Vue', 'vue的文件格式为', '.jsx', '.vue', '.ts', '.html', 'B', 'vue基本知识', 2, NULL, '1', '2022-03-07 17:37:20', '2022-03-07 17:37:20', 1, 0);
INSERT INTO `select_question` VALUES (1501077111476404226, 'js基础', '通过javascript控制id=“d1”的div隐藏，使用的代码是', 'document.getElementById(“d1”).style.show = “false”;', 'document.getElementById(“d1”).style.show = “none”;', 'document.getElementById(“d1”).style.display = “false”', 'document.getElementById(“d1”).style.display = “none”;', 'D', '无解析', 2, NULL, '3', '2022-03-08 14:07:27', '2022-03-08 14:07:27', 1, 0);
INSERT INTO `select_question` VALUES (1501077240866488322, 'js基础', 'window对象如下哪个方法是创建一个有”确定”、”取消”两个按钮的对话框 （    ）', 'open( )', 'alert(  )', 'confirm( )', 'prompt()', 'D', '无解析', 2, NULL, '3', '2022-03-08 14:07:58', '2022-03-08 14:07:58', 1, 0);
INSERT INTO `select_question` VALUES (1501077457586176001, 'js基础', '在HTML页面上包含如下所示的层对象，则javascript语句document.getElementById(“info”).innerHTML的值是（     ）\n\n<div id=”info” style=”display:block”><p>请填写</p></div>', '请填写', '<p>请填写</p>', 'id=”info” style=”display:block”', '<div id=”info” style=”display:block”><p>请填写</p>', 'B', '无解析', 2, NULL, '3', '2022-03-08 14:08:49', '2022-03-08 14:08:49', 1, 0);
INSERT INTO `select_question` VALUES (1501077601215922177, 'js基础', '下列可以控制某个元素a的文本颜色的是 （  ）\n\n<a href=”#” name=”a”>hello</a>', 'document.all.a.style.color', 'document.all.a.style.backgroundColor', 'document.a.color', 'document.a.gackgroundColor', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:09:23', '2022-03-08 14:09:23', 1, 0);
INSERT INTO `select_question` VALUES (1501078197977300993, 'js基础', '下列不属于访问指定节点的方法的是\n', 'obj.value', 'getElementsByTagName  得到是一个数组', 'getElementsByName   得到是一个数组', 'getElementById    得到的是一个对象', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:11:46', '2022-03-08 14:11:46', 1, 0);
INSERT INTO `select_question` VALUES (1501078316864847874, 'js基础', '在HTML页面中包含一个按钮控件mybutton，如果要实现点击该按钮时调用已定义的Javascript函数compute，要编写的HTML代码是（  ）', '<input name=”mybutton” type=”button” onBlur=”compute()”value=”计算”>', '<input name=”mybutton” type=”button” onFocus=”compute()”value=”计算”>', '<input name=”mybutton” type=”button” onClick=”function compute()”value=”计算”>', '<input name=”mybutton” type=”button” onClick=”compute()”value=”计算”>', 'D', '无解析', 2, NULL, '3', '2022-03-08 14:12:14', '2022-03-08 14:12:14', 1, 0);
INSERT INTO `select_question` VALUES (1501078490064437250, 'js基础', '下关于JAVASCRIPT函数方法getMonth()的特点（  ）', '获取的月份是从1开始计数的', '获取的月份是从0开始计数的', '获取的月份是英文单词的缩写，如六月份为Jun', '无法获取月份', 'B', '无解析', 2, NULL, '3', '2022-03-08 14:12:55', '2022-03-08 14:12:55', 1, 0);
INSERT INTO `select_question` VALUES (1501078632997928961, 'js基础', '分析下面的Javascript代码段，输出结果是（   ）                                   \n\nvar s1=parseInt(“101中学”);\n\ndocument.write(s1);代码段，输出结果是', 'NaN', '101中学', '101', '出现脚本错误', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:13:29', '2022-03-08 14:13:29', 1, 0);
INSERT INTO `select_question` VALUES (1501078788380114946, 'js基础', '在JavaScript中，把字符串“123”转换为整型值123的正确方法是(     )。', 'var str=\"123\";  var num=(int)str;', 'var str=\"123\";  var num=str.parseInt(str);', 'var str=\"123\";  var num=parseInt(str);   转换函数', 'var str=\"123\";  var num=Integer.parseInt(str);', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:14:07', '2022-03-08 14:14:07', 1, 0);
INSERT INTO `select_question` VALUES (1501078928138518529, 'js基础', '在JavaScript中，下面代码表示获取到文本框的值，则下列选项中验证文本框为空的条件表达式不正确的是 (    ).', 'usrName ==\"\"', 'usrName.length<=0', 'usrName===\"\"', 'usrName.length<0', 'D', '无解析', 2, NULL, '3', '2022-03-08 14:14:40', '2022-03-08 14:14:40', 1, 0);
INSERT INTO `select_question` VALUES (1501079053837615105, 'js基础', '在JavaScript中，下拉选项中可以获取滚动条距窗口顶端滚动的距离的是 (    ).', 'document.documentElement.scrollTop;  ', 'document.documentElement.topScroll;', 'document.style.scrollTop;  ', 'document.style.topScroll;', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:15:10', '2022-03-08 14:15:10', 1, 0);
INSERT INTO `select_question` VALUES (1501079170661564418, 'js基础', '假设今天是2006年4月1日星期六,请问以下javascript代码输出结果是：(    )\n\nvar time = new Date( );\n\ndocument.write(time.getMonth( ));', '3', '4', '5', '4月', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:15:38', '2022-03-08 14:15:38', 1, 0);
INSERT INTO `select_question` VALUES (1501079282641092610, 'js基础', '下列不是 JavaScript内置对象的有？（    ）', 'Windows', 'String', 'Array', 'RegExp', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:16:04', '2022-03-08 14:16:04', 1, 0);
INSERT INTO `select_question` VALUES (1501079373758152705, 'js基础', '对代码 setTimeout(\"show()\",100) 理解正确的是（    ）。', '表示100毫秒后调用一次show方法', '表示每隔100毫秒调用一次show方法', '有语法错误，要去掉双引号', '以上说法都不准确', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:16:26', '2022-03-08 14:16:26', 1, 0);
INSERT INTO `select_question` VALUES (1501079482986217473, 'js基础', '在使用Javascript实现省市级联菜单功能时，在添加城市列表前清空原来的下拉选项的代码是（    ）', 'document.myform.selCity.options.clear()', 'document.myform.selCity.options.deleteAll()', 'document.myform.selCity.options.length=0', 'document.myform.selCity.options.size=0', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:16:52', '2022-03-08 14:16:52', 1, 0);
INSERT INTO `select_question` VALUES (1501080051897417729, 'js基础', '系统预先定义好的，直接使用的对象称为（）', '内置对象', '宿主对象', '宿主对象', '日期对象', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:19:08', '2022-03-08 14:19:08', 1, 0);
INSERT INTO `select_question` VALUES (1501080113268473858, 'js基础', '浏览器对象又被叫做是（）', '内置对象', '宿主对象', '宿主对象', '日期对象', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:19:22', '2022-03-08 14:19:22', 1, 0);
INSERT INTO `select_question` VALUES (1501080206780481538, 'js基础', '在字符串对象中，将指定的字符串替换为新字符串的方法是（）。', 'CharAT', 'indexOf', 'replace', 'spilit', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:19:45', '2022-03-08 14:19:45', 1, 0);
INSERT INTO `select_question` VALUES (1501080243677773826, 'js基础', '在字符串对象中，将指定的字符串替换为新字符串的方法是（）。', 'charAt', 'indexOf', 'replace', 'spilit', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:19:53', '2022-03-08 14:19:53', 1, 0);
INSERT INTO `select_question` VALUES (1501080624407330817, 'js基础', '关于数学对象的描述中错误的是（）', 'math对象包含一些常用的属性和方法', 'Math对象拥有构造函数', 'Math对象无需创建', '可以直接通过属性对象.属性名调用', 'B', '无解析', 2, NULL, '3', '2022-03-08 14:21:24', '2022-03-08 14:21:24', 1, 0);
INSERT INTO `select_question` VALUES (1501080740157538306, 'js基础', '以下（）表达式产生一个0-7之间（含0,7）的随机整数。', 'Math.floor(Math.random()*6)', 'Math.floor(Math.random()*7)', 'Math.floor(Math.random()*8)', 'Math.floor(Math.random()*9)', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:21:52', '2022-03-08 14:21:52', 1, 0);
INSERT INTO `select_question` VALUES (1501080818356142082, 'js基础', '返回数字的平方根的方法是（）。', 'random()', 'pow（x,y）', 'sqrt(x)', 'exp(x)', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:22:10', '2022-03-08 14:22:10', 1, 0);
INSERT INTO `select_question` VALUES (1501080905748660226, 'js基础', '返回某数四舍五入之后保留x位小数的方法是（）。', 'toFixed(x)', 'toPrecision(x)', 'floor(x)', 'round(x)', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:22:31', '2022-03-08 14:22:31', 1, 0);
INSERT INTO `select_question` VALUES (1501080994428829698, 'js基础', '下列关于数学对象的方法的描述中错误的是（）。', 'abs(x)返回数字的绝对值', 'ceil(x)对数字进行下取整', 'exp(x)返回e的对数', 'random()返回0-1之间的随机数', 'B', '无解析', 2, NULL, '3', '2022-03-08 14:22:52', '2022-03-08 14:22:52', 1, 0);
INSERT INTO `select_question` VALUES (1501081396348010498, 'js基础', '产生当前日期的方法是（）', 'Now（）', 'Date ()', 'new Date（）', 'new Now ()', 'C', '无解析', 2, NULL, '3', '2022-03-08 14:24:28', '2022-03-08 14:24:28', 1, 0);
INSERT INTO `select_question` VALUES (1501081488819830786, 'js基础', '在JavaScript中，可以使用Date对象的（）方法返回一个月中的某一天。', 'getDate', 'getYear', 'getMonth', 'getTime', 'A', '无解析', 2, NULL, '3', '2022-03-08 14:24:50', '2022-03-08 14:24:50', 1, 0);
INSERT INTO `select_question` VALUES (1501081597896900609, 'js基础', '在JavaScript中，可以使用Date对象的（）方法设置Date对象中的年份。', 'setDate()', 'setFullYear()', 'setSeconds()', 'setTime', 'B', '无解析', 2, NULL, '3', '2022-03-08 14:25:16', '2022-03-08 14:25:16', 1, 0);
INSERT INTO `select_question` VALUES (1501081703027130369, 'js基础', '关于JS中日期对象的格式转换，错误的是（）。', 'toString()把 Date 对象转换为字符串', 'toDateString()把 Date 对象的日期部分转换为字符串', 'toLocaleString()根据本地时间格式，把 Date 对象转换为字符串', 'toLocaleDateString()根据本地时间格式，根据本地时间格式，把 Date 对象转换为字符串', 'D', '无解析', 2, NULL, '3', '2022-03-08 14:25:41', '2022-03-08 14:25:41', 1, 0);

-- ----------------------------
-- Table structure for short_answer_question
-- ----------------------------
DROP TABLE IF EXISTS `short_answer_question`;
CREATE TABLE `short_answer_question`  (
  `saq_id` bigint NOT NULL,
  `saq_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `saq_question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `saq_analysis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `saq_score` int NULL DEFAULT NULL,
  `saq_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `deleted` int NULL DEFAULT NULL,
  PRIMARY KEY (`saq_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of short_answer_question
-- ----------------------------
INSERT INTO `short_answer_question` VALUES (1500992047539326978, 'Vue', '请简述Vue中数据双向绑定的原理', '我们都知道 Vue 是数据双向绑定的框架，双向绑定由三个重要部分构成\n\n数据层（Model）：应用的数据及业务逻辑\n视图层（View）：应用的展示效果，各类UI组件\n业务逻辑层（ViewModel）：框架封装的核心，它负责将数据与视图关联起来\n而上面的这个分层的架构方案，可以用一个专业术语进行称呼：MVVM这里的控制层的核心功能便是 “数据双向绑定”', 10, '2', '2022-03-08 08:29:26', '2022-03-08 08:29:26', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082295459987458, 'html', '网页三要素是什么？', 'HTML(内容)\nCSS(外观)\nJavascript(行为)', 10, '3', '2022-03-08 14:28:03', '2022-03-08 14:28:03', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082356784906241, 'js基础', 'JavaScript是什么', 'JavaScript一门解释型(不是编译型)脚本语言,它的主要特点有:面向对象,弱类型,动态,基于原型的面向对象(对象)(不基于类)', 10, '3', '2022-03-08 14:28:17', '2022-03-08 14:28:17', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082398845386753, 'js基础', '讲下js的数据类型', '基本类型: 数值(number),字符串(string),布尔值(boolean),undefined\n对象类型: 对象(Object)，数组(Array)，函数(Function)', 10, '3', '2022-03-08 14:28:27', '2022-03-08 14:28:27', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082440947810305, 'js基础', '用什么方法来判断一个对象的数据类型,怎么样去判断数组', 'typeof判断对象类型,用instanceOf判断是不是数组', 10, '3', '2022-03-08 14:28:37', '2022-03-08 14:28:37', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082479145336833, 'js基础', '分别讲下小括号,中括号,大括号,冒号在js中的作用', '1). 小括号: ()用来定义或调用一个函数\n2). 中括号运算符: [ ]用来创建一个数组/获取数组元素\n3). 大括号运算符: { }用来创建一个对象\n4). 冒号运算符: 冒号用来分隔对象的属性名和属性值', 10, '3', '2022-03-08 14:28:46', '2022-03-08 14:28:46', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082555657830401, 'js基础', '讲下函数的三种定义:\n1.function name(){}\n2. var name=function(){}\n3. var name=new Function(\"n\",\"m\",\"n+m\")', '无解析', 10, '3', '2022-03-08 14:29:05', '2022-03-08 14:29:05', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082596124475393, 'js基础', '函数的形参和实参是否可以不一样,如果不一样,通过什么调用', '可以不一样,每个函数里面都有个arguments数组类型的变量,可以拿到实参的个数', 10, '3', '2022-03-08 14:29:14', '2022-03-08 14:29:14', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082634951147522, 'js基础', '说几个系统预定义函数', 'parseInt() / parseFloat() : 将一个字符串转为数字\nisNaN() : 判断是否不是一个数值或者数值类型字符串\nencodeURI() / decodeURI(): 对字符串进行编码与解码\neval() : 将JS代码格式的字符串当作js执行\nsetInterval(callback,m)间隔多久执行一次callback函数', 10, '3', '2022-03-08 14:29:24', '2022-03-08 14:29:24', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082675015139330, 'js基础', '讲下变量的作用域', '如果在函数里面用var声明,就是局部变量,如果在函数里面不用var声明,那就是全局变量,在函数外面用var定义都是全局变量', 10, '3', '2022-03-08 14:29:33', '2022-03-08 14:29:33', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082709878194178, 'js基础', '数组有哪两种声明方式', '1.直接用[]里面包含数据声明\n2.用new Array声明', 10, '3', '2022-03-08 14:29:41', '2022-03-08 14:29:41', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082751338889218, 'js基础', '数组用什么去访问', '用下标来访问 arr[index]', 10, '3', '2022-03-08 14:29:51', '2022-03-08 14:29:51', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082802278711297, 'js基础', '对象是怎么样定义的,属性是怎么定义的', '可以用function定义一个对象,然后根据形参在里面this.x=x可以定义属性,或者可以通过动态的添加一个属性', 10, '3', '2022-03-08 14:30:03', '2022-03-08 14:30:03', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082835879280642, 'js基础', '怎么样给一个对象动态添加属性或者方法', '直接在对象上面用obj.属性=\"test\",或 obj.方法名=function(){}定义一个方法', 10, '3', '2022-03-08 14:30:12', '2022-03-08 14:30:12', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082873762234370, 'js基础', 'prototype(原型)是什么,它是怎么使用的', '每个函数都有一个prototype属性, 它是一个引用变量, 默认指向一个空Object对象 ,有备用的意思,当调用一个对象的函数或者属性的时候,如果在当前对象里面找不到,那么就到原型里面去找', 10, '3', '2022-03-08 14:30:21', '2022-03-08 14:30:21', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082911632605185, 'js基础', '什么是DOM,DOM分为那三种', 'DOM= Document Object Model，文档对象模型， DOM 是 W3C（万维网联盟）的标准。DOM 定义了访问 HTML 和 XML 文档的标准：独立于平台和语言的接口. W3C DOM 标准被分为 3 个不同的部分：\n 核心 DOM - 针对任何结构化文档的标准模型\n XML DOM - 针对 XML 文档的标准模型\n HTML DOM - 针对 HTML 文档的标准模型', 10, '3', '2022-03-08 14:30:30', '2022-03-08 14:30:30', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082945304477697, 'js基础', 'DOM中有几种类型的节点', '整个文档是一个文档节点(Document)\n每个 HTML 标签是一个元素节点(Element)\n每一个 HTML 属性是一个属性节点(Attribute)\n包含在 HTML 元素中的文本是文本节点(Text)', 10, '3', '2022-03-08 14:30:38', '2022-03-08 14:30:38', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501082988568723458, 'js基础', '讲下DOM对象的三种查询方式', 'getElementById()根据元素id来查找 ,\ngetElementsByTagName(tag):根据元素的tag名字来查找 \ngetElementsByName(name) 根据元素名字来查找', 10, '3', '2022-03-08 14:30:48', '2022-03-08 14:30:48', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083032390811649, 'js基础', '如果我在js里面访问在js下面的html的tag,用什么技术实现', '默认js都是解释性语言,js不能访问后面定义的html元素的,但在window里面有个onload函数,把代码写在下面\n函数体里面就可以 window.οnlοad=function(){}\n', 10, '3', '2022-03-08 14:30:58', '2022-03-08 14:30:58', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083257281003522, 'Java面向对象', '面向对象的优点？', '（1）提高了代码的可扩展性。\n（2）提高了代码的可维护性。\n（3）面向对象的封装，继承，多态。', 10, '3', '2022-03-08 14:31:52', '2022-03-08 14:31:52', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083324515696641, 'Java基础', '接口与抽象类的区别？', '（1）抽象类使用abstract修饰 ，接口使用interface修饰。\n（2）抽象类可以有普通方法，有抽象方法的一定要有抽象类，接口不可有有普通方法只能有抽象类。\n（3）抽象类可有有普通属性，接口只能是常量。\n（4）抽象类和接口不能实例化，就是不能new，就是不能创建对象，因为不是具体的。\n（5）抽象类有构造方法，接口没有构造方法。\n（6）抽象类只支持单继承支持多实现，接口支持多继承。', 10, '3', '2022-03-08 14:32:08', '2022-03-08 14:32:08', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083377917575169, 'Java基础', '类的组成和执行顺序?', '（1）类的组成：属性 方法 静态块 非静态块。\n（2）执行顺序：父类，子类，静态块，静态字段，非静态块，非静态字段，构造器，方法。', 10, '3', '2022-03-08 14:32:21', '2022-03-08 14:32:21', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083423190892545, 'Java面向对象', '如何理解面向对象?', '世间万物皆对象，对象有具体的的实例化,任何方法或者属性都要写在对象(类)里面，就是不断的创建对象使用对象指挥对象做事。', 10, '3', '2022-03-08 14:32:32', '2022-03-08 14:32:32', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083484729720834, 'Java基础', '构造方法可否能被重写?', '不能被重写，只有继承关系才能重写，构造方法不能被重写，但是能被重载6.String与StringBuffer,StringBuilder的区别?\n（1）String是不可变的字符串常量对象，就是字符串序列底层实现是char数组，因为是数组所以定长（一但定义长度就固定不变）。\n（2）StringBuffer线程安全的可变字符串，底层实现是一个“可变长的数组”，数据安全效率低。\n（3）StringBuilder用作替换StringBuffer，JDK1.5新增类，线程不安全的可变字符串，效率高。', 10, '3', '2022-03-08 14:32:46', '2022-03-08 14:32:46', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083570767478785, 'Java基础', '（= =）与equals（）的区别?', '（1）==：引用类型比较的是地址，基本类型比较的是值\n（2）equals:底层比较的是地址，重写equals方法比较的是内容。', 10, '3', '2022-03-08 14:33:07', '2022-03-08 14:33:07', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083619400433666, 'Java基础', '什么是拆箱和装箱?', 'JDK1.5提供了自动装箱和自动拆箱功能\n（1）装箱就是自动将基本数据类型转换为包装器类型，就是可以把一个基本类型变量直接赋值给对应得包装类型变量，或者赋值给Object变量（Object是所有类的父类，子类对象可以直接赋值给父类变量）；\n（2）拆箱就是自动将包装器类型转换为基本数据类型，允许直接把包装类对象直接赋值给一个对应的基本类型变量。', 10, '3', '2022-03-08 14:33:18', '2022-03-08 14:33:18', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083660823379969, 'Java基础', 'final类有什么特点？', '（1）final修饰的类不能被继承\n（2）final修饰的方法不能被重写\n（3）final修饰的属性不能被改变', 10, '3', '2022-03-08 14:33:28', '2022-03-08 14:33:28', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083708621668354, 'Java基础', '谈谈final，finally，finalize的区别。', '（1）final用于声明属性，方法和类，分别表示属性不可变，方法不可以覆盖，类不可继承。\n（2）finally是异常处理语句结构的一部分，表示总是执行。\n（3）finalize是Object类的一个方法，在垃圾收集器执行的时候会调用被回收对象的此方法，可以覆盖此方法提供垃圾收集时的其他资源回收，例如关闭文件等。', 10, '3', '2022-03-08 14:33:40', '2022-03-08 14:33:40', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083754406690817, 'Java基础', 'GC是什么？为什么要有GC？', 'GC是垃圾收集的意思（Gabage Collection），内存处理是编程人员容易出现问题的地方，忘记或者错误的内存回收会导致程序或系统的不稳定甚至崩溃，java提供的GC功能可以自动监测对象是否超过作用域从而达到自动回收内存的目的，java语音没有提供释放已分配内存的显示操作方法。', 10, '3', '2022-03-08 14:33:50', '2022-03-08 14:33:50', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083797163425794, 'Java基础', 'Set里的元素是不能重复的，那么用什么方法来区分重复与否，是用==还是equals()?他们有何区别？', 'Set里的元素是不能重复的，用iterator()方法来区分重复与否，equals()是判断两个的Set是否相等。\nequals()和==方法决定引用值是否指向同一对象equals()在类中被覆盖，为的是当两个分离的对象的内容和类型相配的话放回真值', 10, '3', '2022-03-08 14:34:01', '2022-03-08 14:34:01', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501083847155335170, 'Java基础', 'error和exception有什么区别？', '（1）error表示恢复不是不可能但很困难的情况下的一种严重问题，比如说内存溢出。不可能指望程序能处理这样的情况。\n（2）exception表示一种设计或实现问题。也就是说，它表示如果程序运行正常，从不会发生的情况。', 10, '3', '2022-03-08 14:34:13', '2022-03-08 14:34:13', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084055813570561, 'Java基础', 'int和Integer有什么区别？', 'java提供了两种不同的类型：引用类型和基本类型，int是java的基本类型，integer是java为int提供的包装类。', 10, '3', '2022-03-08 14:35:02', '2022-03-08 14:35:02', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084094279532545, 'Java基础', '描述一个JVM加载class文件的原理机制？', 'JVM中类的装载是由ClassLoader和它的子类来实现的，java ClassLoader是一个重要的java运行系统组件，它负责在运行时查找和装入类文件的类。', 10, '3', '2022-03-08 14:35:12', '2022-03-08 14:35:12', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084142753103874, 'Java基础', '集合和数组的区别？', '（1）数组存放基本类型和对象，集合类存放都是对象的引用，而非对象本身。\n（2）数组长度固定无法动态改变，集合类容量动态改变。\n（3）数组无法判断其中实际存有多少元素，length只是告诉了数组的长度是多少，定义了多长的长度后，即使没有存放那么多的元素，没有存放元素的空间就浪费了，而集合的size()可以知道元素的个数。\n（4）集合以类的形式存在，具有封装，继承，多态等类的特征，通过简单的方法和属性即可实现各种复杂操作，大大提高了软件的开发效率', 10, '3', '2022-03-08 14:35:23', '2022-03-08 14:35:23', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084774524338178, 'Vue', '请简述什么是Vue', 'Vue（读音/Vjuː/，类似于View）是一套用于构建用户界面的渐进式框架，与其他大型框架相比，Vue被设计为可以自底向上逐层应用。\n其他大型框架往往一开始就对项目的技术方案进行强制性的要求，而Vue更加灵活，开发者既可以选择使用Vue来开发一个全新项目，也可以将Vue引入到一个现有的项目中。\nVue；两大特点：响应式编程，组件化', 10, '3', '2022-03-08 14:37:54', '2022-03-08 14:37:54', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084823316676610, 'Vue', '请简述Vue优势有哪些？', '1.轻量级: Vue相对简单、直接，所以Vue使用起来更加友好。\n2.数据绑定: Vue是一个MVVM框架，即数据双向绑定。\n3.指令: 指令主要包括内置指令和自定义指令，以“v-”开头，作用于HTML元素。\n4.插件: 插件用于对Vue框架功能进行扩展，通过MyPlugin.install完成插件的编写，简单配置后就可以全局使用。', 10, '3', '2022-03-08 14:38:05', '2022-03-08 14:38:05', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084936046985217, 'Vue', '请列出Vue指令常用内部指令，至少6个。', 'v-model：双向数据绑定\nv-on：监听事件\nv-bind：单向数据绑定\nv-text：插入文本内容\nv-html：插入包含HTML的内容\nv-for：列表渲染\nv-if：条件渲染\nv-show：显示隐藏', 10, '3', '2022-03-08 14:38:32', '2022-03-08 14:38:32', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501084995660627970, 'Vue', '请简述什么是Vue组件化开发。', '1.在Vue中，组件是构成页面中独立结构单元，能够减少重复代码的编写。\n2.提高开发效率，降低代码之间的耦合程度，使项目更易维护和管理。\n3.组件主要以页面结构形式存在，不同组件也具有基本交互功能，根据业务逻辑实现复杂的项目功能。', 10, '3', '2022-03-08 14:38:46', '2022-03-08 14:38:46', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501085071942434818, 'Vue', '请简述什么是Vue插件，如何安装。', '插件是一个对象或函数，通过插件可以为Vue添加全局功能。\n如果是对象，必须提供install()方法，用来安装插件；\n如果插件是一个函数，则该函数将被当成install()方法。\nVue.use主要用于在Vue中安装插件', 10, '3', '2022-03-08 14:39:05', '2022-03-08 14:39:05', 1, 0);
INSERT INTO `short_answer_question` VALUES (1501085316952702978, 'Vue', '简述Vuex中的actions的含义。', 'actions 选项用来定义事件处理方法，用于处理 state 数据。actions 类似于 mutations，不同之处在于 actions 是异步执行的，事件处理函数可以接收 {commit} 对象，完成 mutation 提交，从而方便 devtools 调试工具跟踪状态的 state 变化。\n在使用时，需要在 store 仓库中注册 actions 选项，在里面定义事件处理方法。事件处理方法接收 context 作为第1个参数，payload 作为第 2 个参数（根据需要进行选择）。', 10, '3', '2022-03-08 14:40:03', '2022-03-08 14:40:03', 1, 0);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` bigint NOT NULL COMMENT 'Id，主键',
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间，自动生成',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间，自动维护',
  `version` int NULL DEFAULT NULL COMMENT '版本，随update_time动，自动维护',
  `stu_tel` bigint NULL DEFAULT NULL COMMENT '电话，通过tel登陆！',
  `stu_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱，摆设',
  `stu_institute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '废弃',
  `stu_major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业，废弃',
  `stu_identity_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份证，摆设',
  `deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除键值，需要删除用户的时候将deleted置为1 ！',
  `stu_level` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '2' COMMENT '记不得什么了，摆设',
  `stu_sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `stu_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `class_id` bigint NULL DEFAULT NULL COMMENT '班级Id',
  `stu_grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年级，摆设',
  `stu_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_academy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_pid` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1501180419028512102, '数媒1901-学生-1', '2021-12-01 18:45:45', '2021-12-01 18:45:47', 1, 18115773855, '1356768966@qq.com', '普通三本', '数媒', '320621200107288717', 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第一个诞生的学生！', '江南大学清苑78号楼', 1191190101);
INSERT INTO `student` VALUES (1501186950689030146, '数媒1901-学生-2', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 18908055566, 'cadi@live.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第2个诞生的学生!', '江南大学清苑78号楼-52', 1191190102);
INSERT INTO `student` VALUES (1501186950814859265, '数媒1901-学生-3', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 18702874445, 'c5omnx2b@ask.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第3个诞生的学生!', '江南大学清苑78号楼-53', 1191190103);
INSERT INTO `student` VALUES (1501186950814859266, '数媒1901-学生-4', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 17108070072, '7na@yahoo.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第4个诞生的学生!', '江南大学清苑78号楼-54', 1191190104);
INSERT INTO `student` VALUES (1501186950877773825, '数媒1901-学生-5', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 18808447314, 'fm610sl@163.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第5个诞生的学生!', '江南大学清苑78号楼-55', 1191190105);
INSERT INTO `student` VALUES (1501186950877773826, '数媒1901-学生-6', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 13102543083, 'ia1ham@ask.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第6个诞生的学生!', '江南大学清苑78号楼-56', 1191190106);
INSERT INTO `student` VALUES (1501186950944882690, '数媒1901-学生-7', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 17401597768, 'b0gidar@sohu.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第7个诞生的学生!', '江南大学清苑78号楼-57', 1191190107);
INSERT INTO `student` VALUES (1501186951007797250, '数媒1901-学生-8', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 15703974801, 'rou3@googlemail.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第8个诞生的学生!', '江南大学清苑78号楼-58', 1191190108);
INSERT INTO `student` VALUES (1501186951007797251, '数媒1901-学生-9', '2022-03-08 21:23:54', '2022-03-08 21:23:54', 1, 15708442821, '2jdro@live.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第9个诞生的学生!', '江南大学清苑78号楼-59', 1191190109);
INSERT INTO `student` VALUES (1501186951074906114, '数媒1901-学生-10', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 13708110288, 'nz@sina.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第10个诞生的学生!', '江南大学清苑78号楼-510', 1191190110);
INSERT INTO `student` VALUES (1501186951074906115, '数媒1901-学生-11', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 13905677646, 'zw5@live.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第11个诞生的学生!', '江南大学清苑78号楼-511', 1191190111);
INSERT INTO `student` VALUES (1501186951142014978, '数媒1901-学生-12', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15801778085, 'gp2mnb@sohu.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第12个诞生的学生!', '江南大学清苑78号楼-512', 1191190112);
INSERT INTO `student` VALUES (1501186951142014979, '数媒1901-学生-13', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 18202067493, '7ryw@126.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第13个诞生的学生!', '江南大学清苑78号楼-513', 1191190113);
INSERT INTO `student` VALUES (1501186951209123842, '数媒1901-学生-14', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15207808313, '4tvl0v@sina.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第14个诞生的学生!', '江南大学清苑78号楼-514', 1191190114);
INSERT INTO `student` VALUES (1501186951209123843, '数媒1901-学生-15', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15102072032, 'xitr2@0355.net', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第15个诞生的学生!', '江南大学清苑78号楼-515', 1191190115);
INSERT INTO `student` VALUES (1501186951276232705, '数媒1901-学生-16', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15305151571, 'gb@3721.net', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第16个诞生的学生!', '江南大学清苑78号楼-516', 1191190116);
INSERT INTO `student` VALUES (1501186951339147265, '数媒1901-学生-17', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 18904420819, 'yney4h@qq.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第17个诞生的学生!', '江南大学清苑78号楼-517', 1191190117);
INSERT INTO `student` VALUES (1501186951339147266, '数媒1901-学生-18', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 17502738767, '055w@ask.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第18个诞生的学生!', '江南大学清苑78号楼-518', 1191190118);
INSERT INTO `student` VALUES (1501186951406256130, '数媒1901-学生-19', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 17103694748, 'n9x7n@163.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第19个诞生的学生!', '江南大学清苑78号楼-519', 1191190119);
INSERT INTO `student` VALUES (1501186951406256131, '数媒1901-学生-20', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 18503611262, '863@yeah.net', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第20个诞生的学生!', '江南大学清苑78号楼-520', 1191190120);
INSERT INTO `student` VALUES (1501186951469170690, '数媒1901-学生-21', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 17706458119, '3bkvy9vg@live.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第21个诞生的学生!', '江南大学清苑78号楼-521', 1191190121);
INSERT INTO `student` VALUES (1501186951469170691, '数媒1901-学生-22', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 13400837699, '3hko3@qq.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第22个诞生的学生!', '江南大学清苑78号楼-522', 1191190122);
INSERT INTO `student` VALUES (1501186951532085250, '数媒1901-学生-23', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 18506760585, 'v77o7hk1q@qq.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第23个诞生的学生!', '江南大学清苑78号楼-523', 1191190123);
INSERT INTO `student` VALUES (1501186951532085251, '数媒1901-学生-24', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 13707127962, '06c04s2k5@3721.net', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第24个诞生的学生!', '江南大学清苑78号楼-524', 1191190124);
INSERT INTO `student` VALUES (1501186951599194113, '数媒1901-学生-25', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 17303430377, '857eawc@hotmail.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第25个诞生的学生!', '江南大学清苑78号楼-525', 1191190125);
INSERT INTO `student` VALUES (1501186951599194114, '数媒1901-学生-26', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15601403464, '35@263.net', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第26个诞生的学生!', '江南大学清苑78号楼-526', 1191190126);
INSERT INTO `student` VALUES (1501186951662108673, '数媒1901-学生-27', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15905613843, '61@ask.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第27个诞生的学生!', '江南大学清苑78号楼-527', 1191190127);
INSERT INTO `student` VALUES (1501186951662108674, '数媒1901-学生-28', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 17208503394, 'ifhav@263.net', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第28个诞生的学生!', '江南大学清苑78号楼-528', 1191190128);
INSERT INTO `student` VALUES (1501186951725023233, '数媒1901-学生-29', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 13003614694, 'a2z103@ask.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第29个诞生的学生!', '江南大学清苑78号楼-529', 1191190129);
INSERT INTO `student` VALUES (1501186951725023234, '数媒1901-学生-30', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 18704048661, 'fj5ab@163.com', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第30个诞生的学生!', '江南大学清苑78号楼-530', 1191190130);
INSERT INTO `student` VALUES (1501186951792132098, '数媒1901-学生-31', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 17506110358, 'plb@yahoo.com', '普通三本', '数媒', NULL, 0, '2', '女', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第31个诞生的学生!', '江南大学清苑78号楼-531', 1191190131);
INSERT INTO `student` VALUES (1501186951855046658, '数媒1901-学生-32', '2022-03-08 21:23:55', '2022-03-08 21:23:55', 1, 15902621776, 'smp9@263.net', '普通三本', '数媒', NULL, 0, '2', '男', '123', 1501180409038512129, '1', '江南大学', '人工智能与计算机学院', '第32个诞生的学生!', '江南大学清苑78号楼-532', 1191190132);
INSERT INTO `student` VALUES (1507170221114617857, '数媒1902-学生-2', '2022-03-25 09:39:17', '2022-03-25 09:39:17', 1, 18000843422, '45b84ifb@live.com', '普通三本', '数媒', '320621200107280002', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 2 个学生!', '江南大学清苑79号楼-42', NULL);
INSERT INTO `student` VALUES (1507170221932507138, '数媒1902-学生-3', '2022-03-25 09:39:17', '2022-03-25 09:39:17', 1, 18704652680, '6nav6o@hotmail.com', '普通三本', '数媒', '320621200107280003', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 3 个学生!', '江南大学清苑79号楼-43', NULL);
INSERT INTO `student` VALUES (1507170222125445121, '数媒1902-学生-4', '2022-03-25 09:39:17', '2022-03-25 09:39:17', 1, 13006306018, 'wfkr1rbt@126.com', '普通三本', '数媒', '320621200107280004', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 4 个学生!', '江南大学清苑79号楼-44', NULL);
INSERT INTO `student` VALUES (1507170222582624257, '数媒1902-学生-5', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 17803267814, 'fbkkobfy@ask.com', '普通三本', '数媒', '320621200107280005', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 5 个学生!', '江南大学清苑79号楼-45', NULL);
INSERT INTO `student` VALUES (1507170222779756545, '数媒1902-学生-6', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 15103918266, 'hb1pb@gmail.com', '普通三本', '数媒', '320621200107280006', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 6 个学生!', '江南大学清苑79号楼-46', NULL);
INSERT INTO `student` VALUES (1507170222981083137, '数媒1902-学生-7', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13703127179, 'w12un@sohu.com', '普通三本', '数媒', '320621200107280007', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 7 个学生!', '江南大学清苑79号楼-47', NULL);
INSERT INTO `student` VALUES (1507170223165632514, '数媒1902-学生-8', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 15002434126, 'tqf@yahoo.com.cn', '普通三本', '数媒', '320621200107280008', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 8 个学生!', '江南大学清苑79号楼-48', NULL);
INSERT INTO `student` VALUES (1507170223362764802, '数媒1902-学生-9', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13001202604, 'cbfy8b73s@126.com', '普通三本', '数媒', '320621200107280009', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 9 个学生!', '江南大学清苑79号楼-49', NULL);
INSERT INTO `student` VALUES (1507170223555702786, '数媒1902-学生-10', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 18107158598, '55kt@163.com', '普通三本', '数媒', '320621200107280010', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 10 个学生!', '江南大学清苑79号楼-410', NULL);
INSERT INTO `student` VALUES (1507170223752835073, '数媒1902-学生-11', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13906699053, '0w@gmail.com', '普通三本', '数媒', '320621200107280011', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 11 个学生!', '江南大学清苑79号楼-411', NULL);
INSERT INTO `student` VALUES (1507170224012881921, '数媒1902-学生-12', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13300808369, 'wct9b@3721.net', '普通三本', '数媒', '320621200107280012', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 12 个学生!', '江南大学清苑79号楼-412', NULL);
INSERT INTO `student` VALUES (1507170224210014210, '数媒1902-学生-13', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13208821693, 'jlmesxmb3@ask.com', '普通三本', '数媒', '320621200107280013', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 13 个学生!', '江南大学清苑79号楼-413', NULL);
INSERT INTO `student` VALUES (1507170224402952193, '数媒1902-学生-14', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 15805881265, '5lfcbl1jj@live.com', '普通三本', '数媒', '320621200107280014', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 14 个学生!', '江南大学清苑79号楼-414', NULL);
INSERT INTO `student` VALUES (1507170224600084481, '数媒1902-学生-15', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 15602591178, '1qzqjkzux@hotmail.com', '普通三本', '数媒', '320621200107280015', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 15 个学生!', '江南大学清苑79号楼-415', NULL);
INSERT INTO `student` VALUES (1507170224868519938, '数媒1902-学生-16', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13500336007, 'laadc3sb@263.net', '普通三本', '数媒', '320621200107280016', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 16 个学生!', '江南大学清苑79号楼-416', NULL);
INSERT INTO `student` VALUES (1507170225128566786, '数媒1902-学生-17', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 15902288953, '5r9p7jym@0355.net', '普通三本', '数媒', '320621200107280017', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 17 个学生!', '江南大学清苑79号楼-417', NULL);
INSERT INTO `student` VALUES (1507170225325699074, '数媒1902-学生-18', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 18808280173, 'e24d5t3@hotmail.com', '普通三本', '数媒', '320621200107280018', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 18 个学生!', '江南大学清苑79号楼-418', NULL);
INSERT INTO `student` VALUES (1507170225518637057, '数媒1902-学生-19', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 18002378876, 'in6qw3@126.com', '普通三本', '数媒', '320621200107280019', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 19 个学生!', '江南大学清苑79号楼-419', NULL);
INSERT INTO `student` VALUES (1507170225711575042, '数媒1902-学生-20', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 17300344451, '3d1qea@126.com', '普通三本', '数媒', '320621200107280020', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 20 个学生!', '江南大学清苑79号楼-420', NULL);
INSERT INTO `student` VALUES (1507170225841598465, '数媒1902-学生-21', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 13905416254, '33h2@163.net', '普通三本', '数媒', '320621200107280021', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 21 个学生!', '江南大学清苑79号楼-421', NULL);
INSERT INTO `student` VALUES (1507170225971621890, '数媒1902-学生-22', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 17800855563, 'bg1@163.com', '普通三本', '数媒', '320621200107280022', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 22 个学生!', '江南大学清苑79号楼-422', NULL);
INSERT INTO `student` VALUES (1507170226164559874, '数媒1902-学生-23', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 17103346710, 'pl@aol.com', '普通三本', '数媒', '320621200107280023', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 23 个学生!', '江南大学清苑79号楼-423', NULL);
INSERT INTO `student` VALUES (1507170226298777601, '数媒1902-学生-24', '2022-03-25 09:39:18', '2022-03-25 09:39:18', 1, 18700772472, 'pq@yahoo.com.cn', '普通三本', '数媒', '320621200107280024', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 24 个学生!', '江南大学清苑79号楼-424', NULL);
INSERT INTO `student` VALUES (1507170226491715586, '数媒1902-学生-25', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 17806135145, 'ojnouhkt@yahoo.com', '普通三本', '数媒', '320621200107280025', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 25 个学生!', '江南大学清苑79号楼-425', NULL);
INSERT INTO `student` VALUES (1507170226755956738, '数媒1902-学生-26', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 17705576042, 'uyg@qq.com', '普通三本', '数媒', '320621200107280026', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 26 个学生!', '江南大学清苑79号楼-426', NULL);
INSERT INTO `student` VALUES (1507170226953089025, '数媒1902-学生-27', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 17406286132, 'o9py59@hotmail.com', '普通三本', '数媒', '320621200107280027', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 27 个学生!', '江南大学清苑79号楼-427', NULL);
INSERT INTO `student` VALUES (1507170227150221313, '数媒1902-学生-28', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 13104055647, 'frcsvbl@3721.net', '普通三本', '数媒', '320621200107280028', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 28 个学生!', '江南大学清苑79号楼-428', NULL);
INSERT INTO `student` VALUES (1507170227338964993, '数媒1902-学生-29', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 15104315792, '6l@googlemail.com', '普通三本', '数媒', '320621200107280029', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 29 个学生!', '江南大学清苑79号楼-429', NULL);
INSERT INTO `student` VALUES (1507170227540291585, '数媒1902-学生-30', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 17706097437, 'e6hv84x@msn.com', '普通三本', '数媒', '320621200107280030', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 30 个学生!', '江南大学清苑79号楼-430', NULL);
INSERT INTO `student` VALUES (1507170227804532738, '数媒1902-学生-31', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 15306502879, 'geqb@126.com', '普通三本', '数媒', '320621200107280031', 0, '2', '女', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 31 个学生!', '江南大学清苑79号楼-431', NULL);
INSERT INTO `student` VALUES (1507170227993276418, '数媒1902-学生-32', '2022-03-25 09:39:19', '2022-03-25 09:39:19', 1, 15606251048, 'cqwy@googlemail.com', '普通三本', '数媒', '320621200107280032', 0, '2', '男', '123456', 1501180422934241281, '1', '江南大学', '人工智能与计算机学院', '这是二班第 32 个学生!', '江南大学清苑79号楼-432', NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tea_id` bigint NOT NULL COMMENT '主键',
  `tea_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `version` int NULL DEFAULT NULL,
  `tea_tel` bigint NULL DEFAULT NULL COMMENT '登陆账号',
  `tea_institute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设',
  `tea_identity_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设',
  `tea_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '摆设',
  `tea_type` int NULL DEFAULT NULL COMMENT '老师等级，也是摆设',
  `deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除，删除只需要置为1即可！！！',
  `tea_sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `tea_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `tea_role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '角色，为1，虽然是摆设但是不可以改！',
  `tea_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '老师等级（type弃用）',
  `tea_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tea_academy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tea_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tea_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2131, '老师-4', '2022-02-24 17:26:03', '2022-03-09 00:20:46', 1, 123, '本科', '44444444444444444', '444444444444@outlook.com', 2, 0, '女', '123', '1', '普通老师', '火星大学', '人工智能与计算机学院', '第七个诞生的用户！', '火星大学的地址', 1501180409038512129);
INSERT INTO `teacher` VALUES (2131231, '老师-5', '2022-02-24 17:28:11', '2022-02-24 17:28:14', 1, 2113266675, '本科', '5555555555555555555', '45555555555555@126.com', 2, 0, '女', '123', '1', '普通老师', '火星大学', '人工智能与计算机学院', '第八个诞生的用户！', '火星大学的地址', 1501180422934241281);
INSERT INTO `teacher` VALUES (6525451, 'cayon', '2021-12-01 19:45:21', '2021-12-01 19:45:24', 1, 12331212, '二流本科', '234214412421322', '12324218@qq.com', 1, 0, '男', '123', '1', '普通老师', '火星大学', '人工智能与计算机学院', '第一个诞生得用户！', '火星大学的地址', 1501180432992182274);
INSERT INTO `teacher` VALUES (12782187, '老师-2', '2022-02-24 17:23:40', '2022-02-24 17:23:43', 1, 1232131, '本科', '22222222222222222', '22222@qq.com', 2, 0, '男', '123', '1', '普通老师', '火星大学', '物联网工程学院', '第五个诞生的用户！', '火星大学的地址', 1501180441322070018);
INSERT INTO `teacher` VALUES (23412312, '老师-1', '2022-02-24 17:21:35', '2022-02-24 17:21:38', 1, 432234234, '本科', '1111111111111111111', '1111111@qq.com', 2, 0, '女', '123', '1', '普通老师', '火星大学', '人工智能与计算机学院', '第四个诞生得用户！', '火星大学的地址', 1501180450687950849);
INSERT INTO `teacher` VALUES (31312344, 'xiyeye', '2021-12-01 19:43:48', '2021-12-01 19:43:52', 1, 1234567998, '三流本科', '21312124124123', '1234567789@qq.com', 1, 0, '男', '123', '1', '普通老师', '火星大学', '人工智能与计算机学院', '第一个诞生得用户！', '火星大学的地址', 1501180459605041153);
INSERT INTO `teacher` VALUES (34233421, '老师-7', '2022-02-24 17:31:23', '2022-02-24 17:31:25', 1, 21312, '本科', '2433254514532', '6324234@126.com', 2, 0, '男', '123', '1', '普通老师', '不知道起啥名学院', '机械工程学院', '不知道起啥名学院的老师', '不知道起啥名学院的地址', 1501180468182392833);
INSERT INTO `teacher` VALUES (89877654, '老师-6', '2022-02-24 17:28:52', '2022-02-24 17:28:54', 1, 9219012089, '本科', '66666666666666666', '7823781@163.com', 2, 0, '男', '123', '1', '普通老师', '不知道起啥名学院', '数字媒体学院', '时代的眼泪了属于是', '不知道起啥名学院的地址', 1501180477372112898);
INSERT INTO `teacher` VALUES (231123321, '老师-3', '2022-02-24 17:25:37', '2022-02-24 17:25:39', 1, 13123432, '本科', '3333333333333333', '3333333@qq.com', 2, 0, '男', '123', '1', '普通老师', '火星大学', '设计学院', '第六个诞生的用户！', '火星大学的地址', 1501180491259453442);
INSERT INTO `teacher` VALUES (342141241, 'xiye0-1', '2021-12-01 19:46:06', '2021-12-01 19:46:10', 1, 6452432345, '大专', '31233212312123232', '2163892136@qq.com', 2, 0, '女', '123', '1', '普通老师', '火星大学', '人工智能与计算机学院', '第一个诞生得用户！', '火星大学的地址', 1501180911373524993);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户id,主键，字符串型',
  `user_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `user_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户秘密',
  `user_role_id` int NOT NULL COMMENT '当前用户的角色的id',
  `user_avatar` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户的头像地址',
  `user_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户的自我描述',
  `user_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户手机号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `class_id` bigint NULL DEFAULT NULL COMMENT '班级id',
  `user_identity_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_school` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_academy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_pid` bigint NULL DEFAULT NULL,
  `user_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_institute` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_username`(`user_username`) USING BTREE,
  UNIQUE INDEX `user_email`(`user_email`) USING BTREE,
  UNIQUE INDEX `user_phone`(`user_phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('79392778a90d4639a297dbd0bae0f779', 'student', '红领巾', 'YWRtaW4xMjM=', 3, 'https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg', '好好学习，天天向上', 'student@outlook.com', '17712345678', '2019-05-06 18:07:14', '2022-04-11 08:44:32', 1501180409038512129, '320621200107288701', '男', '火星大学', '人工智能与计算机学院', '火星大学的地址xx公寓xx号楼', 1191180101, '数字媒体技术', '本科');
INSERT INTO `user` VALUES ('eb04f0bdf777421ab2feec63d56f26c5', 'user_17777777777', 'user_17777777777', 'd2ZsMTIz', 3, 'http://d.lanrentuku.com/down/png/1904/business_avatar/8_avatar_2754583.png', 'welcome to online exam system', '2529121135@qq.com', '17777777777', '2022-03-28 15:25:26', '2022-04-11 08:44:51', 1501180409038512129, '320621200107288702', '男', '火星大学', '人工智能与计算机学院', '火星大学的地址xx公寓xx号楼xx-xxx', 1191180102, '数字媒体技术', '本科');

SET FOREIGN_KEY_CHECKS = 1;
