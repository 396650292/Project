/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-09 10:43:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `club`
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `club_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `creat_date` date NOT NULL,
  `club_numbers` int(11) DEFAULT '0',
  `club_remarks` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_name` (`club_name`),
  KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of club
-- ----------------------------
INSERT INTO `club` VALUES ('1', '程序员', 'C#', '2017-03-07', '3', '负责C#制作窗体程序');
INSERT INTO `club` VALUES ('2', '程序员', 'VB', '2016-11-07', '2', 'VB应用程序');
INSERT INTO `club` VALUES ('3', '程序员', 'ASP', '2016-11-01', '5', '负责ASP制作网页');
INSERT INTO `club` VALUES ('4', '程序员', 'PHP', '2016-11-01', '3', '负责PHP制作网页');
INSERT INTO `club` VALUES ('5', '程序员', 'ASP.net', '2016-11-01', '2', '负责ASP.net制作网页');
INSERT INTO `club` VALUES ('6', '程序员', 'JAVA WEB', '2016-11-11', '0', '负责JSP制作网页');
INSERT INTO `club` VALUES ('7', '程序员', 'VC', '2016-11-11', '0', '负责VC程序');
INSERT INTO `club` VALUES ('8', '程序员', '基础部', '2016-11-11', '0', '负责程序编写');
INSERT INTO `club` VALUES ('9', 'HR', '人力资源部', '2016-11-11', '0', '负责人事工作');
INSERT INTO `club` VALUES ('10', '程序员', 'oracle', '2015-11-11', '0', '负责数据库');
INSERT INTO `club` VALUES ('15', '程序员', 'Android', '2016-11-10', '2', '负责安卓应用程序');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `sex` varchar(32) COLLATE utf8_bin NOT NULL,
  `age` int(3) NOT NULL,
  `birthday` date NOT NULL,
  `position` varchar(32) COLLATE utf8_bin NOT NULL,
  `major` varchar(32) COLLATE utf8_bin NOT NULL,
  `work_experience` varchar(32) COLLATE utf8_bin NOT NULL,
  `degree` varchar(32) COLLATE utf8_bin NOT NULL,
  `telphone` double(32,0) NOT NULL,
  `school` varchar(32) COLLATE utf8_bin NOT NULL,
  `address` varchar(32) COLLATE utf8_bin NOT NULL,
  `regist_time` date NOT NULL,
  `biography` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `luyong` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '录用',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('2', '张三', '男', '22', '2016-11-11', '程序员', '计算机', '无', '专科', '123456', '湖工', '湖北十堰', '2016-11-11', '应届实习生', '已录用');
INSERT INTO `employee` VALUES ('3', '张三1', '男', '23', '2016-11-11', '程序员', '计算机', '无', '专科', '2225', '湖工', '湖北十堰', '2016-11-11', '应届实习生', '已录用');
INSERT INTO `employee` VALUES ('4', '张三2', '男', '22', '2016-11-11', '程序员', '计算机', '无', '专科', '213123', '湖工', '湖北十堰', '2016-11-11', '应届实习生', '已录用');
INSERT INTO `employee` VALUES ('5', '李四', '男', '31', '2016-11-11', '程序员', '计算机', '无', '专科', '213123', '湖工', '湖北十堰', '2016-11-11', '应届实习生', '已录用');
INSERT INTO `employee` VALUES ('17', '11', '男', '21', '1997-09-06', 'HR', '计算机', '无', '本科', '12243324', '武大', '湖北十堰', '2017-03-09', '无', '已录用');
INSERT INTO `employee` VALUES ('18', '张子栋', '男', '12', '1997-09-06', 'HR', '计算机', '无', '本科', '13546435634', '武大', '湖北武汉', '2017-03-09', '无', '已录用');
INSERT INTO `employee` VALUES ('19', '张子山', '男', '12', '1997-09-06', '程序员', '计算机', '无', '本科', '143543534', '武大', '湖北武汉', '2017-03-09', '无', '已录用');
INSERT INTO `employee` VALUES ('20', '张无忌', '男', '21', '1997-09-06', 'HR', '人力资源管理', '无', '本科', '13546435634', '湖北大学', '湖北武汉', '2017-03-09', '应届毕业生', '已录用');
INSERT INTO `employee` VALUES ('21', '李四地', '男', '21', '1997-09-06', 'HR', '计算机', '无', '本科', '13546435634', '华中科技大学', '湖北襄阳', '2017-03-09', '应届毕业生', '已录用');
INSERT INTO `employee` VALUES ('22', '张翠山', '男', '21', '1997-09-06', 'HR', '计算机应用', '无', '本科', '13546435634', '湖北大学', '湖北黄冈', '2017-03-09', '应届毕业生', '已录用');
INSERT INTO `employee` VALUES ('23', '张无忌', '男', '21', '1997-09-06', 'HR', '计算机应用', '无', '本科', '13546435634', '武大', '湖北黄冈', '2017-03-09', '无', '已录用');
INSERT INTO `employee` VALUES ('24', '陈慧慧', '女', '21', '1997-09-06', 'HR', '人力资源管理', '无', '本科', '13546435634', '华中师范大学', '湖北黄冈', '2017-03-09', '111', '已录用');

