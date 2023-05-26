/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : db_snack_shop

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2019-02-04 19:46:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `m_time` date DEFAULT NULL,
  `m_type` varchar(255) DEFAULT NULL COMMENT '充值/消费/提现',
  `m_amoney` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '2018-03-05', '消费', '-100');
INSERT INTO `account` VALUES ('2', '1', '2018-03-06', '提现', '-100');
INSERT INTO `account` VALUES ('3', '1', '2018-03-07', '充值', '+100');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_username` varchar(255) DEFAULT NULL,
  `ad_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `roleIdpre` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '客服', '123456', '3');
INSERT INTO `admin` VALUES ('2', 'admin', 'admin', '1');
INSERT INTO `admin` VALUES ('3', '库管小刘', '123456', '2');

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '个人信息');
INSERT INTO `admin_menu` VALUES ('2', '人员管理');
INSERT INTO `admin_menu` VALUES ('3', '图片管理');
INSERT INTO `admin_menu` VALUES ('4', '订单管理');
INSERT INTO `admin_menu` VALUES ('5', '图表统计');
INSERT INTO `admin_menu` VALUES ('6', '商品管理');

-- ----------------------------
-- Table structure for `admin_menu_child`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu_child`;
CREATE TABLE `admin_menu_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_menu_name` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `child_menu_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_menu_child
-- ----------------------------
INSERT INTO `admin_menu_child` VALUES ('1', '用户管理', '2', '/admin/user/mainToUserinfo');
INSERT INTO `admin_menu_child` VALUES ('2', '员工管理', '2', '/admin/user/mainToAdmin');
INSERT INTO `admin_menu_child` VALUES ('3', '订单管理', '4', '/admin/order/mainToAdminOrder');
INSERT INTO `admin_menu_child` VALUES ('4', '上传图片', '3', '/admin/img/mainToAdminImg');
INSERT INTO `admin_menu_child` VALUES ('5', '商品管理', '6', '/admin/snackinfo/mainToAdminSnackinfo');
INSERT INTO `admin_menu_child` VALUES ('6', '饼图统计', '5', '/admin/map/mainToPieMap');
INSERT INTO `admin_menu_child` VALUES ('7', '个人信息', '1', '/user/mainToAdminuser');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_parentId` int(11) DEFAULT NULL COMMENT '追评',
  `s_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `e_pictureName` varchar(255) DEFAULT NULL COMMENT '上传的图片名字',
  `e_type` int(11) DEFAULT NULL COMMENT '1=好评，0，-1差评',
  `e_score` int(11) DEFAULT NULL COMMENT '评分',
  `info` varchar(255) DEFAULT NULL COMMENT '评语',
  `e_date` date DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`e_id`) USING BTREE,
  KEY `u_idpre` (`u_id`) USING BTREE,
  KEY `s_idpre` (`s_id`) USING BTREE,
  CONSTRAINT `s_idpre` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`),
  CONSTRAINT `u_idpre` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `integral`
-- ----------------------------
DROP TABLE IF EXISTS `integral`;
CREATE TABLE `integral` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `i_number` int(11) DEFAULT NULL COMMENT '获得积分',
  `i_time` date DEFAULT NULL COMMENT '操作时间',
  `i_dese` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`i_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of integral
