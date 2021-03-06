/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : myproject

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-09-04 16:48:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_app_fmfile`
-- ----------------------------
DROP TABLE IF EXISTS `t_app_fmfile`;
CREATE TABLE `t_app_fmfile` (
  `id` varchar(32) NOT NULL,
  `FILEURLID` varchar(255) DEFAULT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `UPLOADTIME` datetime NOT NULL,
  `UPLOADER` varchar(255) DEFAULT NULL,
  `FOLDER` varchar(32) DEFAULT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_e42p1bc5t07wjvxhv2k0l93vv` (`FOLDER`),
  CONSTRAINT `FK_e42p1bc5t07wjvxhv2k0l93vv` FOREIGN KEY (`FOLDER`) REFERENCES `t_app_fmfolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_fmfile
-- ----------------------------

-- ----------------------------
-- Table structure for `t_app_fmfolder`
-- ----------------------------
DROP TABLE IF EXISTS `t_app_fmfolder`;
CREATE TABLE `t_app_fmfolder` (
  `id` varchar(32) NOT NULL,
  `CREATIONTIME` datetime NOT NULL,
  `ISPUBLIC` int(11) DEFAULT '0',
  `NAME` varchar(255) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '0',
  `PARENTID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dqay47vhs3rxiff4hm0tfe0xp` (`PARENTID`),
  CONSTRAINT `FK_dqay47vhs3rxiff4hm0tfe0xp` FOREIGN KEY (`PARENTID`) REFERENCES `t_app_fmfolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_fmfolder
-- ----------------------------