-- ----------------------------
-- Table structure for `eward_punish`
-- ----------------------------
DROP TABLE IF EXISTS `eward_punish`;
CREATE TABLE `eward_punish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `sum` int(11) NOT NULL,
  `date` date NOT NULL,
  `reason` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of eward_punish
-- ----------------------------
INSERT INTO `eward_punish` VALUES ('1', '发多少', '奖励', '32', '2016-11-11', '22');
INSERT INTO `eward_punish` VALUES ('2', '而我认为', '奖励', '34', '2016-11-11', '无');
INSERT INTO `eward_punish` VALUES ('3', '我企鹅完全', '奖励', '23', '2016-11-11', '无');
INSERT INTO `eward_punish` VALUES ('4', '萨达', '奖励', '22', '2016-11-11', '222');
INSERT INTO `eward_punish` VALUES ('5', '222', '奖励', '22', '2016-11-11', '222');

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `sex` char(2) COLLATE utf8_bin NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `idCard` varchar(32) COLLATE utf8_bin NOT NULL,
  `nation` varchar(32) COLLATE utf8_bin NOT NULL,
  `marital_status` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `political_status` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `native_place` varchar(32) COLLATE utf8_bin NOT NULL,
  `telphone` double(32,0) NOT NULL,
  `address` varchar(32) COLLATE utf8_bin NOT NULL,
  `school` varchar(32) COLLATE utf8_bin NOT NULL,
  `major` varchar(32) COLLATE utf8_bin NOT NULL,
  `degree` varchar(32) COLLATE utf8_bin NOT NULL,
  `posts_time` date NOT NULL,
  `club_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `position` varchar(32) COLLATE utf8_bin NOT NULL,
  `registrant` varchar(32) COLLATE utf8_bin NOT NULL,
  `regist_time` date NOT NULL,
  `remarks` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `biography` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_position` (`position`),
  KEY `name` (`name`),
  KEY `fk_club_name` (`club_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('6', '张三', '男', '22', '2016-11-11', 'dsdas', '汉', '未婚', '群众', 'dasdasd', '22', 'asdas', '32133', 'asd', '本科', '2016-11-11', 'PHP', '程序员', 'dfssdf', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('8', '李四', '男', '21', '2016-11-11', '2312312', '汉', '未婚', '群众', '213123', '12312', '123123123', '1233123', '213123', '本科', '2016-11-11', 'ASP', '程序员', '213213213', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('9', '王五', '男', '12', '2016-11-11', '3213', '汉', '未婚', '群众', '12312', '213123', '123', '1233123', '3123', '本科', '2016-11-11', 'Android', '程序员', '213231', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('10', '大师', '男', '23', '2016-11-11', '231323', '汉', '未婚', '群众', '123321', '22', '32132', '312', '213213', '本科', '2016-11-11', 'PHP', '程序员', '213213', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('11', '硕大', '男', '20', '2016-11-11', '213213', '汉', '未婚', '群众', '231', '213123', '32', '213', '31212', '本科', '2016-11-11', 'ASP.net', '程序员', '123213', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('12', '大神', '男', '23', '2016-11-11', '23123123123', '汉', '未婚', '群众', '213321', '213123', '12312', '123', '312312', '本科', '2016-11-11', 'Android', '程序员', '123', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('13', '的撒', '男', '20', '2016-11-11', '1234567', '汉', '未婚', '群众', '213', '123456743', '湖北十堰', '湖工职', '计算机', '本科', '2016-11-11', 'PHP', '程序员', 'de', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('14', '打', '男', '20', '2016-11-11', '123123', '汉', '未婚', '群众', '312312', '3213123', '3123', '13213213', '123123', '本科', '2016-11-11', 'VB', '程序员', '213123', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('15', '守打法', '男', '22', '2016-11-11', '23123123123', '汉', '未婚', '群众', 'qweqw', '3123123', 'weq', 'wqeqwe', 'wqe', '本科', '2016-11-11', 'C#', '程序员', 'ewq', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('16', '反倒是', '男', '22', '2016-11-11', '3123123', '汉', '未婚', '群众', 'weqwe', '21312312', 'wqeqw', 'weeqw', 'wqe', '本科', '2016-11-11', 'ASP.net', '程序员', 'wqewq', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('17', '大神2', '男', '20', '2016-11-11', '23123123123', '汉', '未婚', '群众', '2131', '123', 'qwe', '123', 'wqe', '本科', '2016-11-11', 'ASP', '程序员', 'wqeqw', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('18', '称呼', '女', '20', '1996-09-26', '12312312312', '汉族', '未婚', '群众', '中国', '156166', '湖北十堰', '湖工', '计算机', '本科', '2016-11-11', 'VB', '程序员', '123', '2016-11-11', '无', '无');
INSERT INTO `members` VALUES ('19', '111', '男', '12', '1997-09-01', '11', '汉族', '未婚', '群众', '111', '12121212', '1111', '1212121', '111', '本科', '2017-09-06', 'ASP', '程序员', '1212', '2017-09-02', '121', '111');
INSERT INTO `members` VALUES ('25', '111', '男', '21', '1997-09-01', '1111111', '汉族', '未婚', '群众', '湖北十堰', '12121212', '湖北十堰', '湖工职', '计算机', '本科', '2017-09-06', 'C#', '程序员', '123', '2017-03-08', '123', '22222');
INSERT INTO `members` VALUES ('27', '陈慧慧', '女', '21', '1997-09-06', '123432453253', '汉族', '未婚', '群众', '湖北黄冈', '13546435634', '湖北黄冈', '华中师范大学', '人力资源管理', '本科', '2017-08-07', 'ASP', '程序员', 'zjl', '2017-03-09', '无', '无');

-- ----------------------------
-- Table structure for `money`
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `no` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `month` date DEFAULT NULL,
  `basic_wage` decimal(10,0) NOT NULL,
  `over_pay` int(11) DEFAULT NULL,
  `overtime_pay` decimal(10,0) NOT NULL,
  `work_pay` decimal(10,0) DEFAULT NULL,
  `work_age_pay` decimal(10,0) NOT NULL,
  `attendance_pay` decimal(10,0) NOT NULL,
  `absenteeism_pay` decimal(10,0) NOT NULL,
  `premium` decimal(10,0) NOT NULL,
  `net_pay` decimal(10,0) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `fk_no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('15', '守打法', '2017-03-08', '4000', '0', '0', '0', '0', '100', '0', '100', '3900');

-- ----------------------------
-- Table structure for `train`
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer` varchar(32) COLLATE utf8_bin NOT NULL,
  `train_theme` varchar(32) COLLATE utf8_bin NOT NULL,
  `train_aim` varchar(32) COLLATE utf8_bin NOT NULL,
  `train_time` date NOT NULL,
  `train_address` varchar(32) COLLATE utf8_bin NOT NULL,
  `attendee` varchar(32) COLLATE utf8_bin NOT NULL,
  `train_remarks` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES ('8', '张三', '打扫卫生', '干净彻底', '2017-03-08', '会议室', '所有', '无');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `rank` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zjl', '123', '普通职员');
INSERT INTO `user` VALUES ('2', 'reb', '123', '普通职员');
INSERT INTO `user` VALUES ('3', 'ch', '1234', 'HR');
INSERT INTO `user` VALUES ('4', '123', '123', '职员');
INSERT INTO `user` VALUES ('5', '陈辉', '123', '职员');
INSERT INTO `user` VALUES ('7', '11', '111', '普通');
