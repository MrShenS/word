/*
 Navicat Premium Data Transfer

 Source Server         : Hospitalms
 Source Server Type    : MySQL
 Source Server Version : 50529
 Source Host           : localhost:3306
 Source Schema         : hos

 Target Server Type    : MySQL
 Target Server Version : 50529
 File Encoding         : 65001

 Date: 08/12/2019 14:17:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '感冒发热', '治疗感冒发烧');
INSERT INTO `category` VALUES (2, '消炎止痛', '治疗消炎止痛');
INSERT INTO `category` VALUES (3, '糖尿病类', '治疗糖尿病');
INSERT INTO `category` VALUES (4, '妇科用药', '治疗妇科疾病');
INSERT INTO `category` VALUES (5, '儿科用药', '治疗小儿不适');
INSERT INTO `category` VALUES (6, '肝胆胰类', NULL);
INSERT INTO `category` VALUES (7, '男科用药', NULL);
INSERT INTO `category` VALUES (8, '泌尿系统', NULL);
INSERT INTO `category` VALUES (9, '维矿物质', NULL);
INSERT INTO `category` VALUES (10, '呼吸系统', NULL);
INSERT INTO `category` VALUES (11, '肠胃疾病', NULL);
INSERT INTO `category` VALUES (12, '补脑安神', NULL);
INSERT INTO `category` VALUES (13, '皮肤用药', NULL);
INSERT INTO `category` VALUES (14, '眼科用药', NULL);
INSERT INTO `category` VALUES (15, '清热解毒', '不能老吃');
INSERT INTO `category` VALUES (17, 'aa', 'tes');
INSERT INTO `category` VALUES (21, '血药', '以血练成');
INSERT INTO `category` VALUES (23, '印度圣药', '来路同样不正');
INSERT INTO `category` VALUES (24, '小葵花', '专门对付医闹');
INSERT INTO `category` VALUES (25, '含笑半步颠', '好药');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '信息中心', '收集 病人信息', '是');
INSERT INTO `department` VALUES (2, '耳鼻喉科', '负责诊断耳鼻喉方面的疾病', '是');
INSERT INTO `department` VALUES (3, '内科', '心血管内科 内分泌', '是');
INSERT INTO `department` VALUES (4, '保卫科', '暂无描述信息...', '否');
INSERT INTO `department` VALUES (6, '妇科', '暂无描述信息...', '是');
INSERT INTO `department` VALUES (7, '眼科', '暂无描述信息...', '是');
INSERT INTO `department` VALUES (8, '口腔科', '暂无描述信息...', '是');
INSERT INTO `department` VALUES (9, '皮肤科', '暂无描述信息...', '是');
INSERT INTO `department` VALUES (10, '外科', '暂无描述信息...', '是');
INSERT INTO `department` VALUES (11, '呼吸内科', '暂无描述信息...', '否');
INSERT INTO `department` VALUES (12, '消化内科', '暂无描述信息...', '否');
INSERT INTO `department` VALUES (13, '心血管内科', '暂无描述信息...', '否');
INSERT INTO `department` VALUES (14, '财务科', '暂无描述信息...', '否');
INSERT INTO `department` VALUES (15, '院长办公室', '暂无描述信息...', '否');
INSERT INTO `department` VALUES (18, '总经理室', '总经理办公室', '1');
INSERT INTO `department` VALUES (20, '骨科', '骨科检查', '否');
INSERT INTO `department` VALUES (21, 'aa', 'aa', '是');
INSERT INTO `department` VALUES (24, '000', '', '否');
INSERT INTO `department` VALUES (25, '000', '', '否');
INSERT INTO `department` VALUES (26, 'qq', '1', '是');
INSERT INTO `department` VALUES (28, '战斗部', '专门对付医闹', '否');
INSERT INTO `department` VALUES (29, '中医', '中华绝技', '是');

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dosageform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `specifications` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `prime_cost` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `drug_ibfk_1`(`category_id`) USING BTREE,
  CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES (1, 1, '6923959408694', '克咳胶囊', '【商品名称】克咳胶囊(运动员慎用)', '胶囊剂', '0.3g*12粒', '盒', 5.5, 14, 175, 10);
INSERT INTO `drug` VALUES (3, 15, '6523959408344', '慢严舒柠', '清热利咽,宽胸润喉。用于急慢咽炎,扁桃体炎,咽喉发干,声音嘶哑。', '浸出剂', '5g*6袋', '盒', 10.33, 16.65, 192, 5);
INSERT INTO `drug` VALUES (4, 1, '655955365408694', '999感冒灵颗粒', '', '浸出剂', '10g*9袋', '盒', 5, 13, 60, 10);
INSERT INTO `drug` VALUES (5, 2, '65595536540869', '华素片西地碘含片', '华素片西地碘含片简介', '片剂', '1.5mg*15片', '盒', 4, 6, 79, 6);
INSERT INTO `drug` VALUES (6, 2, '655955365408698', '利君沙', '利君沙简介', '片剂', '0.125g*24片', '盒', 8.25, 11.7, 38, 10);
INSERT INTO `drug` VALUES (7, 2, '32534223797323', '阿莫西林胶囊', '阿莫西林胶囊治疗发烧感冒', '片剂', '0.125g*24片', '盒', 5.32, 8.5, 160, 20);
INSERT INTO `drug` VALUES (8, 8, '325342237977', '罗红霉素胶囊', '罗红霉素胶囊简介', '胶囊剂', '0.15g*6粒', '盒', 4.32, 6.8, 30, 5);
INSERT INTO `drug` VALUES (9, 1, '325342237973', '快克', '治感冒，疗效好', '胶囊剂', NULL, '盒', 5, 8, 180, 20);

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `merriage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `drugAllergy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cardNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (10, 'test', 23, '男', '1996-02-13', '未婚', '昆山', '花粉过敏', '12308', 4166.7);
INSERT INTO `patient` VALUES (12, 'tom', 24, '男', '1890-03-02', '未婚', '昆山', '无', '12309', 4491);
INSERT INTO `patient` VALUES (15, '小白龙255', 38, '男', '2019-04-08', '已婚', '哑巴湖2222', '无', '3303412', 8933);
INSERT INTO `patient` VALUES (17, '大声道55', 1222, '男', '1996-04-08', '已婚2', '昆仑山2', '无', '12309', 1000);
INSERT INTO `patient` VALUES (19, '钟馗ww', 66, '男', '1880-03-02', '已婚', '洞府', '无', '12309', 10008);
INSERT INTO `patient` VALUES (20, '保百', 34, '男', '1840-02-01', '未婚', '上海', '花粉过敏', '18923991455230', 10022);
INSERT INTO `patient` VALUES (21, '小李子', 24, '女', '2019-04-09', '已婚', '昆山', '无', '18923991455230', 1000);
INSERT INTO `patient` VALUES (22, '小白龙', 38, '女', '2019-04-09', '已婚', '昆山', '无', '123090', 888);
INSERT INTO `patient` VALUES (23, '张三', 25, '男', '2019-09-04', '未婚', '上海', '无', '1239024', 1900);
INSERT INTO `patient` VALUES (24, '王五', 32, '男', '2019-06-05', '未婚', '浙江温州', '花粉过敏', '100099', 100);

-- ----------------------------
-- Table structure for patientdrug
-- ----------------------------
DROP TABLE IF EXISTS `patientdrug`;
CREATE TABLE `patientdrug`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` double DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patientdrug_ibfk_1`(`patient_id`) USING BTREE,
  INDEX `patientdrug_ibfk_2`(`drug_id`) USING BTREE,
  CONSTRAINT `patientdrug_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `patientdrug_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patientdrug
-- ----------------------------
INSERT INTO `patientdrug` VALUES (7, 33.3, 10, 3, 2);
INSERT INTO `patientdrug` VALUES (8, 33.3, NULL, 3, 2);
INSERT INTO `patientdrug` VALUES (9, 16, NULL, 9, 2);
INSERT INTO `patientdrug` VALUES (10, 16, NULL, 9, 2);
INSERT INTO `patientdrug` VALUES (11, 17, 12, 7, 2);
INSERT INTO `patientdrug` VALUES (12, NULL, 10, 7, 1000);
INSERT INTO `patientdrug` VALUES (13, 16000, 10, 9, 2000);
INSERT INTO `patientdrug` VALUES (19, 85, NULL, 7, 10);
INSERT INTO `patientdrug` VALUES (20, 23.4, 23, 6, 2);
INSERT INTO `patientdrug` VALUES (21, 39, 23, 4, 3);
INSERT INTO `patientdrug` VALUES (22, 24, 24, 9, 3);

-- ----------------------------
-- Table structure for patientphysicalexam
-- ----------------------------
DROP TABLE IF EXISTS `patientphysicalexam`;
CREATE TABLE `patientphysicalexam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` double DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `physical_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patientphysicalexam_ibfk_1`(`patient_id`) USING BTREE,
  INDEX `patientphysicalexam_ibfk_2`(`physical_id`) USING BTREE,
  CONSTRAINT `patientphysicalexam_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `patientphysicalexam_ibfk_2` FOREIGN KEY (`physical_id`) REFERENCES `physicalexam` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patientphysicalexam
-- ----------------------------
INSERT INTO `patientphysicalexam` VALUES (5, 55, 10, 4);
INSERT INTO `patientphysicalexam` VALUES (6, 55, NULL, 4);
INSERT INTO `patientphysicalexam` VALUES (7, 55, NULL, 4);
INSERT INTO `patientphysicalexam` VALUES (8, 55, NULL, 4);
INSERT INTO `patientphysicalexam` VALUES (9, 55, 12, 4);
INSERT INTO `patientphysicalexam` VALUES (10, NULL, 10, 3);
INSERT INTO `patientphysicalexam` VALUES (11, 150, 12, 6);
INSERT INTO `patientphysicalexam` VALUES (12, 150, 23, 6);
INSERT INTO `patientphysicalexam` VALUES (13, 150, 23, 6);
INSERT INTO `patientphysicalexam` VALUES (14, 80, 23, 16);
INSERT INTO `patientphysicalexam` VALUES (15, 65, 24, 3);

-- ----------------------------
-- Table structure for physicalexam
-- ----------------------------
DROP TABLE IF EXISTS `physicalexam`;
CREATE TABLE `physicalexam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of physicalexam
-- ----------------------------
INSERT INTO `physicalexam` VALUES (1, '喉镜', 150);
INSERT INTO `physicalexam` VALUES (2, '胃镜', 120);
INSERT INTO `physicalexam` VALUES (3, '彩超', 65);
INSERT INTO `physicalexam` VALUES (4, 'B超', 55);
INSERT INTO `physicalexam` VALUES (5, '尿检', 30);
INSERT INTO `physicalexam` VALUES (6, '体检', 150);
INSERT INTO `physicalexam` VALUES (11, '核磁共振', 1900);
INSERT INTO `physicalexam` VALUES (16, '血液检查', 80);
INSERT INTO `physicalexam` VALUES (18, '号脉', 50);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'doctor');
INSERT INTO `role` VALUES (2, 'technician');
INSERT INTO `role` VALUES (3, 'nurse');
INSERT INTO `role` VALUES (4, 'guideDoctor');
INSERT INTO `role` VALUES (5, 'chargeMan');
INSERT INTO `role` VALUES (6, 'medicineManagerMan');
INSERT INTO `role` VALUES (7, 'dictionaryManagerMan');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `professional` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_ibfk_1`(`department_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (16, '李春雨', '男', '1990-03-14', '17722222222', '昆山', '341225****3214', '本科', '二级', '妇科医生', 6, 'doctor', '111111', 1);
INSERT INTO `user` VALUES (17, '张传静', '女', '1996-03-14', '17751283826', '安徽', '341225****8943', '本科', '二级', '妇科医技人员', 6, 'technician', '111111', 2);
INSERT INTO `user` VALUES (20, '柴慧超', '女', '1993-02-15', '17724245555', '山西', '341225****7887', '本科', '一级', '护士', 10, 'nurse', '111111', 3);
INSERT INTO `user` VALUES (21, '莫西', '女', '1995-03-09', '13144446666', '湖南', '341124****3245', '本科', '一级', '导医', 1, 'guideDoctor', '111111', 4);
INSERT INTO `user` VALUES (22, '梁伟', '男', '1994-10-03', '15567678989', '河南', '341332****4563', '本科', '二级', '药房管理员', 1, 'medicineManagerMan', '111111', 6);
INSERT INTO `user` VALUES (23, '路晨', '男', '1994-09-18', '15166668888', '兰州', '341332****3232', '本科', '三级', '字典维护人员', 1, 'dictionaryManagerMan', '111111', 7);
INSERT INTO `user` VALUES (24, '王中华', '男', '1995-02-10', '15590908888', '湖南', '341225****6574', '本科', '一级', '门诊收费员', 14, 'chargeMan', '111111', 5);
INSERT INTO `user` VALUES (25, '老张', '男', '2019-04-23', '12323', '', '', '本科', '', '', 7, 'doctor', '111111', 1);
INSERT INTO `user` VALUES (26, '小白haul', '男', '2019-04-15', '123567687', '', '', '硕士', '以及', '', 4, NULL, '111111', 3);

-- ----------------------------
-- Table structure for userpatient
-- ----------------------------
DROP TABLE IF EXISTS `userpatient`;
CREATE TABLE `userpatient`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `symptom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `complained` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pastMedicalHistory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `historyOfPresentIllness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `physicalExamResult` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userpatient_ibfk_1`(`user_id`) USING BTREE,
  INDEX `userpatient_ibfk_2`(`patient_id`) USING BTREE,
  CONSTRAINT `userpatient_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `userpatient_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userpatient
-- ----------------------------
INSERT INTO `userpatient` VALUES (109, 123, '未处理', '无', '无', 25, 23, '2019-06-05 00:55:06', '无', '无', '无', NULL);
INSERT INTO `userpatient` VALUES (113, 123, '未处理', NULL, NULL, 25, 12, '2019-06-05 00:11:30', NULL, NULL, NULL, NULL);
INSERT INTO `userpatient` VALUES (114, 11, '已处理', NULL, NULL, 25, 19, '2019-06-05 00:38:41', NULL, NULL, NULL, NULL);
INSERT INTO `userpatient` VALUES (125, 12, '已处理', '感冒', '注意保养', 25, 24, '2019-06-05 10:21:03', '无', '过敏', '风寒', NULL);
INSERT INTO `userpatient` VALUES (126, 12, '未处理', NULL, NULL, 25, 21, '2019-06-05 10:23:50', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