-- ----------------------------
-- Table structure for `t_app_fmfolder_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_app_fmfolder_log`;
CREATE TABLE `t_app_fmfolder_log` (
  `id` varchar(32) NOT NULL,
  `addUser` varchar(255) DEFAULT NULL,
  `folderId` varchar(255) DEFAULT NULL,
  `logContent` varchar(255) DEFAULT NULL,
  `logDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_fmfolder_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_app_fmfolderpermission`
-- ----------------------------
DROP TABLE IF EXISTS `t_app_fmfolderpermission`;
CREATE TABLE `t_app_fmfolderpermission` (
  `id` varchar(32) NOT NULL,
  `INHERITED` int(11) DEFAULT '0',
  `LASTMODIFIED` datetime NOT NULL,
  `SUBJECT` varchar(255) DEFAULT NULL,
  `SUBJECTTYPE` int(11) DEFAULT NULL,
  `FOLDER` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2512thtu58auyyxap9kg7w8un` (`FOLDER`),
  CONSTRAINT `FK_2512thtu58auyyxap9kg7w8un` FOREIGN KEY (`FOLDER`) REFERENCES `t_app_fmfolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_app_fmfolderpermission
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_qz`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_qz`;
CREATE TABLE `t_e_qz` (
  `ID_E_QZ` varchar(32) NOT NULL,
  `JC` varchar(255) DEFAULT NULL,
  `ID_E_YY` varchar(32) DEFAULT NULL,
  `YXBZ` int(11) DEFAULT '1',
  `XTQZBZ` int(11) DEFAULT '0',
  `DM` varchar(255) DEFAULT NULL,
  `MS` varchar(255) DEFAULT NULL,
  `ID_SXWD` varchar(255) DEFAULT NULL,
  `YJBZ` int(11) DEFAULT '0',
  `MC` varchar(255) DEFAULT NULL,
  `FYHQZBZ` int(11) DEFAULT '0',
  `PLXH` int(11) DEFAULT NULL,
  `WYMC` varchar(255) DEFAULT NULL,
  `ID_E_ZZ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID_E_QZ`),
  KEY `FK_4gv9j8boddnx0jb9jl8dfec5c` (`ID_E_ZZ`),
  CONSTRAINT `FK_4gv9j8boddnx0jb9jl8dfec5c` FOREIGN KEY (`ID_E_ZZ`) REFERENCES `t_e_zz` (`ID_E_ZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_qz
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_qzyh`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_qzyh`;
CREATE TABLE `t_e_qzyh` (
  `ID_E_QZYH` varchar(32) NOT NULL,
  `PLXH` int(11) DEFAULT '0',
  `ID_E_QZ` varchar(32) DEFAULT NULL,
  `ID_E_YH` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID_E_QZYH`),
  KEY `FK_hq8qrnxkg0jcnm0p9cujyhe9q` (`ID_E_QZ`),
  KEY `FK_f9q4b1w2u44qvlx8wu30914uh` (`ID_E_YH`),
  CONSTRAINT `FK_f9q4b1w2u44qvlx8wu30914uh` FOREIGN KEY (`ID_E_YH`) REFERENCES `t_e_yh` (`ID_E_YH`),
  CONSTRAINT `FK_hq8qrnxkg0jcnm0p9cujyhe9q` FOREIGN KEY (`ID_E_QZ`) REFERENCES `t_e_qz` (`ID_E_QZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_qzyh
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_yh`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_yh`;
CREATE TABLE `t_e_yh` (
  `ID_E_YH` varchar(255) NOT NULL,
  `WYMC_ZZDY` varchar(255) DEFAULT NULL,
  `ID_E_ZZDY` varchar(255) NOT NULL,
  `WYMC` varchar(255) NOT NULL,
  `DM` varchar(255) NOT NULL,
  `MC` varchar(255) NOT NULL,
  `JC` varchar(255) DEFAULT NULL,
  `ZW` varchar(255) DEFAULT NULL,
  `PLXH` int(11) NOT NULL,
  `QC` varchar(255) NOT NULL,
  `JKCZLX` int(11) NOT NULL,
  `YXBZ` int(11) NOT NULL,
  `DMC` varchar(255) DEFAULT NULL,
  `YJMC` varchar(255) DEFAULT NULL,
  `YJYHBZ` int(11) NOT NULL,
  `SSXT` varchar(255) DEFAULT NULL,
  `KL` varchar(255) DEFAULT NULL,
  `MS` varchar(255) DEFAULT NULL,
  `ID_SXWD` varchar(255) DEFAULT NULL,
  `ID_E_YH_ZS` varchar(255) DEFAULT NULL,
  `CYYJBLOB` blob,
  `ID_E_ZZ` varchar(255) DEFAULT NULL,
  `IsEmployee` int(11) DEFAULT NULL,
  `IsLongUser` int(11) DEFAULT NULL,
  `SHORTPINYIN` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_E_YH`),
  KEY `FK94B29A549347492E` (`ID_E_ZZ`) USING BTREE,
  KEY `FK94B29A5419B75FEA` (`ID_E_YH_ZS`) USING BTREE,
  KEY `FK94B29A545E6003E7` (`ID_E_ZZDY`) USING BTREE,
  CONSTRAINT `t_e_yh_ibfk_1` FOREIGN KEY (`ID_E_YH_ZS`) REFERENCES `t_e_yh` (`ID_E_YH`),
  CONSTRAINT `t_e_yh_ibfk_2` FOREIGN KEY (`ID_E_ZZDY`) REFERENCES `t_e_zzdy` (`ID_E_ZZDY`),
  CONSTRAINT `t_e_yh_ibfk_3` FOREIGN KEY (`ID_E_ZZ`) REFERENCES `t_e_zz` (`ID_E_ZZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_yh
-- ----------------------------
INSERT INTO `t_e_yh` VALUES ('17d29adec0a8016d35f445707b04a37b', 'OU=org/O=all', '17d29a32c0a8016d1feec756de2423ad', 'U=root/O=all', 'root', '超级用户', null, null, '0', '超级用户/虚拟全体单位', '0', '1', null, null, '0', null, 'password', 'EABnP系统的超级管理员', null, null, null, '17d161f6c0a8016d3e549763763673ad', null, null, 'cjyh', null);
INSERT INTO `t_e_yh` VALUES ('402881ea5a4130bd015a413333780003', 'OU=jsb/O=suredy', '1ce63f3cc0a8016d211719ee258f1369', 'U=A1672633/OU=jsb/O=suredy', 'A1672633', '左雨虹', null, null, '0', '左雨虹/技术部/水滴科技', '0', '1', null, null, '0', null, '1', null, null, null, null, '1c619ecfc0a8016d63e5551834d87a65', '1', '0', 'zyh', '');

-- ----------------------------
-- Table structure for `t_e_zz`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_zz`;
CREATE TABLE `t_e_zz` (
  `ID_E_ZZ` varchar(255) NOT NULL DEFAULT '',
  `WYMC` varchar(255) NOT NULL,
  `DM` varchar(255) NOT NULL,
  `MC` varchar(255) NOT NULL,
  `JC` varchar(255) DEFAULT NULL,
  `PLXH` int(11) NOT NULL,
  `QC` varchar(255) NOT NULL,
  `XTZZBZ` int(11) NOT NULL,
  `YXBZ` int(11) NOT NULL,
  `MS` varchar(255) DEFAULT NULL,
  `ID_SXWD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_E_ZZ`),
  UNIQUE KEY `WYMC` (`WYMC`) USING BTREE,
  UNIQUE KEY `DM` (`DM`) USING BTREE,
  UNIQUE KEY `MC` (`MC`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_zz
-- ----------------------------
INSERT INTO `t_e_zz` VALUES ('17d161f6c0a8016d3e549763763673ad', 'O=all', 'all', '虚拟全体单位', null, '0', '虚拟全体单位', '1', '1', '这是一个虚拟的单位，代表所有单位', null);
INSERT INTO `t_e_zz` VALUES ('17d29aedc0a8016d2acc154509eb3698', 'O=special', 'special', '特殊组织', null, '1', '特殊组织', '1', '1', '用来包含在流程中使用的特殊部门、群组的“特殊组织”', null);
INSERT INTO `t_e_zz` VALUES ('1c619ecfc0a8016d63e5551834d87a65', 'O=suredy', 'suredy', '水滴科技', '', '1000', '水滴科技', '0', '1', '', null);

-- ----------------------------
-- Table structure for `t_e_zzdy`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_zzdy`;
CREATE TABLE `t_e_zzdy` (
  `ID_E_ZZDY` varchar(255) NOT NULL,
  `WYMC` varchar(255) NOT NULL,
  `DM` varchar(255) NOT NULL,
  `MC` varchar(255) NOT NULL,
  `JC` varchar(255) DEFAULT NULL,
  `PLXH` int(11) NOT NULL,
  `QC` varchar(255) NOT NULL,
  `YXBZ` int(11) NOT NULL,
  `MS` varchar(255) DEFAULT NULL,
  `ID_SXWD` varchar(255) DEFAULT NULL,
  `ID_E_ZZ` varchar(255) DEFAULT NULL,
  `ID_E_ZZDY_SJ` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_E_ZZDY`),
  UNIQUE KEY `WYMC` (`WYMC`) USING BTREE,
  KEY `FK327615DA9347492E` (`ID_E_ZZ`) USING BTREE,
  KEY `FK327615DAB6BFABD7` (`ID_E_ZZDY_SJ`) USING BTREE,
  CONSTRAINT `t_e_zzdy_ibfk_1` FOREIGN KEY (`ID_E_ZZ`) REFERENCES `t_e_zz` (`ID_E_ZZ`),
  CONSTRAINT `t_e_zzdy_ibfk_2` FOREIGN KEY (`ID_E_ZZDY_SJ`) REFERENCES `t_e_zzdy` (`ID_E_ZZDY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_zzdy
-- ----------------------------
INSERT INTO `t_e_zzdy` VALUES ('17d29a32c0a8016d1feec756de2423ad', 'OU=org/O=all', 'org', 'org', null, '0', 'org/虚拟全体单位', '1', 'Org', null, '17d161f6c0a8016d3e549763763673ad', null);
INSERT INTO `t_e_zzdy` VALUES ('1ce63f3cc0a8016d211719ee258f1369', 'OU=jsb/O=suredy', 'jsb', '技术部', null, '1000', '技术部/水滴科技', '1', '', null, '1c619ecfc0a8016d63e5551834d87a65', null);

-- ----------------------------
-- Table structure for `t_report_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_report_type`;
CREATE TABLE `t_report_type` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '0',
  `PARENTID` varchar(32) DEFAULT NULL,
  `RESOURCEID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gyxyat7nc1rhydhu7mso0mvvr` (`PARENTID`),
  KEY `FK_etxm91pkb1nnc1xr9xw8qp5cl` (`RESOURCEID`),
  CONSTRAINT `FK_etxm91pkb1nnc1xr9xw8qp5cl` FOREIGN KEY (`RESOURCEID`) REFERENCES `t_security_resource` (`id`),
  CONSTRAINT `FK_gyxyat7nc1rhydhu7mso0mvvr` FOREIGN KEY (`PARENTID`) REFERENCES `t_report_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report_type
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_menu`;
CREATE TABLE `t_resource_menu` (
  `id` varchar(32) NOT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `COLLAPSE` bit(1) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '0',
  `NAME` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `PARENTID` varchar(32) DEFAULT NULL,
  `RESOURCEID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_haohifnic8rl2gy64qkksoqec` (`PARENTID`),
  KEY `FK_ay0xwnu7g9j8hk6ufw8e130je` (`RESOURCEID`),
  CONSTRAINT `FK_ay0xwnu7g9j8hk6ufw8e130je` FOREIGN KEY (`RESOURCEID`) REFERENCES `t_security_resource` (`id`),
  CONSTRAINT `FK_haohifnic8rl2gy64qkksoqec` FOREIGN KEY (`PARENTID`) REFERENCES `t_resource_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource_menu
-- ----------------------------
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c26bc810000', '', '\0', ' icon-home', '0', '首页', 'test/ckeditor', null, '402881e75e3c1fb8015e3c26bc9c0001');
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c2a3716000c', '\0', '\0', 'icon-desktop', '50', 'Java', null, null, '402881e75e3c1fb8015e3c2a3716000d');
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c2a9cb4000e', '\0', '\0', 'icon-desktop', '150', 'Android', null, null, '402881e75e3c1fb8015e3c2a9cb4000f');
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c2b9ec80010', '\0', '\0', 'icon-desktop', '100', ' jquery', null, null, '402881e75e3c1fb8015e3c2b9ec80011');
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c2d11bb0012', '\0', '\0', 'icon-desktop', '200', '我的项目', null, null, '402881e75e3c1fb8015e3c2d11bb0013');
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c2d8f460014', '\0', '\0', 'icon-desktop', '300', '其他', null, null, '402881e75e3c1fb8015e3c2d8f460015');
INSERT INTO `t_resource_menu` VALUES ('402881e75e3c1fb8015e3c377be5002e', '\0', '\0', 'icon-desktop', '250', '案例', null, null, '402881e75e3c1fb8015e3c377be5002f');

-- ----------------------------
-- Table structure for `t_resource_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_report`;
CREATE TABLE `t_resource_report` (
  `id` varchar(32) NOT NULL,
  `FILEID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '0',
  `RESOURCEID` varchar(32) DEFAULT NULL,
  `TYPEID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3s9o4t0nr3hx14wi90dtsv0gg` (`RESOURCEID`),
  KEY `FK_3jj9dkiignqxuctxfi15te0ws` (`TYPEID`),
  CONSTRAINT `FK_3jj9dkiignqxuctxfi15te0ws` FOREIGN KEY (`TYPEID`) REFERENCES `t_report_type` (`id`),
  CONSTRAINT `FK_3s9o4t0nr3hx14wi90dtsv0gg` FOREIGN KEY (`RESOURCEID`) REFERENCES `t_security_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource_report
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource_segment`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_segment`;
CREATE TABLE `t_resource_segment` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '0',
  `URI` varchar(255) DEFAULT NULL,
  `RESOURCEID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k4jof5v25nle58k3od9tk8dou` (`RESOURCEID`),
  CONSTRAINT `FK_k4jof5v25nle58k3od9tk8dou` FOREIGN KEY (`RESOURCEID`) REFERENCES `t_security_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource_segment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_security_basicpermission`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_basicpermission`;
CREATE TABLE `t_security_basicpermission` (
  `id` varchar(32) NOT NULL,
  `PERMISSIONID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s0v2vsxx2e729ly65t3qfbluj` (`PERMISSIONID`),
  CONSTRAINT `FK_s0v2vsxx2e729ly65t3qfbluj` FOREIGN KEY (`PERMISSIONID`) REFERENCES `t_security_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_basicpermission
-- ----------------------------
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358fd20017', '402881e75e3c1fb8015e3c358fd20016');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358fda0019', '402881e75e3c1fb8015e3c358fda0018');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358fdf001b', '402881e75e3c1fb8015e3c358fde001a');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358fe6001d', '402881e75e3c1fb8015e3c358fe5001c');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358feb001f', '402881e75e3c1fb8015e3c358feb001e');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358ff10021', '402881e75e3c1fb8015e3c358ff00020');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358ff70023', '402881e75e3c1fb8015e3c358ff70022');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c358ffd0025', '402881e75e3c1fb8015e3c358ffc0024');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c3590040027', '402881e75e3c1fb8015e3c3590030026');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c35900a0029', '402881e75e3c1fb8015e3c35900a0028');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c359013002b', '402881e75e3c1fb8015e3c359012002a');
INSERT INTO `t_security_basicpermission` VALUES ('402881e75e3c1fb8015e3c35901a002d', '402881e75e3c1fb8015e3c35901a002c');

