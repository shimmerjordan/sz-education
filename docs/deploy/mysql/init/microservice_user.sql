/*
 Navicat Premium Data Transfer

 Source Server         : shimmerjordan
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : microservice-user

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 17/05/2021 08:17:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` bigint NOT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attach_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件类型',
  `attach_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型 0-普通，1-头像',
  `preview_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览地址',
  `upload_type` tinyint NULL DEFAULT NULL COMMENT '上传类型',
  `creator` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------
INSERT INTO `sys_attachment` VALUES (839503846928683008, 'Ju Qiaodan.jpg', 'jpg', '77373', NULL, 'C:/attach/EXAM/1/839503846928683008', '839503846928683008', NULL, '1', NULL, NULL, 'admin', '2021-05-05 14:08:34', 'admin', '2021-05-05 14:08:34', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL COMMENT '主键',
  `dept_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `dept_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_leader` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父级部门id',
  `sort` int NULL DEFAULT NULL COMMENT '排序号',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (596290673729212416, '基础平台部', '基础平台部', '管理员', -1, 30, 'admin', '2021-02-23 14:37:56', 'admin', '2021-02-23 14:27:13', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户的IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户代理信息',
  `request_uri` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的URI',
  `method` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的方式',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作提交的数据',
  `exception` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `service_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `creator` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记',
  `application_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (805409649418440704, 0, '用户登录', '192.168.0.107', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '273', 'student', '2021-01-31 12:10:24', 'student', '2021-01-31 12:10:24', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (805450767736639488, 0, '用户登录', '192.168.0.107', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '281', 'preview', '2021-01-31 14:53:48', 'preview', '2021-01-31 14:53:48', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (805454603184377856, 0, '用户登录', '192.168.0.107', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '362', 'preview', '2021-01-31 15:09:02', 'preview', '2021-01-31 15:09:02', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (820684893783724032, 0, '注册用户', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/user/anonymousUser/register', 'POST', 'identifier=%5Bshimmerjordan%5D&email=%5Bshimmerjordan%40foxmail.com%5D&randomStr=%5B94061615708121159%5D&code=%5B3336%5D&password=%5Bshimmerjordan%5D&credential=%5Bshimmerjordan%5D', NULL, NULL, '713', 'anonymousUser', '2021-03-14 15:48:46', 'anonymousUser', '2021-03-14 15:48:46', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (820684930731347968, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '334', 'shimmerjordan', '2021-03-14 15:48:55', 'shimmerjordan', '2021-03-14 15:48:55', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (820707542933049344, 0, '用户登录', '192.168.0.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '253', 'shimmerjordan', '2021-03-14 17:18:46', 'shimmerjordan', '2021-03-14 17:18:46', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (821072284742717440, 0, '用户登录', '192.168.0.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '209', 'shimmerjordan', '2021-03-15 17:28:07', 'shimmerjordan', '2021-03-15 17:28:07', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (821340444460978176, 0, '用户登录', '192.168.0.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '158', 'shimmerjordan', '2021-03-16 11:13:42', 'shimmerjordan', '2021-03-16 11:13:42', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (821341464456990720, 0, '用户登录', '192.168.0.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '107', 'shimmerjordan', '2021-03-16 11:17:45', 'shimmerjordan', '2021-03-16 11:17:45', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (821342302827057152, 0, '用户登录', '192.168.0.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '105', 'shimmerjordan', '2021-03-16 11:21:05', 'shimmerjordan', '2021-03-16 11:21:05', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (821402900155731968, 0, '用户登录', '192.168.0.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '155', 'shimmerjordan', '2021-03-16 15:21:52', 'shimmerjordan', '2021-03-16 15:21:52', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (821410056741457920, 0, '更新用户基本信息', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/user/updateInfo', 'PUT', '', NULL, 'web_app', '96', 'shimmerjordan', '2021-03-16 15:50:19', 'shimmerjordan', '2021-03-16 15:50:19', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (829729898049441792, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '213', 'shimmerjordan', '2021-04-08 14:50:23', 'shimmerjordan', '2021-04-08 14:50:23', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (833667597747752960, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '131', 'shimmerjordan', '2021-04-19 11:37:24', 'shimmerjordan', '2021-04-19 11:37:24', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (833748808360923136, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '188', 'shimmerjordan', '2021-04-19 17:00:06', 'shimmerjordan', '2021-04-19 17:00:06', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (836230047047225344, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '268', 'shimmerjordan', '2021-04-26 13:19:40', 'shimmerjordan', '2021-04-26 13:19:40', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (836246463368531968, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '254', 'preview', '2021-04-26 14:24:54', 'preview', '2021-04-26 14:24:54', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (836246901451001856, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '153', 'admin', '2021-04-26 14:26:38', 'admin', '2021-04-26 14:26:38', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (836247357870968832, 0, '新增考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/examination/', 'POST', '', NULL, 'web_app', '96', 'admin', '2021-04-26 14:28:27', 'admin', '2021-04-26 14:28:27', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (836336943926218752, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '147', 'admin', '2021-04-26 20:24:26', 'admin', '2021-04-26 20:24:26', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838771468832739328, 0, '用户登录', '172.20.10.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '155', 'admin', '2021-05-03 13:38:22', 'admin', '2021-05-03 13:38:22', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780104854343680, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '19', 'admin', '2021-05-03 14:12:41', 'admin', '2021-05-03 14:12:41', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780257212436480, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '5', 'admin', '2021-05-03 14:13:17', 'admin', '2021-05-03 14:13:17', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780287298179072, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '7', 'admin', '2021-05-03 14:13:24', 'admin', '2021-05-03 14:13:24', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780291857387520, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '6', 'admin', '2021-05-03 14:13:25', 'admin', '2021-05-03 14:13:25', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780295976194048, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '6', 'admin', '2021-05-03 14:13:26', 'admin', '2021-05-03 14:13:26', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780301151965184, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '12', 'admin', '2021-05-03 14:13:28', 'admin', '2021-05-03 14:13:28', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838780464293613568, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '6', 'admin', '2021-05-03 14:14:06', 'admin', '2021-05-03 14:14:06', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838781435216269312, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '8', 'admin', '2021-05-03 14:17:58', 'admin', '2021-05-03 14:17:58', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838781442497581056, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '6', 'admin', '2021-05-03 14:18:00', 'admin', '2021-05-03 14:18:00', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838782014055387136, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '83', 'admin', '2021-05-03 14:20:16', 'admin', '2021-05-03 14:20:16', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838783118948306944, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '63', 'admin', '2021-05-03 14:24:39', 'admin', '2021-05-03 14:24:39', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838783126636466176, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '7', 'admin', '2021-05-03 14:24:41', 'admin', '2021-05-03 14:24:41', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838783682981531648, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '6', 'admin', '2021-05-03 14:26:54', 'admin', '2021-05-03 14:26:54', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838783922170105856, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '41', 'admin', '2021-05-03 14:27:51', 'admin', '2021-05-03 14:27:51', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838788349090205696, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '20', 'admin', '2021-05-03 14:45:26', 'admin', '2021-05-03 14:45:26', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838851637761150976, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '890', 'admin', '2021-05-03 18:56:56', 'admin', '2021-05-03 18:56:56', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838851637761150977, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '890', 'admin', '2021-05-03 18:56:56', 'admin', '2021-05-03 18:56:56', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838861991643844608, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '667', 'admin', '2021-05-03 19:38:04', 'admin', '2021-05-03 19:38:04', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838863799992848384, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '137', 'admin', '2021-05-03 19:45:15', 'admin', '2021-05-03 19:45:15', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838865087900028928, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '422', 'admin', '2021-05-03 19:50:22', 'admin', '2021-05-03 19:50:22', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838865107562926080, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '362', 'admin', '2021-05-03 19:50:27', 'admin', '2021-05-03 19:50:27', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838866253509693440, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '865', 'admin', '2021-05-03 19:55:00', 'admin', '2021-05-03 19:55:00', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838868159434985472, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '1036', 'admin', '2021-05-03 20:02:35', 'admin', '2021-05-03 20:02:35', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838868216578183168, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '250', 'admin', '2021-05-03 20:02:48', 'admin', '2021-05-03 20:02:48', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838868237109301248, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '256', 'admin', '2021-05-03 20:02:53', 'admin', '2021-05-03 20:02:53', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838871120252899328, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '203', 'admin', '2021-05-03 20:14:21', 'admin', '2021-05-03 20:14:21', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838881907948261376, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '257', 'admin', '2021-05-03 20:57:13', 'admin', '2021-05-03 20:57:13', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838882919459196928, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '561', 'admin', '2021-05-03 21:01:14', 'admin', '2021-05-03 21:01:14', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838907881406468096, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '510', 'admin', '2021-05-03 22:40:25', 'admin', '2021-05-03 22:40:25', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838911980537516032, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '649', 'admin', '2021-05-03 22:56:42', 'admin', '2021-05-03 22:56:42', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838914508356456448, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '259', 'admin', '2021-05-03 23:06:45', 'admin', '2021-05-03 23:06:45', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (838915147417391104, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '223', 'admin', '2021-05-03 23:09:17', 'admin', '2021-05-03 23:09:17', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839270584373350400, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '875', 'admin', '2021-05-04 22:41:40', 'admin', '2021-05-04 22:41:40', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839271020283170816, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '89', 'admin', '2021-05-04 22:43:24', 'admin', '2021-05-04 22:43:24', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839271884011999232, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '262', 'admin', '2021-05-04 22:46:50', 'admin', '2021-05-04 22:46:50', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839272547240513536, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '392', 'admin', '2021-05-04 22:49:28', 'admin', '2021-05-04 22:49:28', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839299111760039936, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '222', 'admin', '2021-05-05 00:35:02', 'admin', '2021-05-05 00:35:02', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839299575117385728, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '997', 'admin', '2021-05-05 00:36:52', 'admin', '2021-05-05 00:36:52', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839299594650259456, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '62', 'admin', '2021-05-05 00:36:57', 'admin', '2021-05-05 00:36:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839299717669195776, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '613', 'admin', '2021-05-05 00:37:26', 'admin', '2021-05-05 00:37:26', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839301375467851776, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '668', 'admin', '2021-05-05 00:44:01', 'admin', '2021-05-05 00:44:01', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839301414374215680, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '374', 'admin', '2021-05-05 00:44:11', 'admin', '2021-05-05 00:44:11', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839302724876111872, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '183', 'admin', '2021-05-05 00:49:23', 'admin', '2021-05-05 00:49:23', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839302792710590464, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '23', 'admin', '2021-05-05 00:49:39', 'admin', '2021-05-05 00:49:39', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839302999703687168, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '684', 'admin', '2021-05-05 00:50:29', 'admin', '2021-05-05 00:50:29', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839303095774220288, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '71', 'admin', '2021-05-05 00:50:52', 'admin', '2021-05-05 00:50:52', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839303103911170048, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '63', 'admin', '2021-05-05 00:50:53', 'admin', '2021-05-05 00:50:53', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839303112551436288, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '422', 'admin', '2021-05-05 00:50:56', 'admin', '2021-05-05 00:50:56', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839475876264546304, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '507', 'admin', '2021-05-05 12:17:26', 'admin', '2021-05-05 12:17:26', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839475960544890880, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '176', 'admin', '2021-05-05 12:17:46', 'admin', '2021-05-05 12:17:46', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839475982036504576, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '173', 'admin', '2021-05-05 12:17:51', 'admin', '2021-05-05 12:17:51', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839475990366392320, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '693', 'admin', '2021-05-05 12:17:53', 'admin', '2021-05-05 12:17:53', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839475996469104640, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '329', 'admin', '2021-05-05 12:17:54', 'admin', '2021-05-05 12:17:54', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839475999463837696, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '22', 'admin', '2021-05-05 12:17:55', 'admin', '2021-05-05 12:17:55', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839476006380244992, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '325', 'admin', '2021-05-05 12:17:57', 'admin', '2021-05-05 12:17:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839476011371466752, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '99', 'admin', '2021-05-05 12:17:58', 'admin', '2021-05-05 12:17:58', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839476017327378432, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '121', 'admin', '2021-05-05 12:17:59', 'admin', '2021-05-05 12:17:59', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839476020275974144, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '62', 'admin', '2021-05-05 12:18:00', 'admin', '2021-05-05 12:18:00', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839476039813042176, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '368', 'admin', '2021-05-05 12:18:05', 'admin', '2021-05-05 12:18:05', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839476304775614464, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '173', 'admin', '2021-05-05 12:19:08', 'admin', '2021-05-05 12:19:08', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839477775848050688, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '733', 'admin', '2021-05-05 12:24:59', 'admin', '2021-05-05 12:24:59', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839480685138939904, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '494', 'admin', '2021-05-05 12:36:32', 'admin', '2021-05-05 12:36:32', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839481292562239488, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '247', 'admin', '2021-05-05 12:38:57', 'admin', '2021-05-05 12:38:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839481883174768640, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '534', 'admin', '2021-05-05 12:41:18', 'admin', '2021-05-05 12:41:18', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839483944461275136, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '657', 'admin', '2021-05-05 12:49:29', 'admin', '2021-05-05 12:49:29', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839484049843163136, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '8', 'admin', '2021-05-05 12:49:54', 'admin', '2021-05-05 12:49:54', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839484318039543808, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '152', 'admin', '2021-05-05 12:50:58', 'admin', '2021-05-05 12:50:58', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839484538253086720, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '111', 'admin', '2021-05-05 12:51:51', 'admin', '2021-05-05 12:51:51', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839484562315808768, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '119', 'admin', '2021-05-05 12:51:57', 'admin', '2021-05-05 12:51:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839484968936804352, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '447', 'admin', '2021-05-05 12:53:33', 'admin', '2021-05-05 12:53:33', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839486457700814848, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '162', 'admin', '2021-05-05 12:59:28', 'admin', '2021-05-05 12:59:28', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839486468899606528, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '350', 'admin', '2021-05-05 12:59:31', 'admin', '2021-05-05 12:59:31', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839487075752480768, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '152', 'admin', '2021-05-05 13:01:56', 'admin', '2021-05-05 13:01:56', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839487081507065856, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '65', 'admin', '2021-05-05 13:01:57', 'admin', '2021-05-05 13:01:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839487088163426304, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '388', 'admin', '2021-05-05 13:01:59', 'admin', '2021-05-05 13:01:59', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839487757154914304, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '465', 'admin', '2021-05-05 13:04:38', 'admin', '2021-05-05 13:04:38', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839489960255033344, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '84', 'admin', '2021-05-05 13:13:23', 'admin', '2021-05-05 13:13:23', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839489975258058752, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '452', 'admin', '2021-05-05 13:13:27', 'admin', '2021-05-05 13:13:27', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491494518853632, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '511', 'admin', '2021-05-05 13:19:29', 'admin', '2021-05-05 13:19:29', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491502920044544, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '16', 'admin', '2021-05-05 13:19:31', 'admin', '2021-05-05 13:19:31', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491507680579584, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '60', 'admin', '2021-05-05 13:19:32', 'admin', '2021-05-05 13:19:32', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491510910193664, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '53', 'admin', '2021-05-05 13:19:33', 'admin', '2021-05-05 13:19:33', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491515754614784, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '124', 'admin', '2021-05-05 13:19:34', 'admin', '2021-05-05 13:19:34', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491517944041472, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '38', 'admin', '2021-05-05 13:19:35', 'admin', '2021-05-05 13:19:35', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491522582941696, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '146', 'admin', '2021-05-05 13:19:36', 'admin', '2021-05-05 13:19:36', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491524499738624, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '119', 'admin', '2021-05-05 13:19:36', 'admin', '2021-05-05 13:19:36', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491528270417920, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '15', 'admin', '2021-05-05 13:19:37', 'admin', '2021-05-05 13:19:37', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839491651046084608, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '74', 'admin', '2021-05-05 13:20:07', 'admin', '2021-05-05 13:20:07', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494196757925888, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '34', 'admin', '2021-05-05 13:30:14', 'admin', '2021-05-05 13:30:14', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494423388753920, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '136', 'admin', '2021-05-05 13:31:08', 'admin', '2021-05-05 13:31:08', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494429139144704, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '79', 'admin', '2021-05-05 13:31:09', 'admin', '2021-05-05 13:31:09', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494433035653120, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '114', 'admin', '2021-05-05 13:31:10', 'admin', '2021-05-05 13:31:10', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494436944744448, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '21', 'admin', '2021-05-05 13:31:11', 'admin', '2021-05-05 13:31:11', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494439922700288, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '104', 'admin', '2021-05-05 13:31:12', 'admin', '2021-05-05 13:31:12', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494446809747456, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '115', 'admin', '2021-05-05 13:31:13', 'admin', '2021-05-05 13:31:13', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494450114859008, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '320', 'admin', '2021-05-05 13:31:14', 'admin', '2021-05-05 13:31:14', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494453805846528, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '23', 'admin', '2021-05-05 13:31:15', 'admin', '2021-05-05 13:31:15', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494456645390336, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '104', 'admin', '2021-05-05 13:31:16', 'admin', '2021-05-05 13:31:16', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494461745664000, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '104', 'admin', '2021-05-05 13:31:17', 'admin', '2021-05-05 13:31:17', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494463071064064, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '105', 'admin', '2021-05-05 13:31:17', 'admin', '2021-05-05 13:31:17', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494468251029504, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '15', 'admin', '2021-05-05 13:31:18', 'admin', '2021-05-05 13:31:18', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839494470763417600, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '92', 'admin', '2021-05-05 13:31:19', 'admin', '2021-05-05 13:31:19', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496740116762624, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '74', 'admin', '2021-05-05 13:40:20', 'admin', '2021-05-05 13:40:20', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496801601064960, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '217', 'admin', '2021-05-05 13:40:35', 'admin', '2021-05-05 13:40:35', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496812787273728, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '156', 'admin', '2021-05-05 13:40:37', 'admin', '2021-05-05 13:40:37', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496816826388480, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '44', 'admin', '2021-05-05 13:40:38', 'admin', '2021-05-05 13:40:38', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496822404812800, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '110', 'admin', '2021-05-05 13:40:40', 'admin', '2021-05-05 13:40:40', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496825319854080, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '61', 'admin', '2021-05-05 13:40:40', 'admin', '2021-05-05 13:40:40', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496829237334016, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '29', 'admin', '2021-05-05 13:40:41', 'admin', '2021-05-05 13:40:41', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496831489675264, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '32', 'admin', '2021-05-05 13:40:42', 'admin', '2021-05-05 13:40:42', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496835881111552, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '112', 'admin', '2021-05-05 13:40:43', 'admin', '2021-05-05 13:40:43', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496837453975552, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '48', 'admin', '2021-05-05 13:40:43', 'admin', '2021-05-05 13:40:43', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496841111408640, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '14', 'admin', '2021-05-05 13:40:44', 'admin', '2021-05-05 13:40:44', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496842675884032, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '105', 'admin', '2021-05-05 13:40:44', 'admin', '2021-05-05 13:40:44', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496846526255104, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '38', 'admin', '2021-05-05 13:40:45', 'admin', '2021-05-05 13:40:45', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496847444807680, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '8', 'admin', '2021-05-05 13:40:46', 'admin', '2021-05-05 13:40:46', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839496853400719360, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '22', 'admin', '2021-05-05 13:40:47', 'admin', '2021-05-05 13:40:47', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839497325687738368, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '122', 'admin', '2021-05-05 13:42:40', 'admin', '2021-05-05 13:42:40', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839497756845412352, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '53', 'admin', '2021-05-05 13:44:22', 'admin', '2021-05-05 13:44:22', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839497814449983488, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '149', 'admin', '2021-05-05 13:44:36', 'admin', '2021-05-05 13:44:36', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839498129635151872, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '145', 'admin', '2021-05-05 13:45:51', 'admin', '2021-05-05 13:45:51', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839498640371355648, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '235', 'admin', '2021-05-05 13:47:53', 'admin', '2021-05-05 13:47:53', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839500240162787328, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '404', 'admin', '2021-05-05 13:54:14', 'admin', '2021-05-05 13:54:14', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839502654240591872, 0, '自动组卷Auto1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/Auto1/836247357539618816', 'POST', '', NULL, 'web_app', '489', 'admin', '2021-05-05 14:03:50', 'admin', '2021-05-05 14:03:50', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839503821205016576, 0, '更新用户基本信息', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/user/updateInfo', 'PUT', '', NULL, 'web_app', '58', 'admin', '2021-05-05 14:08:28', 'admin', '2021-05-05 14:08:28', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839503847318753280, 0, '上传文件', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/attachment/upload', 'POST', 'busiType=%5B1%5D', NULL, 'web_app', '109', 'admin', '2021-05-05 14:08:34', 'admin', '2021-05-05 14:08:34', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839503849298464768, 0, '更新用户头像', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/user/updateAvatar', 'PUT', '', NULL, 'web_app', '82', 'admin', '2021-05-05 14:08:35', 'admin', '2021-05-05 14:08:35', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839503856063877120, 0, '更新用户基本信息', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/user/updateInfo', 'PUT', '', NULL, 'web_app', '52', 'admin', '2021-05-05 14:08:37', 'admin', '2021-05-05 14:08:37', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (839503936586125312, 0, '更新用户基本信息', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/user/updateInfo', 'PUT', '', NULL, 'web_app', '76', 'admin', '2021-05-05 14:08:56', 'admin', '2021-05-05 14:08:56', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840305837456101376, 0, '用户登录', '192.168.43.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '283', 'admin', '2021-05-07 19:15:24', 'admin', '2021-05-07 19:15:24', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840319400149127168, 0, '更新知识', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/knowledge/', 'PUT', '', NULL, 'web_app', '549', 'admin', '2021-05-07 20:09:17', 'admin', '2021-05-07 20:09:17', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840319414309097472, 0, '更新知识', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/knowledge/', 'PUT', '', NULL, 'web_app', '273', 'admin', '2021-05-07 20:09:21', 'admin', '2021-05-07 20:09:21', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840336576943886336, 0, '批量删除题目', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/subject/deleteAll', 'POST', '', NULL, 'web_app', '317', 'admin', '2021-05-07 21:17:33', 'admin', '2021-05-07 21:17:33', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840340905000046592, 0, '用户登录', '192.168.43.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '188', 'shimmerjordan', '2021-05-07 21:34:45', 'shimmerjordan', '2021-05-07 21:34:45', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840341988766257152, 0, '更新考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examination/', 'PUT', '', NULL, 'web_app', '175', 'admin', '2021-05-07 21:39:03', 'admin', '2021-05-07 21:39:03', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (840342040016457728, 0, '开始考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '/v1/examRecord/start', 'POST', '', NULL, 'web_app', '258', 'shimmerjordan', '2021-05-07 21:39:15', 'shimmerjordan', '2021-05-07 21:39:15', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843244436052905984, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '243', 'teacher', '2021-05-15 21:52:20', 'teacher', '2021-05-15 21:52:20', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843587580544028672, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '221', 'teacher', '2021-05-16 20:35:52', 'teacher', '2021-05-16 20:35:52', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843588112356610048, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '123', 'shimmerjordan', '2021-05-16 20:37:59', 'shimmerjordan', '2021-05-16 20:37:59', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843588207693139968, 0, '开始考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/examRecord/start', 'POST', '', NULL, 'web_app', '226', 'shimmerjordan', '2021-05-16 20:38:22', 'shimmerjordan', '2021-05-16 20:38:22', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843589078896218112, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '143', 'admin', '2021-05-16 20:41:50', 'admin', '2021-05-16 20:41:50', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843593007423950848, 0, '批改答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/mark', 'PUT', '', NULL, 'web_app', '49', 'admin', '2021-05-16 20:57:26', 'admin', '2021-05-16 20:57:26', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843595889925820416, 0, '用户登录', '172.22.108.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/oauth/token', 'POST', NULL, NULL, 'auth-service', '109', 'shimmerjordan', '2021-05-16 21:08:53', 'shimmerjordan', '2021-05-16 21:08:53', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596118813184000, 0, '开始考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/examRecord/start', 'POST', '', NULL, 'web_app', '104', 'shimmerjordan', '2021-05-16 21:09:48', 'shimmerjordan', '2021-05-16 21:09:48', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596751691714560, 0, '批改答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/mark', 'PUT', '', NULL, 'web_app', '207', 'admin', '2021-05-16 21:12:19', 'admin', '2021-05-16 21:12:19', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596759392456704, 0, '批改答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/mark', 'PUT', '', NULL, 'web_app', '103', 'admin', '2021-05-16 21:12:21', 'admin', '2021-05-16 21:12:21', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596847179239424, 0, '批改答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/mark', 'PUT', '', NULL, 'web_app', '40', 'admin', '2021-05-16 21:12:42', 'admin', '2021-05-16 21:12:42', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596863935483904, 0, '批改答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/mark', 'PUT', '', NULL, 'web_app', '74', 'admin', '2021-05-16 21:12:46', 'admin', '2021-05-16 21:12:46', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596872097599488, 0, '批改答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/mark', 'PUT', '', NULL, 'web_app', '150', 'admin', '2021-05-16 21:12:48', 'admin', '2021-05-16 21:12:48', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596904397934592, 0, '开始考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/examRecord/start', 'POST', '', NULL, 'web_app', '103', 'shimmerjordan', '2021-05-16 21:12:55', 'shimmerjordan', '2021-05-16 21:12:55', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843596919388377088, 0, '提交答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/submit', 'POST', '', NULL, 'web_app', '287', 'shimmerjordan', '2021-05-16 21:12:59', 'shimmerjordan', '2021-05-16 21:12:59', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843597030424186880, 0, '开始考试', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/examRecord/start', 'POST', '', NULL, 'web_app', '76', 'shimmerjordan', '2021-05-16 21:13:25', 'shimmerjordan', '2021-05-16 21:13:25', 0, 'EXAM', 'gitee');
INSERT INTO `sys_log` VALUES (843597189371531264, 0, '提交答题', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/v1/answer/submit', 'POST', '', NULL, 'web_app', '92', 'shimmerjordan', '2021-05-16 21:14:03', 'shimmerjordan', '2021-05-16 21:14:03', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `data_level` int NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('571348650370928640', '个人管理', 'personal', '/api/user/v1/personal/**', '-1', 'user', '30', '0', 1, 'admin', '2021-04-26 14:55:33', 'admin', '2021-02-22 13:03:09', '0', 'EXAM', 'Layout', '/personal', NULL, '个人管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571349816924311552', '个人资料', 'personal:message', '/api/user/v1/user/updateInfo', '571348650370928640', '', '29', '0', 1, 'admin', '2021-04-26 15:00:11', 'admin', '2021-04-26 15:00:11', '0', 'EXAM', 'views/personal/message', 'message', NULL, '个人资料', 'gitee');
INSERT INTO `sys_menu` VALUES ('571350099653955584', '修改密码', 'personal:password', '/api/user/v1/user/updateInfo', '571348650370928640', '', '30', '0', 1, 'admin', '2021-04-26 15:01:18', 'admin', '2021-04-26 15:01:18', '0', 'EXAM', 'views/personal/password', 'password', NULL, '修改密码', 'gitee');
INSERT INTO `sys_menu` VALUES ('571351763521769472', '附件管理', 'attachment', '/api/user/v1/attachment/**', '-1', 'documentation', '10', '0', 1, 'admin', '2021-04-26 15:07:55', 'admin', '2021-02-22 13:02:22', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571352087896657920', '附件列表', 'attachment:list', '/api/user/v1/attachment/list', '571351763521769472', '', '30', '0', 1, 'admin', '2021-04-26 15:09:12', 'admin', '2021-04-26 15:09:12', '0', 'EXAM', 'views/attachment/list', 'list', NULL, '附件列表', 'gitee');
INSERT INTO `sys_menu` VALUES ('571352797233156096', '考务管理', 'exam', '/api/exam/**', '-1', 'nested', '8', '0', 1, 'admin', '2021-04-26 15:12:02', 'admin', '2021-05-23 21:28:32', '0', 'EXAM', 'Layout', '/exam', NULL, '考务管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353230286655488', '课程管理', 'exam:course', '/api/exam/v1/course/**', '571352797233156096', '', '1', '0', 1, 'admin', '2021-04-26 15:13:45', 'admin', '2021-04-26 15:13:45', '0', 'EXAM', 'views/exam/course', 'course', NULL, '课程管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353525381107712', '考试管理', 'exam:exam', '/api/exam/v1/examination/**', '571352797233156096', '', '2', '0', 1, 'admin', '2021-04-26 15:14:55', 'admin', '2021-04-26 15:14:55', '0', 'EXAM', 'views/exam/exam', 'exam', NULL, '考试管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571353992756596736', '题库管理', 'exam:subject', '/api/exam/v1/subject/**', '571352797233156096', '', '3', '0', 1, 'admin', '2021-04-26 15:16:47', 'admin', '2021-04-26 15:16:47', '0', 'EXAM', 'views/exam/subject', 'subject', NULL, '题库管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571354428217626624', '成绩管理', 'exam:examRecord', '/api/exam/v1/examRecord/**', '571352797233156096', '', '4', '0', 1, 'admin', '2021-04-26 15:18:30', 'admin', '2021-04-26 15:18:30', '0', 'EXAM', 'views/exam/examRecord', 'score', NULL, '成绩管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571354823258148864', '知识库', 'exam:knowledge', '/api/exam/v1/knowledge/**', '571352797233156096', '', '5', '0', 1, 'admin', '2021-04-26 15:20:05', 'admin', '2021-04-26 15:20:05', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', NULL, '知识库', 'gitee');
INSERT INTO `sys_menu` VALUES ('571355240792723456', '新增课程', 'exam:course:add', NULL, '571353230286655488', '', '1', '1', 1, 'admin', '2021-04-26 15:21:44', 'admin', '2021-04-26 15:21:44', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355418715099136', '修改课程', 'exam:course:edit', NULL, '571353230286655488', '', '2', '1', 1, 'admin', '2021-04-26 15:22:27', 'admin', '2021-04-26 15:22:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355486121758720', '删除课程', 'exam:course:del', NULL, '571353230286655488', '', '3', '1', 1, 'admin', '2021-04-26 15:22:43', 'admin', '2021-04-26 15:22:43', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355686403969024', '新增考试', 'exam:exam:add', NULL, '571353525381107712', '', '1', '1', 1, 'admin', '2021-04-26 15:23:30', 'admin', '2021-04-26 15:23:30', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355830226653184', '修改课程', 'exam:exam:edit', NULL, '571353525381107712', '', '2', '1', 1, 'admin', '2021-04-26 15:24:05', 'admin', '2021-04-26 15:24:05', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571355921259827200', '删除考试', 'exam:exam:del', NULL, '571353525381107712', '', '3', '1', 1, 'admin', '2021-04-26 15:24:26', 'admin', '2021-04-26 15:24:26', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356206782877696', '题目管理', 'exam:exam:subject', NULL, '571353525381107712', '', '4', '1', 1, 'admin', '2021-04-26 15:25:34', 'admin', '2021-04-26 15:25:34', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356537642160128', '导出题目', 'exam:exam:subject:export', NULL, '571353525381107712', '', '5', '1', 1, 'admin', '2021-04-26 15:26:53', 'admin', '2021-04-26 15:27:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571356877741494272', '导入题目', 'exam:exam:subject:import', NULL, '571353525381107712', '', '6', '1', 1, 'admin', '2021-04-26 15:28:14', 'admin', '2021-04-26 15:28:14', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357072436891648', '新增题目', 'exam:exam:subject:add', NULL, '571353525381107712', '', '7', '1', 1, 'admin', '2021-04-26 15:29:01', 'admin', '2021-04-26 15:29:01', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357235276550144', '删除题目', 'exam:exam:subject:del', NULL, '571353525381107712', '', '8', '1', 1, 'admin', '2021-04-26 15:29:40', 'admin', '2021-04-26 15:29:40', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357509638557696', '新增题目', 'exam:subject:bank:add', NULL, '571353992756596736', '', '1', '1', 1, 'admin', '2021-04-26 15:30:45', 'admin', '2021-04-26 15:30:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357821778661376', '修改题目', 'exam:subject:bank:edit', NULL, '571353992756596736', '', '2', '1', 1, 'admin', '2021-04-26 15:32:00', 'admin', '2021-04-26 15:32:00', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571357937931522048', '删除题目', 'exam:subject:bank:del', NULL, '571353992756596736', '', '3', '1', 1, 'admin', '2021-04-26 15:32:27', 'admin', '2021-04-26 17:41:21', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358188264361984', '新增题目分类', 'exam:subject:category:add', NULL, '571353992756596736', '', '4', '1', 1, 'admin', '2021-04-26 15:33:27', 'admin', '2021-04-26 15:33:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358308477308928', '修改题目分类', 'exam:subject:category:edit', NULL, '571353992756596736', '', '5', '1', 1, 'admin', '2021-04-26 15:33:56', 'admin', '2021-04-26 15:33:56', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358407353831424', '删除题目分类', 'exam:subject:category:del', NULL, '571353992756596736', '', '6', '1', 1, 'admin', '2021-04-26 15:34:19', 'admin', '2021-04-26 15:34:19', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358617991778304', '导入题目', 'exam:subject:bank:import', NULL, '571353992756596736', '', '7', '1', 1, 'admin', '2021-04-26 15:35:09', 'admin', '2021-04-26 15:35:09', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571358928483520512', '导出题目', 'exam:subject:bank:export', NULL, '571353992756596736', '', '8', '1', 1, 'admin', '2021-04-26 15:36:23', 'admin', '2021-04-26 15:36:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571359163205160960', '导出成绩', 'exam:examRecord:export', NULL, '571354428217626624', '', '30', '1', 1, 'admin', '2021-04-26 15:37:19', 'admin', '2021-04-26 15:37:19', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571361163502292992', '系统监控', 'sys', '/api/monitor/**', '-1', 'monitoring', '7', '0', 1, 'admin', '2021-04-26 15:45:16', 'admin', '2021-02-22 13:01:08', '0', 'EXAM', 'Layout', '/monitor', NULL, '系统监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571361526066319360', '日志监控', 'monitor:log', '/api/user/v1/log/**', '571361163502292992', '', '30', '0', 1, 'admin', '2021-04-26 15:46:43', 'admin', '2021-04-26 15:46:43', '0', 'EXAM', 'views/monitor/log', 'log', NULL, '日志监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571361746552492032', 'consul监控', 'monitor:service', '/api/monitor/service/**', '571361163502292992', '', '31', '0', 1, 'admin', '2021-04-26 15:47:35', 'admin', '2021-02-23 16:20:39', '0', 'EXAM', NULL, 'http://localhost:8500/ui', NULL, 'consul监控', 'gitee');
INSERT INTO `sys_menu` VALUES ('571362994005610496', 'zipkin监控', 'monitor:link', '/api/monitor/**', '571361163502292992', '', '32', '0', 1, 'admin', '2021-04-26 15:52:33', 'admin', '2021-02-23 16:18:46', '0', 'EXAM', NULL, 'http://localhost:9411', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571363268497641472', '服务监控', 'monitor:admin', '/api/monitor/**', '571361163502292992', '', '33', '0', 1, 'admin', '2021-04-26 15:53:38', 'admin', '2021-02-23 16:20:24', '0', 'EXAM', NULL, 'http://localhost:9186/', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571363537549660160', '接口文档', 'monitor:document', '/api/monitor/**', '571361163502292992', '', '34', '0', 1, 'admin', '2021-04-26 15:54:42', 'admin', '2021-02-23 16:19:58', '0', 'EXAM', NULL, 'http://localhost:9180/swagger-ui.html?urls.primaryName=user-service/', NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571364115214372864', '删除日志', 'monitor:log:del', NULL, '571361526066319360', '', '30', '1', 1, 'admin', '2021-04-26 15:57:00', 'admin', '2021-04-26 15:57:00', '0', 'EXAM', NULL, NULL, NULL, '删除日志', 'gitee');
INSERT INTO `sys_menu` VALUES ('571365178965364736', '首页', 'dashboard', '/', '-1', 'dashboard', '0', '0', 1, 'admin', '2021-04-26 16:01:14', 'admin', '2021-04-05 19:47:03', '0', 'EXAM', 'Layout', 'dashboard', NULL, '首页', 'gitee');
INSERT INTO `sys_menu` VALUES ('571367565360762880', '系统管理', 'sys', '/api/user/v1/**', '-1', 'component', '1', '0', 1, 'admin', '2021-04-26 16:10:43', 'admin', '2021-05-23 21:52:26', '0', 'EXAM', 'Layout', '/sys', NULL, '系统管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571367969767165952', '用户管理', 'sys:user', '/api/user/v1/user/**', '571367565360762880', '', '2', '0', 1, 'admin', '2021-04-26 16:12:19', 'admin', '2021-04-26 16:12:19', '0', 'EXAM', 'views/sys/user', 'user', NULL, '用户管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571368181252362240', '部门管理', 'sys:dept', '/api/user/v1/dept/**', '571367565360762880', '', '8', '0', 1, 'admin', '2021-04-26 16:13:09', 'admin', '2021-04-26 16:13:09', '0', 'EXAM', 'views/sys/dept', 'dept', NULL, '部门管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571368627413061632', '角色管理', 'sys:role', '/api/user/v1/role/**', '571367565360762880', '', '9', '0', 1, 'admin', '2021-04-26 16:14:56', 'admin', '2021-04-26 16:14:56', '0', 'EXAM', 'views/sys/role', 'role', NULL, '角色管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369094226513920', '菜单管理', 'sys:menu', '/api/user/v1/menu/**', '571367565360762880', '', '10', '0', 1, 'admin', '2021-04-26 16:16:47', 'admin', '2021-04-26 16:16:47', '0', 'EXAM', 'views/sys/menu', 'menu', NULL, '菜单管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369709904203776', '终端管理', 'sys:client', '/api/user/v1/client/**', '581237996276289536', '', '11', '0', 1, 'admin', '2021-04-26 16:19:14', 'admin', '2021-04-26 16:19:14', '0', 'EXAM', 'views/sys/client', 'client', NULL, '终端管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571369965811273728', '路由管理', 'sys:route', '/api/user/route/**', '581237996276289536', '', '12', '0', 1, 'admin', '2021-04-26 16:20:15', 'admin', '2021-04-26 16:20:15', '0', 'EXAM', 'views/sys/route', 'route', NULL, '路由管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('571371375550402560', '新增用户', 'sys:user:add', NULL, '571367969767165952', '', '1', '1', 1, 'admin', '2021-04-26 16:25:51', 'admin', '2021-07-04 10:50:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371477828505600', '删除用户', 'sys:user:del', NULL, '571367969767165952', '', '2', '1', 1, 'admin', '2021-04-26 16:26:15', 'admin', '2021-04-26 16:26:15', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371606652358656', '修改用户', 'sys:user:edit', NULL, '571367969767165952', '', '3', '1', 1, 'admin', '2021-04-26 16:26:46', 'admin', '2021-04-26 16:26:46', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371699010932736', '导出用户', 'sys:user:export', NULL, '571367969767165952', '', '4', '1', 1, 'admin', '2021-04-26 16:27:08', 'admin', '2021-04-26 16:27:08', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571371773073952768', '导入用户', 'sys:user:import', NULL, '571367969767165952', '', '5', '1', 1, 'admin', '2021-04-26 16:27:26', 'admin', '2021-04-26 16:27:26', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372425787346944', '新增部门', 'sys:dept:add', NULL, '571368181252362240', '', '1', '1', 1, 'admin', '2021-04-26 16:30:01', 'admin', '2021-04-26 16:30:01', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372559308820480', '修改部门', 'sys:dept:edit', NULL, '571368181252362240', '', '2', '1', 1, 'admin', '2021-04-26 16:30:33', 'admin', '2021-04-26 16:30:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571372707153842176', '删除部门', 'sys:dept:del', NULL, '571368181252362240', '', '3', '1', 1, 'admin', '2021-04-26 16:31:08', 'admin', '2021-04-26 17:41:02', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373219269971968', '新增角色', 'sys:role:add', NULL, '571368627413061632', '', '1', '1', 1, 'admin', '2021-04-26 16:33:11', 'admin', '2021-04-26 16:33:11', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373292582211584', '修改角色', 'sys:role:edit', NULL, '571368627413061632', '', '2', '1', 1, 'admin', '2021-04-26 16:33:28', 'admin', '2021-04-26 16:33:28', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373363046518784', '删除角色', 'sys:role:del', NULL, '571368627413061632', '', '3', '1', 1, 'admin', '2021-04-26 16:33:45', 'admin', '2021-04-26 16:33:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373478440210432', '分配权限', 'sys:role:auth', NULL, '571368627413061632', '', '4', '1', 1, 'admin', '2021-04-26 16:34:12', 'admin', '2021-04-26 16:34:12', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373881496047616', '新增菜单', 'sys:menu:add', NULL, '571369094226513920', '', '1', '1', 1, 'admin', '2021-04-26 16:35:48', 'admin', '2021-04-26 16:35:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571373962609692672', '修改菜单', 'sys:menu:edit', NULL, '571369094226513920', '', '2', '1', 1, 'admin', '2021-04-26 16:36:08', 'admin', '2021-04-26 16:36:08', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374025859796992', '删除菜单', 'sys:menu:del', NULL, '571369094226513920', '', '3', '1', 1, 'admin', '2021-04-26 16:36:23', 'admin', '2021-04-26 16:36:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374113881460736', '导入菜单', 'sys:menu:import', NULL, '571369094226513920', '', '4', '1', 1, 'admin', '2021-04-26 16:36:44', 'admin', '2021-04-26 16:36:44', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374178956087296', '导出菜单', 'sys:menu:export', NULL, '571369094226513920', '', '5', '1', 1, 'admin', '2021-04-26 16:36:59', 'admin', '2021-04-26 16:36:59', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374593844056064', '新增终端', 'sys:client:add', NULL, '571369709904203776', '', '1', '1', 1, 'admin', '2021-04-26 16:38:38', 'admin', '2021-04-26 16:38:38', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374671245742080', '修改终端', 'sys:client:edit', NULL, '571369709904203776', '', '2', '1', 1, 'admin', '2021-04-26 16:38:57', 'admin', '2021-04-26 16:38:57', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374747460440064', '删除终端', 'sys:client:del', NULL, '571369709904203776', '', '3', '1', 1, 'admin', '2021-04-26 16:39:15', 'admin', '2021-04-26 16:39:15', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374884270247936', '新增路由', 'sys:route:add', NULL, '571369965811273728', '', '1', '1', 1, 'admin', '2021-04-26 16:39:48', 'admin', '2021-04-26 16:39:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571374951823708160', '修改路由', 'sys:route:edit', NULL, '571369965811273728', '', '2', '1', 1, 'admin', '2021-04-26 16:40:04', 'admin', '2021-04-26 16:40:04', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571375033570693120', '删除路由', 'sys:route:del', NULL, '571369965811273728', '', '3', '1', 1, 'admin', '2021-04-26 16:40:23', 'admin', '2021-04-26 16:40:23', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571375135655858176', '刷新路由', 'sys:route:refresh', NULL, '571369965811273728', '', '4', '1', 1, 'admin', '2021-04-26 16:40:47', 'admin', '2021-04-26 16:40:47', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('571454722205159424', '修改题目', 'exam:exam:subject:edit', NULL, '571353525381107712', '', '9', '1', 1, 'admin', '2021-04-26 21:57:02', 'admin', '2021-04-26 21:57:02', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581237996276289536', '租户中心', 'tenant', '/api/user/v1/tenent/**', '-1', 'example', '3', '0', 1, 'admin', '2021-05-23 21:52:17', 'admin', '2021-02-22 12:58:27', '0', 'EXAM', 'Layout', '/tenant', NULL, '租户管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('581238351663861760', '单位管理', 'tenant:tenant', '/api/user/tenant/**', '581237996276289536', '', '1', '0', 1, 'admin', '2021-05-23 21:53:41', 'admin', '2021-05-23 21:55:30', '0', 'EXAM', 'views/tenant/tenant', 'tenant', NULL, '单位管理', 'gitee');
INSERT INTO `sys_menu` VALUES ('581238560250793984', '新增单位', 'tenant:tenant:add', NULL, '581238351663861760', '', '1', '1', 1, 'admin', '2021-05-23 21:54:31', 'admin', '2021-05-23 21:55:05', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581238795467362304', '修改单位', 'tenant:tenant:edit', '', '581238351663861760', '', '2', '1', 1, 'admin', '2021-05-23 21:55:27', 'admin', '2021-05-23 21:55:27', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('581238883182841856', '删除单位', 'tenant:tenant:del', NULL, '581238351663861760', '', '3', '1', 1, 'admin', '2021-05-23 21:55:48', 'admin', '2021-05-23 21:55:48', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('624972495417643008', '查看首页', 'dashboard:view', NULL, '571365178965364736', '', '30', '1', NULL, 'admin', '2021-09-21 14:17:34', 'admin', '2021-09-21 14:17:34', '0', 'EXAM', NULL, NULL, NULL, '查看首页', 'gitee');
INSERT INTO `sys_menu` VALUES ('625058053556932608', '编辑考试', 'exam:exam:edit', '/api/exam/v1/examination/**', '571353525381107712', '', '2', '1', NULL, 'admin', '2021-09-21 19:57:33', 'admin', '2021-09-21 19:57:33', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('625058859773464576', '编辑题目', 'exam:exam:subject:edit', NULL, '571353525381107712', '', '9', '1', NULL, 'admin', '2021-09-21 20:00:45', 'admin', '2021-09-21 20:00:45', '0', 'EXAM', NULL, NULL, NULL, NULL, 'gitee');
INSERT INTO `sys_menu` VALUES ('681171474660331520', 'elk日志', 'monitor:elk', '/api/monitor/**', '571361163502292992', '', '35', '0', NULL, 'admin', '2021-02-23 16:12:15', 'admin', '2021-02-23 16:18:07', '0', 'EXAM', NULL, 'https://cv.shimmerjordan.site/work-single.html', NULL, NULL, 'gitee');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL COMMENT '主键',
  `role_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色code',
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `is_default` tinyint NOT NULL DEFAULT 0 COMMENT '是否默认 0-否，1-是',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '启用禁用状态 0-启用，1-禁用',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (596116511031169024, '普通用户', 'role_user', '普通用户', 1, 0, 'admin', '2021-09-08 20:57:57', 'admin', '2021-09-08 20:57:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (596117256346406912, '超级管理员', 'role_admin', '超级管理员', 0, 0, 'admin', '2021-10-07 15:02:17', 'admin', '2021-10-07 14:53:50', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (596330074307956736, '教师', 'role_teacher', '教师', 0, 0, 'admin', '2021-09-08 20:57:57', 'admin', '2021-09-08 20:57:57', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (624964171867492352, '租户管理员', 'role_tenant_admin', '租户管理员', 0, 0, 'admin', '2021-10-08 21:55:13', 'admin', '2021-10-08 21:46:48', 0, 'EXAM', 'gitee');
INSERT INTO `sys_role` VALUES (681167029125910528, '预览', 'role_preview', '预览权限', 0, 0, 'admin', '2021-04-08 14:45:47', 'admin', '2021-02-23 15:54:35', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (581239021590679552, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (581239021590679553, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (581239021590679554, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (581239021590679555, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (581239021590679556, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (581239021590679557, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (581239021590679558, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (581239021590679559, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (581239021590679560, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (581239021590679561, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (581239021590679562, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (581239021590679563, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (581239021590679564, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (581239021590679565, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (581239021590679566, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (581239021590679567, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (581239021590679568, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (581239021590679569, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (581239021590679570, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (581239021590679571, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (581239021590679572, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (581239021590679573, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (581239021590679574, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (581239021590679575, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (581239021590679576, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (581239021590679577, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (581239021590679578, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (581239021590679579, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (581239021590679580, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (581239021590679581, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (581239021590679582, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (581239021590679583, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (581239021590679584, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (581239021590679585, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (581239021590679586, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (581239021590679587, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (581239021590679588, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (581239021590679589, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (581239021590679590, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (581239021590679591, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (581239021590679592, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (581239021590679593, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (581239021590679594, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (581239021590679595, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (581239021590679596, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (581239021590679597, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (581239021590679598, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (581239021590679599, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (581239021590679600, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (581239021590679601, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (581239021590679602, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (581239021590679603, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (581239021590679604, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (581239021590679605, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (581239021590679606, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (581239021590679607, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (581239021590679608, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (581239021590679609, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (581239021590679610, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (581239021590679611, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (581239021590679612, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (581239021590679613, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (581239021590679614, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (581239021590679615, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (581239021590679616, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (581239021590679617, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (581239021590679618, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (581239021590679619, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (581239021590679620, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (581239021590679621, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (581239021590679622, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (581239021590679623, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (581239021590679624, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (581239021590679625, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (581239021590679626, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (586547078973493248, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (586547078973493249, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (586547078973493250, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (586547078973493251, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (586547078973493252, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (586547078973493253, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (586547078973493254, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (586547078973493255, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (586547078973493256, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (586547078973493257, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (586547078973493258, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (586547078973493259, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (586547078973493260, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (586547078973493261, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (586547078973493262, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (586547078973493263, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (586547078973493264, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (586547078973493265, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (586547078973493266, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (586547078973493267, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (586547078973493268, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (586547078973493269, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (586547078973493270, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (586547078973493271, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (586547078973493272, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (586547078973493273, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (586547078973493274, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (586547078973493275, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (586547078973493276, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (586547078973493277, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (586547078973493278, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (586547078973493279, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (586547078973493280, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (586547078973493281, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (586547078973493282, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (586547078973493283, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (586547078973493284, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (586547078973493285, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (586547078973493286, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (586547078973493287, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (586547078973493288, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (586547078973493289, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (586547078973493290, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (586547078973493291, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (586547078973493292, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (586547078973493293, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (586547078973493294, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (586547078973493295, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (586547078973493296, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (586547078973493297, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (586547078973493298, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (586547078973493299, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (586547078973493300, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (586547078973493301, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (586547078973493302, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (586547078973493303, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (586547078973493304, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (586547078973493305, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (586547078973493306, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (586547078973493307, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (586547078973493308, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (586547078973493309, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (586915493013753856, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (590994415867269120, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (590994415867269121, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (590994415867269122, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (590994415867269123, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (590994415867269124, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (590994415867269125, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (590994415867269126, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (590994415867269127, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (590994415867269128, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (590994415867269129, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (590994415867269130, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (590994415867269131, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (590994415867269132, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (590994415867269133, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (590994415867269134, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (590994415867269135, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (590994415867269136, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (590994415867269137, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (590994415867269138, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (590994415867269139, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (590994415867269140, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (590994415867269141, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (590994415867269142, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (590994415867269143, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (590994415867269144, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (590994415867269145, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (590994415867269146, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (590994415867269147, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (590994415867269148, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (590994415867269149, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (590994415867269150, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (590994415867269151, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (590994415867269152, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (590994415867269153, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (590994415867269154, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624972978748264448, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624972978748264449, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624972978748264450, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624972978748264451, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624972978748264452, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379413561344, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379413561345, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624985379413561346, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624985379413561347, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379413561348, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624985379413561349, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624985379413561350, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624985379413561351, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624985379413561352, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624985379413561353, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624985379417755648, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624985379417755649, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624985379417755650, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624985379417755651, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624985379417755652, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624985379417755653, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624985379417755654, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624985379417755655, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624985379417755656, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624985379417755657, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624985379417755658, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624985379417755659, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624985379417755660, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624985379417755661, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624985379417755662, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624985379417755663, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624985379417755664, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624985379417755665, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624985379417755666, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624985379417755667, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624985379417755668, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624985379417755669, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624985379417755670, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (624985379417755671, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (624985379417755672, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (624985379417755673, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (624985379417755674, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (624985379417755675, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (624985379417755676, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (624985379417755677, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (624985379417755678, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (624985379417755679, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (624985379417755680, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (624985379417755681, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (624985379417755682, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624985379417755683, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624985379417755684, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624985379417755685, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624985379417755686, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624985379417755687, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624985379417755688, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624985379417755689, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624985379417755690, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624985379417755691, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624985379417755692, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624985379417755693, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624985379417755694, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624985379417755695, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624985379417755696, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624985379417755697, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624985379417755698, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624985379421949952, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624985379421949953, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624985379421949954, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624985379421949955, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624985379421949956, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624985379421949957, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624985379421949958, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624985379421949959, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624985379421949960, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624985379421949961, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (624985379421949962, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (624985379421949963, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379421949964, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379421949965, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379421949966, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379421949967, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624985379421949968, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624985379421949969, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379421949970, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624985379421949971, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624985379421949972, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624985379421949973, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624985379421949974, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624985379421949975, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624985379421949976, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624985379421949977, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624985379421949978, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624985379421949979, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624985379421949980, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624985379421949981, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624985379421949982, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624985379421949983, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624985379421949984, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624985379421949985, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624985379421949986, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624985379421949987, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624985379421949988, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624985379421949989, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624985379421949990, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624985379421949991, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624985379421949992, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624985379421949993, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624985379421949994, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624985379421949995, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624985379421949996, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624985379421949997, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624985379421949998, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624985379421949999, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624985379421950000, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624985379421950001, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624985379421950002, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624985379421950003, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624985379421950004, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624985379426144256, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624985379426144257, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624985379426144258, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624985379426144259, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624985379426144260, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624985379426144261, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624985379426144262, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624985379426144263, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (624985379426144264, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624985379426144265, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624985379426144266, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624985379426144267, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624985379426144268, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624985379426144269, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624985379426144270, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624985379426144271, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624985379426144272, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624985379426144273, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624985379426144274, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624985379426144275, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624985379426144276, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379426144277, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379426144278, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379426144279, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379426144280, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379426144281, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624985379426144282, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624985379426144283, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624985379426144284, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624985379426144285, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624985379426144286, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624985379426144287, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624985379426144288, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624985379426144289, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624985379426144290, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624985379426144291, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624985379426144292, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624985379426144293, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624985379426144294, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624985379426144295, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624985379426144296, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624985379426144297, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624985379426144298, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624985379426144299, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624985379426144300, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624985379426144301, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624985379426144302, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624985379426144303, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624985379426144304, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624985379426144305, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624985379426144306, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624985379426144307, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624985379426144308, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624985379426144309, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624985379426144310, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624985379426144311, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624985379426144312, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379426144313, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379426144314, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624985379434532967, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624985379434532968, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624985379434532969, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624985379434532970, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624985379434532971, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615829475328, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615829475329, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615829475330, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615829475331, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615829475332, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615829475333, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615829475334, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615829475335, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615829475336, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615829475337, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615829475338, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615829475339, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615829475340, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615829475341, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615829475342, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615829475343, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615829475344, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615829475345, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615829475346, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615829475347, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615829475348, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615829475349, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615829475350, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615829475351, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615829475352, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615829475353, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615829475354, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615829475355, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615829475356, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615829475357, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615829475358, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615829475359, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615829475360, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (624992615829475361, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (624992615829475362, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (624992615829475363, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (624992615829475364, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (624992615829475365, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (624992615829475366, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (624992615829475367, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (624992615829475368, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (624992615829475369, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (624992615829475370, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (624992615829475371, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (624992615829475372, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615829475373, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615829475374, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615829475375, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615829475376, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615829475377, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615829475378, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615829475379, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615829475380, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615829475381, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615829475382, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615829475383, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615829475384, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615829475385, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615829475386, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615829475387, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615829475388, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615829475389, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615829475390, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615829475391, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615829475392, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615829475393, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615829475394, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615829475395, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615829475396, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615829475397, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615833669632, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (624992615833669633, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (624992615833669634, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615833669635, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615833669636, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615833669637, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615833669638, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615833669639, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615833669640, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615833669641, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615833669642, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615833669643, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615833669644, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615833669645, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615833669646, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615833669647, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615833669648, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615833669649, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615833669650, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615833669651, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615833669652, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615833669653, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615833669654, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615833669655, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615833669656, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615833669657, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615833669658, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615833669659, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615833669660, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615833669661, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615833669662, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615833669663, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615833669664, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615833669665, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615833669666, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615833669667, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615833669668, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615833669669, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615833669670, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615833669671, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615833669672, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615833669673, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615833669674, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615833669675, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615833669676, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615833669677, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615833669678, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615833669679, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615833669680, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615833669681, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615833669682, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615833669683, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (624992615833669684, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615833669685, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615833669686, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615833669687, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615833669688, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615833669689, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615833669690, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615833669691, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615833669692, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615833669693, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615833669694, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615833669695, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615833669696, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615833669697, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615833669698, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615833669699, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615833669700, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615833669701, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615833669702, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615833669703, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615833669704, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615833669705, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615833669706, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615833669707, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615833669708, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615833669709, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615833669710, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615833669711, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615833669712, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615833669713, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615833669714, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615833669715, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615833669716, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615833669717, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615833669718, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615833669719, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615833669720, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615833669721, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615833669722, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615833669723, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615833669724, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615833669725, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615833669726, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615833669727, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615833669728, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615833669729, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615833669730, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615833669731, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615833669732, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615833669733, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615833669734, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615837864087, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615837864088, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624992615837864089, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615837864090, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615837864091, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615837864092, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615837864093, 571347202849509376, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615837864094, 571347202849509376, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615837864095, 571347202849509376, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615837864096, 571347202849509376, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615837864097, 571347202849509376, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615837864098, 571347202849509376, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615837864099, 571347202849509376, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615837864100, 571347202849509376, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615837864101, 571347202849509376, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615837864102, 571347202849509376, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615837864103, 571347202849509376, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615837864104, 571347202849509376, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615837864105, 571347202849509376, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615837864106, 571347202849509376, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615837864107, 571347202849509376, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615837864108, 571347202849509376, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615837864109, 571347202849509376, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615837864110, 571347202849509376, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615837864111, 571347202849509376, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615837864112, 571347202849509376, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615837864113, 571347202849509376, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615837864114, 571347202849509376, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615837864115, 571347202849509376, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615837864116, 571347202849509376, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615837864117, 571347202849509376, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615837864118, 571347202849509376, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615837864119, 571347202849509376, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615837864120, 571347202849509376, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615837864121, 571347202849509376, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615837864122, 571347202849509376, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615837864123, 571347202849509376, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615837864124, 571347202849509376, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (624992615837864125, 571347202849509376, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (624992615837864126, 571347202849509376, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (624992615837864127, 571347202849509376, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (624992615837864128, 571347202849509376, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (624992615837864129, 571347202849509376, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (624992615837864130, 571347202849509376, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (624992615837864131, 571347202849509376, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (624992615837864132, 571347202849509376, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (624992615837864133, 571347202849509376, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (624992615837864134, 571347202849509376, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (624992615837864135, 571347202849509376, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (624992615837864136, 571347202849509376, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615837864137, 571347202849509376, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615837864138, 571347202849509376, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615837864139, 571347202849509376, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615837864140, 571347202849509376, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615837864141, 571347202849509376, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615837864142, 571347202849509376, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615837864143, 571347202849509376, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615837864144, 571347202849509376, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615837864145, 571347202849509376, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615837864146, 571347202849509376, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615837864147, 571347202849509376, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615837864148, 571347202849509376, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615837864149, 571347202849509376, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615837864150, 571347202849509376, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615837864151, 571347202849509376, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615837864152, 571347202849509376, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615837864153, 571347202849509376, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615837864154, 571347202849509376, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615837864155, 571347202849509376, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615837864156, 571347202849509376, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615837864157, 571347202849509376, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615837864158, 571347202849509376, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615837864159, 571347202849509376, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615837864160, 571347202849509376, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615837864161, 571347202849509376, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615837864162, 571347202849509376, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (624992615837864163, 571347202849509376, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (624992615837864164, 571347202849509376, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615837864165, 571347202849509376, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615837864166, 571347202849509376, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615837864167, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615837864168, 571347272906969088, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615837864169, 571347272906969088, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615837864170, 571347272906969088, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615837864171, 571347272906969088, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615837864172, 571347272906969088, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615837864173, 571347272906969088, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615837864174, 571347272906969088, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615837864175, 571347272906969088, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615837864176, 571347272906969088, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615837864177, 571347272906969088, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615837864178, 571347272906969088, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615837864179, 571347272906969088, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615837864180, 571347272906969088, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615837864181, 571347272906969088, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615837864182, 571347272906969088, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615837864183, 571347272906969088, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615837864184, 571347272906969088, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615837864185, 571347272906969088, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615837864186, 571347272906969088, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615837864187, 571347272906969088, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615837864188, 571347272906969088, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615837864189, 571347272906969088, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615837864190, 571347272906969088, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615837864191, 571347272906969088, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615837864192, 571347272906969088, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615837864193, 571347272906969088, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615837864194, 571347272906969088, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615837864195, 571347272906969088, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615837864196, 571347272906969088, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615837864197, 571347272906969088, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615837864198, 571347272906969088, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615846252544, 571347272906969088, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (624992615846252545, 571347272906969088, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (624992615846252546, 571347272906969088, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (624992615846252547, 571347272906969088, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (624992615846252548, 571347272906969088, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (624992615846252549, 571347272906969088, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (624992615846252550, 571347272906969088, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (624992615846252551, 571347272906969088, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (624992615846252552, 571347272906969088, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (624992615846252553, 571347272906969088, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (624992615846252554, 571347272906969088, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (624992615846252555, 571347272906969088, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (624992615846252556, 571347272906969088, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (624992615846252557, 571347272906969088, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (624992615846252558, 571347272906969088, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (624992615846252559, 571347272906969088, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (624992615846252560, 571347272906969088, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (624992615846252561, 571347272906969088, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (624992615846252562, 571347272906969088, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (624992615846252563, 571347272906969088, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (624992615846252564, 571347272906969088, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (624992615846252565, 571347272906969088, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (624992615846252566, 571347272906969088, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (624992615846252567, 571347272906969088, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (624992615846252568, 571347272906969088, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (624992615846252569, 571347272906969088, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (624992615846252570, 571347272906969088, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (624992615846252571, 571347272906969088, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615846252572, 571347272906969088, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615846252573, 571347272906969088, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615846252574, 586914735614726144, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615846252575, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615846252576, 571347357346697216, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (624992615846252577, 571347357346697216, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (624992615846252578, 571347357346697216, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (624992615846252579, 571347357346697216, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (624992615846252580, 571347357346697216, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (624992615846252581, 571347357346697216, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (624992615846252582, 571347357346697216, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (624992615846252583, 571347357346697216, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (624992615846252584, 571347357346697216, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (624992615846252585, 571347357346697216, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (624992615846252586, 571347357346697216, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (624992615846252587, 571347357346697216, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (624992615846252588, 571347357346697216, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (624992615846252589, 571347357346697216, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (624992615846252590, 571347357346697216, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (624992615846252591, 571347357346697216, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (624992615846252592, 571347357346697216, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (624992615846252593, 571347357346697216, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (624992615846252594, 571347357346697216, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (624992615846252595, 571347357346697216, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (624992615846252596, 571347357346697216, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (624992615846252597, 571347357346697216, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (624992615846252598, 571347357346697216, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (624992615846252599, 571347357346697216, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (624992615846252600, 571347357346697216, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (624992615846252601, 571347357346697216, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (624992615846252602, 571347357346697216, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (624992615846252603, 571347357346697216, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (624992615846252604, 571347357346697216, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (624992615846252605, 571347357346697216, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (624992615846252606, 571347357346697216, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (624992615846252607, 571347357346697216, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615846252608, 571347357346697216, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615846252609, 571347357346697216, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624992615846252775, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624992615846252776, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624992615846252777, 596116511031169024, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (624992615846252778, 596116511031169024, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (624992615846252779, 596116511031169024, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (624993535845863424, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863425, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863426, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863433, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863434, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624993535845863435, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863436, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863437, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863444, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863445, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624993535845863446, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535845863447, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057728, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057735, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057736, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (624993535850057737, 571347202849509376, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057738, 571347272906969088, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057739, 571347357346697216, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057746, 596116511031169024, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (624993535850057747, 596116511031169024, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (640208290051133440, 624964171867492352, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (640208290051133441, 624964171867492352, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (640208290051133442, 624964171867492352, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (640208290051133443, 624964171867492352, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (640208290051133444, 624964171867492352, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (640208290051133445, 624964171867492352, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (640208290051133446, 624964171867492352, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (640208290051133447, 624964171867492352, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (640208290051133448, 624964171867492352, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (640208290051133449, 624964171867492352, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (640208290051133450, 624964171867492352, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (640208290051133451, 624964171867492352, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (640208290051133452, 624964171867492352, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (640208290051133453, 624964171867492352, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (640208290051133454, 624964171867492352, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (640208290051133455, 624964171867492352, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (640208290051133456, 624964171867492352, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (640208290051133457, 624964171867492352, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (640208290051133458, 624964171867492352, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (640208290051133459, 624964171867492352, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (640208290051133460, 624964171867492352, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (640208290051133461, 624964171867492352, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (640208290051133462, 624964171867492352, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (640208290051133463, 624964171867492352, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (640208290051133464, 624964171867492352, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (640208290051133465, 624964171867492352, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (640208290051133466, 624964171867492352, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (640208290051133467, 624964171867492352, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (640208290051133468, 624964171867492352, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (640208290051133469, 624964171867492352, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (640208290051133470, 624964171867492352, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (640208290051133471, 624964171867492352, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (640208290051133472, 624964171867492352, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (640208290051133473, 624964171867492352, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (640208290051133474, 624964171867492352, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (640208290051133475, 624964171867492352, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (640208290051133476, 624964171867492352, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (640208290051133477, 624964171867492352, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (640208290051133478, 624964171867492352, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (640208290051133479, 624964171867492352, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (640208290051133480, 624964171867492352, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (640208290051133481, 624964171867492352, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (640208290051133482, 624964171867492352, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (640208290051133483, 624964171867492352, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (640208290051133484, 624964171867492352, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (640208290051133485, 624964171867492352, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (640208290051133486, 624964171867492352, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (640208290051133487, 624964171867492352, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (640208290051133488, 624964171867492352, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (640208290051133489, 624964171867492352, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (640214746716573696, 596330074307956736, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (640214746716573697, 596330074307956736, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (640214746716573698, 596330074307956736, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (640214746716573699, 596330074307956736, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (640214746716573700, 596330074307956736, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (640214746716573701, 596330074307956736, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (640214746716573702, 596330074307956736, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (640214746716573703, 596330074307956736, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (640214746716573704, 596330074307956736, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (640214746716573705, 596330074307956736, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (640214746716573706, 596330074307956736, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (640214746716573707, 596330074307956736, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (640214746716573708, 596330074307956736, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (640214746716573709, 596330074307956736, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (640214746716573710, 596330074307956736, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (640214746716573711, 596330074307956736, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (640214746716573712, 596330074307956736, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (640214746716573713, 596330074307956736, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (640214746716573714, 596330074307956736, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (640214746716573715, 596330074307956736, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (640214746716573716, 596330074307956736, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (640214746716573717, 596330074307956736, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (640214746716573718, 596330074307956736, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (640214746716573719, 596330074307956736, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (640214746716573720, 596330074307956736, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (640214746716573721, 596330074307956736, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (640214746716573722, 596330074307956736, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (640214746716573723, 596330074307956736, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (681171832786784256, 596117256346406912, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (681171832786784257, 596117256346406912, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (681171832786784258, 596117256346406912, 571367565360762880);
INSERT INTO `sys_role_menu` VALUES (681171832786784259, 596117256346406912, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (681171832786784260, 596117256346406912, 571371375550402560);
INSERT INTO `sys_role_menu` VALUES (681171832786784261, 596117256346406912, 571371477828505600);
INSERT INTO `sys_role_menu` VALUES (681171832786784262, 596117256346406912, 571371606652358656);
INSERT INTO `sys_role_menu` VALUES (681171832786784263, 596117256346406912, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (681171832786784264, 596117256346406912, 571371773073952768);
INSERT INTO `sys_role_menu` VALUES (681171832786784265, 596117256346406912, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (681171832786784266, 596117256346406912, 571372425787346944);
INSERT INTO `sys_role_menu` VALUES (681171832786784267, 596117256346406912, 571372559308820480);
INSERT INTO `sys_role_menu` VALUES (681171832786784268, 596117256346406912, 571372707153842176);
INSERT INTO `sys_role_menu` VALUES (681171832786784269, 596117256346406912, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (681171832786784270, 596117256346406912, 571373219269971968);
INSERT INTO `sys_role_menu` VALUES (681171832786784271, 596117256346406912, 571373292582211584);
INSERT INTO `sys_role_menu` VALUES (681171832786784272, 596117256346406912, 571373363046518784);
INSERT INTO `sys_role_menu` VALUES (681171832786784273, 596117256346406912, 571373478440210432);
INSERT INTO `sys_role_menu` VALUES (681171832786784274, 596117256346406912, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (681171832786784275, 596117256346406912, 571373881496047616);
INSERT INTO `sys_role_menu` VALUES (681171832786784276, 596117256346406912, 571373962609692672);
INSERT INTO `sys_role_menu` VALUES (681171832786784277, 596117256346406912, 571374025859796992);
INSERT INTO `sys_role_menu` VALUES (681171832786784278, 596117256346406912, 571374113881460736);
INSERT INTO `sys_role_menu` VALUES (681171832786784279, 596117256346406912, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (681171832786784280, 596117256346406912, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (681171832786784281, 596117256346406912, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (681171832786784282, 596117256346406912, 581238560250793984);
INSERT INTO `sys_role_menu` VALUES (681171832786784283, 596117256346406912, 581238795467362304);
INSERT INTO `sys_role_menu` VALUES (681171832786784284, 596117256346406912, 581238883182841856);
INSERT INTO `sys_role_menu` VALUES (681171832786784285, 596117256346406912, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (681171832786784286, 596117256346406912, 571374593844056064);
INSERT INTO `sys_role_menu` VALUES (681171832786784287, 596117256346406912, 571374671245742080);
INSERT INTO `sys_role_menu` VALUES (681171832786784288, 596117256346406912, 571374747460440064);
INSERT INTO `sys_role_menu` VALUES (681171832786784289, 596117256346406912, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (681171832786784290, 596117256346406912, 571374884270247936);
INSERT INTO `sys_role_menu` VALUES (681171832786784291, 596117256346406912, 571374951823708160);
INSERT INTO `sys_role_menu` VALUES (681171832786784292, 596117256346406912, 571375033570693120);
INSERT INTO `sys_role_menu` VALUES (681171832786784293, 596117256346406912, 571375135655858176);
INSERT INTO `sys_role_menu` VALUES (681171832786784294, 596117256346406912, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (681171832786784295, 596117256346406912, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (681171832786784296, 596117256346406912, 571364115214372864);
INSERT INTO `sys_role_menu` VALUES (681171832786784297, 596117256346406912, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (681171832786784298, 596117256346406912, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (681171832786784299, 596117256346406912, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (681171832786784300, 596117256346406912, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (681171832786784301, 596117256346406912, 681171474660331520);
INSERT INTO `sys_role_menu` VALUES (681171832786784302, 596117256346406912, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (681171832786784303, 596117256346406912, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (681171832786784304, 596117256346406912, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (681171832786784305, 596117256346406912, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (681171832786784306, 596117256346406912, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (681171832786784307, 596117256346406912, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (681171832786784308, 596117256346406912, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (681171832786784309, 596117256346406912, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (681171832786784310, 596117256346406912, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (681171832786784311, 596117256346406912, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (681171832786784312, 596117256346406912, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (681171832786784313, 596117256346406912, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (681171832786784314, 596117256346406912, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (681171832786784315, 596117256346406912, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (681171832786784316, 596117256346406912, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (681171832786784317, 596117256346406912, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (681171832786784318, 596117256346406912, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (681171832786784319, 596117256346406912, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (681171832786784320, 596117256346406912, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (681171832786784321, 596117256346406912, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (681171832786784322, 596117256346406912, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (681171832786784323, 596117256346406912, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (681171832786784324, 596117256346406912, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (681171832786784325, 596117256346406912, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (681171832786784326, 596117256346406912, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (681171832786784327, 596117256346406912, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (681171832786784328, 596117256346406912, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (681171832786784329, 596117256346406912, 571350099653955584);
INSERT INTO `sys_role_menu` VALUES (681171867557564416, 681167029125910528, 571365178965364736);
INSERT INTO `sys_role_menu` VALUES (681171867557564417, 681167029125910528, 624972495417643008);
INSERT INTO `sys_role_menu` VALUES (681171867557564418, 681167029125910528, 571367969767165952);
INSERT INTO `sys_role_menu` VALUES (681171867557564419, 681167029125910528, 571371699010932736);
INSERT INTO `sys_role_menu` VALUES (681171867557564420, 681167029125910528, 571368181252362240);
INSERT INTO `sys_role_menu` VALUES (681171867557564421, 681167029125910528, 571368627413061632);
INSERT INTO `sys_role_menu` VALUES (681171867557564422, 681167029125910528, 571369094226513920);
INSERT INTO `sys_role_menu` VALUES (681171867557564423, 681167029125910528, 571374178956087296);
INSERT INTO `sys_role_menu` VALUES (681171867557564424, 681167029125910528, 581237996276289536);
INSERT INTO `sys_role_menu` VALUES (681171867557564425, 681167029125910528, 581238351663861760);
INSERT INTO `sys_role_menu` VALUES (681171867557564426, 681167029125910528, 571369709904203776);
INSERT INTO `sys_role_menu` VALUES (681171867557564427, 681167029125910528, 571369965811273728);
INSERT INTO `sys_role_menu` VALUES (681171867557564428, 681167029125910528, 571361163502292992);
INSERT INTO `sys_role_menu` VALUES (681171867557564429, 681167029125910528, 571361526066319360);
INSERT INTO `sys_role_menu` VALUES (681171867557564430, 681167029125910528, 571361746552492032);
INSERT INTO `sys_role_menu` VALUES (681171867557564431, 681167029125910528, 571362994005610496);
INSERT INTO `sys_role_menu` VALUES (681171867557564432, 681167029125910528, 571363268497641472);
INSERT INTO `sys_role_menu` VALUES (681171867557564433, 681167029125910528, 571363537549660160);
INSERT INTO `sys_role_menu` VALUES (681171867557564434, 681167029125910528, 681171474660331520);
INSERT INTO `sys_role_menu` VALUES (681171867557564435, 681167029125910528, 571352797233156096);
INSERT INTO `sys_role_menu` VALUES (681171867557564436, 681167029125910528, 571353230286655488);
INSERT INTO `sys_role_menu` VALUES (681171867557564437, 681167029125910528, 571355240792723456);
INSERT INTO `sys_role_menu` VALUES (681171867557564438, 681167029125910528, 571355418715099136);
INSERT INTO `sys_role_menu` VALUES (681171867557564439, 681167029125910528, 571355486121758720);
INSERT INTO `sys_role_menu` VALUES (681171867557564440, 681167029125910528, 571353525381107712);
INSERT INTO `sys_role_menu` VALUES (681171867557564441, 681167029125910528, 571355686403969024);
INSERT INTO `sys_role_menu` VALUES (681171867557564442, 681167029125910528, 571355830226653184);
INSERT INTO `sys_role_menu` VALUES (681171867557564443, 681167029125910528, 625058053556932608);
INSERT INTO `sys_role_menu` VALUES (681171867557564444, 681167029125910528, 571355921259827200);
INSERT INTO `sys_role_menu` VALUES (681171867557564445, 681167029125910528, 571356206782877696);
INSERT INTO `sys_role_menu` VALUES (681171867557564446, 681167029125910528, 571356537642160128);
INSERT INTO `sys_role_menu` VALUES (681171867557564447, 681167029125910528, 571356877741494272);
INSERT INTO `sys_role_menu` VALUES (681171867557564448, 681167029125910528, 571357072436891648);
INSERT INTO `sys_role_menu` VALUES (681171867557564449, 681167029125910528, 571357235276550144);
INSERT INTO `sys_role_menu` VALUES (681171867557564450, 681167029125910528, 571454722205159424);
INSERT INTO `sys_role_menu` VALUES (681171867557564451, 681167029125910528, 625058859773464576);
INSERT INTO `sys_role_menu` VALUES (681171867557564452, 681167029125910528, 571353992756596736);
INSERT INTO `sys_role_menu` VALUES (681171867557564453, 681167029125910528, 571357509638557696);
INSERT INTO `sys_role_menu` VALUES (681171867557564454, 681167029125910528, 571357821778661376);
INSERT INTO `sys_role_menu` VALUES (681171867557564455, 681167029125910528, 571357937931522048);
INSERT INTO `sys_role_menu` VALUES (681171867557564456, 681167029125910528, 571358188264361984);
INSERT INTO `sys_role_menu` VALUES (681171867557564457, 681167029125910528, 571358308477308928);
INSERT INTO `sys_role_menu` VALUES (681171867557564458, 681167029125910528, 571358407353831424);
INSERT INTO `sys_role_menu` VALUES (681171867557564459, 681167029125910528, 571358617991778304);
INSERT INTO `sys_role_menu` VALUES (681171867557564460, 681167029125910528, 571358928483520512);
INSERT INTO `sys_role_menu` VALUES (681171867557564461, 681167029125910528, 571354428217626624);
INSERT INTO `sys_role_menu` VALUES (681171867557564462, 681167029125910528, 571359163205160960);
INSERT INTO `sys_role_menu` VALUES (681171867557564463, 681167029125910528, 571354823258148864);
INSERT INTO `sys_role_menu` VALUES (681171867557564464, 681167029125910528, 571351763521769472);
INSERT INTO `sys_role_menu` VALUES (681171867557564465, 681167029125910528, 571352087896657920);
INSERT INTO `sys_role_menu` VALUES (681171867557564466, 681167029125910528, 571348650370928640);
INSERT INTO `sys_role_menu` VALUES (681171867557564467, 681167029125910528, 571349816924311552);
INSERT INTO `sys_role_menu` VALUES (681171867557564468, 681167029125910528, 571350099653955584);

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student`  (
  `id` bigint NOT NULL COMMENT '主键',
  `student_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `born` date NULL DEFAULT NULL,
  `sex` tinyint NULL DEFAULT NULL COMMENT '难度等级',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门id',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就读学校',
  `wechat` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `city_id` bigint NULL DEFAULT NULL COMMENT '城市id',
  `county_id` bigint NULL DEFAULT NULL COMMENT '县id',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_student
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户标识',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户名称',
  `tenant_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户描述信息',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (581236567985754112, 'gitee', '码云', '码云', 1, 'admin', '2021-05-23 21:46:36', 'admin', '2021-05-23 21:46:36', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `avatar_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像id',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `born` date NULL DEFAULT NULL COMMENT '出生日期',
  `status` tinyint NOT NULL DEFAULT 0,
  `sex` tinyint NULL DEFAULT NULL COMMENT '性别',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `parent_uid` bigint NULL DEFAULT NULL COMMENT '父账号id',
  `street_id` bigint NULL DEFAULT NULL COMMENT '街道id',
  `county_id` bigint NULL DEFAULT NULL COMMENT '国家id',
  `city_id` bigint NULL DEFAULT NULL COMMENT '城市id',
  `province_id` bigint NULL DEFAULT NULL COMMENT '省id',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `lock_time` timestamp NULL DEFAULT NULL COMMENT '锁定账号时间',
  `wechat` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `family_role` tinyint NULL DEFAULT NULL COMMENT '家庭角色',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (596078038307966976, '管理员', '18540171008', '839503846928683008', 'example@email.com', '1999-02-26', 0, 0, 596290673729212416, '管理员', NULL, NULL, NULL, 530100, 530000, '2021-05-16 20:41:50', NULL, NULL, '测试', NULL, 'admin', '2021-05-16 20:41:49', 'admin', '2021-05-16 20:41:50', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (596307222997372928, '梁同学', '15521089123', '0', 'example@email.com', '1999-02-02', 0, 1, 596290673729212416, '梁同学', NULL, NULL, NULL, NULL, NULL, '2021-01-31 12:10:24', NULL, NULL, NULL, NULL, 'admin', '2021-04-08 14:09:11', 'student', '2021-01-31 12:10:24', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (596332387600830464, '林老师', '15521089123', NULL, 'example@email.com', '1999-02-02', 0, 1, 596290673729212416, '林老师', NULL, NULL, NULL, NULL, NULL, '2021-05-16 20:35:52', NULL, NULL, NULL, NULL, 'admin', '2021-05-16 20:35:52', 'teacher', '2021-05-16 20:35:52', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (681167776798347264, '预览权限', '15521089123', '0', NULL, '1999-02-02', 0, 0, 596290673729212416, '', 596329627606192128, NULL, NULL, NULL, NULL, '2021-04-26 14:24:54', NULL, NULL, NULL, NULL, 'admin', '2021-04-26 14:24:53', 'preview', '2021-04-26 14:24:54', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user` VALUES (820684891577520128, NULL, NULL, NULL, 'shimmerjordan@foxmail.com', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-16 21:08:53', NULL, NULL, NULL, NULL, 'shimmerjordan', '2021-05-16 21:08:53', 'shimmerjordan', '2021-05-16 21:08:53', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_user_auths
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_auths`;
CREATE TABLE `sys_user_auths`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `identity_type` tinyint NOT NULL COMMENT '登录类型，手机号、邮箱、用户名或第三方应用名称（微信 微博等）',
  `identifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识，手机号、邮箱、用户名或第三方应用的唯一标识',
  `credential` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码凭证，站内的保存密码，站外的不保存或保存token',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记 0:正常;1:删除',
  `application_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编号',
  `tenant_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户授权表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_auths
-- ----------------------------
INSERT INTO `sys_user_auths` VALUES (596329627606192128, 596078038307966976, 1, 'admin', '$2a$10$fi16OaJpNVcMuhudn5pxf.0Um3OI0mOODA9Rx3.oLERDrry9RRCRe', 'admin', '2021-03-29 16:13:29', 'admin', '2021-07-04 13:21:02', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (596329627648135168, 596307222997372928, 1, 'student', '$2a$10$5XMiXaS3XbkZvcdFHFA6HeZGWAfzxQtLVXRZi8Oyic/rbRLExT5Na', 'admin', '2021-07-04 13:21:03', 'admin', '2021-07-04 13:21:03', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (596332387693105152, 596332387600830464, 1, 'teacher', '$2a$10$8CNmKhP0UJm9WVeDRkowteGHtJEz77xUNaKoVQook6ESYemueK8sC', 'admin', '2021-07-04 13:32:01', 'admin', '2021-07-04 13:32:01', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (681167777872089088, 681167776798347264, 1, 'preview', '$2a$10$tzwo3TcjyyHnX85WlyO2Huq/gdR7gxhNBGrARAl9PctT6AFZ30Dnu', 'admin', '2021-02-23 15:57:34', 'admin', '2021-02-23 15:57:34', 0, 'EXAM', 'gitee');
INSERT INTO `sys_user_auths` VALUES (820684892361854976, 820684891577520128, 1, 'shimmerjordan', '$2a$10$oPcF57bY6ronvk2FrCCivOJ.avBFtmw.WIm2tNG4vlbUaPT8AB3gK', 'shimmerjordan', '2021-03-14 15:48:46', 'shimmerjordan', '2021-03-14 15:48:46', 0, 'EXAM', 'gitee');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (681167857941352448, 596307222997372928, 596116511031169024);
INSERT INTO `sys_user_role` VALUES (681167874412384256, 596078038307966976, 596117256346406912);
INSERT INTO `sys_user_role` VALUES (685246878203383808, 596332387600830464, 596330074307956736);
INSERT INTO `sys_user_role` VALUES (686273423307051008, 681167776798347264, 681167029125910528);
INSERT INTO `sys_user_role` VALUES (820684893141995520, 820684891577520128, 596116511031169024);

-- ----------------------------
-- Table structure for sys_user_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_student`;
CREATE TABLE `sys_user_student`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '学生姓名',
  `student_id` bigint NOT NULL COMMENT '电话号码',
  `relationship_type` tinyint NOT NULL COMMENT '关系类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户学生关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_student
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
