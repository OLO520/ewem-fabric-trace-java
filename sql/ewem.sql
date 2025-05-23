/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : localhost:3306
 Source Schema         : ewem

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 03/04/2025 16:28:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ewem_apply
-- ----------------------------
DROP TABLE IF EXISTS `ewem_apply`;
CREATE TABLE `ewem_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请名称',
  `quantity` bigint(20) NULL DEFAULT NULL COMMENT '申请数量',
  `apply_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请状态',
  `batch_id` bigint(20) NULL DEFAULT NULL COMMENT '批次ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `anti_length` int(10) NULL DEFAULT NULL COMMENT '防伪码长度',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `trace_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '溯源方式',
  `gen_code_rule` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生码规则：1：纯数字，2：纯字母，3：混合',
  `char_length` int(10) NULL DEFAULT NULL COMMENT '字符长度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '码申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_apply
-- ----------------------------
INSERT INTO `ewem_apply` VALUES (20, '1', 1, '3', 6, '0', 0, '0', 'admin', '2025-04-03 15:18:36', 'admin', '2025-04-03 15:18:40', NULL, '1', '3', 32);

-- ----------------------------
-- Table structure for ewem_batch
-- ----------------------------
DROP TABLE IF EXISTS `ewem_batch`;
CREATE TABLE `ewem_batch`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批号',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '产品id',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '批次表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_batch
-- ----------------------------
INSERT INTO `ewem_batch` VALUES (1, 'tea001', 1, '0', '0', 'admin', '2025-03-20 14:39:43', NULL, NULL, NULL);
INSERT INTO `ewem_batch` VALUES (2, 'tea002', 2, '0', '0', 'admin', '2025-03-20 14:39:50', NULL, NULL, NULL);
INSERT INTO `ewem_batch` VALUES (3, '20250320001', 3, '0', '0', 'admin', '2025-03-20 14:57:13', NULL, NULL, NULL);
INSERT INTO `ewem_batch` VALUES (4, '20250320002', 3, '0', '0', 'admin', '2025-03-20 15:04:23', NULL, NULL, NULL);
INSERT INTO `ewem_batch` VALUES (5, '20250324001', 3, '0', '0', 'admin', '2025-03-24 16:19:25', NULL, NULL, NULL);
INSERT INTO `ewem_batch` VALUES (6, '20250325001', 5, '0', '0', 'admin', '2025-03-25 13:41:07', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ewem_batch_link
-- ----------------------------
DROP TABLE IF EXISTS `ewem_batch_link`;
CREATE TABLE `ewem_batch_link`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) NULL DEFAULT NULL COMMENT '批次ID',
  `link_id` bigint(20) NULL DEFAULT NULL COMMENT '环节ID',
  `attrs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '动态参数',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '批次环节记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_batch_link
-- ----------------------------
INSERT INTO `ewem_batch_link` VALUES (1, 1, 1, '[]', '0', '2', 'admin', '2025-03-20 14:47:46', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (2, 1, 2, '[]', '0', '2', 'admin', '2025-03-20 14:47:51', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (3, 1, 3, '[]', '0', '2', 'admin', '2025-03-20 14:47:55', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (4, 1, 4, '[]', '0', '2', 'admin', '2025-03-20 14:47:59', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (5, 3, 1, '[{\"k\":\"地址\",\"v\":\"安徽黄山\"},{\"k\":\"温度\",\"v\":\"20摄氏度\"},{\"k\":\"品种\",\"v\":\"乌龙茶\"},{\"k\":\"种植时间\",\"v\":\"2024-03-20\"}]', '0', '2', 'admin', '2025-03-20 14:58:11', 'admin', '2025-03-20 14:58:34', NULL);
INSERT INTO `ewem_batch_link` VALUES (6, 3, 2, '[{\"k\":\"采摘时间\",\"v\":\"2025-03-20\"},{\"k\":\"采摘地点\",\"v\":\"安徽黄山\"}]', '0', '2', 'admin', '2025-03-20 14:59:18', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (7, 3, 1, '[{\"k\":\"地址\",\"v\":\"安徽黄山\"},{\"k\":\"温度\",\"v\":\"20摄氏度\"},{\"k\":\"品种\",\"v\":\"乌龙茶\"},{\"k\":\"种植时间\",\"v\":\"2025-03-20\"}]', '0', '2', 'admin', '2025-03-20 15:05:06', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (8, 3, 2, '[{\"k\":\"采摘地\",\"v\":\"2号茶园\"},{\"k\":\"采摘时间\",\"v\":\"2025-03-20\"},{\"k\":\"采摘数量\",\"v\":\"20\"}]', '0', '2', 'admin', '2025-03-20 15:05:35', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (9, 3, 3, '[{\"k\":\"加工地址\",\"v\":\"安徽黄山\"},{\"k\":\"加工品种\",\"v\":\"乌龙茶\"},{\"k\":\"加工时间\",\"v\":\"2025-03-20\"}]', '0', '2', 'admin', '2025-03-20 15:06:09', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (10, 4, 1, '[{\"k\":\"地址\",\"v\":\"安徽黄山\"},{\"k\":\"种植时间\",\"v\":\"2025-03-20\"},{\"k\":\"品种\",\"v\":\"乌龙茶\"}]', '0', '0', 'admin', '2025-03-20 15:11:10', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (11, 4, 2, '[{\"k\":\"采摘地\",\"v\":\"2号茶园\"},{\"k\":\"采摘时间\",\"v\":\"2025-03-20\"}]', '0', '0', 'admin', '2025-03-20 15:11:39', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (12, 4, 3, '[{\"k\":\"加工地址\",\"v\":\"安徽黄山\"},{\"k\":\"加工时间\",\"v\":\"2025-03-20\"}]', '0', '0', 'admin', '2025-03-20 15:12:04', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (13, 1, 1, '[]', '0', '0', 'admin', '2025-03-24 14:44:29', 'admin', '2025-03-24 15:21:09', '1');
INSERT INTO `ewem_batch_link` VALUES (14, 5, 1, '[{\"k\":\"种植地\",\"v\":\"安徽黄山\"}]', '0', '2', 'admin', '2025-03-24 16:20:19', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (15, 5, 2, '[{\"k\":\"采摘时间\",\"v\":\"2025-03-24\"}]', '0', '2', 'admin', '2025-03-24 16:22:10', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (16, 5, 3, '[{\"k\":\"加工地\",\"v\":\"合肥\"}]', '0', '2', 'admin', '2025-03-24 17:04:29', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (17, 5, 1, '[{\"k\":\"种植时间\",\"v\":\"2025-03-24\"}]', '0', '2', 'admin', '2025-03-24 17:05:28', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (18, 5, 2, '[{\"k\":\"采摘地\",\"v\":\"安徽黄山\"}]', '0', '2', 'admin', '2025-03-24 17:05:42', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (19, 5, 4, '[{\"k\":\"销售商\",\"v\":\"千严科技\"},{\"k\":\"销售时间\",\"v\":\"2025-03-24\"}]', '0', '2', 'admin', '2025-03-24 17:06:07', 'admin', '2025-03-24 17:09:17', NULL);
INSERT INTO `ewem_batch_link` VALUES (20, 5, 1, '[{\"k\":\"种植地\",\"v\":\"安徽合肥\"},{\"k\":\"种植时间\",\"v\":\"2025-03-25\"}]', '0', '2', 'admin', '2025-03-25 09:11:25', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (21, 5, 1, '[{\"k\":\"种植地\",\"v\":\"安徽合肥\"},{\"k\":\"种植时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 09:38:15', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (22, 5, 2, '[{\"k\":\"采摘时间\",\"v\":\"2025-03-25\"},{\"k\":\"采摘园\",\"v\":\"2号茶园\"}]', '0', '0', 'admin', '2025-03-25 11:10:57', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (23, 5, 3, '[{\"k\":\"加工地\",\"v\":\"安徽黄山\"},{\"k\":\"加工时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 11:11:21', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (24, 5, 4, '[{\"k\":\"销售商\",\"v\":\"千严科技\"},{\"k\":\"销售时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 11:11:54', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (25, 6, 1, '[{\"k\":\"种植地\",\"v\":\"新疆\"},{\"k\":\"种植时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 13:42:27', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (26, 6, 2, '[{\"k\":\"采摘园\",\"v\":\"2号果园\"},{\"k\":\"采摘时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 13:42:54', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (27, 6, 3, '[{\"k\":\"加工地\",\"v\":\"新疆\"},{\"k\":\"加工时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 13:43:18', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (28, 6, 4, '[{\"k\":\"销售商\",\"v\":\"千严科技\"},{\"k\":\"销售时间\",\"v\":\"2025-03-25\"}]', '0', '0', 'admin', '2025-03-25 13:43:42', NULL, NULL, NULL);
INSERT INTO `ewem_batch_link` VALUES (29, 6, 1, '[{\"k\":\"11\",\"v\":\"11\"}]', '0', '0', 'admin', '2025-04-03 15:41:13', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ewem_category
-- ----------------------------
DROP TABLE IF EXISTS `ewem_category`;
CREATE TABLE `ewem_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_category
-- ----------------------------
INSERT INTO `ewem_category` VALUES (1, '茶叶', NULL, '0', '0', 'admin', '2025-03-20 14:38:17', NULL, NULL, NULL);
INSERT INTO `ewem_category` VALUES (2, '水果', NULL, '0', '2', 'admin', '2025-03-20 14:38:23', NULL, NULL, NULL);
INSERT INTO `ewem_category` VALUES (3, '水果', NULL, '0', '2', 'admin', '2025-03-25 13:37:18', NULL, NULL, NULL);
INSERT INTO `ewem_category` VALUES (4, '水果', NULL, '0', '0', 'admin', '2025-03-25 13:39:53', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ewem_code
-- ----------------------------
DROP TABLE IF EXISTS `ewem_code`;
CREATE TABLE `ewem_code`  (
  `id` bigint(22) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '码',
  `batch_id` bigint(20) NULL DEFAULT NULL COMMENT '申请ID',
  `scan_num` int(10) NULL DEFAULT 0 COMMENT '扫码次数',
  `first_scan_time` datetime NULL DEFAULT NULL COMMENT '首次扫码时间',
  `anti_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '防伪码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `trace_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '溯源方式',
  `qr_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '码数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_code
-- ----------------------------
INSERT INTO `ewem_code` VALUES (22, '4c3d5bbe84a74a18be7f610bf1bdeed0', 6, 3, '2025-04-03 15:50:16', '', '0', '0', 'admin', '2025-04-03 15:18:40', 'admin', '2025-04-03 15:50:16', '1', 'http://127.0.0.1/trace_h5?code=4c3d5bbe84a74a18be7f610bf1bdeed0');

-- ----------------------------
-- Table structure for ewem_link
-- ----------------------------
DROP TABLE IF EXISTS `ewem_link`;
CREATE TABLE `ewem_link`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '环节名称',
  `show_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端显示名称',
  `order_num` int(20) NULL DEFAULT NULL COMMENT '排序',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否显示(0显示 1隐藏)',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '环节模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_link
-- ----------------------------
INSERT INTO `ewem_link` VALUES (1, '种植', '种植', 1, '0', '0', '0', 'admin', '2025-03-20 14:41:56', NULL, NULL, NULL);
INSERT INTO `ewem_link` VALUES (2, '采摘', '采摘', 2, '0', '0', '0', 'admin', '2025-03-20 14:42:03', NULL, NULL, NULL);
INSERT INTO `ewem_link` VALUES (3, '加工', '加工', 3, '0', '0', '0', 'admin', '2025-03-20 14:42:11', NULL, NULL, NULL);
INSERT INTO `ewem_link` VALUES (4, '销售', '销售', 4, '0', '0', '0', 'admin', '2025-03-20 14:42:18', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ewem_product
-- ----------------------------
DROP TABLE IF EXISTS `ewem_product`;
CREATE TABLE `ewem_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `bar_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品条码',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `attrs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '动态参数',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本描述',
  `img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品视频',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_product
-- ----------------------------
INSERT INTO `ewem_product` VALUES (1, 'tea001', '茶001', '茶001', 1, '[]', NULL, NULL, NULL, '0', '0', 'admin', '2025-03-20 14:39:04', NULL, NULL, NULL);
INSERT INTO `ewem_product` VALUES (2, 'tea002', '茶002', '茶002', 1, '[]', NULL, NULL, NULL, '0', '0', 'admin', '2025-03-20 14:39:19', 'admin', '2025-03-20 14:39:31', NULL);
INSERT INTO `ewem_product` VALUES (3, 'w001', '乌龙茶', 'wlc001', 1, '[{\"k\":\"产地\",\"v\":\"安徽黄山\"}]', NULL, '/profile/upload/2025/03/21/1f0e1980-4538-43d8-bb04-f86c2ff6ef19.png', NULL, '0', '0', 'admin', '2025-03-20 14:56:59', 'admin', '2025-03-20 15:08:49', NULL);
INSERT INTO `ewem_product` VALUES (4, 'a001', '苹果', 'apple001', 3, '[{\"k\":\"品种\",\"v\":\"红富士\"},{\"k\":\"时间\",\"v\":\"2025-03-25\"},{\"k\":\"产地\",\"v\":\"新疆\"},{\"k\":\"价格\",\"v\":\"50元\"}]', NULL, '/profile/upload/2025/03/25/9d146c11-3913-4bcb-b5d4-3307ad590e6a.png', NULL, '0', '2', 'admin', '2025-03-25 13:39:26', NULL, NULL, NULL);
INSERT INTO `ewem_product` VALUES (5, 'a001', '苹果', 'apple001', 4, '[{\"k\":\"产地\",\"v\":\"新疆\"},{\"k\":\"品种\",\"v\":\"红富士\"},{\"k\":\"时间\",\"v\":\"2025-03-25\"},{\"k\":\"价格\",\"v\":\"5元/斤\"}]', NULL, '/profile/upload/2025/03/25/59683040-710d-4091-9bdc-0004d7fbd9e8.png', NULL, '0', '0', 'admin', '2025-03-25 13:40:53', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ewem_scan_log
-- ----------------------------
DROP TABLE IF EXISTS `ewem_scan_log`;
CREATE TABLE `ewem_scan_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '码',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维度',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `scan_time` datetime NULL DEFAULT NULL COMMENT '扫码时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扫码记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ewem_scan_log
-- ----------------------------
INSERT INTO `ewem_scan_log` VALUES (1, '19c3c30ed1f943068dff55d194cff012', NULL, NULL, NULL, '2025-03-20 14:45:59', NULL);
INSERT INTO `ewem_scan_log` VALUES (2, '19c3c30ed1f943068dff55d194cff012', NULL, NULL, NULL, '2025-03-20 14:47:00', NULL);
INSERT INTO `ewem_scan_log` VALUES (3, '19c3c30ed1f943068dff55d194cff012', NULL, NULL, NULL, '2025-03-20 14:48:08', NULL);
INSERT INTO `ewem_scan_log` VALUES (4, '19c3c30ed1f943068dff55d194cff012', NULL, NULL, NULL, '2025-03-20 14:48:09', NULL);
INSERT INTO `ewem_scan_log` VALUES (5, '66835e44b7264d17864db78ef03cbad1', NULL, NULL, NULL, '2025-03-20 14:48:57', NULL);
INSERT INTO `ewem_scan_log` VALUES (6, '66835e44b7264d17864db78ef03cbad1', NULL, NULL, NULL, '2025-03-20 14:53:50', NULL);
INSERT INTO `ewem_scan_log` VALUES (7, '74ec4da2eb924250b2f819279ace025a', NULL, NULL, NULL, '2025-03-20 14:59:56', NULL);
INSERT INTO `ewem_scan_log` VALUES (8, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:06:59', NULL);
INSERT INTO `ewem_scan_log` VALUES (9, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:07:09', NULL);
INSERT INTO `ewem_scan_log` VALUES (10, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:07:19', NULL);
INSERT INTO `ewem_scan_log` VALUES (11, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:07:45', NULL);
INSERT INTO `ewem_scan_log` VALUES (12, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:08:18', NULL);
INSERT INTO `ewem_scan_log` VALUES (13, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:08:54', NULL);
INSERT INTO `ewem_scan_log` VALUES (14, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:09:03', NULL);
INSERT INTO `ewem_scan_log` VALUES (15, '6ad687e0a01b41df8f97432265705d49', NULL, NULL, NULL, '2025-03-20 15:09:09', NULL);
INSERT INTO `ewem_scan_log` VALUES (16, 'b457e4d50e44442f8684ed7bdafcb11a', NULL, NULL, NULL, '2025-03-20 15:13:22', NULL);
INSERT INTO `ewem_scan_log` VALUES (17, 'c350f0d98dc04befa645a45e9229ac2e', NULL, NULL, NULL, '2025-03-20 15:19:10', NULL);
INSERT INTO `ewem_scan_log` VALUES (18, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-20 15:24:10', NULL);
INSERT INTO `ewem_scan_log` VALUES (19, '03c996b148e44762bb3f9d6f2adb998c', NULL, NULL, NULL, '2025-03-20 15:25:11', NULL);
INSERT INTO `ewem_scan_log` VALUES (20, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-20 15:57:40', NULL);
INSERT INTO `ewem_scan_log` VALUES (21, '74ec4da2eb924250b2f819279ace025a', NULL, NULL, NULL, '2025-03-21 11:12:24', NULL);
INSERT INTO `ewem_scan_log` VALUES (22, '74ec4da2eb924250b2f819279ace025a', NULL, NULL, NULL, '2025-03-21 11:13:55', NULL);
INSERT INTO `ewem_scan_log` VALUES (23, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:41:05', NULL);
INSERT INTO `ewem_scan_log` VALUES (24, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:45:11', NULL);
INSERT INTO `ewem_scan_log` VALUES (25, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:47:37', NULL);
INSERT INTO `ewem_scan_log` VALUES (26, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:50:02', NULL);
INSERT INTO `ewem_scan_log` VALUES (27, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:50:09', NULL);
INSERT INTO `ewem_scan_log` VALUES (28, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:50:26', NULL);
INSERT INTO `ewem_scan_log` VALUES (29, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 13:57:03', NULL);
INSERT INTO `ewem_scan_log` VALUES (30, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:14:18', NULL);
INSERT INTO `ewem_scan_log` VALUES (31, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:20:29', NULL);
INSERT INTO `ewem_scan_log` VALUES (32, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:23:04', NULL);
INSERT INTO `ewem_scan_log` VALUES (33, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:37:55', NULL);
INSERT INTO `ewem_scan_log` VALUES (34, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:43:39', NULL);
INSERT INTO `ewem_scan_log` VALUES (35, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:45:37', NULL);
INSERT INTO `ewem_scan_log` VALUES (36, 'bae47e340c2d4db48631bcb2c2bf26e8', NULL, NULL, NULL, '2025-03-21 14:45:56', NULL);
INSERT INTO `ewem_scan_log` VALUES (37, 'b457e4d50e44442f8684ed7bdafcb11a', NULL, NULL, NULL, '2025-03-21 14:49:08', NULL);
INSERT INTO `ewem_scan_log` VALUES (38, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 16:23:01', NULL);
INSERT INTO `ewem_scan_log` VALUES (39, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 16:23:57', NULL);
INSERT INTO `ewem_scan_log` VALUES (40, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 16:25:50', NULL);
INSERT INTO `ewem_scan_log` VALUES (41, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:04:59', NULL);
INSERT INTO `ewem_scan_log` VALUES (42, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:06:35', NULL);
INSERT INTO `ewem_scan_log` VALUES (43, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:06:42', NULL);
INSERT INTO `ewem_scan_log` VALUES (44, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:18:57', NULL);
INSERT INTO `ewem_scan_log` VALUES (45, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:19:04', NULL);
INSERT INTO `ewem_scan_log` VALUES (46, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:26:47', NULL);
INSERT INTO `ewem_scan_log` VALUES (47, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:27:52', NULL);
INSERT INTO `ewem_scan_log` VALUES (48, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-24 17:29:46', NULL);
INSERT INTO `ewem_scan_log` VALUES (49, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:00:34', NULL);
INSERT INTO `ewem_scan_log` VALUES (50, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:38:27', NULL);
INSERT INTO `ewem_scan_log` VALUES (51, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:41:04', NULL);
INSERT INTO `ewem_scan_log` VALUES (52, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:41:37', NULL);
INSERT INTO `ewem_scan_log` VALUES (53, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:43:23', NULL);
INSERT INTO `ewem_scan_log` VALUES (54, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:44:13', NULL);
INSERT INTO `ewem_scan_log` VALUES (55, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:49:17', NULL);
INSERT INTO `ewem_scan_log` VALUES (56, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:55:35', NULL);
INSERT INTO `ewem_scan_log` VALUES (57, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:56:37', NULL);
INSERT INTO `ewem_scan_log` VALUES (58, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 09:56:57', NULL);
INSERT INTO `ewem_scan_log` VALUES (59, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:00:42', NULL);
INSERT INTO `ewem_scan_log` VALUES (60, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:05:11', NULL);
INSERT INTO `ewem_scan_log` VALUES (61, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:05:29', NULL);
INSERT INTO `ewem_scan_log` VALUES (62, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:10:21', NULL);
INSERT INTO `ewem_scan_log` VALUES (63, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:11:02', NULL);
INSERT INTO `ewem_scan_log` VALUES (64, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:13:32', NULL);
INSERT INTO `ewem_scan_log` VALUES (65, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:13:51', NULL);
INSERT INTO `ewem_scan_log` VALUES (66, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:13:56', NULL);
INSERT INTO `ewem_scan_log` VALUES (67, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 10:14:05', NULL);
INSERT INTO `ewem_scan_log` VALUES (68, 'c5bdb12c8e0a4eee9325c03e5275509a', NULL, NULL, NULL, '2025-03-25 11:12:04', NULL);
INSERT INTO `ewem_scan_log` VALUES (69, '11fae2f24d38477e801c3d68f08d301a', NULL, NULL, NULL, '2025-03-25 13:43:57', NULL);
INSERT INTO `ewem_scan_log` VALUES (70, '4c3d5bbe84a74a18be7f610bf1bdeed0', NULL, NULL, NULL, '2025-04-03 15:50:16', NULL);
INSERT INTO `ewem_scan_log` VALUES (71, '4c3d5bbe84a74a18be7f610bf1bdeed0', NULL, NULL, NULL, '2025-04-03 15:53:48', NULL);
INSERT INTO `ewem_scan_log` VALUES (72, '4c3d5bbe84a74a18be7f610bf1bdeed0', NULL, NULL, NULL, '2025-04-03 15:54:05', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
INSERT INTO `qrtz_fired_triggers` VALUES ('EwemScheduler', 'DESKTOP-TRIUDVG17436687442561743668744257', 'TASK_CLASS_NAME4', 'DEFAULT', 'DESKTOP-TRIUDVG1743668744256', 1743668920033, 1743668930000, 5, 'ACQUIRED', NULL, NULL, '0', '0');

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('EwemScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ewem.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E6577656D2E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E6577656D2E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000195B225034878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('EwemScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ewem.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E6577656D2E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E6577656D2E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000195B225034878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('EwemScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ewem.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E6577656D2E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E6577656D2E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000195B225034878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('EwemScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', NULL, 'com.ewem.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E6577656D2E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E6577656D2E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000195B225034878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E68616E646C65436F646574000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000004740009E7A081E585A5E5BA9374000133740001307800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('EwemScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('EwemScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('EwemScheduler', 'DESKTOP-TRIUDVG1743668744256', 1743668914702, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1743668750000, -1, 5, 'PAUSED', 'CRON', 1743668744000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1743668745000, -1, 5, 'PAUSED', 'CRON', 1743668744000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1743668760000, -1, 5, 'PAUSED', 'CRON', 1743668744000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('EwemScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', 'TASK_CLASS_NAME4', 'DEFAULT', NULL, 1743668930000, 1743668920000, 5, 'ACQUIRED', 'CRON', 1743668744000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-03-20 14:02:05', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-03-20 14:02:05', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-03-20 14:02:05', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2025-03-20 14:02:05', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-03-20 14:02:05', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (35, 0, '初始化', '1', 'ewem_apply_status', NULL, 'primary', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 0, '进行中', '2', 'ewem_apply_status', NULL, 'warning', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 0, '失败', '4', 'ewem_apply_status', NULL, 'danger', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 0, '成功', '3', 'ewem_apply_status', NULL, 'success', 'N', '0', 'admin', '2025-03-20 14:02:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 0, '普通溯源', '1', 'ewem_trace_type', NULL, 'success', 'N', '0', 'admin', '2025-03-24 09:56:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '区块链溯源', '2', 'ewem_trace_type', NULL, 'primary', 'N', '0', 'admin', '2025-03-24 09:56:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 1, '纯数字', '1', 'ewem_gen_code_rule', NULL, 'primary', 'N', '0', 'admin', '2025-04-03 14:38:13', 'admin', '2025-04-03 14:38:44', NULL);
INSERT INTO `sys_dict_data` VALUES (42, 2, '纯字母', '2', 'ewem_gen_code_rule', NULL, 'success', 'N', '0', 'admin', '2025-04-03 14:38:25', 'admin', '2025-04-03 14:38:48', NULL);
INSERT INTO `sys_dict_data` VALUES (43, 3, '混合', '3', 'ewem_gen_code_rule', NULL, 'warning', 'N', '0', 'admin', '2025-04-03 14:38:35', 'admin', '2025-04-03 14:39:01', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '码申请状态', 'ewem_apply_status', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '码申请状态列表');
INSERT INTO `sys_dict_type` VALUES (12, '溯源方式', 'ewem_trace_type', '0', 'admin', '2025-03-24 09:55:47', '', NULL, '溯源码溯源方式');
INSERT INTO `sys_dict_type` VALUES (13, '生码规则', 'ewem_gen_code_rule', '0', 'admin', '2025-04-03 14:36:48', 'admin', '2025-04-03 14:37:15', '生码规则');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (4, '码入库', 'DEFAULT', 'ryTask.handleCode', '0/10 * * * * ?', '3', '1', '0', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-20 16:11:01', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------


-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 14:34:04');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '39.170.58.206,127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 15:42:38');
INSERT INTO `sys_logininfor` VALUES (3, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-20 16:04:33');
INSERT INTO `sys_logininfor` VALUES (4, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 16:04:36');
INSERT INTO `sys_logininfor` VALUES (5, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-20 16:04:46');
INSERT INTO `sys_logininfor` VALUES (6, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 16:04:52');
INSERT INTO `sys_logininfor` VALUES (7, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-20 16:08:29');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-20 16:08:32');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-21 11:11:39');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-21 13:39:05');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 09:55:12');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 14:44:09');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 15:20:57');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 16:18:41');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 17:04:11');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-25 09:10:40');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-25 13:36:37');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 17:01:22');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-31 17:27:03');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 17:27:15');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-31 17:28:56');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 17:29:54');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-31 17:37:37');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-31 17:43:44');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-31 17:43:48');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-03-31 17:44:47');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-03 14:36:01');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-03 16:28:03');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1162 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-03-20 14:02:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-03-20 14:02:05', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-03-20 14:02:05', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '溯源查询', 0, 4, 'http://localhost/trace', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-03-21 11:07:46', '', NULL, '溯源查询地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-03-20 14:02:05', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-03-20 14:02:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-03-20 14:02:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-03-20 14:02:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-03-20 14:02:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-03-20 14:02:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-03-20 14:02:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-03-20 14:02:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-03-20 14:02:05', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-03-20 14:02:05', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-03-20 14:02:05', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-03-20 14:02:05', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-03-20 14:02:05', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-03-20 14:02:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-03-20 14:02:05', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-03-20 14:02:05', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-03-20 14:02:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-03-20 14:02:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-03-20 14:02:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '赋码管理', 0, 30, 'code', NULL, 1, 0, 'M', '0', '0', '', 'code', 'admin', '2025-03-20 14:02:05', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, '溯源码管理', 1061, 2, 'code', 'ewem/code/index', 1, 0, 'C', '0', '0', 'ewem:code:list', '#', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-24 17:30:40', '码管理菜单');
INSERT INTO `sys_menu` VALUES (1081, '码管理查询', 1080, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:code:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '码管理新增', 1080, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:code:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '码管理修改', 1080, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:code:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '码管理删除', 1080, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:code:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '码管理导出', 1080, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:code:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '基础数据', 0, 10, 'basicData', NULL, 1, 0, 'M', '0', '0', '', 'build', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-20 14:02:05', '');
INSERT INTO `sys_menu` VALUES (1113, '产品管理', 1088, 2, 'product', 'ewem/product/index', 1, 0, 'C', '0', '0', 'ewem:product:list', '#', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-24 17:31:19', '产品管理菜单');
INSERT INTO `sys_menu` VALUES (1114, '产品管理查询', 1113, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:product:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1115, '产品管理新增', 1113, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:product:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1116, '产品管理修改', 1113, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:product:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1117, '产品管理删除', 1113, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:product:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1118, '产品管理导出', 1113, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:product:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1119, '产品分类', 1088, 1, 'category', 'ewem/category/index', 1, 0, 'C', '0', '0', 'ewem:category:list', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '产品分类菜单');
INSERT INTO `sys_menu` VALUES (1120, '产品分类查询', 1119, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:category:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1121, '产品分类新增', 1119, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:category:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1122, '产品分类修改', 1119, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:category:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1123, '产品分类删除', 1119, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:category:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1124, '产品分类导出', 1119, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:category:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1125, '批次管理', 1088, 3, 'batch', 'ewem/batch/index', 1, 0, 'C', '0', '0', 'ewem:batch:list', '#', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-24 17:31:24', '批次菜单');
INSERT INTO `sys_menu` VALUES (1126, '批次查询', 1125, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:batch:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1127, '批次新增', 1125, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:batch:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1128, '批次修改', 1125, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:batch:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1129, '批次删除', 1125, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:batch:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1130, '批次导出', 1125, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:batch:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1131, '溯源码申请', 1061, 1, 'apply', 'ewem/apply/index', 1, 0, 'C', '0', '0', 'ewem:apply:list', '#', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-24 17:30:29', '码申请菜单');
INSERT INTO `sys_menu` VALUES (1132, '码申请查询', 1131, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:apply:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1133, '码申请新增', 1131, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:apply:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1134, '码申请修改', 1131, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:apply:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1135, '码申请删除', 1131, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:apply:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1136, '码申请导出', 1131, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:apply:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1137, '环节管理', 0, 50, 'link', NULL, 1, 0, 'M', '0', '0', '', 'list', 'admin', '2025-03-20 14:02:05', 'admin', NULL, '');
INSERT INTO `sys_menu` VALUES (1138, '环节模板', 1137, 1, 'link', 'ewem/link/index', 1, 0, 'C', '0', '0', 'ewem:link:list', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '环节模板菜单');
INSERT INTO `sys_menu` VALUES (1139, '环节模板查询', 1138, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:link:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1140, '环节模板新增', 1138, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:link:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1141, '环节模板修改', 1138, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:link:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1142, '环节模板删除', 1138, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:link:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1143, '环节模板导出', 1138, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:link:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1150, '溯源环节录入', 1137, 1, 'batchLink', 'ewem/batchLink/index', 1, 0, 'C', '0', '0', 'ewem:batchLink:list', '#', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-24 17:32:01', '批次环节记录菜单');
INSERT INTO `sys_menu` VALUES (1151, '批次环节记录查询', 1150, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:batchLink:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1152, '批次环节记录新增', 1150, 2, '#', '', 1, 0, 'F', '0', '0', 'ewem:batchLink:add', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1153, '批次环节记录修改', 1150, 3, '#', '', 1, 0, 'F', '0', '0', 'ewem:batchLink:edit', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1154, '批次环节记录删除', 1150, 4, '#', '', 1, 0, 'F', '0', '0', 'ewem:batchLink:remove', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1155, '批次环节记录导出', 1150, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:batchLink:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1158, '扫码记录', 1061, 3, 'scanLog', 'ewem/scanLog/index', 1, 0, 'C', '0', '0', 'ewem:scanLog:list', '#', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-24 17:30:44', '扫码记录菜单');
INSERT INTO `sys_menu` VALUES (1159, '扫码记录查询', 1158, 1, '#', '', 1, 0, 'F', '0', '0', 'ewem:scanLog:query', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1160, '扫码记录导出', 1158, 5, '#', '', 1, 0, 'F', '0', '0', 'ewem:scanLog:export', '#', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1161, '区块链浏览器', 0, 5, 'http://192.168.32.130:9090/', NULL, 0, 0, 'M', '0', '0', '', 'example', 'admin', '2025-03-24 17:36:55', 'admin', '2025-03-25 10:35:51', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-03-20 14:02:05', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-03-20 14:02:05', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '产品分类', 1, 'com.ewem.code.controller.CategoryController.add()', 'POST', 1, 'admin', NULL, '/ewem/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1742452697525,\"name\":\"茶叶\",\"id\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:38:17');
INSERT INTO `sys_oper_log` VALUES (2, '产品分类', 1, 'com.ewem.code.controller.CategoryController.add()', 'POST', 1, 'admin', NULL, '/ewem/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1742452703553,\"name\":\"水果\",\"id\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:38:23');
INSERT INTO `sys_oper_log` VALUES (3, '产品管理', 1, 'com.ewem.code.controller.ProductController.add()', 'POST', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"code\":\"tea001\",\"attrs\":[],\"barCode\":\"茶001\",\"createBy\":\"admin\",\"createTime\":1742452744140,\"name\":\"茶001\",\"id\":1,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:39:04');
INSERT INTO `sys_oper_log` VALUES (4, '产品管理', 1, 'com.ewem.code.controller.ProductController.add()', 'POST', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"code\":\"茶002\",\"attrs\":[],\"barCode\":\"茶002\",\"createBy\":\"admin\",\"createTime\":1742452759877,\"name\":\"茶002\",\"id\":2,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:39:19');
INSERT INTO `sys_oper_log` VALUES (5, '产品管理', 2, 'com.ewem.code.controller.ProductController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"code\":\"tea002\",\"updateTime\":1742452771017,\"delFlag\":\"0\",\"attrs\":[],\"barCode\":\"茶002\",\"createBy\":\"admin\",\"createTime\":1742452759000,\"updateBy\":\"admin\",\"name\":\"茶002\",\"id\":2,\"category\":{\"createBy\":\"admin\",\"createTime\":1742452697000,\"name\":\"茶叶\",\"id\":1,\"delFlag\":\"0\",\"status\":\"0\"},\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:39:31');
INSERT INTO `sys_oper_log` VALUES (6, '批次', 1, 'com.ewem.code.controller.BatchController.add()', 'POST', 1, 'admin', NULL, '/ewem/batch', '127.0.0.1', '内网IP', '{\"number\":\"tea001\",\"createBy\":\"admin\",\"productId\":1,\"createTime\":1742452783349,\"id\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:39:43');
INSERT INTO `sys_oper_log` VALUES (7, '批次', 1, 'com.ewem.code.controller.BatchController.add()', 'POST', 1, 'admin', NULL, '/ewem/batch', '127.0.0.1', '内网IP', '{\"number\":\"tea002\",\"createBy\":\"admin\",\"productId\":2,\"createTime\":1742452790821,\"id\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:39:50');
INSERT INTO `sys_oper_log` VALUES (8, '环节模板', 1, 'com.ewem.code.controller.LinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/link', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"showName\":\"种植\",\"visible\":\"0\",\"createTime\":1742452916089,\"name\":\"种植\",\"orderNum\":1,\"id\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:41:56');
INSERT INTO `sys_oper_log` VALUES (9, '环节模板', 1, 'com.ewem.code.controller.LinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/link', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"showName\":\"采摘\",\"visible\":\"0\",\"createTime\":1742452923677,\"name\":\"采摘\",\"orderNum\":2,\"id\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:42:03');
INSERT INTO `sys_oper_log` VALUES (10, '环节模板', 1, 'com.ewem.code.controller.LinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/link', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"showName\":\"加工\",\"visible\":\"0\",\"createTime\":1742452931291,\"name\":\"加工\",\"orderNum\":3,\"id\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:42:11');
INSERT INTO `sys_oper_log` VALUES (11, '环节模板', 1, 'com.ewem.code.controller.LinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/link', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"showName\":\"销售\",\"visible\":\"0\",\"createTime\":1742452938485,\"name\":\"销售\",\"orderNum\":4,\"id\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:42:18');
INSERT INTO `sys_oper_log` VALUES (12, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":2,\"batchId\":1,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"createTime\":1742453099934,\"name\":\"tea001申请码\",\"id\":1,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:44:59');
INSERT INTO `sys_oper_log` VALUES (13, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":1,\"attrs\":[],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742453266280,\"id\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:47:46');
INSERT INTO `sys_oper_log` VALUES (14, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":1,\"attrs\":[],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742453271007,\"id\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:47:51');
INSERT INTO `sys_oper_log` VALUES (15, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":1,\"attrs\":[],\"createBy\":\"admin\",\"linkId\":3,\"createTime\":1742453275148,\"id\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:47:55');
INSERT INTO `sys_oper_log` VALUES (16, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":1,\"attrs\":[],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742453279316,\"id\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:47:59');
INSERT INTO `sys_oper_log` VALUES (17, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":1,\"antiLength\":6,\"useAnti\":true,\"createBy\":\"admin\",\"createTime\":1742453321605,\"name\":\"001茶申请码2\",\"id\":2,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:48:41');
INSERT INTO `sys_oper_log` VALUES (18, '产品管理', 1, 'com.ewem.code.controller.ProductController.add()', 'POST', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"code\":\"w001\",\"attrs\":[{\"v\":\"1\",\"k\":\"qq\"},{\"v\":\"2\",\"k\":\"22\"}],\"barCode\":\"wlc001\",\"createBy\":\"admin\",\"createTime\":1742453819642,\"name\":\"乌龙茶\",\"id\":3,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:56:59');
INSERT INTO `sys_oper_log` VALUES (19, '批次', 1, 'com.ewem.code.controller.BatchController.add()', 'POST', 1, 'admin', NULL, '/ewem/batch', '127.0.0.1', '内网IP', '{\"number\":\"20250320001\",\"createBy\":\"admin\",\"productId\":3,\"createTime\":1742453833492,\"id\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:57:13');
INSERT INTO `sys_oper_log` VALUES (20, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":3,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"地址\"},{\"v\":\"20摄氏度\",\"k\":\"温度\"},{\"v\":\"乌龙茶\",\"k\":\"品种\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742453891859,\"id\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:58:11');
INSERT INTO `sys_oper_log` VALUES (21, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742453914372,\"batchId\":3,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"地址\"},{\"v\":\"20摄氏度\",\"k\":\"温度\"},{\"v\":\"乌龙茶\",\"k\":\"品种\"},{\"v\":\"2024-03-20\",\"k\":\"时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742453891000,\"updateBy\":\"admin\",\"id\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:58:34');
INSERT INTO `sys_oper_log` VALUES (22, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742453914000,\"batchId\":3,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"地址\"},{\"v\":\"20摄氏度\",\"k\":\"温度\"},{\"v\":\"乌龙茶\",\"k\":\"品种\"},{\"v\":\"2024-03-20\",\"k\":\"种植时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742453891000,\"updateBy\":\"admin\",\"id\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:58:41');
INSERT INTO `sys_oper_log` VALUES (23, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":3,\"attrs\":[{\"v\":\"2025-03-20\",\"k\":\"采摘时间\"},{\"v\":\"安徽黄山\",\"k\":\"采摘地点\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742453958660,\"id\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:59:18');
INSERT INTO `sys_oper_log` VALUES (24, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":3,\"antiLength\":6,\"useAnti\":true,\"createBy\":\"admin\",\"createTime\":1742453986302,\"name\":\"20250320001溯源码\",\"id\":3,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 14:59:46');
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 3, 'com.ewem.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2025-03-20 15:02:35');
INSERT INTO `sys_oper_log` VALUES (26, '角色管理', 2, 'com.ewem.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1742450525000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:03:11');
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 3, 'com.ewem.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:03:16');
INSERT INTO `sys_oper_log` VALUES (28, '批次', 1, 'com.ewem.code.controller.BatchController.add()', 'POST', 1, 'admin', NULL, '/ewem/batch', '127.0.0.1', '内网IP', '{\"number\":\"20250320002\",\"createBy\":\"admin\",\"productId\":3,\"createTime\":1742454263668,\"id\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:04:23');
INSERT INTO `sys_oper_log` VALUES (29, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":3,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"地址\"},{\"v\":\"20摄氏度\",\"k\":\"温度\"},{\"v\":\"乌龙茶\",\"k\":\"品种\"},{\"v\":\"2025-03-20\",\"k\":\"种植时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742454306290,\"id\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:05:06');
INSERT INTO `sys_oper_log` VALUES (30, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":3,\"attrs\":[{\"v\":\"2号茶园\",\"k\":\"采摘地\"},{\"v\":\"2025-03-20\",\"k\":\"采摘时间\"},{\"v\":\"20\",\"k\":\"采摘数量\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742454335983,\"id\":8,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:05:36');
INSERT INTO `sys_oper_log` VALUES (31, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":3,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"加工地址\"},{\"v\":\"乌龙茶\",\"k\":\"加工品种\"},{\"v\":\"2025-03-20\",\"k\":\"加工时间\"}],\"createBy\":\"admin\",\"linkId\":3,\"createTime\":1742454369912,\"id\":9,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:06:09');
INSERT INTO `sys_oper_log` VALUES (32, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":4,\"antiLength\":6,\"useAnti\":true,\"createBy\":\"admin\",\"createTime\":1742454385695,\"name\":\"20250320002溯源码\",\"id\":4,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:06:25');
INSERT INTO `sys_oper_log` VALUES (33, '产品管理', 2, 'com.ewem.code.controller.ProductController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"code\":\"w001\",\"updateTime\":1742454529753,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"产地\"}],\"barCode\":\"wlc001\",\"createBy\":\"admin\",\"createTime\":1742453819000,\"updateBy\":\"admin\",\"name\":\"乌龙茶\",\"id\":3,\"category\":{\"createBy\":\"admin\",\"createTime\":1742452697000,\"name\":\"茶叶\",\"id\":1,\"delFlag\":\"0\",\"status\":\"0\"},\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:08:49');
INSERT INTO `sys_oper_log` VALUES (34, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/1,2,3,4,5,6,7,8,9', '127.0.0.1', '内网IP', '{ids=1,2,3,4,5,6,7,8,9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:09:55');
INSERT INTO `sys_oper_log` VALUES (35, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":4,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"地址\"},{\"v\":\"2025-03-20\",\"k\":\"种植时间\"},{\"v\":\"乌龙茶\",\"k\":\"品种\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742454670389,\"id\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:11:10');
INSERT INTO `sys_oper_log` VALUES (36, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":4,\"attrs\":[{\"v\":\"2号茶园\",\"k\":\"采摘地\"},{\"v\":\"2025-03-20\",\"k\":\"采摘时间\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742454699197,\"id\":11,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:11:39');
INSERT INTO `sys_oper_log` VALUES (37, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":4,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"加工地址\"},{\"v\":\"2025-03-20\",\"k\":\"加工时间\"}],\"createBy\":\"admin\",\"linkId\":3,\"createTime\":1742454724244,\"id\":12,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:12:04');
INSERT INTO `sys_oper_log` VALUES (38, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":4,\"antiLength\":6,\"useAnti\":true,\"createBy\":\"admin\",\"createTime\":1742454738630,\"name\":\"20250320002溯源码\",\"id\":5,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:12:18');
INSERT INTO `sys_oper_log` VALUES (39, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":4,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"createTime\":1742455439493,\"name\":\"11\",\"id\":6,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:23:59');
INSERT INTO `sys_oper_log` VALUES (40, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":2,\"batchId\":2,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"createTime\":1742455468934,\"name\":\"22\",\"id\":7,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:24:28');
INSERT INTO `sys_oper_log` VALUES (41, '码管理', 3, 'com.ewem.code.controller.CodeController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/code/1,9,8,2,3', '39.170.58.206,127.0.0.1', '内网IP', '{ids=1,9,8,2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:54:47');
INSERT INTO `sys_oper_log` VALUES (42, '码申请', 3, 'com.ewem.code.controller.ApplyController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/apply/1,2,7', '39.170.58.206,127.0.0.1', '内网IP', '{ids=1,2,7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 15:55:02');
INSERT INTO `sys_oper_log` VALUES (43, '用户管理', 1, 'com.ewem.web.controller.system.SysUserController.add()', 'POST', 1, 'ry', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$t0XTVbw2GZDEOgE2j0OkPeTcm6RcZhtk1/W3ZxGaxwBY/GUiJnsI.\",\"postIds\":[],\"nickName\":\"万万\",\"deptId\":101,\"params\":{},\"userName\":\"万万\",\"userId\":4,\"createBy\":\"ry\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 16:05:43');
INSERT INTO `sys_oper_log` VALUES (44, '角色管理', 2, 'com.ewem.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1742450525000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,1088,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1061,1080,1081,1082,1083,1084,1085,1131,1132,1133,1134,1135,1136,1158,1159,1160,1137,1138,1139,1140,1141,1142,1143,1150,1151,1152,1153,1154,1155],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 16:09:35');
INSERT INTO `sys_oper_log` VALUES (45, '定时任务', 2, 'com.ewem.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"码入库\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0/10 * * * * ?\",\"jobId\":4,\"createBy\":\"admin\",\"nextValidTime\":1742458270000,\"createTime\":1742450525000,\"updateBy\":\"admin\",\"invokeTarget\":\"ryTask.handleCode\",\"misfirePolicy\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-20 16:11:01');
INSERT INTO `sys_oper_log` VALUES (46, '产品管理', 2, 'com.ewem.code.controller.ProductController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"img\":\"/profile/upload/2025/03/21/1f0e1980-4538-43d8-bb04-f86c2ff6ef19.png\",\"code\":\"w001\",\"updateTime\":1742454529000,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"产地\"}],\"barCode\":\"wlc001\",\"createBy\":\"admin\",\"createTime\":1742453819000,\"updateBy\":\"admin\",\"name\":\"乌龙茶\",\"id\":3,\"category\":{\"createBy\":\"admin\",\"createTime\":1742452697000,\"name\":\"茶叶\",\"id\":1,\"delFlag\":\"0\",\"status\":\"0\"},\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-21 13:39:41');
INSERT INTO `sys_oper_log` VALUES (47, '字典类型', 1, 'com.ewem.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"溯源方式\",\"remark\":\"溯源码溯源方式\",\"params\":{},\"dictType\":\"ewem_trace_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 09:55:47');
INSERT INTO `sys_oper_log` VALUES (48, '字典数据', 1, 'com.ewem.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"ewem_trace_type\",\"dictLabel\":\"普通溯源\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 09:56:07');
INSERT INTO `sys_oper_log` VALUES (49, '字典数据', 1, 'com.ewem.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"ewem_trace_type\",\"dictLabel\":\"区块链溯源\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 09:56:16');
INSERT INTO `sys_oper_log` VALUES (50, '码申请', 2, 'com.ewem.code.controller.ApplyController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"updateTime\":1742453990000,\"batchId\":3,\"delFlag\":\"0\",\"antiLength\":0,\"createBy\":\"admin\",\"createTime\":1742453986000,\"updateBy\":\"admin\",\"name\":\"20250320001溯源码\",\"id\":3,\"applyStatus\":\"3\",\"status\":\"0\"}', 'null', 1, '当前申请状态不可修改', '2025-03-24 10:08:51');
INSERT INTO `sys_oper_log` VALUES (51, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":1,\"attrs\":[],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742798669906,\"id\":13,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 14:44:29');
INSERT INTO `sys_oper_log` VALUES (52, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"remark\":\"1\",\"updateTime\":1742800869429,\"batchId\":1,\"delFlag\":\"0\",\"attrs\":[],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742798669000,\"updateBy\":\"admin\",\"id\":13,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 15:21:09');
INSERT INTO `sys_oper_log` VALUES (53, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"remark\":\"1\",\"updateTime\":1742800869000,\"batchId\":1,\"delFlag\":\"0\",\"attrs\":[],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742798669000,\"updateBy\":\"admin\",\"id\":13,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 15:21:33');
INSERT INTO `sys_oper_log` VALUES (54, '批次', 1, 'com.ewem.code.controller.BatchController.add()', 'POST', 1, 'admin', NULL, '/ewem/batch', '127.0.0.1', '内网IP', '{\"number\":\"20250324001\",\"createBy\":\"admin\",\"productId\":3,\"createTime\":1742804365818,\"id\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 16:19:25');
INSERT INTO `sys_oper_log` VALUES (55, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":5,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"2\",\"createTime\":1742804397543,\"name\":\"20250324001溯源码\",\"id\":8,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 16:19:57');
INSERT INTO `sys_oper_log` VALUES (56, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"种植地\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742804419151,\"id\":14,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 1ebb8fe33dc2541b5ad198d8bc8aa5b0c3fdd72cddd2e4660216f65131efc388\",\"code\":200}', 0, NULL, '2025-03-24 16:20:25');
INSERT INTO `sys_oper_log` VALUES (57, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"2025-03-24\",\"k\":\"采摘时间\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742804530732,\"id\":15,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 5b5eec5131915aaeeb87035057c0650d0267f4ab3b54556ae24d5534138a2d6a\",\"code\":200}', 0, NULL, '2025-03-24 16:22:12');
INSERT INTO `sys_oper_log` VALUES (58, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"合肥\",\"k\":\"加工地\"}],\"createBy\":\"admin\",\"linkId\":3,\"createTime\":1742807069048,\"id\":16,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 2f943a159563af6e3a714065f7b6913834089dc20a8628f256ba1589a162afa7\",\"code\":200}', 0, NULL, '2025-03-24 17:04:35');
INSERT INTO `sys_oper_log` VALUES (59, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"2025-03-24\",\"k\":\"种植时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742807128622,\"id\":17,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 6fb996a8b88db29367b2aabca27e81f64ba3fe2acaf00150e0ace218d5b7e61d\",\"code\":200}', 0, NULL, '2025-03-24 17:05:30');
INSERT INTO `sys_oper_log` VALUES (60, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"采摘地\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742807142548,\"id\":18,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 62447f3915ac173b56cf9ff2ff678a82d376c27fd6286a5ee9f6fda58232842f\",\"code\":200}', 0, NULL, '2025-03-24 17:05:44');
INSERT INTO `sys_oper_log` VALUES (61, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167537,\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 684eb7e4dfff12b08d20e1133b6de3af72a57194292db999176d1e887d336c60\",\"code\":200}', 0, NULL, '2025-03-24 17:06:09');
INSERT INTO `sys_oper_log` VALUES (62, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742807357439,\"batchId\":5,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167000,\"updateBy\":\"admin\",\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 321eb7b682a2cdceb76d4a62603c120872fd88d702842ebf8195b758ef11c8a0\",\"code\":200}', 0, NULL, '2025-03-24 17:09:19');
INSERT INTO `sys_oper_log` VALUES (63, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742807357000,\"batchId\":5,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167000,\"updateBy\":\"admin\",\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: d21f96ac3303809c365e90838de2006cfb4dc73a6c66eb5d195c12ca427241f0\",\"code\":200}', 0, NULL, '2025-03-24 17:10:39');
INSERT INTO `sys_oper_log` VALUES (64, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742807357000,\"batchId\":5,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167000,\"updateBy\":\"admin\",\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 1bb3e6575ed1818968eb16bcfb1f85a9bd8892713f15d34f6036d1dd32038ead\",\"code\":200}', 0, NULL, '2025-03-24 17:10:53');
INSERT INTO `sys_oper_log` VALUES (65, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742807357000,\"batchId\":5,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167000,\"updateBy\":\"admin\",\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 35995cdab014a1fd4b38f463b231a39af0ac421369aa04bfbad7c56c82f1c7b3\",\"code\":200}', 0, NULL, '2025-03-24 17:11:07');
INSERT INTO `sys_oper_log` VALUES (66, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742807357000,\"batchId\":5,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167000,\"updateBy\":\"admin\",\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: d5af58920a56549cbd1f3a6632e31d750f59ad1747ed6f16d897c12fe299ff90\",\"code\":200}', 0, NULL, '2025-03-24 17:13:41');
INSERT INTO `sys_oper_log` VALUES (67, '批次环节记录', 2, 'com.ewem.code.controller.BatchLinkController.edit()', 'PUT', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"updateTime\":1742807357000,\"batchId\":5,\"delFlag\":\"0\",\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-24\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742807167000,\"updateBy\":\"admin\",\"id\":19,\"status\":\"0\"}', '{\"msg\":\"操作成功,链上交易ID: 06d09e2e86ec4cb558b7ab9ddbe1deb96bac995852b1cb09e26bf95ca7c75c21\",\"code\":200}', 0, NULL, '2025-03-24 17:18:23');
INSERT INTO `sys_oper_log` VALUES (68, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/19', '127.0.0.1', '内网IP', '{ids=19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:18:48');
INSERT INTO `sys_oper_log` VALUES (69, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/18', '127.0.0.1', '内网IP', '{ids=18}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:26:40');
INSERT INTO `sys_oper_log` VALUES (70, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/17', '127.0.0.1', '内网IP', '{ids=17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:27:24');
INSERT INTO `sys_oper_log` VALUES (71, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/16', '127.0.0.1', '内网IP', '{ids=16}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:27:38');
INSERT INTO `sys_oper_log` VALUES (72, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/19', '127.0.0.1', '内网IP', '{ids=19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:29:41');
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"溯源码管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"code\",\"component\":\"ewem/code/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"ewem:code:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:30:23');
INSERT INTO `sys_oper_log` VALUES (74, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"溯源码申请\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"apply\",\"component\":\"ewem/apply/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1131,\"menuType\":\"C\",\"perms\":\"ewem:apply:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:30:29');
INSERT INTO `sys_oper_log` VALUES (75, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"溯源码管理\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"code\",\"component\":\"ewem/code/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"ewem:code:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:30:40');
INSERT INTO `sys_oper_log` VALUES (76, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"扫码记录\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"scanLog\",\"component\":\"ewem/scanLog/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1158,\"menuType\":\"C\",\"perms\":\"ewem:scanLog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:30:44');
INSERT INTO `sys_oper_log` VALUES (77, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"产品管理\",\"params\":{},\"parentId\":1088,\"isCache\":\"0\",\"path\":\"product\",\"component\":\"ewem/product/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1113,\"menuType\":\"C\",\"perms\":\"ewem:product:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:31:19');
INSERT INTO `sys_oper_log` VALUES (78, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"批次管理\",\"params\":{},\"parentId\":1088,\"isCache\":\"0\",\"path\":\"batch\",\"component\":\"ewem/batch/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1125,\"menuType\":\"C\",\"perms\":\"ewem:batch:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:31:24');
INSERT INTO `sys_oper_log` VALUES (79, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"溯源环节录入\",\"params\":{},\"parentId\":1137,\"isCache\":\"0\",\"path\":\"batchLink\",\"component\":\"ewem/batchLink/index\",\"children\":[],\"createTime\":1742450525000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1150,\"menuType\":\"C\",\"perms\":\"ewem:batchLink:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:32:01');
INSERT INTO `sys_oper_log` VALUES (80, '菜单管理', 1, 'com.ewem.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"5\",\"menuName\":\"区块链浏览器\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://192.168.32.130:9090/\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:36:55');
INSERT INTO `sys_oper_log` VALUES (81, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/14,15,16,17,18', '127.0.0.1', '内网IP', '{ids=14,15,16,17,18}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 09:11:04');
INSERT INTO `sys_oper_log` VALUES (82, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"安徽合肥\",\"k\":\"种植地\"},{\"v\":\"2025-03-25\",\"k\":\"种植时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742865085924,\"id\":20,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 09:11:26');
INSERT INTO `sys_oper_log` VALUES (83, '批次环节记录', 3, 'com.ewem.code.controller.BatchLinkController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/batchLink/20', '127.0.0.1', '内网IP', '{ids=20}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 09:37:32');
INSERT INTO `sys_oper_log` VALUES (84, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"安徽合肥\",\"k\":\"种植地\"},{\"v\":\"2025-03-25\",\"k\":\"种植时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742866695493,\"id\":21,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: eda1315edcad3045eca637c9687bea9c3634a44af2ca085618759c8e8a9b39f5\",\"code\":200}', 0, NULL, '2025-03-25 09:38:19');
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 2, 'com.ewem.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"5\",\"menuName\":\"区块链浏览器\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://192.168.32.130:9090/\",\"children\":[],\"createTime\":1742809015000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":1161,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 10:35:51');
INSERT INTO `sys_oper_log` VALUES (86, '码管理', 3, 'com.ewem.code.controller.CodeController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/code/4', '127.0.0.1', '内网IP', '{ids=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 10:39:15');
INSERT INTO `sys_oper_log` VALUES (87, '码管理', 3, 'com.ewem.code.controller.CodeController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/code/5,6,7', '127.0.0.1', '内网IP', '{ids=5,6,7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 10:39:22');
INSERT INTO `sys_oper_log` VALUES (88, '码申请', 3, 'com.ewem.code.controller.ApplyController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/apply/3,4,5,6', '127.0.0.1', '内网IP', '{ids=3,4,5,6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 10:39:31');
INSERT INTO `sys_oper_log` VALUES (89, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":4,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1742870414321,\"name\":\"20250320002溯源码\",\"id\":9,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 10:40:14');
INSERT INTO `sys_oper_log` VALUES (90, '产品分类', 3, 'com.ewem.code.controller.CategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/category/2', '127.0.0.1', '内网IP', '{ids=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 10:46:18');
INSERT INTO `sys_oper_log` VALUES (91, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"2025-03-25\",\"k\":\"采摘时间\"},{\"v\":\"2号茶园\",\"k\":\"采摘园\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742872257035,\"id\":22,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: ec1524ebe7dc16a4b89aa51d75b340b9fbf9a1c6081cae09a23e46afd912128a\",\"code\":200}', 0, NULL, '2025-03-25 11:10:59');
INSERT INTO `sys_oper_log` VALUES (92, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"安徽黄山\",\"k\":\"加工地\"},{\"v\":\"2025-03-25\",\"k\":\"加工时间\"}],\"createBy\":\"admin\",\"linkId\":3,\"createTime\":1742872281943,\"id\":23,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: e3d0662686e33019ca1fea83d41ed4ab784f5924382ce5d2d2f10dfb91e6a2ad\",\"code\":200}', 0, NULL, '2025-03-25 11:11:24');
INSERT INTO `sys_oper_log` VALUES (93, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":5,\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-25\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742872314050,\"id\":24,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: b4455f65e3d6783cfbf1b0391f27951747a048d74df82dc120bfd22c9b67d0c6\",\"code\":200}', 0, NULL, '2025-03-25 11:11:56');
INSERT INTO `sys_oper_log` VALUES (94, '产品分类', 1, 'com.ewem.code.controller.CategoryController.add()', 'POST', 1, 'admin', NULL, '/ewem/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1742881038973,\"name\":\"水果\",\"id\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:37:19');
INSERT INTO `sys_oper_log` VALUES (95, '产品管理', 1, 'com.ewem.code.controller.ProductController.add()', 'POST', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"img\":\"/profile/upload/2025/03/25/9d146c11-3913-4bcb-b5d4-3307ad590e6a.png\",\"code\":\"a001\",\"attrs\":[{\"v\":\"红富士\",\"k\":\"品种\"},{\"v\":\"2025-03-25\",\"k\":\"时间\"},{\"v\":\"新疆\",\"k\":\"产地\"},{\"v\":\"50元\",\"k\":\"价格\"}],\"barCode\":\"apple001\",\"createBy\":\"admin\",\"createTime\":1742881166626,\"name\":\"苹果\",\"id\":4,\"categoryId\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:39:26');
INSERT INTO `sys_oper_log` VALUES (96, '产品分类', 3, 'com.ewem.code.controller.CategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/category/3', '127.0.0.1', '内网IP', '{ids=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:39:33');
INSERT INTO `sys_oper_log` VALUES (97, '产品管理', 3, 'com.ewem.code.controller.ProductController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/product/4', '127.0.0.1', '内网IP', '{ids=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:39:37');
INSERT INTO `sys_oper_log` VALUES (98, '产品分类', 1, 'com.ewem.code.controller.CategoryController.add()', 'POST', 1, 'admin', NULL, '/ewem/category', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1742881193707,\"name\":\"水果\",\"id\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:39:53');
INSERT INTO `sys_oper_log` VALUES (99, '产品管理', 1, 'com.ewem.code.controller.ProductController.add()', 'POST', 1, 'admin', NULL, '/ewem/product', '127.0.0.1', '内网IP', '{\"img\":\"/profile/upload/2025/03/25/59683040-710d-4091-9bdc-0004d7fbd9e8.png\",\"code\":\"a001\",\"attrs\":[{\"v\":\"新疆\",\"k\":\"产地\"},{\"v\":\"红富士\",\"k\":\"品种\"},{\"v\":\"2025-03-25\",\"k\":\"时间\"},{\"v\":\"5元/斤\",\"k\":\"价格\"}],\"barCode\":\"apple001\",\"createBy\":\"admin\",\"createTime\":1742881253584,\"name\":\"苹果\",\"id\":5,\"categoryId\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:40:53');
INSERT INTO `sys_oper_log` VALUES (100, '批次', 1, 'com.ewem.code.controller.BatchController.add()', 'POST', 1, 'admin', NULL, '/ewem/batch', '127.0.0.1', '内网IP', '{\"number\":\"20250325001\",\"createBy\":\"admin\",\"productId\":5,\"createTime\":1742881267807,\"id\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:41:07');
INSERT INTO `sys_oper_log` VALUES (101, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"quantity\":1,\"batchId\":6,\"antiLength\":6,\"useAnti\":true,\"createBy\":\"admin\",\"traceType\":\"2\",\"createTime\":1742881301672,\"name\":\"20250325001溯源码\",\"id\":10,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-25 13:41:41');
INSERT INTO `sys_oper_log` VALUES (102, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":6,\"attrs\":[{\"v\":\"新疆\",\"k\":\"种植地\"},{\"v\":\"2025-03-25\",\"k\":\"种植时间\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1742881347623,\"id\":25,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: 8013718e76ac75aa40a260b80f34b539b022133aff0dc076d4936cd6567a3cf9\",\"code\":200}', 0, NULL, '2025-03-25 13:42:30');
INSERT INTO `sys_oper_log` VALUES (103, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":6,\"attrs\":[{\"v\":\"2号果园\",\"k\":\"采摘园\"},{\"v\":\"2025-03-25\",\"k\":\"采摘时间\"}],\"createBy\":\"admin\",\"linkId\":2,\"createTime\":1742881374531,\"id\":26,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: 8ce4b704caf96ff61308ffde260fbc91f34e3e4c7d5cea994bf9e82aef8857e7\",\"code\":200}', 0, NULL, '2025-03-25 13:42:56');
INSERT INTO `sys_oper_log` VALUES (104, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":6,\"attrs\":[{\"v\":\"新疆\",\"k\":\"加工地\"},{\"v\":\"2025-03-25\",\"k\":\"加工时间\"}],\"createBy\":\"admin\",\"linkId\":3,\"createTime\":1742881398645,\"id\":27,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: a9b3f3a299bd91d4c6be1e24bb4c711045b53bfb7886726c72188924520e2596\",\"code\":200}', 0, NULL, '2025-03-25 13:43:20');
INSERT INTO `sys_oper_log` VALUES (105, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":6,\"attrs\":[{\"v\":\"千严科技\",\"k\":\"销售商\"},{\"v\":\"2025-03-25\",\"k\":\"销售时间\"}],\"createBy\":\"admin\",\"linkId\":4,\"createTime\":1742881422589,\"id\":28,\"status\":\"0\"}', '{\"msg\":\"新增成功,链上交易ID: b1c84952fdd7d141bf792d9528a20c88114530c4e74f79c4f50603f57e9a93b6\",\"code\":200}', 0, NULL, '2025-03-25 13:43:44');
INSERT INTO `sys_oper_log` VALUES (106, '字典类型', 1, 'com.ewem.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"生码规则\",\"params\":{},\"dictType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:36:48');
INSERT INTO `sys_oper_log` VALUES (107, '字典类型', 2, 'com.ewem.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1743662208000,\"updateBy\":\"admin\",\"dictName\":\"生码规则\",\"remark\":\"生码规则\",\"dictId\":13,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:37:15');
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ewem.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"纯数字\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:38:14');
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 1, 'com.ewem.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"纯字母\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:38:25');
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ewem.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"混合\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:38:35');
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 2, 'com.ewem.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":1,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"纯数字\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1743662293000,\"dictCode\":41,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:38:44');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 2, 'com.ewem.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"success\",\"dictSort\":2,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"纯字母\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1743662305000,\"dictCode\":42,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:38:48');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 2, 'com.ewem.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"info\",\"dictSort\":3,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"混合\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1743662315000,\"dictCode\":43,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:38:55');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 2, 'com.ewem.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"warning\",\"dictSort\":3,\"params\":{},\"dictType\":\"ewem_gen_code_rule\",\"dictLabel\":\"混合\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1743662315000,\"dictCode\":43,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:39:01');
INSERT INTO `sys_oper_log` VALUES (115, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":18,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743662527403,\"name\":\"问问\",\"genCodeRule\":\"3\",\"id\":11,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:42:07');
INSERT INTO `sys_oper_log` VALUES (116, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":18,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743662862481,\"name\":\"22\",\"genCodeRule\":\"2\",\"id\":12,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:47:42');
INSERT INTO `sys_oper_log` VALUES (117, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":18,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743662907732,\"name\":\"111\",\"genCodeRule\":\"3\",\"id\":13,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:48:27');
INSERT INTO `sys_oper_log` VALUES (118, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":18,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743663304933,\"name\":\"1\",\"genCodeRule\":\"1\",\"id\":14,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:55:05');
INSERT INTO `sys_oper_log` VALUES (119, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":18,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743663312014,\"name\":\"2\",\"genCodeRule\":\"3\",\"id\":15,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:55:12');
INSERT INTO `sys_oper_log` VALUES (120, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":32,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743663322573,\"name\":\"1\",\"genCodeRule\":\"3\",\"id\":16,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:55:22');
INSERT INTO `sys_oper_log` VALUES (121, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":32,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743663331756,\"name\":\"1\",\"genCodeRule\":\"1\",\"id\":17,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:55:31');
INSERT INTO `sys_oper_log` VALUES (122, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":32,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743663342079,\"name\":\"1\",\"genCodeRule\":\"2\",\"id\":18,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:55:42');
INSERT INTO `sys_oper_log` VALUES (123, '码申请', 3, 'com.ewem.code.controller.ApplyController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/apply/8,9,10,11,12,13,14,15,16,17', '127.0.0.1', '内网IP', '{ids=8,9,10,11,12,13,14,15,16,17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:57:32');
INSERT INTO `sys_oper_log` VALUES (124, '码管理', 3, 'com.ewem.code.controller.CodeController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/code/10,11,12,13,14,15,16,17,18,19', '127.0.0.1', '内网IP', '{ids=10,11,12,13,14,15,16,17,18,19}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:57:37');
INSERT INTO `sys_oper_log` VALUES (125, '码管理', 3, 'com.ewem.code.controller.CodeController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/code/20', '127.0.0.1', '内网IP', '{ids=20}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 14:57:50');
INSERT INTO `sys_oper_log` VALUES (126, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":18,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743663701055,\"name\":\"1\",\"genCodeRule\":\"3\",\"id\":19,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 15:01:41');
INSERT INTO `sys_oper_log` VALUES (127, '码管理', 3, 'com.ewem.code.controller.CodeController.remove()', 'DELETE', 1, 'admin', NULL, '/ewem/code/21', '127.0.0.1', '内网IP', '{ids=21}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 15:18:22');
INSERT INTO `sys_oper_log` VALUES (128, '码申请', 1, 'com.ewem.code.controller.ApplyController.add()', 'POST', 1, 'admin', NULL, '/ewem/apply', '127.0.0.1', '内网IP', '{\"charLength\":32,\"quantity\":1,\"batchId\":6,\"antiLength\":0,\"useAnti\":false,\"createBy\":\"admin\",\"traceType\":\"1\",\"createTime\":1743664716943,\"name\":\"1\",\"genCodeRule\":\"3\",\"id\":20,\"applyStatus\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 15:18:37');
INSERT INTO `sys_oper_log` VALUES (129, '批次环节记录', 1, 'com.ewem.code.controller.BatchLinkController.add()', 'POST', 1, 'admin', NULL, '/ewem/batchLink', '127.0.0.1', '内网IP', '{\"batchId\":6,\"attrs\":[{\"v\":\"11\",\"k\":\"11\"}],\"createBy\":\"admin\",\"linkId\":1,\"createTime\":1743666073428,\"id\":29,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-03 15:41:16');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-03-20 14:02:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-03-20 14:02:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-03-20 14:02:05', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-03-20 14:02:05', 'admin', '2025-03-20 16:09:35', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1080);
INSERT INTO `sys_role_menu` VALUES (2, 1081);
INSERT INTO `sys_role_menu` VALUES (2, 1082);
INSERT INTO `sys_role_menu` VALUES (2, 1083);
INSERT INTO `sys_role_menu` VALUES (2, 1084);
INSERT INTO `sys_role_menu` VALUES (2, 1085);
INSERT INTO `sys_role_menu` VALUES (2, 1088);
INSERT INTO `sys_role_menu` VALUES (2, 1113);
INSERT INTO `sys_role_menu` VALUES (2, 1114);
INSERT INTO `sys_role_menu` VALUES (2, 1115);
INSERT INTO `sys_role_menu` VALUES (2, 1116);
INSERT INTO `sys_role_menu` VALUES (2, 1117);
INSERT INTO `sys_role_menu` VALUES (2, 1118);
INSERT INTO `sys_role_menu` VALUES (2, 1119);
INSERT INTO `sys_role_menu` VALUES (2, 1120);
INSERT INTO `sys_role_menu` VALUES (2, 1121);
INSERT INTO `sys_role_menu` VALUES (2, 1122);
INSERT INTO `sys_role_menu` VALUES (2, 1123);
INSERT INTO `sys_role_menu` VALUES (2, 1124);
INSERT INTO `sys_role_menu` VALUES (2, 1125);
INSERT INTO `sys_role_menu` VALUES (2, 1126);
INSERT INTO `sys_role_menu` VALUES (2, 1127);
INSERT INTO `sys_role_menu` VALUES (2, 1128);
INSERT INTO `sys_role_menu` VALUES (2, 1129);
INSERT INTO `sys_role_menu` VALUES (2, 1130);
INSERT INTO `sys_role_menu` VALUES (2, 1131);
INSERT INTO `sys_role_menu` VALUES (2, 1132);
INSERT INTO `sys_role_menu` VALUES (2, 1133);
INSERT INTO `sys_role_menu` VALUES (2, 1134);
INSERT INTO `sys_role_menu` VALUES (2, 1135);
INSERT INTO `sys_role_menu` VALUES (2, 1136);
INSERT INTO `sys_role_menu` VALUES (2, 1137);
INSERT INTO `sys_role_menu` VALUES (2, 1138);
INSERT INTO `sys_role_menu` VALUES (2, 1139);
INSERT INTO `sys_role_menu` VALUES (2, 1140);
INSERT INTO `sys_role_menu` VALUES (2, 1141);
INSERT INTO `sys_role_menu` VALUES (2, 1142);
INSERT INTO `sys_role_menu` VALUES (2, 1143);
INSERT INTO `sys_role_menu` VALUES (2, 1150);
INSERT INTO `sys_role_menu` VALUES (2, 1151);
INSERT INTO `sys_role_menu` VALUES (2, 1152);
INSERT INTO `sys_role_menu` VALUES (2, 1153);
INSERT INTO `sys_role_menu` VALUES (2, 1154);
INSERT INTO `sys_role_menu` VALUES (2, 1155);
INSERT INTO `sys_role_menu` VALUES (2, 1158);
INSERT INTO `sys_role_menu` VALUES (2, 1159);
INSERT INTO `sys_role_menu` VALUES (2, 1160);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-04-03 16:28:03', 'admin', '2025-03-20 14:02:05', '', '2025-04-03 16:28:03', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-20 16:04:52', 'admin', '2025-03-20 14:02:05', '', '2025-03-20 16:04:52', '测试员');
INSERT INTO `sys_user` VALUES (4, 101, '万万', '万万', '00', '', '', '0', '', '$2a$10$t0XTVbw2GZDEOgE2j0OkPeTcm6RcZhtk1/W3ZxGaxwBY/GUiJnsI.', '0', '0', '', NULL, 'ry', '2025-03-20 16:05:42', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