-- ----------------------------
-- Table structure for `t_security_loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_loginlog`;
CREATE TABLE `t_security_loginlog` (
  `id` varchar(32) NOT NULL,
  `loginIp` varchar(255) DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `logindate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_loginlog
-- ----------------------------
INSERT INTO `t_security_loginlog` VALUES ('402881e75e3b4c28015e3b4cb4340000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-01 10:37:16');
INSERT INTO `t_security_loginlog` VALUES ('402881e75e3c8b7d015e3c8be9e50000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-01 16:25:55');
INSERT INTO `t_security_loginlog` VALUES ('402881e75e3ca956015e3ca99c090000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-01 16:58:22');
INSERT INTO `t_security_loginlog` VALUES ('402881e75e3cbac7015e3cbbf03f0000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-01 17:18:23');
INSERT INTO `t_security_loginlog` VALUES ('402881ec5e4aefe6015e4af02d260000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-04 11:30:07');
INSERT INTO `t_security_loginlog` VALUES ('402881ec5e4ba341015e4ba4002e0000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-04 14:46:32');
INSERT INTO `t_security_loginlog` VALUES ('402881ec5e4bc4ce015e4bc54cef0000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-04 15:22:55');
INSERT INTO `t_security_loginlog` VALUES ('402881ec5e4c04d7015e4c054c290000', '0:0:0:0:0:0:0:1', '左雨虹/技术部/水滴科技', '2017-09-04 16:32:49');

-- ----------------------------
-- Table structure for `t_security_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_permission`;
CREATE TABLE `t_security_permission` (
  `id` varchar(32) NOT NULL,
  `ACTION` int(11) DEFAULT NULL,
  `RESOURCEID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1sds6ly62efd1r9yn87xmcl8n` (`RESOURCEID`),
  CONSTRAINT `FK_1sds6ly62efd1r9yn87xmcl8n` FOREIGN KEY (`RESOURCEID`) REFERENCES `t_security_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_permission
-- ----------------------------
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358fd20016', '0', '402881e75e3c1fb8015e3c26bc9c0001');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358fda0018', '0', '402881e75e3c1fb8015e3c2a3716000d');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358fde001a', '0', '402881e75e3c1fb8015e3c2b9ec80011');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358fe5001c', '0', '402881e75e3c1fb8015e3c2a9cb4000f');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358feb001e', '0', '402881e75e3c1fb8015e3c2d11bb0013');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358ff00020', '0', '402881e75e3c1fb8015e3c2d8f460015');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358ff70022', '1', '402881e75e3c1fb8015e3c26bc9c0001');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c358ffc0024', '1', '402881e75e3c1fb8015e3c2a3716000d');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c3590030026', '1', '402881e75e3c1fb8015e3c2b9ec80011');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c35900a0028', '1', '402881e75e3c1fb8015e3c2a9cb4000f');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c359012002a', '1', '402881e75e3c1fb8015e3c2d11bb0013');
INSERT INTO `t_security_permission` VALUES ('402881e75e3c1fb8015e3c35901a002c', '1', '402881e75e3c1fb8015e3c2d8f460015');