-- ----------------------------
INSERT INTO `integral` VALUES ('1', '1', '6', '2018-03-01', '每天登录送积分');
INSERT INTO `integral` VALUES ('2', '1', '5', '2018-02-28', '每天登录送积分');
INSERT INTO `integral` VALUES ('3', '1', '4', '2018-02-27', '每天登录送积分');
INSERT INTO `integral` VALUES ('4', '1', '3', '2018-03-02', '每天登录送积分');
INSERT INTO `integral` VALUES ('5', '1', '2', '2018-03-03', '每天登录送积分');
INSERT INTO `integral` VALUES ('6', '1', '1', '2018-03-04', '每天登录送积分');
INSERT INTO `integral` VALUES ('7', '1', '7', '2018-03-25', '每天登录送积分');
INSERT INTO `integral` VALUES ('8', '1', '8', '2018-03-24', '每天登录送积分');
INSERT INTO `integral` VALUES ('9', '1', '9', '2018-03-23', '每天登录送积分');
INSERT INTO `integral` VALUES ('10', '1', '10', '2018-03-22', '每天登录送积分');
INSERT INTO `integral` VALUES ('11', '1', '11', '2018-03-21', '每天登录送积分');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `u_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `o_time` date DEFAULT NULL,
  `o_type` int(11) DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('84', '201803272559', '12', '2', '2018-03-27', '1');
INSERT INTO `order` VALUES ('125', '201811024234', '17', '1', '2018-11-02', '0');
INSERT INTO `order` VALUES ('126', '201811045281', '18', '2', '2018-11-04', '0');
INSERT INTO `order` VALUES ('127', '201812053444', '19', '2', '2018-12-05', '1');
INSERT INTO `order` VALUES ('128', '201812074630', '20', '2', '2018-12-07', '0');
INSERT INTO `order` VALUES ('129', '201812075605', '20', null, '2018-12-07', '-2');
INSERT INTO `order` VALUES ('131', '201812077894', '20', null, '2018-12-07', '-1');
INSERT INTO `order` VALUES ('132', '201812078303', '20', '2', '2018-12-07', '1');
INSERT INTO `order` VALUES ('133', '201902045019', '21', null, '2019-02-04', '-1');
INSERT INTO `order` VALUES ('134', '201902041371', '21', '2', '2019-02-04', '1');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `o_num` int(11) DEFAULT NULL,
  `o_money` double DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('94', '201803272559', '20', '2', '10');
INSERT INTO `orderdetail` VALUES ('154', '201811024234', '26', '1', '16');
INSERT INTO `orderdetail` VALUES ('155', '201811024234', '25', '1', '1');
INSERT INTO `orderdetail` VALUES ('156', '201811045281', '82', '2', '10');
INSERT INTO `orderdetail` VALUES ('157', '201812053444', '39', '2', '20');
INSERT INTO `orderdetail` VALUES ('158', '201812053444', '32', '3', '10');
INSERT INTO `orderdetail` VALUES ('159', '201812074630', '67', '3', '16');
INSERT INTO `orderdetail` VALUES ('160', '201812074630', '55', '2', '9');
INSERT INTO `orderdetail` VALUES ('161', '201812074630', '39', '1', '20');
INSERT INTO `orderdetail` VALUES ('162', '201812075605', '49', '1', '14');
INSERT INTO `orderdetail` VALUES ('163', '201812075605', '45', '1', '27');
INSERT INTO `orderdetail` VALUES ('164', '201812075605', '30', '1', '8');
INSERT INTO `orderdetail` VALUES ('166', '201812077894', '72', '2', '14');
INSERT INTO `orderdetail` VALUES ('167', '201812077894', '32', '1', '10');
INSERT INTO `orderdetail` VALUES ('168', '201812078303', '66', '1', '16');
INSERT INTO `orderdetail` VALUES ('169', '201812078303', '34', '1', '12');
INSERT INTO `orderdetail` VALUES ('170', '201902045019', '39', '1', '20');
INSERT INTO `orderdetail` VALUES ('171', '201902045019', '26', '2', '16');
INSERT INTO `orderdetail` VALUES ('172', '201902041371', '26', '2', '16');
INSERT INTO `orderdetail` VALUES ('173', '201902041371', '41', '3', '16');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isparent` int(11) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '员工管理', '0', '/snack/admin/user/mainToAdmin', '1', '1');
INSERT INTO `permission` VALUES ('2', '员工添加', '1', '/snack/admin/user/addNewAdmin', '0', '1');
INSERT INTO `permission` VALUES ('3', '员工删除', '1', '/snack/admin/user/delAdminById', '0', '1');
INSERT INTO `permission` VALUES ('4', '员工修改', '1', '/snack/admin/user/updateGoAdminById', '0', '1');
INSERT INTO `permission` VALUES ('6', '用户管理', '0', '/snack/admin/user/mainToUserinfo', '1', '1');
INSERT INTO `permission` VALUES ('9', '用户删除', '6', '/snack/admin/user/delUserinfoById', '0', '1');
INSERT INTO `permission` VALUES ('10', '用户修改', '6', '/snack/admin/user/updateGoUserinfoById', '0', '1');
INSERT INTO `permission` VALUES ('13', '订单管理', '0', '/snack/admin/order/mainToAdminOrder', '1', '1');
INSERT INTO `permission` VALUES ('14', '订单修改', '13', '/snack/admin/order/updateSelectAdminOrder', '0', '1');
INSERT INTO `permission` VALUES ('15', '订单删除', '13', '/snack/admin/order/deleteAdminOrder', '0', '1');
INSERT INTO `permission` VALUES ('16', '详情修改', '13', '/snack/admin/order/updateSelectAdminOrderDetial', '0', '1');
INSERT INTO `permission` VALUES ('17', '详情删除', '13', '/snack/admin/order/deleteOrderdetail', '0', '1');
INSERT INTO `permission` VALUES ('19', '图片管理', '0', '/snack/admin/img/mainToAdminImg', '1', '1');
INSERT INTO `permission` VALUES ('20', '上传图片', '19', '/snack/admin/img/upload', '0', '1');
INSERT INTO `permission` VALUES ('21', '商品管理', '0', '/snack/admin/snackinfo/mainToAdminSnackinfo', '0', '1');
INSERT INTO `permission` VALUES ('22', '商品上架', '21', '/snack/admin/snackinfo/addAdminSnack', '0', '1');
INSERT INTO `permission` VALUES ('23', '商品删除', '21', '/snack/admin/snackinfo/delAdminUserinfo', '0', '1');
INSERT INTO `permission` VALUES ('24', '商品修改', '21', '/snack/admin/snackinfo/selectAdminUserinfoBysId', '0', '1');
INSERT INTO `permission` VALUES ('25', '个人信息', '0', '/admin/user/mainToAdminuser', '1', '1');
INSERT INTO `permission` VALUES ('26', '确认发货', '13', '/snack/admin/order/userOrderConfirm', '0', '1');

