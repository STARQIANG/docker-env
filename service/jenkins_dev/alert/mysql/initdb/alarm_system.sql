/*
SQLyog v10.2 
MySQL - 5.6.38 : Database - alarm_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`alarm_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `alarm_system`;

/*Table structure for table `t_email_template` */

DROP TABLE IF EXISTS `t_email_template`;

CREATE TABLE `t_email_template` (
  `id` varchar(32) NOT NULL,
  `template_name` varchar(50) DEFAULT NULL,
  `template_value` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(2) DEFAULT NULL COMMENT '1 有效 2 废止',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_email_template` */

insert  into `t_email_template`(`id`,`template_name`,`template_value`,`create_time`,`status`,`remark`) values ('1','pv-web','mail','2018-01-25 19:39:51','1',NULL),('11123222','alarm-web','mail','2018-02-01 16:18:35','1',NULL),('2','phoenix','mail','2018-01-26 10:19:13','1',NULL),('3','wechat-waiwei','mail','2018-01-26 14:01:46','1',NULL),('4','wechat-neiwei','mail','2018-01-26 14:02:48','1',NULL),('dddddeeeeeee333333','outer-web','mail','2018-02-01 16:15:10','1',NULL),('f0717708-04bb-11e8-af8b-0242ac12','asset-service','mail','2018-01-29 14:16:27','1',NULL),('f07177aa-04bb-11e8-af8b-0242ac12','nginx_error','mail','2018-02-02 13:58:29','1',NULL),('f07303ec-04bb-11e8-af8b-0242ac12','basic-service','mail','2018-01-29 14:16:27','1',NULL),('f0748f67-04bb-11e8-af8b-0242ac12','basic-web','mail','2018-01-29 14:16:27','1',NULL),('f075eed7-04bb-11e8-af8b-0242ac12','channel-inner-web','mail','2018-01-29 14:16:27','1',NULL),('f077660b-04bb-11e8-af8b-0242ac12','channel-out-web','mail','2018-01-29 14:16:27','1',NULL),('f079143a-04bb-11e8-af8b-0242ac12','check_service','mail','2018-01-29 14:16:27','1',NULL),('f07a7b4b-04bb-11e8-af8b-0242ac12','common-platform-web','mail','2018-01-29 14:16:27','1',NULL),('f07bda3c-04bb-11e8-af8b-0242ac12','contract-service','mail','2018-01-29 14:16:27','1',NULL),('f07d92ea-04bb-11e8-af8b-0242ac12','hunter-back-web','mail','2018-01-29 14:16:27','1',NULL),('f0833eb3-04bb-11e8-af8b-0242ac12','huofh-web','mail','2018-01-29 14:16:27','1',NULL),('f084bfc7-04bb-11e8-af8b-0242ac12','lms-web','mail','2018-01-29 14:16:27','1',NULL),('f0863299-04bb-11e8-af8b-0242ac12','message-service','mail','2018-01-29 14:16:27','1',NULL),('f0878ba2-04bb-11e8-af8b-0242ac12','mortgage-service','mail','2018-01-29 14:16:27','1',NULL),('f0891220-04bb-11e8-af8b-0242ac12','mortgage-web','mail','2018-01-29 14:16:27','1',NULL),('f08aa0b2-04bb-11e8-af8b-0242ac12','new-rule-engine','mail','2018-01-29 14:16:27','1',NULL),('f08c3061-04bb-11e8-af8b-0242ac12','outer-service','mail','2018-01-29 14:16:27','1',NULL),('f08db2ee-04bb-11e8-af8b-0242ac12','outnet-web','mail','2018-01-29 14:16:27','1',NULL),('f08f2952-04bb-11e8-af8b-0242ac12','quartz-service','mail','2018-01-29 14:16:27','1',NULL),('f0907e09-04bb-11e8-af8b-0242ac12','risk-web','mail','2018-01-29 14:16:27','1',NULL),('f091cd53-04bb-11e8-af8b-0242ac12','rule-engine-web','mail','2018-01-29 14:16:27','1',NULL),('f0937136-04bb-11e8-af8b-0242ac12','start-stop','mail','2018-01-29 14:16:27','1',NULL),('f09a0cff-04bb-11e8-af8b-0242ac12','user-service','mail','2018-01-29 14:16:27','1',NULL),('f09bb8c6-04bb-11e8-af8b-0242ac12','user-web','mail','2018-01-29 14:16:27','1',NULL),('f09d372a-04bb-11e8-af8b-0242ac12','wechat-hunter','mail','2018-01-29 14:16:27','1',NULL);

/*Table structure for table `t_email_user` */

DROP TABLE IF EXISTS `t_email_user`;

CREATE TABLE `t_email_user` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `email` text COMMENT '邮箱',
  `status` varchar(2) DEFAULT NULL COMMENT '1 启用 2 废止',
  `tag` varchar(20) DEFAULT NULL COMMENT '标志',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_email_user` */

insert  into `t_email_user`(`id`,`user_name`,`email`,`status`,`tag`,`create_time`,`remark`) values ('1111111111',NULL,'huofh@zhongjiaxin.com','1','huofh-web','2018-02-02 16:07:21',NULL),('11111111zxzxxx','111','outer@zhongjiaxin.com','1','outer-web','2018-02-02 16:20:05',NULL),('11223334444','1','rd@zhongjiaxin.com','1','nginx_error','2018-02-02 15:55:49',NULL),('2222222','1','alarm_web@zhongjaxin.co','1','alarm-web','2018-02-02 16:27:18',NULL),('4b7f837f-0630-11e8-af8b-0242ac01','1','alert_user@zhongjiaxin.com','1','alarm-web','2018-02-02 16:27:18',NULL),('4b7f837f-0630-11e8-af8b-0242ac08',NULL,'alert_user@zhongjiaxin.com','1','huofh-web','2018-02-02 16:07:21',NULL),('4b7f837f-0630-11e8-af8b-0242ac09','111','alert_user@zhongjiaxin.com','1','outer-web','2018-02-02 16:20:05',NULL),('4b7f837f-0630-11e8-af8b-0242ac12','1111','wechat@zhongjiaxin.com','1','wechat-neiwei','2018-02-02 15:59:48',NULL),('4b7f837f-0630-11e8-af8b-0242ac14','1','alert_user@zhongjiaxin.com','1','nginx_error','2018-02-02 15:55:49',NULL),('4b7f837f-0630-11e8-af8b-0242ac15','1111','alert_user@zhongjiaxin.com','1','wechat-neiwei','2018-02-02 15:59:48',NULL),('4b7f873b-0630-11e8-af8b-0242ac12','1111','huofh@zhongjiaxin.com','1','phoenix','2018-02-02 16:05:56',NULL),('4b7f873b-0630-11e8-af8b-0242ac16','1111','alert_user@zhongjiaxin.com','1','phoenix','2018-02-02 16:05:56',NULL),('4b7f8797-0630-11e8-af8b-0242ac12','1111','wechat@zhongjiaxin.com','1','wechat-waiwei','2018-02-02 15:59:55',NULL),('4b7f8797-0630-11e8-af8b-0242ac17','1111','alert_user@zhongjiaxin.com','1','wechat-waiwei','2018-02-02 15:59:55',NULL),('4b7f87ce-0630-11e8-af8b-0242ac12','1111','pv_web@zhongjiaxin.com','1','pv-web','2018-02-02 16:02:27',NULL),('4b7f87ce-0630-11e8-af8b-0242ac18','1111','alert_user@zhongjiaxin.com','1','pv-web','2018-02-02 16:02:27',NULL),('4b7f87fb-0630-11e8-af8b-0242ac12',NULL,'basic@zhongjiaxin.com','1','asset-service','2018-02-02 15:57:46',NULL),('4b7f87fb-0630-11e8-af8b-0242ac19',NULL,'alert_user@zhongjiaxin.com','1','asset-service','2018-02-02 15:57:46',NULL),('4b7f8839-0630-11e8-af8b-0242ac12',NULL,'basic@zhongjiaxin.com','1','basic-service','2018-02-02 15:57:58',NULL),('4b7f8839-0630-11e8-af8b-0242ac21',NULL,'alert_user@zhongjiaxin.com','1','basic-service','2018-02-02 15:57:58',NULL),('4b7f8862-0630-11e8-af8b-0242ac12',NULL,'basic@zhongjiaxin.com','1','basic-web','2018-02-02 15:58:11',NULL),('4b7f8862-0630-11e8-af8b-0242ac23',NULL,'alert_user@zhongjiaxin.com','1','basic-web','2018-02-02 15:58:11',NULL),('4b7f8887-0630-11e8-af8b-0242ac12',NULL,'channel@zhongjiaxin.com','1','channel-inner-web','2018-02-02 15:58:15',NULL),('4b7f8887-0630-11e8-af8b-0242ac24',NULL,'alert_user@zhongjiaxin.com','1','channel-inner-web','2018-02-02 15:58:15',NULL),('4b7f88fe-0630-11e8-af8b-0242ac12',NULL,'channel@zhongjiaxin.com','1','channel-out-web','2018-02-02 15:58:37',NULL),('4b7f88fe-0630-11e8-af8b-0242ac25',NULL,'alert_user@zhongjiaxin.com','1','channel-out-web','2018-02-02 15:58:37',NULL),('4b7f8931-0630-11e8-af8b-0242ac12',NULL,'basic@zhongjiaxin.com','1','check_service','2018-02-02 15:58:52',NULL),('4b7f8931-0630-11e8-af8b-0242ac26',NULL,'alert_user@zhongjiaxin.com','1','check_service','2018-02-02 15:58:52',NULL),('4b7f8961-0630-11e8-af8b-0242ac12',NULL,'platform@zhongjiaxin.com','1','common-platform-web','2018-02-02 15:59:04',NULL),('4b7f8961-0630-11e8-af8b-0242ac27',NULL,'alert_user@zhongjiaxin.com','1','common-platform-web','2018-02-02 15:59:04',NULL),('4b7f8989-0630-11e8-af8b-0242ac12',NULL,'contract@zhongjiaxin.com','1','contract-service','2018-02-02 15:59:30',NULL),('4b7f8989-0630-11e8-af8b-0242ac28',NULL,'alert_user@zhongjiaxin.com','1','contract-service','2018-02-02 15:59:30',NULL),('4b7f89b0-0630-11e8-af8b-0242ac12',NULL,'wechat@zhongjiaxin.com','1','hunter-back-web','2018-02-02 15:59:38',NULL),('4b7f89b0-0630-11e8-af8b-0242ac29',NULL,'alert_user@zhongjiaxin.com','1','hunter-back-web','2018-02-02 15:59:38',NULL),('4b7f8a01-0630-11e8-af8b-0242ac12',NULL,'lms_web@zhongjiaxin.com','1','lms-web','2018-02-02 16:02:44',NULL),('4b7f8a01-0630-11e8-af8b-0242ac30',NULL,'alert_user@zhongjiaxin.com','1','lms-web','2018-02-02 16:02:44',NULL),('4b7f8a27-0630-11e8-af8b-0242ac12',NULL,'rd@zhongjiaxin.com','1','message-service','2018-02-02 16:07:38',NULL),('4b7f8a27-0630-11e8-af8b-0242ac31',NULL,'alert_user@zhongjiaxin.com','1','message-service','2018-02-02 16:07:38',NULL),('4b7f8a4b-0630-11e8-af8b-0242ac12',NULL,'mortgage@zhongjiaxin.com','1','mortgage-service','2018-02-02 16:02:47',NULL),('4b7f8a4b-0630-11e8-af8b-0242ac31',NULL,'alert_user@zhongjiaxin.com','1','mortgage-service','2018-02-02 16:02:47',NULL),('4b7f8a70-0630-11e8-af8b-0242ac12',NULL,'mortgage@zhongjiaxin.com','1','mortgage-web','2018-02-02 16:03:18',NULL),('4b7f8a70-0630-11e8-af8b-0242ac33',NULL,'alert_user@zhongjiaxin.com','1','mortgage-web','2018-02-02 16:03:18',NULL),('4b7f8a92-0630-11e8-af8b-0242ac12',NULL,'rule@zhongjiaxin.com','1','new-rule-engine','2018-02-02 16:01:41',NULL),('4b7f8a92-0630-11e8-af8b-0242ac34',NULL,'alert_user@zhongjiaxin.com','1','new-rule-engine','2018-02-02 16:01:41',NULL),('4b7f8ab9-0630-11e8-af8b-0242ac12',NULL,'outer@zhongjiaxin.com','1','outer-service','2018-02-02 16:03:22',NULL),('4b7f8ab9-0630-11e8-af8b-0242ac35',NULL,'alert_user@zhongjiaxin.com','1','outer-service','2018-02-02 16:03:22',NULL),('4b7f8adb-0630-11e8-af8b-0242ac12',NULL,'outer@zhongjiaxin.com','1','outnet-web','2018-02-02 16:05:15',NULL),('4b7f8adb-0630-11e8-af8b-0242ac36',NULL,'alert_user@zhongjiaxin.com','1','outnet-web','2018-02-02 16:05:15',NULL),('4b7f8aff-0630-11e8-af8b-0242ac12',NULL,'quartz@zhongjiaxin.com','1','quartz-service','2018-02-02 16:02:04',NULL),('4b7f8aff-0630-11e8-af8b-0242ac37',NULL,'alert_user@zhongjiaxin.com','1','quartz-service','2018-02-02 16:02:04',NULL),('4b7f8b28-0630-11e8-af8b-0242ac12',NULL,'risk_web@zhongjiaxin.com','1','risk-web','2018-02-02 16:01:51',NULL),('4b7f8b28-0630-11e8-af8b-0242ac38',NULL,'alert_user@zhongjiaxin.com','1','risk-web','2018-02-02 16:01:51',NULL),('4b7f8b4b-0630-11e8-af8b-0242ac12',NULL,'rule@zhongjiaxin.com','1','rule-engine-web','2018-02-02 16:01:08',NULL),('4b7f8b4b-0630-11e8-af8b-0242ac39',NULL,'alert_user@zhongjiaxin.com','1','rule-engine-web','2018-02-02 16:01:08',NULL),('4b7f8b6d-0630-11e8-af8b-0242ac12',NULL,'','1','start-stop','2018-02-02 15:54:28',NULL),('4b7f8b91-0630-11e8-af8b-0242ac12',NULL,'user@zhongjiaxin.com','1','user-service','2018-02-02 16:01:02',NULL),('4b7f8b91-0630-11e8-af8b-0242ac40',NULL,'alert_user@zhongjiaxin.com','1','user-service','2018-02-02 16:01:02',NULL),('4b7f8bb5-0630-11e8-af8b-0242ac11',NULL,'alert_user@zhongjiaxin.com','1','user-web','2018-02-02 16:00:44',NULL),('4b7f8bb5-0630-11e8-af8b-0242ac12',NULL,'user@zhongjiaxin.com','1','user-web','2018-02-02 16:00:44',NULL),('4b7f8bd6-0630-11e8-af8b-0242ac12',NULL,'wechat@zhongjiaxin.com','1','wechat-hunter','2018-02-02 15:59:45',NULL),('4b7f8bd6-0630-11e8-af8b-0242ac13',NULL,'alert_user@zhongjiaxin.com','1','wechat-hunter','2018-02-02 15:59:45',NULL);

/*Table structure for table `t_rule` */

DROP TABLE IF EXISTS `t_rule`;

CREATE TABLE `t_rule` (
  `id` varchar(32) NOT NULL,
  `tag` varchar(50) DEFAULT NULL COMMENT '业务线',
  `rule` varchar(100) DEFAULT NULL COMMENT '匹配规则',
  `status` varchar(2) DEFAULT NULL COMMENT '0 有效 1 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_rule` */

/*Table structure for table `t_wx_tag` */

DROP TABLE IF EXISTS `t_wx_tag`;

CREATE TABLE `t_wx_tag` (
  `id` varchar(32) NOT NULL,
  `tag` varchar(50) DEFAULT NULL COMMENT '业务线',
  `tag_id` varchar(255) DEFAULT NULL COMMENT '企业微信标签id,多组标签以|分割',
  `status` varchar(2) DEFAULT NULL COMMENT '0有效 1 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_wx_tag` */

insert  into `t_wx_tag`(`id`,`tag`,`tag_id`,`status`) values ('11111','nginx_error','1','1'),('f0717701-04bb-11e8-af8b-0242ac11','pv-web','1','1'),('f0717701-04bb-11e8-af8b-0242ac12','pv-web','21','1'),('f0717702-04bb-11e8-af8b-0242ac12','alarm-web','2','1'),('f0717702-04bb-11e8-af8b-0242ac13','alarm-web','1','1'),('f0717703-04bb-11e8-af8b-0242ac12','phoenix','12','1'),('f0717703-04bb-11e8-af8b-0242ac14','phoenix','1','1'),('f0717704-04bb-11e8-af8b-0242ac12','wechat-waiwei','30','1'),('f0717704-04bb-11e8-af8b-0242ac15','wechat-waiwei','1','1'),('f0717705-04bb-11e8-af8b-0242ac12','wechat-neiwei','29','1'),('f0717705-04bb-11e8-af8b-0242ac16','wechat-neiwei','1','1'),('f0717706-04bb-11e8-af8b-0242ac12','asset-service','3','1'),('f0717706-04bb-11e8-af8b-0242ac17','asset-service','1','1'),('f07303ec-04bb-11e8-af8b-0242ac12','basic-service','4','1'),('f07303ec-04bb-11e8-af8b-0242ac18','basic-service','1','1'),('f0748f67-04bb-11e8-af8b-0242ac12','basic-web','5','1'),('f0748f67-04bb-11e8-af8b-0242ac19','basic-web','1','1'),('f075eed7-04bb-11e8-af8b-0242ac12','channel-inner-web','6','1'),('f075eed7-04bb-11e8-af8b-0242ac20','channel-inner-web','1','1'),('f077660b-04bb-11e8-af8b-0242ac12','channel-out-web','7','1'),('f077660b-04bb-11e8-af8b-0242ac21','channel-out-web','1','1'),('f079143a-04bb-11e8-af8b-0242ac12','check_service','8','1'),('f079143a-04bb-11e8-af8b-0242ac22','check_service','1','1'),('f07a7b4b-04bb-11e8-af8b-0242ac12','common-platform-web','9','1'),('f07a7b4b-04bb-11e8-af8b-0242ac23','common-platform-web','1','1'),('f07bda3c-04bb-11e8-af8b-0242ac12','contract-service','10','1'),('f07bda3c-04bb-11e8-af8b-0242ac24','contract-service','1','1'),('f07d92ea-04bb-11e8-af8b-0242ac12','hunter-back-web','1','1'),('f07d92ea-04bb-11e8-af8b-0242ac25','hunter-back-web','1','1'),('f0833eb3-04bb-11e8-af8b-0242ac12','huofh-web','12','1'),('f0833eb3-04bb-11e8-af8b-0242ac26','huofh-web','1','1'),('f084bfc7-04bb-11e8-af8b-0242ac12','lms-web','13','1'),('f084bfc7-04bb-11e8-af8b-0242ac27','lms-web','1','1'),('f0878ba2-04bb-11e8-af8b-0242ac12','mortgage-service','14','1'),('f0878ba2-04bb-11e8-af8b-0242ac28','mortgage-service','1','1'),('f0891220-04bb-11e8-af8b-0242ac12','mortgage-web','15','1'),('f0891220-04bb-11e8-af8b-0242ac29','mortgage-web','1','1'),('f08aa0b2-04bb-11e8-af8b-0242ac12','new-rule-engine','16','1'),('f08aa0b2-04bb-11e8-af8b-0242ac30','new-rule-engine','1','1'),('f08c3061-04bb-11e8-af8b-0242ac12','outer-service','17','1'),('f08c3061-04bb-11e8-af8b-0242ac31','outer-service','1','1'),('f08db2ee-04bb-11e8-af8b-0242ac12','outnet-web','19','1'),('f08db2ee-04bb-11e8-af8b-0242ac32','outnet-web','1','1'),('f08f2952-04bb-11e8-af8b-0242ac12','quartz-service','22','1'),('f08f2952-04bb-11e8-af8b-0242ac33','quartz-service','1','1'),('f0907e09-04bb-11e8-af8b-0242ac12','risk-web','23','1'),('f0907e09-04bb-11e8-af8b-0242ac34','risk-web','1','1'),('f091cd53-04bb-11e8-af8b-0242ac12','rule-engine-web','24','1'),('f091cd53-04bb-11e8-af8b-0242ac35','rule-engine-web','1','1'),('f0937136-04bb-11e8-af8b-0242ac12','start-stop','1','1'),('f09a0cff-04bb-11e8-af8b-0242ac12','user-service','26','1'),('f09a0cff-04bb-11e8-af8b-0242ac36','user-service','1','1'),('f09bb8c6-04bb-11e8-af8b-0242ac12','user-web','27','1'),('f09bb8c6-04bb-11e8-af8b-0242ac37','user-web','1','1'),('f09d372a-04bb-11e8-af8b-0242ac12','wechat-hunter','28','1'),('f09d372a-04bb-11e8-af8b-0242ac38','wechat-hunter','1','1'),('f09d372v-04bb-11e8-af8b-0242ac12','outer-web','18','1'),('f09d372v-04bb-11e8-af8b-0242ac39','outer-web','1','1'),('f09d372v-04bb-11e8-af8b-0242ac40','message-service','1','1'),('ssddddd','message-service',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
