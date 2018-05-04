/*
Navicat MySQL Data Transfer

Source Server         : wyy
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-04 16:11:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sys_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `pid` int(11) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `type` varchar(8) DEFAULT NULL COMMENT '类型（1：目录，2：菜单，3：按钮）',
  `description` varchar(1024) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '权限值',
  `url` varchar(256) DEFAULT NULL COMMENT '路径',
  `icon` varchar(256) DEFAULT NULL COMMENT '图标',
  `status` varchar(8) DEFAULT NULL COMMENT '状态（0：正常 1：禁用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `title` varchar(64) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1024) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(8) DEFAULT NULL COMMENT '性别（0：女 1：男 2：其他）',
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `head_sculpture` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` varchar(8) DEFAULT NULL COMMENT '状态（0：未激活 1：正常 2：锁定）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
