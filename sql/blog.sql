/*
 Navicat Premium Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 28/11/2020 21:28:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_last_login_time` timestamp NOT NULL,
  `question1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `article_user_id` int NOT NULL,
  `article_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `article_sort_id` int NOT NULL,
  `article_tag_id` int NOT NULL,
  `article_date` timestamp NOT NULL,
  `article_views_count` int DEFAULT '0',
  `article_like_count` int DEFAULT '0',
  PRIMARY KEY (`article_id`),
  KEY `article_user_id` (`article_user_id`),
  KEY `article_tag_id` (`article_tag_id`),
  KEY `article_sort_id` (`article_sort_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_user_id`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_tag_id`) REFERENCES `tag` (`tag_id`),
  CONSTRAINT `article_ibfk_3` FOREIGN KEY (`article_sort_id`) REFERENCES `sort` (`sort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_time` timestamp NOT NULL,
  `comment_sub_id` int DEFAULT NULL,
  `comment_user_id` int DEFAULT NULL,
  `comment_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comment_article_id` int NOT NULL,
  `comment_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_sub_id` (`comment_sub_id`),
  KEY `comment_ibfk_2` (`comment_article_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_sub_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `sort_id` int NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for web
-- ----------------------------
DROP TABLE IF EXISTS `web`;
CREATE TABLE `web` (
  `web_id` int NOT NULL AUTO_INCREMENT,
  `web_user_id` int DEFAULT NULL,
  `web_is_open` tinyint(1) NOT NULL,
  `web_domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `web_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`web_id`),
  KEY `web_user_id` (`web_user_id`),
  CONSTRAINT `web_ibfk_1` FOREIGN KEY (`web_user_id`) REFERENCES `admin` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