-- ----------------------------
-- Table structure for `receiptinfo`
-- ----------------------------
DROP TABLE IF EXISTS `receiptinfo`;
CREATE TABLE `receiptinfo` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `o_name` varchar(255) DEFAULT NULL,
  `o_phone` varchar(255) DEFAULT NULL,
  `o_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of receiptinfo
-- ----------------------------
INSERT INTO `receiptinfo` VALUES ('90', '201803272559', '哈哈', '110110110110', '浙江大学');
INSERT INTO `receiptinfo` VALUES ('131', '201811024234', '学猫叫', '15868526202', '浙江杭州');
INSERT INTO `receiptinfo` VALUES ('132', '201811045281', '你好', '13520109202', '猿来入此');
INSERT INTO `receiptinfo` VALUES ('133', '201812053444', '王小波', '13565655656', '上海 浦东');
INSERT INTO `receiptinfo` VALUES ('134', '201812074630', '李晓波', '13656565656', '上海 浦东');
INSERT INTO `receiptinfo` VALUES ('135', '201812075605', '张三', '13656565656', '上海');
INSERT INTO `receiptinfo` VALUES ('137', '201812077894', '王晓光', '13565656464', '上海');
INSERT INTO `receiptinfo` VALUES ('138', '201812078303', '张三', '13855544565', '上海');
INSERT INTO `receiptinfo` VALUES ('139', '201902045019', '王晓红', '13990042342', '四川成都红星路13号');
INSERT INTO `receiptinfo` VALUES ('140', '201902041371', '王晓红', '13990042342', '四川成都红星路13号');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `recordNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `s_idfk` (`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('13', '20', '2018-02-16', '2');
INSERT INTO `record` VALUES ('14', '23', '2018-03-27', '4');
INSERT INTO `record` VALUES ('15', '20', '2018-03-27', '6');
INSERT INTO `record` VALUES ('16', '20', '2018-03-27', '2');
INSERT INTO `record` VALUES ('17', '23', '2018-03-27', '1');
INSERT INTO `record` VALUES ('18', '21', '2018-03-27', '1');
INSERT INTO `record` VALUES ('19', '20', '2018-03-27', '2');
INSERT INTO `record` VALUES ('20', '21', '2018-03-27', '1');
INSERT INTO `record` VALUES ('21', '24', '2018-03-27', '3');
INSERT INTO `record` VALUES ('22', '23', '2018-03-28', '1');
INSERT INTO `record` VALUES ('23', '21', '2018-03-28', '10');
INSERT INTO `record` VALUES ('24', '21', '2018-03-28', '1');
INSERT INTO `record` VALUES ('25', '20', '2018-03-28', '1');
INSERT INTO `record` VALUES ('26', '24', '2018-03-28', '1');
INSERT INTO `record` VALUES ('27', '24', '2018-03-28', '1');
INSERT INTO `record` VALUES ('28', '23', '2018-03-31', '1');
INSERT INTO `record` VALUES ('29', '23', '2018-04-01', '1');
INSERT INTO `record` VALUES ('30', '20', '2018-04-01', '6');
INSERT INTO `record` VALUES ('31', '24', '2018-04-01', '3');
INSERT INTO `record` VALUES ('32', '20', '2018-04-01', '1');
INSERT INTO `record` VALUES ('33', '23', '2018-04-01', '1');
INSERT INTO `record` VALUES ('34', '62', '2018-04-01', '4');
INSERT INTO `record` VALUES ('35', '27', '2018-04-01', '5');
INSERT INTO `record` VALUES ('36', '45', '2018-04-01', '3');
INSERT INTO `record` VALUES ('37', '51', '2018-04-17', '4');
INSERT INTO `record` VALUES ('38', '34', '2018-04-17', '4');
INSERT INTO `record` VALUES ('39', '26', '2018-04-01', '8');
INSERT INTO `record` VALUES ('40', '30', '2018-04-01', '10');
INSERT INTO `record` VALUES ('41', '51', '2018-04-30', '3');
INSERT INTO `record` VALUES ('42', '33', '2018-04-30', '4');
INSERT INTO `record` VALUES ('43', '26', '2018-04-30', '3');
INSERT INTO `record` VALUES ('44', '56', '2018-04-30', '1');
INSERT INTO `record` VALUES ('45', '26', '2018-10-25', '1');
INSERT INTO `record` VALUES ('46', '26', '2018-10-25', '10');
INSERT INTO `record` VALUES ('47', '26', '2018-10-25', '22');
INSERT INTO `record` VALUES ('48', '34', '2018-10-25', '6');
INSERT INTO `record` VALUES ('49', '26', '2018-11-04', '1');
INSERT INTO `record` VALUES ('50', '25', '2018-11-04', '1');
INSERT INTO `record` VALUES ('51', '39', '2018-12-05', '2');
INSERT INTO `record` VALUES ('52', '32', '2018-12-05', '3');
INSERT INTO `record` VALUES ('54', '67', '2018-12-07', '3');
INSERT INTO `record` VALUES ('55', '55', '2018-12-07', '2');
INSERT INTO `record` VALUES ('56', '39', '2018-12-07', '1');
INSERT INTO `record` VALUES ('57', '66', '2018-12-07', '1');
INSERT INTO `record` VALUES ('58', '34', '2018-12-07', '1');
INSERT INTO `record` VALUES ('59', '26', '2019-02-04', '2');
INSERT INTO `record` VALUES ('60', '41', '2019-02-04', '3');
INSERT INTO `record` VALUES ('61', '26', '2019-02-04', '2');
INSERT INTO `record` VALUES ('62', '41', '2019-02-04', '3');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '系统最高权限者(不可添加编辑)');
INSERT INTO `role` VALUES ('2', '普通管理员', '管理发货');
INSERT INTO `role` VALUES ('3', '小角色', '查看基本报表');

-- ----------------------------
-- Table structure for `rolepermission`
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('1', '1', '1');
INSERT INTO `rolepermission` VALUES ('2', '1', '2');
INSERT INTO `rolepermission` VALUES ('3', '1', '3');
INSERT INTO `rolepermission` VALUES ('4', '1', '4');
INSERT INTO `rolepermission` VALUES ('5', '1', '6');
INSERT INTO `rolepermission` VALUES ('6', '1', '9');
INSERT INTO `rolepermission` VALUES ('7', '1', '10');
INSERT INTO `rolepermission` VALUES ('8', '1', '13');
INSERT INTO `rolepermission` VALUES ('9', '1', '14');
INSERT INTO `rolepermission` VALUES ('10', '1', '15');
INSERT INTO `rolepermission` VALUES ('11', '1', '16');
INSERT INTO `rolepermission` VALUES ('12', '1', '17');
INSERT INTO `rolepermission` VALUES ('13', '1', '19');
INSERT INTO `rolepermission` VALUES ('14', '1', '20');
INSERT INTO `rolepermission` VALUES ('15', '1', '21');
INSERT INTO `rolepermission` VALUES ('16', '1', '22');
INSERT INTO `rolepermission` VALUES ('17', '1', '23');
INSERT INTO `rolepermission` VALUES ('18', '1', '24');
INSERT INTO `rolepermission` VALUES ('19', '2', '1');
INSERT INTO `rolepermission` VALUES ('20', '2', '6');
INSERT INTO `rolepermission` VALUES ('21', '2', '13');
INSERT INTO `rolepermission` VALUES ('22', '2', '14');
INSERT INTO `rolepermission` VALUES ('23', '2', '15');
INSERT INTO `rolepermission` VALUES ('24', '2', '16');
INSERT INTO `rolepermission` VALUES ('25', '2', '17');
INSERT INTO `rolepermission` VALUES ('26', '2', '19');
INSERT INTO `rolepermission` VALUES ('27', '2', '21');
INSERT INTO `rolepermission` VALUES ('28', '2', '25');
INSERT INTO `rolepermission` VALUES ('29', '1', '25');
INSERT INTO `rolepermission` VALUES ('30', '3', '1');
INSERT INTO `rolepermission` VALUES ('31', '3', '6');
INSERT INTO `rolepermission` VALUES ('32', '3', '13');
INSERT INTO `rolepermission` VALUES ('33', '3', '19');
INSERT INTO `rolepermission` VALUES ('34', '3', '21');
INSERT INTO `rolepermission` VALUES ('35', '3', '25');
INSERT INTO `rolepermission` VALUES ('36', '1', '26');
INSERT INTO `rolepermission` VALUES ('37', '2', '26');

-- ----------------------------
-- Table structure for `snackinfo`
-- ----------------------------
DROP TABLE IF EXISTS `snackinfo`;
CREATE TABLE `snackinfo` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_batch` varchar(255) DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` varchar(255) DEFAULT NULL,
  `s_price` double DEFAULT NULL,
  `s_discount` varchar(255) DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` varchar(255) DEFAULT NULL,
  `s_brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `s_place` varchar(255) DEFAULT NULL COMMENT '产地',
  `s_Imported` int(1) DEFAULT NULL COMMENT '是否进口',
  `s_score` int(11) DEFAULT NULL COMMENT '积分',
  `s_pDate` date DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) DEFAULT NULL COMMENT '保质期',
  `state` int(11) DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) DEFAULT NULL,
  `s_number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of snackinfo
-- ----------------------------
INSERT INTO `snackinfo` VALUES ('20', '201803273550', '可乐', '10', '10', 'kele.jpg', '百事', '浙江', '1', null, '2018-03-15', '12', '1', '2018-03-27', '很好喝', '饮料类', '9980');
INSERT INTO `snackinfo` VALUES ('21', '201803276547', '瓜子', '20', '9', 'guazi.jpg', '恰恰', '浙江', '1', null, '2018-03-24', '12', '1', '2018-03-27', '好吃的瓜子', '其他', '989999');
INSERT INTO `snackinfo` VALUES ('23', '201803271694', '牛肉干', '100', '8', 'niurougan.jpg', '小辣椒', '浙江', '1', null, '2018-03-14', '12', '1', '2018-03-27', '好吃的牛肉干', '肉制类', '9991');
INSERT INTO `snackinfo` VALUES ('24', '201803272746', '提拉米酥', '100', '5', 'tilamishu.jpg', '大本营', '浙江', '0', null, '2018-03-14', '12', '1', '2018-03-27', '好吃的提拉米酥', '膨化类', '9992');
INSERT INTO `snackinfo` VALUES ('25', '201804174136', '咪咪', '10', '1', 'mimi.jpg', '咪咪', '广东', '0', null, '2018-04-15', '12', '1', '2018-04-17', '好吃的咪咪', '膨化类', '99999');
INSERT INTO `snackinfo` VALUES ('26', '201804172196', '乐事薯片', '20', '8', 'leshishupian.jpg', '乐事', '上海', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的薯片', '膨化类', '9951');
INSERT INTO `snackinfo` VALUES ('27', '201804171833', '黄金锅巴', '10', '7', 'huangjinguoba.jpg', '宇润', '安徽', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的锅巴', '膨化类', '9995');
INSERT INTO `snackinfo` VALUES ('28', '201804174852', '董小姐', '10', '10', 'dongxiaojie.jpg', '董小姐', '海南', '0', null, '2018-04-17', '18', '1', '2018-04-17', '好吃的董小姐', '膨化类', '100000');
INSERT INTO `snackinfo` VALUES ('29', '201804171022', '小馒头', '10', '8', 'xiaomantou.jpg', '旺旺', '北京', '1', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的小馒头', '膨化类', '200000');
INSERT INTO `snackinfo` VALUES ('30', '201804172485', '炒米', '10', '8', 'chaomi.jpg', '甘源', '浙江', '1', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的炒米', '膨化类', '9000');
INSERT INTO `snackinfo` VALUES ('31', '201804172109', '单身狗粮', '20', '8', 'danshengouliang.jpg', '旺旺', '浙江', '0', null, '2018-04-18', '12', '1', '2018-04-17', '好吃的狗粮', '膨化类', '10000');
INSERT INTO `snackinfo` VALUES ('32', '201804174170', '妙妙果', '10', '10', 'miaomiaoguo.jpg', '妙妙', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的妙妙果', '膨化类', '9997');
INSERT INTO `snackinfo` VALUES ('33', '201804173272', '虾味条', '20', '8', 'xiaweitiao.jpg', '旺旺', '浙江', '0', null, '2018-04-02', '12', '1', '2018-04-17', '好吃的虾味条', '膨化类', '119996');
INSERT INTO `snackinfo` VALUES ('34', '201804175107', '糙米卷', '20', '6', 'chumijuan.jpg', '旺旺', '浙江', '1', null, '2018-04-05', '12', '1', '2018-04-17', '好吃的糙米卷', '膨化类', '102291');
INSERT INTO `snackinfo` VALUES ('35', '201804175567', '香脆薯条', '10', '7', 'xiangcuishutiao.jpg', '旺旺', '浙江', '0', null, '2018-04-16', '12', '1', '2018-04-17', '好吃的香脆薯条', '膨化类', '100000');
INSERT INTO `snackinfo` VALUES ('36', '201804174966', '沙屋薯片', '20', '8', 'shawushupian.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的沙屋薯片', '膨化类', '2000');
INSERT INTO `snackinfo` VALUES ('37', '201804178458', '吱脆薯片', '100', '6', 'zhicuishupian.jpg', '旺旺', '浙江', '1', null, '2018-04-14', '12', '1', '2018-04-17', '好吃的吱脆薯片', '膨化类', '10000');
INSERT INTO `snackinfo` VALUES ('38', '201804172586', '奶酪', '20', '4', 'nailao.jpg', '旺旺', '浙江', '0', null, '2018-04-18', '12', '1', '2018-04-17', '好吃的奶酪', '膨化类', '20000');
INSERT INTO `snackinfo` VALUES ('39', '201804178495', '山椒凤爪', '20', '10', 'shanjiaofengzhua.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的山椒凤爪', '肉制类', '19997');
INSERT INTO `snackinfo` VALUES ('40', '201804171216', '泡椒牛肉', '20', '6', 'paojiaoniurou.jpg', '旺旺', '浙江', '1', null, '2018-03-07', '12', '1', '2018-04-17', '好吃的泡椒牛肉', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('41', '201804171172', '酱烧鸭翅', '20', '8', 'jiangshaoyachi.jpg', '旺旺', '浙江', '0', null, '2018-04-20', '12', '1', '2018-04-17', '好吃的酱烧鸭翅', '肉制类', '9994');
INSERT INTO `snackinfo` VALUES ('42', '201804177856', '小鸡腿', '20', '6', 'xiaojitui.jpg', '恰恰', '浙江', '0', null, '2018-04-11', '12', '1', '2018-04-17', '好吃的小鸡腿', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('43', '201804172550', '鸭掌', '20', '4', 'yazhang.jpg', '恰恰', '浙江', '0', null, '2018-04-21', '12', '1', '2018-04-17', '好吃的鸭掌', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('44', '201804179981', '猪肉铺', '30', '6', 'zhuroupu.jpg', '旺旺', '浙江', '0', null, '2018-04-12', '12', '1', '2018-04-17', '好吃的猪肉铺', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('45', '201804177197', '牛肉片', '30', '9', 'niuroupian.jpg', '旺旺', '浙江', '0', null, '2018-04-20', '12', '1', '2018-04-17', '好吃的牛肉片', '肉制类', '9997');
INSERT INTO `snackinfo` VALUES ('46', '201804175915', '鸭脖', '10', '8', 'yabo.jpg', '旺旺', '浙江', '1', null, '2018-04-14', '12', '1', '2018-04-17', '好吃的鸭脖', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('47', '201804176852', '卤牛肉', '30', '9', 'luniurou.jpg', '旺旺', '浙江', '1', null, '2018-04-13', '12', '1', '2018-04-17', '好吃的卤牛肉', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('48', '201804176635', '猪皮筋', '20', '8', 'zhupiji.jpg', '旺旺', '浙江', '0', null, '2018-04-14', '12', '1', '2018-04-17', '好吃的猪皮筋', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('49', '201804174593', '功夫鸭爪', '20', '7', 'gongfuyazhua.jpg', '旺旺', '浙江', '1', null, '2018-04-12', '12', '1', '2018-04-17', '好吃的功夫鸭爪', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('50', '201804177641', '牛肉丝', '20', '8', 'niurousi.jpg', '旺旺', '浙江', '0', null, '2018-04-14', '12', '1', '2018-04-17', '好吃的牛肉丝', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('51', '201804171818', '猪蹄', '30', '9', 'zhuti.jpg', '旺旺', '浙江', '0', null, '2018-04-13', '12', '1', '2018-04-17', '好吃的猪蹄', '肉制类', '9993');
INSERT INTO `snackinfo` VALUES ('52', '201804177621', '翅中', '20', '8', 'chizhong.jpg', '旺旺', '浙江', '1', null, '2018-03-20', '12', '1', '2018-04-17', '好吃的翅中', '肉制类', '10000');
INSERT INTO `snackinfo` VALUES ('53', '201804176052', '蜜桃汁', '10', '9', 'mitaozhi.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的蜜桃汁', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('54', '201804176090', '拿铁咖啡', '30', '8', 'natiekafei.jpg', '旺旺', '浙江', '0', null, '2018-03-07', '12', '1', '2018-04-17', '好吃的拿铁咖啡', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('55', '201804177963', '啵乐乐', '10', '9', 'bolele.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的啵乐乐', '饮料类', '9998');
INSERT INTO `snackinfo` VALUES ('56', '201804177044', '蜜柠水', '20', '6', 'miningshui.jpg', '旺旺', '浙江', '1', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的蜜柠水', '饮料类', '9999');
INSERT INTO `snackinfo` VALUES ('57', '201804173371', '养味乳味', '20', '8', 'yangweiruwei.jpg', '旺旺', '浙江', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的养味乳味', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('58', '201804171125', '糖豆奶', '50', '9', 'tangdounai.jpg', '旺旺', '西藏', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的糖豆奶', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('59', '201804179146', '丝袜奶茶', '10', '7', 'siwainaicha.jpg', '旺旺', '浙江', '1', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的丝袜奶茶', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('60', '201804177428', '乳酸菌', '20', '5', 'rusuanjun.jpg', '旺旺', '浙江', '0', null, '2018-03-07', '12', '1', '2018-04-17', '好吃的乳酸菌', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('61', '201804176104', '蓝莓饮料', '20', '8', 'lanmeiyinliao.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的蓝莓饮料', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('62', '201804171606', '牛乳茶', '10', '8', 'niurucha.jpg', '旺旺', '浙江', '0', null, '2018-04-05', '12', '1', '2018-04-17', '好吃的牛乳茶', '饮料类', '9996');
INSERT INTO `snackinfo` VALUES ('63', '201804172259', '米稀', '10', '10', 'mixi.jpg', '旺旺', '浙江', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的米稀', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('64', '201804176802', '奇诺咖啡', '20', '8', 'qinuokafei.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的奇诺咖啡', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('65', '201804175746', '西米露', '20', '7', 'ximilu.jpg', '旺旺', '浙江', '1', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的西米露', '饮料类', '10000');
INSERT INTO `snackinfo` VALUES ('66', '201804177256', '椰汁', '20', '8', 'yezhi.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的椰汁', '饮料类', '9999');
INSERT INTO `snackinfo` VALUES ('67', '201804177149', '牛奶果冻', '20', '8', 'niunaiguodong.jpg', '旺旺', '浙江', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的牛奶果冻', '其他', '9997');
INSERT INTO `snackinfo` VALUES ('68', '201804172033', '闪光蛋', '10', '5', 'shanguangdan.jpg', '旺旺', '浙江', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的闪光蛋', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('69', '201804176739', '口香糖', '20', '9', 'kouxiangtang.jpg', '旺旺', '浙江', '1', null, '2018-04-20', '43', '1', '2018-04-17', '好吃的口香糖', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('70', '201804174121', '桔子果杯', '20', '8', 'juziguobei.jpg', '旺旺', '浙江', '0', null, '2018-04-13', '12', '1', '2018-04-17', '好吃的桔子果杯', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('71', '201804175818', '优酪果冻', '20', '8', 'youlaoguodong.jpg', '旺旺', '浙江', '0', null, '2018-04-17', '12', '1', '2018-04-17', '好吃的优酪果冻', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('72', '201804179160', '布丁草莓', '20', '7', 'budingcaomei.jpg', '旺旺', '浙江', '1', null, '2018-04-09', '12', '1', '2018-04-17', '好吃的布丁草莓', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('73', '201804174125', '布丁原味', '20', '8', 'budingyuanwei.jpg', '旺旺', '浙江', '0', null, '2018-04-17', '18', '1', '2018-04-17', '好吃的布丁原味', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('74', '201804172373', '星球杯', '20', '8', 'xingqiubei.jpg', '旺旺', '浙江', '1', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的星球杯', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('75', '201804175309', '欣欣杯', '20', '7', 'xinxinbei.jpg', '旺旺', '浙江', '0', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的欣欣杯', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('76', '201804178276', '葡萄干', '10', '9', 'putaogan.jpg', '旺旺', '浙江', '1', null, '2018-04-19', '12', '1', '2018-04-17', '好吃的葡萄干', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('77', '201804177722', '芒果干', '20', '5', 'mangguogan.jpg', '咪咪', '浙江', '0', null, '2018-04-20', '12', '1', '2018-04-17', '好吃的芒果干', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('78', '201804171055', '桃条', '10', '8', 'taotiao.jpg', '恰恰', '浙江', '0', null, '2018-04-07', '12', '1', '2018-04-17', '好吃的桃条', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('79', '201804172661', '话梅', '10', '8', 'huamei.jpg', '旺旺', '浙江', '1', null, '2018-03-20', '18', '1', '2018-04-17', '好吃的话梅', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('80', '201804173962', '秋葵', '10', '7', 'huamei.jpg', '旺旺', '浙江', '0', null, '2018-04-04', '12', '1', '2018-04-17', '好吃的秋葵', '其他', '10000');
INSERT INTO `snackinfo` VALUES ('81', '201807029034', '瓜子', '21', '1', 'guazi.jpg', '旺旺', '浙江杭州', '0', null, '2018-04-17', '12', '1', '2018-07-02', '32', '其他', '10000');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `u_username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `u_money` varchar(255) DEFAULT NULL COMMENT '钱包金额',
  `u_phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `u_sex` char(255) DEFAULT NULL COMMENT '性别',
  `u_resgistDate` date DEFAULT NULL COMMENT '出生日期',
  `u_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `u_score` int(11) DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('17', '张小帅', 'xiaoshuai', '123456', '9983.0', '15810100256', '761695@qq.com', '女', '2018-11-01', '浙江', null);
INSERT INTO `userinfo` VALUES ('18', '王晓丽', 'yuanlairuci', '123', '11091.0', '13520109202', '1193284480@qq.com', '男', '2018-11-04', '北京', '1');
INSERT INTO `userinfo` VALUES ('19', '李明文', 'limingwqen', '123', '9930.0', '13656565656', '123456@qq.com', '女', '2018-12-05', '上海', null);
INSERT INTO `userinfo` VALUES ('20', '王华丽', 'artisan', '123', '9837.0', '13565659898', 'artusan@qq.com', '男', '2018-12-07', '上海市 浦东新区', null);
INSERT INTO `userinfo` VALUES ('21', '王晓红', 'user1', '123456', '9920.0', '13990042342', '254540457@qq.com', '女', '2019-02-04', '四川成都红星路13号', null);

-- ----------------------------
-- Procedure structure for `haha`
-- ----------------------------
DROP PROCEDURE IF EXISTS `haha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `haha`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `jk`
-- ----------------------------
DROP PROCEDURE IF EXISTS `jk`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jk`()
BEGIN
 SELECT * from admin;
end
;;
DELIMITER ;
