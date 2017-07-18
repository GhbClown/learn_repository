#
# Structure for table "code_dept"
#

DROP TABLE IF EXISTS `code_dept`;
CREATE TABLE `code_dept` (
  `dept_id` varchar(50) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `dept_info` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "code_dept"
#

INSERT INTO `code_dept` VALUES ('1','行政部','日常工作'),('2','财务部','收入支出'),('3','营销部','产品销售'),('4','公关部','公共关系'),('5','生产部','产品生产');

#
# Structure for table "code_sex"
#

DROP TABLE IF EXISTS `code_sex`;
CREATE TABLE `code_sex` (
  `sex_id` varchar(50) NOT NULL,
  `sex_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "code_sex"
#

INSERT INTO `code_sex` VALUES ('1','男'),('2','女');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#


#
# Structure for table "yonghu"
#

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `yh_id` int(11) NOT NULL AUTO_INCREMENT,
  `yh_name` varchar(50) DEFAULT NULL,
  `yh_pass` varchar(50) DEFAULT NULL,
  `sex_id` varchar(50) DEFAULT NULL,
  `dept_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`yh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "yonghu"
#

INSERT INTO `yonghu` VALUES (1,'qe','qwe','1','1'),(2,'qweqe','qewq','1','1'),(3,'zxcvt','adfafas','1','1'),(4,'fadsfsadfasdfq','wer','1','1'),(5,'xcva','asdf','1','1'),(6,'1','1','2','3'),(7,'aaa','asdf','1','1'),(8,'123','123','1','1'),(9,'asdadf','asdfafd','1','1'),(10,'111','111','1','1'),(15,'123123123','12312312','1','1');