-- ----------------------------
-- Table structure for `t_security_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_resource`;
CREATE TABLE `t_security_resource` (
  `id` varchar(32) NOT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `LASTMODIFIEDTIME` datetime DEFAULT NULL,
  `NAME` varchar(512) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `URI` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_resource
-- ----------------------------
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c26bc9c0001', '2017-09-01 14:35:25', '2017-09-01 14:35:25', '首页', '1', 'test/ckeditor');
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c2a3716000d', '2017-09-01 14:39:13', '2017-09-01 14:39:13', 'Java', '1', '5fde76b3-6018-423e-a2da-5e4e5eb4b4fa');
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c2a9cb4000f', '2017-09-01 14:39:39', '2017-09-01 14:39:39', 'Android', '1', '351de5cc-02a8-4842-9666-9852c2d9e69d');
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c2b9ec80011', '2017-09-01 14:40:45', '2017-09-01 14:40:45', ' jquery', '1', '8c02b0c8-42b6-40d2-ad6a-6389aa492844');
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c2d11bb0013', '2017-09-01 14:42:20', '2017-09-01 14:42:20', '我的项目', '1', '43b08637-8ff4-42f0-813f-153e5394fed5');
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c2d8f460015', '2017-09-01 14:42:52', '2017-09-01 14:42:52', '其他', '1', 'd942b8b3-dcbf-4ba3-b383-9f4dc58f0549');
INSERT INTO `t_security_resource` VALUES ('402881e75e3c1fb8015e3c377be5002f', '2017-09-01 14:53:42', '2017-09-01 14:53:42', '案例', '1', '77c3dc9f-869b-48e7-8a8f-a363a7c8aaba');

-- ----------------------------
-- Table structure for `t_security_role2permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_role2permission`;
CREATE TABLE `t_security_role2permission` (
  `id` varchar(32) NOT NULL,
  `PERMISSIONID` varchar(32) DEFAULT NULL,
  `ROLEID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7uu8fqq2wlrcrsynbl6rqttag` (`PERMISSIONID`),
  KEY `FK_dxnfrstjhdnbp50riberykqi` (`ROLEID`),
  CONSTRAINT `FK_7uu8fqq2wlrcrsynbl6rqttag` FOREIGN KEY (`PERMISSIONID`) REFERENCES `t_security_permission` (`id`),
  CONSTRAINT `FK_dxnfrstjhdnbp50riberykqi` FOREIGN KEY (`ROLEID`) REFERENCES `t_e_qz` (`ID_E_QZ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_role2permission
-- ----------------------------

-- ----------------------------
-- Table structure for `t_security_user2permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_user2permission`;
CREATE TABLE `t_security_user2permission` (
  `id` varchar(32) NOT NULL,
  `PERMISSIONID` varchar(32) DEFAULT NULL,
  `USERID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qvaw0lhga9v4k6kw5brmxj2mr` (`PERMISSIONID`),
  KEY `FK_dfpe1mucsuwat3g8h80k6n5o9` (`USERID`),
  CONSTRAINT `FK_dfpe1mucsuwat3g8h80k6n5o9` FOREIGN KEY (`USERID`) REFERENCES `t_e_yh` (`ID_E_YH`),
  CONSTRAINT `FK_qvaw0lhga9v4k6kw5brmxj2mr` FOREIGN KEY (`PERMISSIONID`) REFERENCES `t_security_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_user2permission
-- ----------------------------

-- ----------------------------
-- Table structure for `t_security_usertoken`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_usertoken`;
CREATE TABLE `t_security_usertoken` (
  `id` varchar(32) NOT NULL,
  `ACTIVETIME` datetime DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `ISACTIVE` int(11) DEFAULT NULL,
  `REFRESHTIME` datetime DEFAULT NULL,
  `TOKEN` varchar(255) NOT NULL,
  `USERCODE` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_usertoken
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_db_backups`
-- ----------------------------
DROP TABLE IF EXISTS `tb_db_backups`;
CREATE TABLE `tb_db_backups` (
  `id` varchar(32) NOT NULL,
  `backups_person` varchar(500) NOT NULL,
  `backups_time` datetime NOT NULL,
  `db_name` varchar(500) NOT NULL,
  `relative_backups_path` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_db_backups
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionary`;
CREATE TABLE `tb_dictionary` (
  `id` varchar(32) NOT NULL,
  `groupCode` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '999',
  `is_system` int(11) NOT NULL DEFAULT '0',
  `val` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1jwv731xsy1tyc7x4cuoifygw` (`groupCode`,`val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_file`
-- ----------------------------
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE `tb_file` (
  `id` varchar(32) NOT NULL,
  `extend_data` longtext,
  `name` varchar(200) NOT NULL,
  `relative_file_path` varchar(500) NOT NULL,
  `SHACODE` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_fuffix` varchar(255) NOT NULL,
  `upload_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_file
-- ----------------------------
