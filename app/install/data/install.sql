/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : oneblog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-04 11:08:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_action_log
-- ----------------------------
DROP TABLE IF EXISTS `blog_action_log`;
CREATE TABLE `blog_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行会员id',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT '执行行为者ip',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '行为名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '执行的URL',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1487 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of blog_action_log
-- ----------------------------


-- ----------------------------
-- Table structure for blog_addon
-- ----------------------------
DROP TABLE IF EXISTS `blog_addon`;
CREATE TABLE `blog_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '插件描述',
  `config` text NOT NULL COMMENT '配置',
  `author` varchar(40) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of blog_addon
-- ----------------------------
INSERT INTO `blog_addon` VALUES ('3', 'File', '文件上传', '文件上传插件', '', 'Jack', '1.0', '1', '0', '0');
INSERT INTO `blog_addon` VALUES ('4', 'Icon', '图标选择', '图标选择插件', '', 'Bigotry', '1.0', '1', '0', '0');
INSERT INTO `blog_addon` VALUES ('5', 'Editor', '文本编辑器', '富文本编辑器', '', 'Bigotry', '1.0', '1', '0', '0');

-- ----------------------------
-- Table structure for blog_api
-- ----------------------------
DROP TABLE IF EXISTS `blog_api`;
CREATE TABLE `blog_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL DEFAULT '' COMMENT '接口名称',
  `group_id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '接口分组',
  `request_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '请求类型 0:POST  1:GET',
  `api_url` char(50) NOT NULL DEFAULT '' COMMENT '请求路径',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '接口描述',
  `describe_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接口富文本描述',
  `is_request_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要请求数据',
  `request_data` text NOT NULL COMMENT '请求数据',
  `response_data` text NOT NULL COMMENT '响应数据',
  `is_response_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要响应数据',
  `is_user_token` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要用户token',
  `is_response_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否返回数据签名',
  `is_request_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证请求数据签名',
  `response_examples` text NOT NULL COMMENT '响应栗子',
  `developer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '研发者',
  `api_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口状态（0:待研发，1:研发中，2:测试中，3:已完成）',
  `is_page` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为分页接口 0：否  1：是',
  `sort` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COMMENT='API表';

-- ----------------------------
-- Records of blog_api
-- ----------------------------
INSERT INTO `blog_api` VALUES ('186', '登录或注册', '34', '0', 'common/login', '系统登录注册接口，若用户名存在则验证密码正确性，若用户名不存在则注册新用户，返回 user_token 用于操作需验证身份的接口', '', '1', '[{\"field_name\":\"username\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u7528\\u6237\\u540d\"},{\"field_name\":\"password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u5bc6\\u7801\"}]', '[{\"field_name\":\"data\",\"data_type\":\"2\",\"field_describe\":\"\\u4f1a\\u5458\\u6570\\u636e\\u53causer_token\"}]', '1', '0', '1', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;member_id&quot;: 51,\r\n        &quot;nickname&quot;: &quot;sadasdas&quot;,\r\n        &quot;username&quot;: &quot;sadasdas&quot;,\r\n        &quot;create_time&quot;: &quot;2017-09-09 13:40:17&quot;,\r\n        &quot;user_token&quot;: &quot;eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmVCYXNlIEpXVCIsImlhdCI6MTUwNDkzNTYxNywiZXhwIjoxNTA0OTM2NjE3LCJhdWQiOiJPbmVCYXNlIiwic3ViIjoiT25lQmFzZSIsImRhdGEiOnsibWVtYmVyX2lkIjo1MSwibmlja25hbWUiOiJzYWRhc2RhcyIsInVzZXJuYW1lIjoic2FkYXNkYXMiLCJjcmVhdGVfdGltZSI6IjIwMTctMDktMDkgMTM6NDA6MTcifX0.6PEShODuifNsa-x1TumLoEaR2TCXpUEYgjpD3Mz3GRM&quot;\r\n    }\r\n}', '0', '1', '0', '0', '1', '1504501410', '1520504982');
INSERT INTO `blog_api` VALUES ('187', '文章分类列表', '44', '0', 'article/categorylist', '文章分类列表接口', '', '0', '', '[{\"field_name\":\"id\",\"data_type\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\"},{\"field_name\":\"name\",\"data_type\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u540d\\u79f0\"}]', '1', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: [\r\n        {\r\n            &quot;id&quot;: 2,\r\n            &quot;name&quot;: &quot;测试文章分类2&quot;\r\n        },\r\n        {\r\n            &quot;id&quot;: 1,\r\n            &quot;name&quot;: &quot;测试文章分类1&quot;\r\n        }\r\n    ]\r\n}', '0', '0', '0', '2', '1', '1504765581', '1520504982');
INSERT INTO `blog_api` VALUES ('188', '文章列表', '44', '0', 'article/articlelist', '文章列表接口', '', '1', '[{\"field_name\":\"category_id\",\"data_type\":\"0\",\"is_require\":\"0\",\"field_describe\":\"\\u82e5\\u4e0d\\u4f20\\u9012\\u6b64\\u53c2\\u6570\\u5219\\u4e3a\\u6240\\u6709\\u5206\\u7c7b\"}]', '', '0', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;total&quot;: 9,\r\n        &quot;per_page&quot;: &quot;10&quot;,\r\n        &quot;current_page&quot;: 1,\r\n        &quot;last_page&quot;: 1,\r\n        &quot;data&quot;: [\r\n            {\r\n                &quot;id&quot;: 16,\r\n                &quot;name&quot;: &quot;11111111&quot;,\r\n                &quot;category_id&quot;: 2,\r\n                &quot;describe&quot;: &quot;22222222&quot;,\r\n                &quot;create_time&quot;: &quot;2017-08-07 13:58:37&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 15,\r\n                &quot;name&quot;: &quot;tttttt&quot;,\r\n                &quot;category_id&quot;: 1,\r\n                &quot;describe&quot;: &quot;sddd&quot;,\r\n                &quot;create_time&quot;: &quot;2017-08-07 13:24:46&quot;\r\n            }\r\n        ]\r\n    }\r\n}', '0', '0', '1', '1', '1', '1504779780', '1520504982');
INSERT INTO `blog_api` VALUES ('189', '首页接口', '45', '0', 'combination/index', '首页聚合接口', '', '1', '[{\"field_name\":\"category_id\",\"data_type\":\"0\",\"is_require\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\"}]', '[{\"field_name\":\"article_category_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u6570\\u636e\"},{\"field_name\":\"article_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u6570\\u636e\"}]', '1', '0', '1', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;article_category_list&quot;: [\r\n            {\r\n                &quot;id&quot;: 2,\r\n                &quot;name&quot;: &quot;测试文章分类2&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 1,\r\n                &quot;name&quot;: &quot;测试文章分类1&quot;\r\n            }\r\n        ],\r\n        &quot;article_list&quot;: {\r\n            &quot;total&quot;: 8,\r\n            &quot;per_page&quot;: &quot;2&quot;,\r\n            &quot;current_page&quot;: &quot;1&quot;,\r\n            &quot;last_page&quot;: 4,\r\n            &quot;data&quot;: [\r\n                {\r\n                    &quot;id&quot;: 15,\r\n                    &quot;name&quot;: &quot;tttttt&quot;,\r\n                    &quot;category_id&quot;: 1,\r\n                    &quot;describe&quot;: &quot;sddd&quot;,\r\n                    &quot;create_time&quot;: &quot;2017-08-07 13:24:46&quot;\r\n                },\r\n                {\r\n                    &quot;id&quot;: 14,\r\n                    &quot;name&quot;: &quot;1111111111111111111&quot;,\r\n                    &quot;category_id&quot;: 1,\r\n                    &quot;describe&quot;: &quot;123123&quot;,\r\n                    &quot;create_time&quot;: &quot;2017-08-04 15:37:20&quot;\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '0', '0', '1', '0', '1', '1504785072', '1520504982');
INSERT INTO `blog_api` VALUES ('190', '详情页接口', '45', '0', 'combination/details', '详情页接口', '', '1', '[{\"field_name\":\"article_id\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u6587\\u7ae0ID\"}]', '[{\"field_name\":\"article_category_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u6570\\u636e\"},{\"field_name\":\"article_details\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u8be6\\u60c5\\u6570\\u636e\"}]', '1', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;article_category_list&quot;: [\r\n            {\r\n                &quot;id&quot;: 2,\r\n                &quot;name&quot;: &quot;测试文章分类2&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 1,\r\n                &quot;name&quot;: &quot;测试文章分类1&quot;\r\n            }\r\n        ],\r\n        &quot;article_details&quot;: {\r\n            &quot;id&quot;: 1,\r\n            &quot;name&quot;: &quot;213&quot;,\r\n            &quot;category_id&quot;: 1,\r\n            &quot;describe&quot;: &quot;test001&quot;,\r\n            &quot;content&quot;: &quot;第三方发送到&quot;&quot;&quot;,\r\n            &quot;create_time&quot;: &quot;2014-07-22 11:56:53&quot;\r\n        }\r\n    }\r\n}', '0', '0', '0', '0', '1', '1504922092', '1520504982');
INSERT INTO `blog_api` VALUES ('191', '修改密码', '34', '0', 'common/changepassword', '修改密码接口', '', '1', '[{\"field_name\":\"old_password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u65e7\\u5bc6\\u7801\"},{\"field_name\":\"new_password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u65b0\\u5bc6\\u7801\"}]', '', '0', '1', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;exe_time&quot;: &quot;0.037002&quot;\r\n}', '0', '0', '0', '0', '1', '1504941496', '1520504982');

-- ----------------------------
-- Table structure for blog_api_group
-- ----------------------------
DROP TABLE IF EXISTS `blog_api_group`;
CREATE TABLE `blog_api_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(120) NOT NULL DEFAULT '' COMMENT 'aip分组名称',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='api分组表';

-- ----------------------------
-- Records of blog_api_group
-- ----------------------------
INSERT INTO `blog_api_group` VALUES ('34', '基础接口', '0', '1504501195', '0', '1');
INSERT INTO `blog_api_group` VALUES ('44', '文章接口', '1', '1504765319', '1504765319', '1');
INSERT INTO `blog_api_group` VALUES ('45', '聚合接口', '0', '1504784149', '1504784149', '1');

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '文章名称',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '文章内容',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面图片id',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件id',
  `img_ids` varchar(200) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `sort` int(5) NOT NULL DEFAULT '0',
  `is_top` tinyint(1) NOT NULL DEFAULT '0',
  `top_time` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `editor_type` tinyint(1) NOT NULL DEFAULT '0',
  `content_md` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('23', '1', '序言', '7', 'OneBase 是什么？', '&lt;h3 class=&quot;line&quot;&gt;\r\n	ThinkPHP -&amp;gt; OneBase -&amp;gt; 产品\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	OneBase是一个免费开源的，快速、简单的面向对象的应用研发架构，是为了快速研发应用而诞生的。在保持出色的性能和新颖设计思想同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用OneBase，允许把您基于OneBase研发的应用开源或商业产品发布/销售。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	主要特性\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;规范&lt;/strong&gt;： OneBase 提供一套编码规范，可使团队研发协作事半功倍。&lt;br /&gt;\r\n&lt;strong&gt;严谨&lt;/strong&gt;： 异常严谨的错误检测和安全机制，详细的日志信息，为您的研发保驾护航。&lt;br /&gt;\r\n&lt;strong&gt;灵活&lt;/strong&gt;： 分层，服务，插件等合理的解耦合设计使您升级框架或需求变更得心应手。&lt;br /&gt;\r\n&lt;strong&gt;接口&lt;/strong&gt;： 完善的接口研发架构，使您只需关注业务逻辑研发，省心省力。&lt;br /&gt;\r\n&lt;strong&gt;高效&lt;/strong&gt;： 自动缓存设计，抛弃了处处判断的尴尬，使您不知不觉中已经使用了缓存。&lt;br /&gt;\r\n&lt;strong&gt;特色&lt;/strong&gt;： 无限级权限控制，垃圾资源回收，系统通用回收站，SEO变量支持，性能与操作监控，等各种脑洞大开的设计思想。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	捐赠我们\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	OneBase致力于简化企业和个人应用研发，您的帮助是对我们最大的支持和动力！\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase团队一直在坚持不懈地努力，并坚持开源和免费提供使用，帮助开发人员更加方便的进行应用快速研发，如果您对我们的成果表示认同并且觉得对您有所帮助我们愿意接受来自各方面的捐赠^_^。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	************ &lt;strong&gt;微信捐赠&lt;/strong&gt; ************************* &lt;strong&gt;支付宝捐赠&lt;/strong&gt; ************\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/6640ec28b9701a85b8a970e53b870da3_265x265.png&quot; alt=&quot;&quot; /&gt;&lt;img src=&quot;https://box.kancloud.cn/b63395ec098a6e3c823825167bd6ffd7_265x265.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n************************* &lt;strong&gt;QQ交流群：477824874&lt;/strong&gt; *********************\r\n&lt;/p&gt;', '0', '0', '', '1509620805', '1509762405', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('24', '1', '安装OneBase', '7', 'OneBase安装环境要求', '&lt;h1 class=&quot;line&quot;&gt;\r\n	OneBase安装环境要求\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;pre&gt;PHP &amp;gt;= &lt;span class=&quot;hljs-number&quot;&gt;7.0&lt;/span&gt;&lt;span class=&quot;hljs-number&quot;&gt;.0&lt;/span&gt; PDO PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; MBstring PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; CURL PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; &lt;/pre&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	开始安装\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;下载源码&lt;/strong&gt;：&lt;a href=&quot;https://gitee.com/Bigotry/OneBase&quot;&gt;https://gitee.com/Bigotry/OneBase&lt;/a&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1.下载源码后解压至Web目录。&lt;br /&gt;\r\n2.配置虚拟主机指向源码public目录。&lt;br /&gt;\r\n3.一切就绪后访问域名会看到引导安装界面。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	若安装流程正常执行完毕会跳转至系统首页，此时OneBase已经安装完成啦 ^_^\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;常见安装问题：&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;1. No input file specified&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;解决办法 （.htaccess 文件 RewriteRule 改成这句 ^(.*)$ index.php [L,E=PATH_INFO:$1]）&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;2. 某些Nginx版本下出现，控制器不存在问题，参考以下配置文件&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/picture/20171206/a770f61efb2ce03d85bb4bff7a8c70d7.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	演示系统配置文件参考 &lt;a href=&quot;https://www.kancloud.cn/onebase/onebase/441504&quot;&gt;https://www.kancloud.cn/onebase/onebase/441504&lt;/a&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span id=&quot;__kindeditor_bookmark_start_0__&quot;&gt;&lt;/span&gt; \r\n&lt;/p&gt;', '0', '0', '', '1509762474', '1512538659', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('25', '1', '研发规范', '7', '团队研发事半功倍', '&lt;h1 class=&quot;line&quot;&gt;\r\n	研发规范\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	目录和文件命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		目录命令使用小写加下划线。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类库、函数文件统一以.php为后缀。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类文件采用驼峰法命名（首字母大写），其它文件采用小写加下划线命名。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	函数和类、属性命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		类的命名采用驼峰法（首字母大写），例如 User。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		函数的命名使用小写字母和下划线（小写字母开头）的方式，例如 get_client_ip。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		方法的命名使用驼峰法（首字母小写），例如 getUserName。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		属性的命名使用驼峰法（首字母小写），例如 tableName、instance。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	常量和配置命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		常量以大写字母和下划线命名，例如 APP_PATH。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		配置参数以小写字母和下划线命名，例如 url_route_on。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据表和字段命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		数据表和字段采用小写加下划线方式命名，并注意字段名不要以下划线开头，例如 think_user 表和 user_name字段，不建议使用驼峰和中文作为数据表字段命名。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	编码建议\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		每个类（不含注释）代码应在200行以内，每个方法（不含注释）代码应在20行以内。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		控制器层（controller）中，尽量不出现 if else switch 等流程分支语句。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		业务逻辑尽量封装在逻辑层（logic）中，供控制器调用。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		数据模型层（model）尽量在逻辑层 logic 中使用，尽量不要再控制器中直接使用model。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		数据验证尽量写在验证层（validate）中，供逻辑层调用，尽量不要在控制器中进行数据验证。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		支付|短信 等尽量封装为服务便于后续扩展，图标选择|省市县联动 等尽量封装为插件便于后续复用。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		API接口尽量根据APP界面实现组合接口，减少APP接口请求。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		其他文档中遗漏项，尽量参考OneBase编码与命名。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;', '0', '0', '', '1509762507', '1509763729', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('26', '1', '目录结构', '7', 'OneBase目录结构', '&lt;img src=&quot;/upload/picture/20171206/e49c32fb18c336cf8706e81c704e6774.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;', '0', '0', '', '1509762529', '1512538717', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('27', '1', '首页介绍', '8', '后台登录与首页介绍', '&lt;h3 class=&quot;line&quot;&gt;\r\n	后台首页\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	安装完成以后输入 &lt;a href=&quot;http://xn--eqrt2g04jtsx/admin.php&quot;&gt;http://您的域名/admin.php&lt;/a&gt; 即可进入后台页面，若没有登录则会跳转登录页面。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/fcea4ef525c3d80d03acf8c94e4149f8_1920x1000.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	登录完成后即可进入后台首页\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/8f67981df66d26204af877e920d7e15a_1920x1002.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台分四个区域 顶部，左侧，内容，底部。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;顶部&lt;/strong&gt;：左侧为产品名称，旁边小图标可控制左侧是否展开，顶部右侧齿轮按钮可设置后台皮肤与布局，点击昵称区域可显示上次登录时间，时间下方左侧为 清空系统缓存按钮，右侧为退出系统按钮。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;左侧&lt;/strong&gt;：左侧为系统的菜单区域，左侧菜单为无限级菜单，后台的菜单管理中可控制左侧菜单与上面的图标和链接。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;内容&lt;/strong&gt;：内容区域分左右布局，左侧为系统信息，显示了系统的版本与依赖框架的版本包括运行环境，右侧为产品信息，值得注意的是右侧下方两项，缓存量与命中率只有后台开启自动缓存的情况下才会统计，缓存量是自动缓存的key数量，命中率为\r\n 查询次数与读取缓存次数计算出来的，比如  查询了 2次，第一次查询了数据库，第二次直接从缓存中读取，那么命中率为50%。&lt;br /&gt;\r\n系统信息与产品信息上方左侧为当前操作的标题信息，默认读取菜单名称，也可以控制器中使用 setTitle 方法设置，右侧为面包屑，可标识当前页面的位置结构。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;底部&lt;/strong&gt;：底部分左右布局，左侧为OneBase的版权信息，右侧为版本号，浮动在右下角的是TP5的调试信息，可在配置文件中关闭，研发阶段建议开启。\r\n&lt;/p&gt;', '0', '0', '', '1509792865', '1509792865', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('28', '1', '会员管理', '8', '会员管理及无限级权限介绍', '&lt;h1 class=&quot;line&quot;&gt;\r\n	会员管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	会员列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/98ae6e56979ef99082e34b3855c2d2b8_1920x1005.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase的会员列表是带继承关系的，超级管理员查看可看到所有的会员数据，上方有两个按钮，新增与导出，导出功能为演示系统导出功能的用法，数据列表中的操作按钮有授权与删除，授权可设置会员所在权限组，删除为软删除，需要彻底删除后面介绍回收站时会讲解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：新增会员时表单中有一项 &ldquo;是否共享会员&rdquo;， 若选择共享会员自己的会员则会继承给添加的会员，添加的会员就可以在会员列表中查看到自己的会员数据，若不共享则添加的会员就没有权限查看自己的会员数据。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	权限管理\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ab02d0de03680b08ff9bf439608836e1_1903x945.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	权限管理点开默认为权限组列表页，可新增，删除，编辑 权限组信息。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：每个会员的权限组都是独立的，菜单授权功能也是带继承关系的，超级管理员拥有所有添加在菜单中的节点权限，比如：超级管理员添加\r\n 权限组 A， 并设置权限组A的菜单权限为 a1 a2 a3 a4 a5，然后添加一个会员 张三，将张三授权到权限组 A \r\n中，张三登录进来后，点击权限管理 是看不到 超级管理员的权限组信息的，张三此时可添加自己的权限组 B，然后给 B权限组设置 菜单权限，此时 \r\n张三可设置的菜单节点为 A 组 的最大权限 a1 a2 a3 a4 a5，那么 张三给B组的菜单权限设置为 a1 a2 a3权限， \r\n并添加李四进B组，李四 添加自己的权限组，可分配的最大权限即为 a1 a2 a3，OneBase的权限是可以这样无限的继承分配下去 ^_^。\r\n&lt;/p&gt;', '0', '0', '', '1509792935', '1509792935', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('29', '1', '系统设置与配置管理', '8', '设置系统中需要使用的信息，在系统中通过 config 函数取值使用', '&lt;h1 class=&quot;line&quot; style=&quot;font-size:2.25em;font-family:&amp;quot;font-weight:200;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置与配置管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot; style=&quot;font-family:&amp;quot;font-weight:200;font-size:1.5em;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置\r\n&lt;/h3&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/1bf57e33aa50f1a5ced8cb49638a20fa_1920x947.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置是设置系统中需要使用的字符串，数组，文本 等信息，在系统中通过 config 函数取值使用。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	OneBase 默认支持 数字，字符，文本，枚举，数组 5种配置类型，如有需要可自行扩展，后续手册中也会演示扩展配置类型的教程。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置值之前需要先添加系统配置，下面看下如何添加系统配置。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot; style=&quot;font-family:&amp;quot;font-weight:200;font-size:1.5em;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	配置列表与配置新增\r\n&lt;/h3&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/f993980d47992aee3b1bb7aafa079243_1917x945.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/2aa1a9ed50c0b7c1dbe093adaceb09a2_1918x943.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：系统设置与配置列表 上面的 基础，数据，系统，API 四项 也属于系统配置，在配置列表中是可以找到的，若需要添加新的配置分组可直接在系统设置中进行设置。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	下面咱们演示添加一个枚举与一个字符配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加一个客服电话字符配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/c6a21953d9548a2e588c25e02736454d_1920x730.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加一个语言枚举配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/92d4f8fbeb0dadd88ddc5cbb325210f7_1919x811.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加了两个配置后，咱们来看一下系统设置。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/461df4a992ddd491056d49afc03a0fce_1917x820.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	发现多出了 两个设置选项，显示顺序可在添加配置时根据排序值控制，这里不再叙述。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	客服电话 是字符类型的配置，所以设置时 可以直接输入字符串值。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	枚举类型是单选择框只能选择一个值，因为咱们添加时配置值默认输入的是0，所以此时默认的是 PHP，默认选择值也就是 配置项 中 冒号 : 之前的内容，注意冒号是英文冒号，前后值不要包含空格，一个选项独占一行。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	下面咱们看看 在程序中如何使用\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/e6c3550fc71329855a9f53f3165c78fc_722x599.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	在代码中咱们通过 config函数获取了 刚才的配置标识对应的值，下面看下输出结果。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b28fb82d6ec4f7cf59e5c13754431310_692x111.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	输出了 刚才配置的客服电话 与 语言选项，若咱们在设置中将 客服电话修改为 18521353332 将 语言选项设置为 C#，那么 输出结果将变成 18521353332 与 2 。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	^_^。 理解了吧，是不是很简单。 至于OneBase默认自带的配置 后续章节会介绍蛤~\r\n&lt;/p&gt;', '0', '0', '', '1509966353', '1509966399', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('30', '1', '菜单管理', '8', 'OneBase 后台菜单是无限级的，意味着您的后台菜单可以无限制的往下层添加', '&lt;h1 class=&quot;line&quot;&gt;\r\n	菜单管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	菜单列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/cae5ec29ba13bd71a1db0aaab597481c_1919x942.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 后台菜单是无限级的，意味着您的后台菜单可以无限制的往下层添加。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台查看下级菜单可点击菜单名称或右侧子菜单按钮，此处使用的是递归遍历，所以点进去后模板与外层模板是一样的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	初学者添加后台菜单建议参考OneBase现有的菜单数据添加。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	菜单添加\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/8e68f8eec7b630965f564095edf30820_1905x666.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	菜单名称是用于后台显示的和用户识别的，排序值是控制菜单后台显示顺序的（同级有效），链接是指点击菜单后跳转的页面语法（控制器/方法），上级菜单是指当前添加菜单属于某个菜单下级，是否隐藏是控制是否出现在后台菜单中的（隐藏菜单也会进行权限验证），图标是后台菜单名称前面的小图标，此处小图标选择已经封装成了插件需要使用小图标选择时参考菜单添加与编辑这里，小图标库也可以进行扩展（参考\r\n font-awesome）。\r\n&lt;/p&gt;', '0', '0', '', '1510137834', '1510137842', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('31', '1', '系统回收站', '8', 'OneBase 的回收站不是其他产品那种 某个表（如：订单或文章）的回收站喔，而是整个系统所有数据的回收站喔~', '&lt;h1 class=&quot;line&quot;&gt;\r\n	系统回收站\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	回收站\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/1025ac572b017963b83ad26b9c6cb517_1914x699.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 的回收站不是其他产品那种 某个表（如：订单或文章）的回收站喔，而是整个系统所有数据的回收站喔~\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	下面咱们介绍一下回收站列表页面，上图中 第一列是 数据模型名称，第二列是 数据模型路径，第三列是指 此模型下面被删除数据的数量，第四列是操作列，点击数据可查看此模型被删除的数据。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	小伙伴们看到这里有列表 但是没有新增是不是很好奇数据从哪里来的丫 ^_^。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/058e92152bfb5296e58bf16c663fdb96_1918x783.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	就是这里。。系统设置里面的系统分组中有个回收站配置，key为模型名称，值为显示列。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	意思就是 冒号前面是 模型的名称 如：用户模型（Member），冒号后面是 回收站数据 页面中显示的名称。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	腻害吧，在这里配置完成后 咱们的回收站就会自动显示对应的模型，查看被删除的数据，还可以还原和彻底干掉喔~\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	回收站数据\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ee37aaf33b7b5080c2fcfe7a6365a1de_1918x698.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	比如上图中就是点击菜单模型旁边的数据看到的页面，里面这些数据 都是被删除的数据，点击彻底删除就可以彻底的让Ta消失。。再也找不回来了。所以要慎重(⊙o⊙)&hellip; ，点击恢复正常 可以 把删除状态恢复为正常数据状态，在菜单管理中就可以看到啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	系统回收站就介绍到这里咯，还有疑问可加入QQ交流群：477824874 交流蛤~期待您的光临。\r\n&lt;/p&gt;', '0', '0', '', '1510218109', '1510218109', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('32', '1', '服务管理', '8', 'OneBase 已经集成了 支付服务和云存储服务，OneBase 追求的不是服务有多少，插件有多少，而是给开发者们一套可扩展性强，适合用来二次研发的架构', '&lt;h1 class=&quot;line&quot;&gt;\r\n	服务管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	系统服务列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/05df6205da557c801dd1d061d27317a9_1917x650.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图中可以看到OneBase 已经集成了 支付服务和云存储服务，OneBase \r\n追求的不是服务有多少，插件有多少，而是给开发者们一套可扩展性强，适合用来二次研发的架构，所以OneBase 自带的服务、驱动、插件 \r\n主要是起一个引导作用，实际研发中根据实际情况分析，然后进行服务、驱动、插件、函数 等封装。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	服务驱动列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/75855cf08e4d06f5b94ac91fd278cc97_1915x679.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	点开支付服务右侧的驱动，可以看到已经存在支付宝、微信支付、易宝支付 的驱动，由此处就可以看到 想扩展其他支付驱动很方便，至于服务和驱动 如果进行编码及研发，可参考后续章节的服务研发及使用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/46d13fa1b8d41e0f5596932434a78ad4_1915x731.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/68456ee3cee2ebedb4a9b86a571ccdc1_1915x736.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为 点开 微信驱动安装与支付宝驱动安装的效果，细心的小伙伴会发现 浏览器上的URL并没有变化，而是参数在变化。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	此处使用了多态性的设计，使不同的驱动安装 展示不同的表单录入项，至于需要录入的录入项则是由驱动研发时进行控制的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	这里只是介绍，具体研发及扩展 请阅读后续章节蛤。^_^。\r\n&lt;/p&gt;', '0', '0', '', '1510307288', '1510307288', '1', '0', '0', '0', '1', '0', '');
INSERT INTO `blog_article` VALUES ('33', '1', '插件管理', '8', 'OneBase 可以自己扩展插件哦', '&lt;h1 class=&quot;line&quot;&gt;\r\n	插件管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	钩子列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/232758b9b204a053cd07634fa33a47ce_1918x703.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	插件列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b7406939a59699f894e653fe95eeaf17_1920x737.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为 咱们的插件列表，右侧按钮 有 安装 与 卸载，但是每次只会出现一个，未安装状态下出现的是安装按钮，安装状态下出现的是卸载按钮。\r\n&lt;/p&gt;', '0', '0', '', '1510393207', '1510393207', '1', '0', '0', '0', '1', '0', '');
INSERT INTO `blog_article` VALUES ('34', '1', '文章管理', '8', 'OneBase 文章管理可谓简单粗暴', '&lt;h1 class=&quot;line&quot;&gt;\r\n	文章管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文章分类列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/93e990d2063204f7171aaaee1e8cb319_1915x568.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	文章是很常见的功能模块，也是一套系统经常会操作的功能，所以必须要简单易用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 考虑到文章编辑人员可能存在使用上的障碍，所以默认使用了最常见的结构，一级文章分类，此处抛弃了 无限级分类的文章架构，因为实际情况下运营人员常常要求很简单，不希望常用功能过于复杂难于理解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	当然也不排除有些项目的需求从架构上 就必须要求 多级分类，所以此处谈下 扩展文章分类的做法，OneBase扩展多级分类建议从文章分类上 向上扩展，比如添加文章分类上 加一项顶级分类选择。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文章列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/e03831ec9865bfa3520b59ff68025fec_1913x688.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/800dd3be11a94330050a5cb1f3575512_1903x940.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为文章列表与文章编辑， 可以看到列表页和编辑页有些数据是咱们OneBase前端没有看到的数据，OneBase \r\n是一套研发应用解决方案，文章上的 附件，单图上传，多图上传 等 包括其他模块没有用到的一些功能存在是为了展示研发及使用上的技巧，所以 \r\n作为OneBase的使用者，是需要具备二次研发能力的。\r\n&lt;/p&gt;', '0', '0', '', '1510393374', '1510393406', '1', '0', '0', '0', '7', '0', '');
INSERT INTO `blog_article` VALUES ('35', '1', '接口管理', '8', '接口管理看完后再也不用和APP研发工程师撕逼啦~自己去看文档吧，哈哈', '&lt;h1 class=&quot;line&quot;&gt;\r\n	接口管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	接口分组管理这里就不在叙述，就是为了给接口归类。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/5f5267b6d4fee4a47c9f7d8e29e88ecc_1919x738.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为接口列表页，左上角有两个按钮，一个是新增接口，一个是接口文档跳转按钮。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	数据列表中 第1列为 接口名称，第2列为接口分组，第3列为接口请求类型，OneBase默认统一POST类型，当然需要其他类型如GET \r\n可自行扩展，第4列为接口地址也就是 \r\n（控制器/方法），第5列是接口目前的状态，接口状态中的选项在系统设置的API栏目下可进行配置，第6列为研发者，研发者成员也在系统设置的API栏目下配置，后面两列为接口排序与操作，接口排序为同级有效。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口新增\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/c425bef34644d08f110f9e10e3a794e1_1900x945.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	^_^。  虽然表单数据数据有点多，但是不要怕蛤，咱们来一个一个讲解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们按从左往右，从上往下进行编号讲解，比如 1 2 3 4 对应的是 接口名称，接口排序值，请求地址，请求类型。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1：API接口名称，就是用来看滴。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	2：接口排序值，用来进行接口显示排序，这些都很好理解啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	3：请求地址，接口访问地址格式（控制器/方法）。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	4：请求类型，默认为POST，需要其他类型可自己扩展。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	5：是否为分页接口，意思就是这个接口是否需要分页功能，如果需要分页功能可传递相关参数，如：list_rows 每页显示的数据量，page 查询的页码。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	6：研发者，此接口的研发人员，选项中的可选值可在系统设置的API分组下进行配置。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	7：请求数据，意思就是执行此接口是否需要带请求参数，默认为否不带请求数据，此处的请求数据控制的为接口所依赖的请求参数，大家可以打开 &lt;a href=&quot;/api.php&quot;&gt;https://onebase.org/api.php&lt;/a&gt; 看到里面这些接口 下面有个测试接口功能，此处测试接口功能的表单就是根据这里请求数据设置自动生成的，Token与分页参数是不受此处控制的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	8：响应数据，意思就是接口执行成功后返回的数据，默认为否不带返回数据，为是 则可添加接口返回的数据，当然也会有特殊数据 如 分页数据及后面将介绍的数据签名 等。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	9：接口分组，这个就不介绍啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	10：接口状态，这个也飘过吧。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	11：接口响应示例，这个是用来给接口调用者看的，方便接口调用者可一眼看清数据结构，提升团队研发效率。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	12：接口简介，用来看滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	13：是否验证用户令牌：user_token， 用来做身份验证滴，比如 \r\n文章列表接口，所有的访问者不需要登录也可以看到，就设置为否，这样接口调用就不需要带user_token，若 为需要身份验证的接口，如 \r\n订单列表，某个会员只能查看自己的订单，就需要用到user_token啦，所以 像 订单管理，个人中心等 这些接口是需要带 \r\nuser_token的。user_token 是调用登录接口后返回的，所以若终端想调用需要身份验证的接口，则需要 先调用登录接口后将接口中返回的\r\n user_token 保存下来，在后续接口调用过程中使用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	14：是否响应数据签名：data_sign，此处是用于做数据安全验证的，比如咱们服务器给终端返回了数据，但是 \r\n终端那边怎么知道真滴是咱们返回的呢。。此时 data_sign 就派上用场啦。 返回的数据中带上了 data_sign \r\n字段，终端根据服务器返回的数据进行与服务器端相同的算法，计算出 终端的  data_sign，然后两端的  data_sign \r\n进行比对，若一模一样，则说明 数据是一模一样滴，这样就很安全啦，别人想改也不行，嘿嘿。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	15：是否验证请求数据签名：data_sign，原理是一样滴，意思就是 终端像接口提交数据时，咱们服务器端也得知道提交的数据是否安全，所以\r\n 咱们也要根据提交上来的数据 生成 \r\ndata_sign，与提交数据中带的data_sign，进行比对，不一样的话就不执行操作，接口返回数据签名不对，一样的话就放行。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	16：这个是备用的。。担心服务端人员太腻害，研发出来的接口实在是用言语无法表达。。就可以用富文本进行图文描述。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	好啦，输入选项介绍完了，咱们看下登录接口的编辑数据页面，看看是咋输入滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b66298b92545f3cc1b2c22d886a68f4f_1900x947.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台接口管理功能就介绍到这里，更深一步将在接口研发中讲解。\r\n&lt;/p&gt;', '0', '0', '', '1510646369', '1510646369', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('36', '1', '优化维护-SEO管理', '8', 'OneBase中的SEO信息可是支持变量滴~', '&lt;h1 class=&quot;line&quot;&gt;\r\n	SEO管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	SEO管理列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/4065235f0baa9f04351aa5dfda0a7590_1920x562.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为SEO管理数据列表，可以看到标题和关键词里面有变量，OneBase中的这些变量可不是固定的喔~\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	SEO变量\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	至于新增和编辑这里就不在叙述啦~太简单咯，咱们直接看看SEO中的这些变量是从哪里来滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/6f2c5cf3484b2768324f2409ca84accb_1915x786.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们点开首页的SEO配置信息编辑页面，看到里面用到这些变量，{$category_name}，{$article_title}，{$article_describe}\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	这些变量是从哪里来的？ 请看下图\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/a805e5dee7706276a304787f2ee31194_1031x930.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	细心的观众能看出来，都是 assign 方法中的变量，如果 assign 不知道是干啥的。。那么请移步至ThinkPHP5的手册 看完再来蛤。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	SEO中的变量支持 所有在控制器中 assign 给模板赋值的变量，这意味着您想添加或减少很简单。。前提是您是开发者。当然，开发者开发完成后建议把此处所支持的变量录入到 可用变量 的输入框中 方便 非开发者知道可支持的有哪些变量蛤。\r\n&lt;/p&gt;', '0', '0', '', '1512096686', '1512096686', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('37', '1', '优化维护-数据库', '8', '此处可以备份和还原数据库', '&lt;h1 class=&quot;line&quot;&gt;\r\n	数据库\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据备份\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/fca84a3b960b8d65dfe2896bab3de32d_1912x873.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图是数据备份页面，列表中是数据库表信息，点击左上角的按钮备份数据，可实现数据库的备份，旁边的 优化和修复是执行的MySql内置的优化与修复，如需了解请自行搜索蛤。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据还原\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/a939e0e84d1a25952e619e7beaff76ad_1916x788.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图是数据还原的界面，列表中为之前备份的记录，点击右侧的还原可还原到当时备份的数据库，若系统已经上线此功能要慎重使用。\r\n&lt;/p&gt;', '0', '0', '', '1512096775', '1512096775', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('38', '1', '优化维护-文件清理', '8', '自动清理系统辣鸡文件和辣鸡数据，维护系统健康', '&lt;h1 class=&quot;line&quot;&gt;\r\n	文件清理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文件清理列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/2cbbad1d7df01f67406b189a057e4a2a_1918x609.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	点击文件清理后发现没有数据，说明系统很健康喔~木有辣鸡文件需要清理，下面咱们人工制造两个无用的图片试试。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/d42b3147c268615b37e5275c57cc5344_561x798.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图中咱们 制造了 辣鸡1 和 辣鸡2，再来看看后台。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ded6f545da29c4ddada686a061e93568_1917x764.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	发现辣鸡了。。腻害吧。嘿嘿。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	然后咱们点击开始清理，然后就会自动干掉 系统中没有引用的文件，这里不光是干掉没有使用的辣鸡文件哦，还隐式的干掉了 数据库中记录的文件记录但是在文件中又不存在的，是双向检索蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	那么问题来了， 系统怎么知道咱们哪些需要检索为辣鸡数据 哪些不需要检索呢？\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/0e48380b13dda40e59223ed21ab18d05_1918x845.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图上就是配置检索字段的地方啦。: 冒号前面为 模型名称，后面为 需要检索的字段名称，但是 \r\n冒号前面的模型前咋还有下划线呢？下划线是用来区分key标识的，因为 如果没有下划线前面的 0 和 1 系统就没办法知道 这两个 key \r\n有啥区别，就理解成了 只有 1个key ， 就会造成系统清理的时候 有遗漏蛤，所以 需要添加清理配置列就参考此处喔。\r\n&lt;/p&gt;', '0', '0', '', '1512096869', '1512096869', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('39', '1', '优化维护-行为日志', '8', '后台操作行为一目了然', '&lt;h3 class=&quot;line&quot;&gt;\r\n	行为日志列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ace534fc77ad7137c1eb21c2679d287b_1917x855.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图上是系统的行为日志，此处的行为日志是指后台的操作行为记录，不涉及其他模块，后台研发过程中需要记录行为日志则使用  action_log 函数记录，清空与删除日志此处就不说啦。\r\n&lt;/p&gt;', '0', '0', '', '1512471084', '1512471100', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('40', '1', '优化维护-执行记录', '8', '监控系统执行记录，让系统随时处于最佳状态', '&lt;h1 class=&quot;line&quot;&gt;\r\n	执行记录\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	全局范围\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/5cbb0f2cb8e55ef6593668299a67022a_1916x732.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口范围\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/10f2ec0dfb638c81b70016e7359c51ac_1914x725.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;p&gt;\r\n	这功能就有点腻害啦，是压轴滴蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们第一张图是 全局范围，意思就是 咱们整套系统的任何模块所有的操作记录。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	第二张图是 接口范围，意思就是 咱们接口模块所有的执行操作记录。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	至于数据列表上面的列就不介绍啦~相信能来到这里的小伙伴都可以看懂喔。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	看到全局范围 1200多页。。。会不会影响系统速度呢？\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	看看咱们执行记录的流程就知道咯\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1.访问系统 -&amp;gt; 2.记录文件 -&amp;gt; 3.后台手动批量入库 -&amp;gt;  4.干掉已入库文件记录\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	清空日志是指软删除咱们全局范围中所有的数据库记录，全局范围包含了接口范围喔~\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	之前就说过咯，咱们所有的数据删除都是软删除，想要彻底干掉就去回收站介绍里面看看蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们后台功能介绍就到此为止咯，相信童鞋们已经看到OneBase的腻害之处了吧，下面咱们来看看如何研发后台功能吧。 ^_^。\r\n&lt;/p&gt;', '0', '0', '', '1512471194', '1512471194', '1', '0', '0', '0', '0', '0', '');
INSERT INTO `blog_article` VALUES ('62', '1', 'php如何判断一个日期的格式是否正确', '9', 'php如何判断一个日期的格式是否正确', '&lt;p&gt;\r\n	用php获取上个月最后一天的时间，有两种方法，都非常简单，详细实现源码如下：\r\n&lt;/p&gt;\r\n&lt;pre class=&quot;prettyprint lang-php&quot;&gt;&amp;lt;?php\r\n  date_default_timezone_set(&quot;PRC&quot;); //设置时区\r\n  //方法一\r\n  $times = date(&quot;d&quot;) * 24 * 3600;\r\n  echo date(&quot;Y-m-d H:i:s&quot;, time()-$times);\r\n  echo \'&amp;lt;br/&amp;gt;\';\r\n  //方法二\r\n  $day = date(\'d\');\r\n  echo date(&quot;Y-m-d H:i:s&quot;, strtotime(-$day.\' day\'));\r\n?&amp;gt;&lt;/pre&gt;\r\n&lt;p&gt;\r\n	方法一是利用当前时间离本月初有多少时间，然后用当前时间减去这个时间差，就可以得到上月最后一天了。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#222222;font-family:Consolas, &amp;quot;background-color:#FFFFFF;&quot;&gt; 方法二是先计算本月多少号，即离月初有多少天，然后用strtotime计算出$day天前的时间戳，也可以得到上个月的最后一天。 &lt;/span&gt; \r\n&lt;/p&gt;', '201', '0', '', '1550045502', '1550048015', '1', '0', '0', '0', '249', '0', '');
INSERT INTO `blog_article` VALUES ('76', '1', 'Bootstrap使用table切换后js插件渲染失败的问题', '9', '', '&lt;h3 id=&quot;h3--&quot;&gt;&lt;a name=&quot;一、前言&quot; class=&quot;reference-link&quot;&gt;&lt;/a&gt;&lt;span class=&quot;header-link octicon octicon-link&quot;&gt;&lt;/span&gt;一、前言&lt;/h3&gt;&lt;p&gt;最近在写nav的table切换过程中发现一个诡异的现象，第一次加载过程中如果插件位置不在第一个，那么无法插件渲染。&lt;br&gt;其他需要html渲染的插件也同样会有问题，例如char.js、ueditor。&lt;/p&gt;\r\n&lt;h3 id=&quot;h3--&quot;&gt;&lt;a name=&quot;二、过程&quot; class=&quot;reference-link&quot;&gt;&lt;/a&gt;&lt;span class=&quot;header-link octicon octicon-link&quot;&gt;&lt;/span&gt;二、过程&lt;/h3&gt;&lt;p&gt;下图所示，是一个博客的table切换&lt;br&gt;&lt;a href=&quot;http://zhanghao520.com&quot; title=&quot;张浩博客table切换&quot;&gt;&lt;img src=&quot;/upload/picture/20190301/f3d1648df151f4ca287b8f732f5992db.png&quot; alt=&quot;张浩博客table切换&quot; title=&quot;张浩博客table切换&quot;&gt;&lt;/a&gt;&lt;br&gt;&lt;a href=&quot;http://zhanghao520.com&quot; title=&quot;张浩博客图片上传&quot;&gt;&lt;img src=&quot;/upload/picture/20190301/71876f4427fb4bdb6748aebc595bac4c.png&quot; alt=&quot;张浩博客图片上传&quot; title=&quot;张浩博客图片上传&quot;&gt;&lt;/a&gt;&lt;/p&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;上传图片我用的webupload，点击图片时自动上传，更换图片，但是这个插件所在位置处于table切换的第二个，所以无论如何点击，插件无法渲染，因为bootstrap中table.js使用的是锚链接。&lt;code&gt;href=&amp;quot;#notice&amp;quot;&lt;/code&gt;&lt;/li&gt;&lt;/ol&gt;\r\n&lt;pre&gt;&lt;code&gt;&amp;lt;ul class=&amp;quot;nav nav-tabs&amp;quot; role=&amp;quot;tablist&amp;quot;&amp;gt;\r\n&amp;lt;li role=&amp;quot;presentation&amp;quot; class=&amp;quot;active&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;#notice&amp;quot; aria-controls=&amp;quot;notice&amp;quot; role=&amp;quot;tab&amp;quot; data-toggle=&amp;quot;tab&amp;quot;&amp;gt;网站公告&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n&amp;lt;li role=&amp;quot;presentation&amp;quot; &amp;gt;&amp;lt;a href=&amp;quot;#centre&amp;quot; aria-controls=&amp;quot;centre&amp;quot; role=&amp;quot;tab&amp;quot; data-toggle=&amp;quot;tab&amp;quot;&amp;gt;会员中心&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n&amp;lt;li role=&amp;quot;presentation&amp;quot;&amp;gt;&amp;lt;a href=&amp;quot;#contact&amp;quot; aria-controls=&amp;quot;contact&amp;quot; role=&amp;quot;tab&amp;quot; data-toggle=&amp;quot;tab&amp;quot;&amp;gt;联系站长&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;\r\n&amp;lt;/ul&amp;gt;\r\n&lt;/code&gt;&lt;/pre&gt;&lt;ol&gt;\r\n&lt;li&gt;我们可以查看bootstrap官网中说明&lt;/li&gt;&lt;/ol&gt;\r\n&lt;blockquote&gt;\r\n&lt;p&gt;When showing a new tab, the events fire in the following order:&lt;/p&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;hide.bs.tab (on the current active tab)&lt;/li&gt;&lt;li&gt;show.bs.tab (on the to-be-shown tab)&lt;/li&gt;&lt;li&gt;hidden.bs.tab (on the previous active tab, the same one as for the hide.bs.tab event)&lt;/li&gt;&lt;li&gt;shown.bs.tab (on the newly-active just-shown tab, the same one as for the show.bs.tab event)&lt;/li&gt;&lt;/ol&gt;\r\n&lt;/blockquote&gt;\r\n&lt;p&gt;其中有四种事件类型,我们只要调用&lt;code&gt;show.bs.tab&lt;/code&gt;这个事件就能在锚链接跳转时渲染js插件了&lt;/p&gt;\r\n&lt;pre&gt;&lt;code&gt;$(&amp;#39;a[data-toggle=&amp;quot;tab&amp;quot;]&amp;#39;).on(&amp;#39;shown.bs.tab&amp;#39;, function (e) {\r\n  e.target // newly activated tab\r\n  e.relatedTarget // previous active tab\r\n})\r\n&lt;/code&gt;&lt;/pre&gt;&lt;ol&gt;\r\n&lt;li&gt;接下来我们在项目中使用&lt;/li&gt;&lt;/ol&gt;\r\n&lt;pre&gt;&lt;code&gt;$(&amp;#39;a[data-toggle=&amp;quot;tab&amp;quot;]&amp;#39;).on(&amp;#39;shown.bs.tab&amp;#39;, function (e) {\r\n                        //shown.bs.tab为tab选项卡高亮事件,\r\n                        //这里需要注意！\r\n                        // 获取已激活的标签页的名称\r\n                        var activeTab = $(e.target)[0].hash;\r\n                        //hash 属性是一个可读可写的字符串，该字符串是 URL 的锚部分（从 # 号开始的部分）\r\n\r\n                        if(activeTab === &amp;quot;#centre&amp;quot;){\r\n                            //当相应的标签被点击时，进行图片上传渲染\r\n                            //logo上传\r\n                            /*init webuploader*/\r\n                        }\r\n}\r\n&lt;/code&gt;&lt;/pre&gt;&lt;p&gt;完美解决！&lt;/p&gt;\r\n&lt;h3 id=&quot;h3--&quot;&gt;&lt;a name=&quot;三、总结&quot; class=&quot;reference-link&quot;&gt;&lt;/a&gt;&lt;span class=&quot;header-link octicon octicon-link&quot;&gt;&lt;/span&gt;三、总结&lt;/h3&gt;&lt;p&gt;我们在使用插件过程中，会不断的发现坑点，特别加载多个jq插件的时候，多看文档会让我们解决问题的路上少走弯路。&lt;br&gt;欢迎关注我的博客 &lt;a href=&quot;http://www.zhanghao520.com&quot; title=&quot;www.zhanghao520.com&quot;&gt;www.zhanghao520.com&lt;/a&gt;，更多技术问题一起研究！&lt;/p&gt;\r\n', '217', '0', '', '1551425118', '1551425869', '1', '0', '1', '1551425869', '46', '1', '### 一、前言\r\n最近在写nav的table切换过程中发现一个诡异的现象，第一次加载过程中如果插件位置不在第一个，那么无法插件渲染。\r\n其他需要html渲染的插件也同样会有问题，例如char.js、ueditor。\r\n\r\n\r\n### 二、过程\r\n下图所示，是一个博客的table切换\r\n[![张浩博客table切换](/upload/picture/20190301/f3d1648df151f4ca287b8f732f5992db.png &quot;张浩博客table切换&quot;)](http://zhanghao520.com &quot;张浩博客table切换&quot;)\r\n[![张浩博客图片上传](/upload/picture/20190301/71876f4427fb4bdb6748aebc595bac4c.png &quot;张浩博客图片上传&quot;)](http://zhanghao520.com &quot;张浩博客图片上传&quot;)\r\n\r\n1. 上传图片我用的webupload，点击图片时自动上传，更换图片，但是这个插件所在位置处于table切换的第二个，所以无论如何点击，插件无法渲染，因为bootstrap中table.js使用的是锚链接。`href=&quot;#notice&quot;`\r\n\r\n```\r\n&lt;ul class=&quot;nav nav-tabs&quot; role=&quot;tablist&quot;&gt;\r\n&lt;li role=&quot;presentation&quot; class=&quot;active&quot;&gt;&lt;a href=&quot;#notice&quot; aria-controls=&quot;notice&quot; role=&quot;tab&quot; data-toggle=&quot;tab&quot;&gt;网站公告&lt;/a&gt;&lt;/li&gt;\r\n&lt;li role=&quot;presentation&quot; &gt;&lt;a href=&quot;#centre&quot; aria-controls=&quot;centre&quot; role=&quot;tab&quot; data-toggle=&quot;tab&quot;&gt;会员中心&lt;/a&gt;&lt;/li&gt;\r\n&lt;li role=&quot;presentation&quot;&gt;&lt;a href=&quot;#contact&quot; aria-controls=&quot;contact&quot; role=&quot;tab&quot; data-toggle=&quot;tab&quot;&gt;联系站长&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n```\r\n\r\n2. 我们可以查看bootstrap官网中说明\r\n\r\n&gt; When showing a new tab, the events fire in the following order:\r\n1. hide.bs.tab (on the current active tab)\r\n2. show.bs.tab (on the to-be-shown tab)\r\n3. hidden.bs.tab (on the previous active tab, the same one as for the hide.bs.tab event)\r\n4. shown.bs.tab (on the newly-active just-shown tab, the same one as for the show.bs.tab event)\r\n\r\n其中有四种事件类型,我们只要调用`show.bs.tab`这个事件就能在锚链接跳转时渲染js插件了\r\n\r\n```\r\n$(\'a[data-toggle=&quot;tab&quot;]\').on(\'shown.bs.tab\', function (e) {\r\n  e.target // newly activated tab\r\n  e.relatedTarget // previous active tab\r\n})\r\n```\r\n\r\n3. 接下来我们在项目中使用\r\n\r\n```\r\n$(\'a[data-toggle=&quot;tab&quot;]\').on(\'shown.bs.tab\', function (e) {\r\n                        //shown.bs.tab为tab选项卡高亮事件,\r\n                        //这里需要注意！\r\n                        // 获取已激活的标签页的名称\r\n                        var activeTab = $(e.target)[0].hash;\r\n                        //hash 属性是一个可读可写的字符串，该字符串是 URL 的锚部分（从 # 号开始的部分）\r\n\r\n                        if(activeTab === &quot;#centre&quot;){\r\n                            //当相应的标签被点击时，进行图片上传渲染\r\n                            //logo上传\r\n                            /*init webuploader*/\r\n                        }\r\n}\r\n\r\n```\r\n\r\n完美解决！\r\n### 三、总结\r\n我们在使用插件过程中，会不断的发现坑点，特别加载多个jq插件的时候，多看文档会让我们解决问题的路上少走弯路。\r\n欢迎关注我的博客 [www.zhanghao520.com](http://www.zhanghao520.com &quot;www.zhanghao520.com&quot;)，更多技术问题一起研究！\r\n\r\n\r\n\r\n\r\n\r\n');

-- ----------------------------
-- Table structure for blog_article_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_category`;
CREATE TABLE `blog_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `icon` char(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of blog_article_category
-- ----------------------------
INSERT INTO `blog_article_category` VALUES ('7', '基础', '基础内容', '1509620712', '1548404765', '-1', 'fa-street-view', '0');
INSERT INTO `blog_article_category` VALUES ('8', '后台介绍', '后台功能介绍', '1509792822', '1548404767', '-1', 'fa-user', '0');
INSERT INTO `blog_article_category` VALUES ('9', '后端开发', '', '1548404758', '1548657114', '1', '', '99');
INSERT INTO `blog_article_category` VALUES ('10', '前端技术', '', '1548404783', '1548657118', '1', '', '98');
INSERT INTO `blog_article_category` VALUES ('11', '开源项目', '', '1548404790', '1548657120', '1', '', '97');
INSERT INTO `blog_article_category` VALUES ('12', '技术人生', '', '1548404800', '1548657126', '1', '', '96');
INSERT INTO `blog_article_category` VALUES ('13', '工作以外', '', '1548404820', '1548657128', '1', '', '5');

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES ('1', '7', '41', '1548663195', '1548663195', '1');
INSERT INTO `blog_article_tag` VALUES ('2', '10', '42', '1548667553', '1548667553', '1');
INSERT INTO `blog_article_tag` VALUES ('3', '9', '43', '1548667727', '1548667727', '1');
INSERT INTO `blog_article_tag` VALUES ('4', '11', '44', '1548667855', '1548667855', '1');
INSERT INTO `blog_article_tag` VALUES ('5', '10', '45', '1548668044', '1548668044', '1');
INSERT INTO `blog_article_tag` VALUES ('6', '11', '46', '1548668094', '1548668094', '1');
INSERT INTO `blog_article_tag` VALUES ('7', '10', '47', '1548668740', '1548668740', '1');
INSERT INTO `blog_article_tag` VALUES ('8', '10', '48', '1548668829', '1548668829', '1');
INSERT INTO `blog_article_tag` VALUES ('9', '10', '49', '1548669346', '1548669346', '1');
INSERT INTO `blog_article_tag` VALUES ('10', '11', '50', '1548669446', '1548669446', '1');
INSERT INTO `blog_article_tag` VALUES ('11', '10', '52', '1548670952', '1548670952', '1');
INSERT INTO `blog_article_tag` VALUES ('12', '11', '53', '1548671039', '1548671039', '1');
INSERT INTO `blog_article_tag` VALUES ('13', '12', '54', '1548671431', '1548671431', '1');
INSERT INTO `blog_article_tag` VALUES ('14', '6', '59', '1548742290', '1548742290', '1');
INSERT INTO `blog_article_tag` VALUES ('15', '12', '59', '1548742290', '1548742290', '1');
INSERT INTO `blog_article_tag` VALUES ('60', '9', '62', '1550048016', '1550048016', '1');
INSERT INTO `blog_article_tag` VALUES ('59', '13', '62', '1550048016', '1550048016', '1');
INSERT INTO `blog_article_tag` VALUES ('55', '6', '61', '1548901395', '1548901395', '1');
INSERT INTO `blog_article_tag` VALUES ('54', '11', '61', '1548901395', '1548901395', '1');
INSERT INTO `blog_article_tag` VALUES ('38', '10', '55', '1548747642', '1548747642', '1');
INSERT INTO `blog_article_tag` VALUES ('37', '11', '55', '1548747642', '1548747642', '1');
INSERT INTO `blog_article_tag` VALUES ('36', '12', '55', '1548747642', '1548747642', '1');
INSERT INTO `blog_article_tag` VALUES ('51', '7', '60', '1548747878', '1548747878', '1');
INSERT INTO `blog_article_tag` VALUES ('50', '8', '60', '1548747878', '1548747878', '1');
INSERT INTO `blog_article_tag` VALUES ('49', '9', '60', '1548747878', '1548747878', '1');
INSERT INTO `blog_article_tag` VALUES ('48', '11', '60', '1548747878', '1548747878', '1');
INSERT INTO `blog_article_tag` VALUES ('47', '12', '60', '1548747878', '1548747878', '1');
INSERT INTO `blog_article_tag` VALUES ('61', '0', '63', '1550195325', '1550195325', '1');
INSERT INTO `blog_article_tag` VALUES ('62', '0', '64', '1550195355', '1550195355', '1');
INSERT INTO `blog_article_tag` VALUES ('66', '0', '65', '1551086376', '1551086376', '1');
INSERT INTO `blog_article_tag` VALUES ('67', '15', '66', '1551255355', '1551255355', '1');
INSERT INTO `blog_article_tag` VALUES ('68', '14', '66', '1551255355', '1551255355', '1');
INSERT INTO `blog_article_tag` VALUES ('69', '0', '67', '1551255534', '1551255534', '1');
INSERT INTO `blog_article_tag` VALUES ('71', '0', '68', '1551255591', '1551255591', '1');
INSERT INTO `blog_article_tag` VALUES ('72', '0', '69', '1551255850', '1551255850', '1');
INSERT INTO `blog_article_tag` VALUES ('73', '0', '70', '1551255869', '1551255869', '1');
INSERT INTO `blog_article_tag` VALUES ('75', '0', '71', '1551257329', '1551257329', '1');
INSERT INTO `blog_article_tag` VALUES ('76', '0', '72', '1551257382', '1551257382', '1');
INSERT INTO `blog_article_tag` VALUES ('80', '0', '73', '1551257833', '1551257833', '1');
INSERT INTO `blog_article_tag` VALUES ('82', '0', '74', '1551258743', '1551258743', '1');
INSERT INTO `blog_article_tag` VALUES ('84', '0', '75', '1551261761', '1551261761', '1');

-- ----------------------------
-- Table structure for blog_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth_group`;
CREATE TABLE `blog_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `describe` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(1000) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of blog_auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for blog_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth_group_access`;
CREATE TABLE `blog_auth_group_access` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组授权表';

-- ----------------------------
-- Records of blog_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for blog_banner
-- ----------------------------
DROP TABLE IF EXISTS `blog_banner`;
CREATE TABLE `blog_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) NOT NULL DEFAULT '',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_banner
-- ----------------------------
INSERT INTO `blog_banner` VALUES ('1', '199', '0', '1548906707', '1548906707', '1', '111', '1', '0');
INSERT INTO `blog_banner` VALUES ('2', '199', '0', '1548906721', '1548906721', '1', '111', '1', '0');
INSERT INTO `blog_banner` VALUES ('3', '0', '0', '1548914091', '1550030904', '-1', '', '1', '0');
INSERT INTO `blog_banner` VALUES ('4', '0', '0', '1548914232', '1550030904', '-1', '', '1', '0');
INSERT INTO `blog_banner` VALUES ('5', '0', '0', '1548914282', '1550030904', '-1', '', '1', '0');
INSERT INTO `blog_banner` VALUES ('6', '0', '0', '1548914343', '1550030904', '-1', '', '1', '0');
INSERT INTO `blog_banner` VALUES ('7', '0', '0', '1548914366', '1550030904', '-1', '', '1', '0');

-- ----------------------------
-- Table structure for blog_blogroll
-- ----------------------------
DROP TABLE IF EXISTS `blog_blogroll`;
CREATE TABLE `blog_blogroll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '' COMMENT '链接名称',
  `img_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '链接图片封面',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of blog_blogroll
-- ----------------------------
INSERT INTO `blog_blogroll` VALUES ('3', '百度问答', '200', 'ww.baidu.com', '', '0', '1', '1549854338', '1549854825');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `zan` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('1', '10', '62', '0', '212121', '1', '1550134872', '1550134872', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('2', '10', '62', '0', '2121', '1', '1550135202', '1550135202', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('3', '10', '62', '0', '1111', '1', '1550135233', '1550135233', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('4', '10', '62', '0', '212121', '1', '1550135506', '1550135506', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('5', '10', '62', '0', '2121', '1', '1550135539', '1550135539', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('6', '10', '62', '0', '11', '1', '1550135583', '1550135583', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('7', '10', '62', '0', '11', '1', '1550135586', '1550135586', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('8', '10', '62', '0', '212121', '1', '1550135610', '1550135610', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('9', '10', '62', '0', '212121', '1', '1550135621', '1550135621', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('10', '10', '62', '0', '212121', '1', '1550135627', '1550135627', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('11', '10', '62', '0', '212121', '1', '1550135632', '1550135632', '0', '30', '');
INSERT INTO `blog_comment` VALUES ('12', '10', '62', '0', '&amp;lt;img src=&amp;quot;/static/module/home/images/arclist/37.gif&amp;quot; border=&amp;quot;0&amp;quot; /&amp;gt;212121', '1', '1550139372', '1550139372', '0', '127.0.0.1', 'XX XX 内网IP');
INSERT INTO `blog_comment` VALUES ('13', '10', '62', '0', '11111111111', '1', '1550140651', '1550140651', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('14', '10', '62', '0', '&lt;img src=&quot;/static/module/home/images/arclist/23.gif&quot; border=&quot;0&quot; /&gt;', '1', '1550195565', '1550195565', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('15', '10', '62', '0', '1221', '1', '1550196546', '1550196546', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('16', '10', '62', '0', '2121', '1', '1550196597', '1550196597', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('17', '10', '62', '0', '2121', '1', '1550196601', '1550196601', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('18', '10', '62', '0', '221', '1', '1550196603', '1550196603', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('19', '10', '62', '0', '212121', '1', '1550215187', '1550215187', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('20', '10', '62', '0', '@mess @mess @mess @mess @mess @mess @mess 21212121&lt;img src=&quot;/static/module/home/images/arclist/22.gif&quot; border=&quot;0&quot; /&gt;', '1', '1550219486', '1550219486', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('21', '10', '62', '0', '@mess @mess &lt;img src=&quot;/static/module/home/images/arclist/36.gif&quot; border=&quot;0&quot; /&gt;', '1', '1550454317', '1550454317', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('22', '10', '62', '0', '212121', '1', '1550454664', '1550454664', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('23', '10', '62', '0', '21212', '1', '1550454755', '1550454755', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('24', '10', '62', '0', '1', '1', '1550454824', '1550454824', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('25', '10', '62', '0', '1', '1', '1550454884', '1550454884', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('26', '10', '62', '0', '12', '1', '1550454913', '1550454913', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('27', '10', '62', '0', '334', '1', '1550454916', '1550454916', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('28', '10', '62', '0', '1221', '1', '1550454925', '1550454925', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('29', '10', '62', '0', '2121', '1', '1550455047', '1550455047', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('30', '10', '62', '0', '2121', '1', '1550455066', '1550455066', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('31', '10', '62', '0', '&lt;img src=&quot;/static/module/home/images/arclist/21.gif&quot; border=&quot;0&quot; /&gt;212121', '1', '1550455158', '1550455158', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('32', '10', '62', '0', '2121', '1', '1550455247', '1550455247', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('33', '10', '62', '0', '2121', '1', '1550455521', '1550455521', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('34', '10', '62', '0', '212121', '1', '1550455593', '1550455593', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('35', '10', '62', '0', '2121', '1', '1550455640', '1550455640', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('36', '10', '62', '0', '2121', '1', '1550455878', '1550455878', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('37', '10', '62', '0', '1221', '1', '1550455932', '1550455932', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('38', '10', '62', '0', '21', '1', '1550455947', '1550455947', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('39', '10', '62', '0', '2', '1', '1550455992', '1550455992', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('40', '10', '62', '0', '11', '1', '1550456038', '1550456038', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('41', '10', '62', '0', '1', '1', '1550456109', '1550456109', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('42', '10', '62', '0', '1', '1', '1550456276', '1550456276', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('43', '10', '62', '0', '1', '1', '1550456307', '1550456307', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('44', '10', '62', '0', '1', '1', '1550456315', '1550456315', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('45', '10', '62', '0', '1', '1', '1550456339', '1550456339', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('46', '10', '62', '0', '1', '1', '1550456347', '1550456347', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('47', '10', '62', '0', '1', '1', '1550456361', '1550456361', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('48', '10', '62', '0', '222', '1', '1550456364', '1550456364', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('49', '10', '62', '0', '111', '1', '1550456372', '1550456372', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('50', '10', '62', '0', '11', '1', '1550456388', '1550456388', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('51', '10', '62', '0', '1', '1', '1550456391', '1550456391', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('52', '10', '62', '0', '2', '1', '1550456409', '1550456409', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('53', '10', '62', '0', '111', '1', '1550457055', '1550457055', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('54', '10', '23', '0', '111', '1', '1550457230', '1550457230', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('55', '10', '61', '0', '&lt;img src=&quot;/static/module/home/images/arclist/23.gif&quot; border=&quot;0&quot; /&gt;', '1', '1550458133', '1550458133', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('56', '10', '61', '0', '1', '1', '1550458141', '1550458141', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('57', '10', '61', '0', '11', '1', '1550458149', '1550458149', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('58', '10', '61', '0', '12', '1', '1550458163', '1550458163', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('59', '10', '64', '0', '1', '1', '1550458337', '1550458337', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('60', '10', '64', '0', '111', '1', '1550458342', '1550458342', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('61', '10', '64', '0', '11', '1', '1550458403', '1550458403', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('62', '10', '64', '0', '2121', '1', '1550458432', '1550458432', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('63', '10', '64', '0', '&lt;img src=&quot;/static/module/home/images/arclist/39.gif&quot; border=&quot;0&quot; /&gt;', '1', '1550458440', '1550458440', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('64', '10', '64', '0', '&lt;img src=&quot;/static/module/home/images/arclist/11.gif&quot; border=&quot;0&quot; /&gt;', '1', '1550458443', '1550458443', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('65', '10', '64', '0', '212121221', '1', '1550458447', '1550458447', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('66', '10', '64', '0', '@mess 2121', '-1', '1550458452', '1550736327', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('67', '10', '75', '0', '111', '1', '1551337725', '1551337725', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('68', '10', '75', '0', '212121', '1', '1551338092', '1551338092', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('69', '10', '75', '0', '@mess @mess @mess @mess @mess @mess @mess @mess @mess @mess @mess @mess @mess ', '1', '1551338312', '1551338312', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('70', '10', '75', '0', '2121', '1', '1551338582', '1551338582', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('71', '10', '75', '0', '21212121', '1', '1551338584', '1551338584', '0', '127.0.0.1', '');
INSERT INTO `blog_comment` VALUES ('72', '10', '75', '0', '@mess ', '1', '1551338777', '1551338777', '0', '127.0.0.1', '');

-- ----------------------------
-- Table structure for blog_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_config`;
CREATE TABLE `blog_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置选项',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of blog_config
-- ----------------------------
INSERT INTO `blog_config` VALUES ('1', 'seo_title', '1', '网站标题', '1', '', '网站标题前台显示标题，优先级低于SEO模块', '1378898976', '1512555314', '1', 'OneBase免费开源架构', '3');
INSERT INTO `blog_config` VALUES ('2', 'seo_description', '2', '网站描述', '1', '', '网站搜索引擎描述，优先级低于SEO模块', '1378898976', '1512555314', '1', 'OneBase|ThinkPHP5', '100');
INSERT INTO `blog_config` VALUES ('3', 'seo_keywords', '2', '网站关键字', '1', '', '网站搜索引擎关键字，优先级低于SEO模块', '1378898976', '1512555314', '1', 'OneBase|ThinkPHP5', '99');
INSERT INTO `blog_config` VALUES ('9', 'config_type_list', '3', '配置类型列表', '3', '', '主要用于数据解析和页面表单的生成', '1378898976', '1512982406', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n5:图片\r\n6:文件\r\n7:富文本\r\n8:单选\r\n9:多选\r\n10:日期\r\n11:时间\r\n12:颜色', '100');
INSERT INTO `blog_config` VALUES ('20', 'config_group_list', '3', '配置分组', '3', '', '配置分组', '1379228036', '1512982406', '1', '1:基础\r\n2:数据\r\n3:系统\r\n4:API', '100');
INSERT INTO `blog_config` VALUES ('25', 'list_rows', '0', '每页数据记录数', '2', '', '数据每页显示记录数', '1379503896', '1507197630', '1', '10', '10');
INSERT INTO `blog_config` VALUES ('29', 'data_backup_part_size', '0', '数据库备份卷大小', '2', '', '该值用于限制压缩后的分卷最大长度。单位：B', '1381482488', '1507197630', '1', '52428800', '7');
INSERT INTO `blog_config` VALUES ('30', 'data_backup_compress', '4', '数据库备份文件是否启用压缩', '2', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1507197630', '1', '1', '9');
INSERT INTO `blog_config` VALUES ('31', 'data_backup_compress_level', '4', '数据库备份文件压缩级别', '2', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1507197630', '1', '9', '10');
INSERT INTO `blog_config` VALUES ('33', 'allow_url', '3', '不受权限验证的url', '3', '', '', '1386644047', '1512982406', '1', '0:file/pictureupload\r\n1:addon/execute', '100');
INSERT INTO `blog_config` VALUES ('43', 'empty_list_describe', '1', '数据列表为空时的描述信息', '2', '', '', '1492278127', '1507197630', '1', 'aOh! 暂时还没有数据~', '0');
INSERT INTO `blog_config` VALUES ('44', 'trash_config', '3', '回收站配置', '3', '', 'key为模型名称，值为显示列。', '1492312698', '1512982406', '1', 'Config:name\r\nAuthGroup:name\r\nMember:nickname\r\nMenu:name\r\nArticle:name\r\nArticleCategory:name\r\nAddon:name\r\nPicture:name\r\nFile:name\r\nActionLog:describe\r\nApi:name\r\nApiGroup:name\r\nBlogroll:name', '0');
INSERT INTO `blog_config` VALUES ('49', 'static_domain', '1', '静态资源域名', '1', '', '若静态资源为本地资源则此项为空，若为外部资源则为存放静态资源的域名', '1502430387', '1512555314', '1', '', '0');
INSERT INTO `blog_config` VALUES ('52', 'team_developer', '3', '研发团队人员', '4', '', '', '1504236453', '1510894595', '1', '0:Bigotry\r\n1:扫地僧', '0');
INSERT INTO `blog_config` VALUES ('53', 'api_status_option', '3', 'API接口状态', '4', '', '', '1504242433', '1510894595', '1', '0:待研发\r\n1:研发中\r\n2:测试中\r\n3:已完成', '0');
INSERT INTO `blog_config` VALUES ('54', 'api_data_type_option', '3', 'API数据类型', '4', '', '', '1504328208', '1510894595', '1', '0:字符\r\n1:文本\r\n2:数组\r\n3:文件', '0');
INSERT INTO `blog_config` VALUES ('55', 'frontend_theme', '1', '前端主题', '1', '', '', '1504762360', '1512555314', '1', 'default', '0');
INSERT INTO `blog_config` VALUES ('56', 'api_domain', '1', 'API部署域名', '4', '', '', '1504779094', '1510894595', '1', 'https://demo.onebase.org', '0');
INSERT INTO `blog_config` VALUES ('57', 'api_key', '1', 'API加密KEY', '4', '', '泄露后API将存在安全隐患', '1505302112', '1510894595', '1', 'l2V|gfZp{8`;jzR~6Y1_', '0');
INSERT INTO `blog_config` VALUES ('58', 'loading_icon', '4', '页面Loading图标设置', '1', '1:图标1\r\n2:图标2\r\n3:图标3\r\n4:图标4\r\n5:图标5\r\n6:图标6\r\n7:图标7', '页面Loading图标支持7种图标切换', '1505377202', '1512983062', '1', '7', '80');
INSERT INTO `blog_config` VALUES ('59', 'sys_file_field', '3', '文件字段配置', '3', '', 'key为模型名，值为文件列名。', '1505799386', '1512982406', '1', '0_article:file_id', '0');
INSERT INTO `blog_config` VALUES ('60', 'sys_picture_field', '3', '图片字段配置', '3', '', 'key为模型名，值为图片列名。', '1506315422', '1512982406', '1', '0_article:cover_id\r\n1_article:img_ids', '0');
INSERT INTO `blog_config` VALUES ('61', 'jwt_key', '1', 'JWT加密KEY', '4', '', '', '1506748805', '1510894595', '1', 'l2V|DSFXXXgfZp{8`;FjzR~6Y1_', '0');
INSERT INTO `blog_config` VALUES ('65', 'admin_allow_ip', '3', '超级管理员登录IP', '3', '', '后台超级管理员登录IP限制，其他角色不受限。', '1510995580', '1512982406', '1', '0:27.22.112.250', '0');
INSERT INTO `blog_config` VALUES ('66', 'pjax_mode', '8', 'PJAX模式', '3', '0:否\r\n1:是', '若为PJAX模式则浏览器不会刷新，若为常规模式则为AJAX+刷新', '1512370397', '1512982406', '1', '1', '120');
INSERT INTO `blog_config` VALUES ('67', 'editor_type', '4', '编辑器类型', '1', '0:富文本\r\n1:Markdown\r\n3:kingeditor', '', '1551151653', '1551261524', '1', '1', '0');

-- ----------------------------
-- Table structure for blog_driver
-- ----------------------------
DROP TABLE IF EXISTS `blog_driver`;
CREATE TABLE `blog_driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_name` varchar(40) NOT NULL DEFAULT '' COMMENT '服务标识',
  `driver_name` varchar(20) NOT NULL DEFAULT '' COMMENT '驱动标识',
  `config` text NOT NULL COMMENT '配置',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of blog_driver
-- ----------------------------

-- ----------------------------
-- Table structure for blog_file
-- ----------------------------
DROP TABLE IF EXISTS `blog_file`;
CREATE TABLE `blog_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '保存名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件表';

-- ----------------------------
-- Records of blog_file
-- ----------------------------

-- ----------------------------
-- Table structure for blog_hook
-- ----------------------------
DROP TABLE IF EXISTS `blog_hook`;
CREATE TABLE `blog_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `addon_list` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of blog_hook
-- ----------------------------
INSERT INTO `blog_hook` VALUES ('36', 'File', '文件上传钩子', 'File', '1', '0', '0');
INSERT INTO `blog_hook` VALUES ('37', 'Icon', '图标选择钩子', 'Icon', '1', '0', '0');
INSERT INTO `blog_hook` VALUES ('38', 'ArticleEditor', '富文本编辑器', 'Editor', '1', '0', '0');

-- ----------------------------
-- Table structure for blog_member
-- ----------------------------
DROP TABLE IF EXISTS `blog_member`;
CREATE TABLE `blog_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` char(16) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `leader_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '上级会员ID',
  `is_share_member` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否共享会员',
  `is_inside` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为后台使用者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of blog_member
-- ----------------------------

-- ----------------------------
-- Table structure for blog_menu
-- ----------------------------
DROP TABLE IF EXISTS `blog_menu`;
CREATE TABLE `blog_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `is_shortcut` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否快捷操作',
  `icon` char(30) NOT NULL DEFAULT '' COMMENT '图标',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of blog_menu
-- ----------------------------
INSERT INTO `blog_menu` VALUES ('1', '系统首页', '0', '1', 'admin', 'index/index', '0', '0', 'fa-home', '1', '1520506753', '0');
INSERT INTO `blog_menu` VALUES ('16', '用户管理', '0', '67', 'admin', 'member/index', '0', '0', 'fa-users', '1', '1548903227', '0');
INSERT INTO `blog_menu` VALUES ('17', '用户列表', '16', '1', 'admin', 'member/memberlist', '0', '1', 'fa-list', '1', '1548903253', '0');
INSERT INTO `blog_menu` VALUES ('18', '用户添加', '16', '2', 'admin', 'member/memberadd', '0', '0', 'fa-user-plus', '1', '1548903260', '0');
INSERT INTO `blog_menu` VALUES ('27', '权限管理', '16', '3', 'admin', 'auth/grouplist', '0', '0', 'fa-key', '1', '1520505512', '0');
INSERT INTO `blog_menu` VALUES ('32', '权限组编辑', '27', '0', 'admin', 'auth/groupedit', '1', '0', '', '1', '1492002620', '0');
INSERT INTO `blog_menu` VALUES ('34', '授权', '27', '0', 'admin', 'auth_manager/group', '1', '0', '', '1', '0', '0');
INSERT INTO `blog_menu` VALUES ('35', '菜单授权', '27', '0', 'admin', 'auth/menuauth', '1', '0', '', '1', '1492095653', '0');
INSERT INTO `blog_menu` VALUES ('36', '会员授权', '27', '0', 'admin', 'auth_manager/memberaccess', '1', '0', '', '1', '0', '0');
INSERT INTO `blog_menu` VALUES ('68', '系统管理', '0', '4', 'admin', 'config/group', '0', '0', 'fa-wrench', '1', '1548903161', '0');
INSERT INTO `blog_menu` VALUES ('69', '系统设置', '68', '3', 'admin', 'config/setting', '0', '0', 'fa-cogs', '1', '1520505460', '0');
INSERT INTO `blog_menu` VALUES ('70', '配置管理', '68', '2', 'admin', 'config/index', '0', '0', 'fa-cog', '1', '1520505457', '0');
INSERT INTO `blog_menu` VALUES ('71', '配置编辑', '70', '0', 'admin', 'config/configedit', '1', '0', '', '1', '1491674180', '0');
INSERT INTO `blog_menu` VALUES ('72', '配置删除', '70', '0', 'admin', 'config/configDel', '1', '0', '', '1', '1491674201', '0');
INSERT INTO `blog_menu` VALUES ('73', '配置添加', '70', '0', 'admin', 'config/configadd', '0', '0', 'fa-plus', '1', '1491666947', '0');
INSERT INTO `blog_menu` VALUES ('75', '菜单管理', '68', '1', 'admin', 'menu/index', '0', '0', 'fa-th-large', '1', '1520505453', '0');
INSERT INTO `blog_menu` VALUES ('98', '菜单编辑', '75', '0', 'admin', 'menu/menuedit', '1', '0', '', '1', '1512459021', '0');
INSERT INTO `blog_menu` VALUES ('124', '菜单列表', '75', '0', 'admin', 'menu/menulist', '0', '1', 'fa-list', '1', '1491318271', '0');
INSERT INTO `blog_menu` VALUES ('125', '菜单添加', '75', '0', 'admin', 'menu/menuadd', '0', '0', 'fa-plus', '1', '1491318307', '0');
INSERT INTO `blog_menu` VALUES ('126', '配置列表', '70', '0', 'admin', 'config/configlist', '0', '1', 'fa-list', '1', '1491666890', '1491666890');
INSERT INTO `blog_menu` VALUES ('127', '菜单状态', '75', '0', 'admin', 'menu/setstatus', '1', '0', '', '1', '1520506673', '1491674128');
INSERT INTO `blog_menu` VALUES ('128', '权限组添加', '27', '0', 'admin', 'auth/groupadd', '1', '0', '', '1', '1492002635', '1492002635');
INSERT INTO `blog_menu` VALUES ('134', '授权', '17', '0', 'admin', 'member/memberauth', '1', '0', '', '1', '1492238568', '1492101426');
INSERT INTO `blog_menu` VALUES ('135', '回收站', '68', '4', 'admin', 'trash/trashlist', '0', '0', ' fa-recycle', '1', '1520505468', '1492311462');
INSERT INTO `blog_menu` VALUES ('136', '回收站数据', '135', '0', 'admin', 'trash/trashdatalist', '1', '0', 'fa-database', '1', '1492319477', '1492319392');
INSERT INTO `blog_menu` VALUES ('140', '服务管理', '68', '5', 'admin', 'service/servicelist', '0', '0', 'fa-server', '1', '1520505473', '1492352972');
INSERT INTO `blog_menu` VALUES ('141', '插件管理', '68', '6', 'admin', 'addon/index', '0', '0', 'fa-puzzle-piece', '1', '1520505475', '1492427605');
INSERT INTO `blog_menu` VALUES ('142', '钩子列表', '141', '0', 'admin', 'addon/hooklist', '0', '0', 'fa-anchor', '1', '1492427665', '1492427665');
INSERT INTO `blog_menu` VALUES ('143', '插件列表', '141', '0', 'admin', 'addon/addonlist', '0', '0', 'fa-list', '1', '1492428116', '1492427838');
INSERT INTO `blog_menu` VALUES ('144', '文章管理', '0', '2', 'admin', 'article/index', '0', '0', 'fa-edit', '1', '1548903139', '1492480187');
INSERT INTO `blog_menu` VALUES ('145', '文章列表', '144', '0', 'admin', 'article/articlelist', '0', '1', 'fa-list', '1', '1492480245', '1492480245');
INSERT INTO `blog_menu` VALUES ('146', '分类管理', '144', '0', 'admin', 'article/articlecategorylist', '0', '0', 'fa-list', '1', '1548656872', '1492480342');
INSERT INTO `blog_menu` VALUES ('147', '文章分类编辑', '146', '0', 'admin', 'article/articlecategoryedit', '1', '0', '', '1', '1492485294', '1492485294');
INSERT INTO `blog_menu` VALUES ('148', '分类添加', '144', '0', 'admin', 'article/articlecategoryadd', '0', '0', 'fa-plus', '-1', '1548642148', '1492486576');
INSERT INTO `blog_menu` VALUES ('149', '文章添加', '144', '0', 'admin', 'article/articleadd', '0', '0', 'fa-plus', '-1', '1548642148', '1492518453');
INSERT INTO `blog_menu` VALUES ('150', '文章编辑', '145', '0', 'admin', 'article/articleedit', '1', '0', '', '1', '1492879589', '1492879589');
INSERT INTO `blog_menu` VALUES ('151', '插件安装', '143', '0', 'admin', 'addon/addoninstall', '1', '0', '', '1', '1492879763', '1492879763');
INSERT INTO `blog_menu` VALUES ('152', '插件卸载', '143', '0', 'admin', 'addon/addonuninstall', '1', '0', '', '1', '1492879789', '1492879789');
INSERT INTO `blog_menu` VALUES ('153', '文章删除', '145', '0', 'admin', 'article/articledel', '1', '0', '', '1', '1492879960', '1492879960');
INSERT INTO `blog_menu` VALUES ('154', '文章分类删除', '146', '0', 'admin', 'article/articlecategorydel', '1', '0', '', '1', '1492879995', '1492879995');
INSERT INTO `blog_menu` VALUES ('156', '驱动安装', '140', '0', 'admin', 'service/driverinstall', '1', '0', '', '1', '1502267009', '1502267009');
INSERT INTO `blog_menu` VALUES ('157', '接口管理', '0', '5', 'admin', 'api/index', '0', '0', 'fa fa-book', '1', '1520506753', '1504000434');
INSERT INTO `blog_menu` VALUES ('158', '分组管理', '157', '0', 'admin', 'api/apigrouplist', '0', '0', 'fa fa-fw fa-th-list', '1', '1504000977', '1504000723');
INSERT INTO `blog_menu` VALUES ('159', '分组添加', '157', '0', 'admin', 'api/apigroupadd', '0', '0', 'fa fa-fw fa-plus', '1', '1504004646', '1504004646');
INSERT INTO `blog_menu` VALUES ('160', '分组编辑', '157', '0', 'admin', 'api/apigroupedit', '1', '0', '', '1', '1504004710', '1504004710');
INSERT INTO `blog_menu` VALUES ('161', '分组删除', '157', '0', 'admin', 'api/apigroupdel', '1', '0', '', '1', '1504004732', '1504004732');
INSERT INTO `blog_menu` VALUES ('162', '接口列表', '157', '0', 'admin', 'api/apilist', '0', '0', 'fa fa-fw fa-th-list', '1', '1504172326', '1504172326');
INSERT INTO `blog_menu` VALUES ('163', '接口添加', '157', '0', 'admin', 'api/apiadd', '0', '0', 'fa fa-fw fa-plus', '1', '1504172352', '1504172352');
INSERT INTO `blog_menu` VALUES ('164', '接口编辑', '157', '0', 'admin', 'api/apiedit', '1', '0', '', '1', '1504172414', '1504172414');
INSERT INTO `blog_menu` VALUES ('165', '接口删除', '157', '0', 'admin', 'api/apidel', '1', '0', '', '1', '1504172435', '1504172435');
INSERT INTO `blog_menu` VALUES ('166', '优化维护', '0', '6', 'admin', 'maintain/index', '0', '0', 'fa-legal', '1', '1520506753', '1505387256');
INSERT INTO `blog_menu` VALUES ('168', '数据库', '166', '0', 'admin', 'maintain/database', '0', '0', 'fa-database', '1', '1505539670', '1505539394');
INSERT INTO `blog_menu` VALUES ('169', '数据备份', '168', '0', 'admin', 'database/databackup', '0', '0', 'fa-download', '1', '1506309900', '1505539428');
INSERT INTO `blog_menu` VALUES ('170', '数据还原', '168', '0', 'admin', 'database/datarestore', '0', '0', 'fa-exchange', '1', '1506309911', '1505539492');
INSERT INTO `blog_menu` VALUES ('171', '文件清理', '166', '0', 'admin', 'fileclean/cleanlist', '0', '0', 'fa-file', '1', '1506310152', '1505788517');
INSERT INTO `blog_menu` VALUES ('174', '行为日志', '166', '0', 'admin', 'log/loglist', '0', '1', 'fa-street-view', '1', '1507201516', '1507200836');
INSERT INTO `blog_menu` VALUES ('203', '友情链接', '214', '7', 'admin', 'blogroll/blogrolllist', '0', '0', 'fa-link', '1', '1549854244', '1520505717');
INSERT INTO `blog_menu` VALUES ('205', '链接添加', '203', '0', 'admin', 'blogroll/blogrolladd', '1', '0', 'fa-plus', '1', '1549854447', '1520505826');
INSERT INTO `blog_menu` VALUES ('206', '链接编辑', '203', '0', 'admin', 'blogroll/blogrolledit', '1', '0', 'fa-edit', '1', '1520505863', '1520505863');
INSERT INTO `blog_menu` VALUES ('207', '链接删除', '203', '0', 'admin', 'blogroll/blogrolldel', '1', '0', 'fa-minus', '1', '1520505889', '1520505889');
INSERT INTO `blog_menu` VALUES ('208', '菜单排序', '75', '0', 'admin', 'menu/setsort', '1', '0', '', '1', '1520506696', '1520506696');
INSERT INTO `blog_menu` VALUES ('209', '用户编辑', '16', '2', 'admin', 'member/memberedit', '1', '0', 'fa-edit', '1', '1548903267', '0');
INSERT INTO `blog_menu` VALUES ('210', '修改密码', '1', '2', 'admin', 'member/editpassword', '1', '0', 'fa-edit', '1', '1520505510', '0');
INSERT INTO `blog_menu` VALUES ('211', '标签管理', '144', '0', 'admin', 'tag/index', '0', '0', 'fa-tag', '1', '1548642240', '1548642240');
INSERT INTO `blog_menu` VALUES ('212', '标签编辑', '211', '0', 'admin', 'tag/edit', '1', '0', 'fa-edit', '1', '1548642559', '1548642441');
INSERT INTO `blog_menu` VALUES ('213', '标签删除', '211', '0', 'admin', 'tag/del', '1', '0', 'fa-remove', '1', '1548642554', '1548642468');
INSERT INTO `blog_menu` VALUES ('214', '功能管理', '0', '3', 'admin', 'banner/aaa', '0', '0', 'fa-qrcode', '1', '1548903504', '1548903089');
INSERT INTO `blog_menu` VALUES ('215', '横幅管理', '214', '0', 'admin', 'banner/index', '0', '0', 'fa-credit-card-alt', '1', '1548903569', '1548903569');
INSERT INTO `blog_menu` VALUES ('216', '公告管理', '214', '0', 'admin', 'notice/index', '0', '0', 'fa-sticky-note-o', '1', '1548903645', '1548903645');
INSERT INTO `blog_menu` VALUES ('217', '友情链接', '214', '0', 'admin', 'link/index', '0', '0', 'fa-exchange', '-1', '1549854210', '1548903710');
INSERT INTO `blog_menu` VALUES ('218', '留言管理', '214', '0', 'admin', 'comment/index', '0', '0', 'fa-comments', '1', '1550721241', '1548903786');

-- ----------------------------
-- Table structure for blog_notice
-- ----------------------------
DROP TABLE IF EXISTS `blog_notice`;
CREATE TABLE `blog_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_notice
-- ----------------------------
INSERT INTO `blog_notice` VALUES ('1', '212121', '212121', '1549852601', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('2', '21', '21212121', '1549852661', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('3', '2121', '2121', '1549852686', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('4', '2121', '21212121', '1549852807', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('5', '2121', '2121', '1549852820', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('6', '2121', '21212', '1549853124', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('7', '2121', '2121', '1549853166', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('8', '2121', '2121', '1549853173', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('9', '2121', '2121', '1549853180', '1549853594', '-1', '0');
INSERT INTO `blog_notice` VALUES ('10', '2121啊啊啊啊啊啊啊啊啊啊啊啊', '2121221212121', '1549853227', '1549853594', '-1', '6');
INSERT INTO `blog_notice` VALUES ('11', '公告测试', 'jdo环球网河里去华为可以环球网', '1549853615', '1549853615', '1', '0');

-- ----------------------------
-- Table structure for blog_picture
-- ----------------------------
DROP TABLE IF EXISTS `blog_picture`;
CREATE TABLE `blog_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片表';

-- ----------------------------
-- Records of blog_picture
-- ----------------------------
INSERT INTO `blog_picture` VALUES ('194', '1b90ccf924082d31df799f7e59dbb570.jpg', '20190125/1b90ccf924082d31df799f7e59dbb570.jpg', '', '14168fbfa15fd8707db85ac8d4a2e1f4bb2ab765', '1548398980', '1548398980', '1');
INSERT INTO `blog_picture` VALUES ('195', '9515f153a5e35ee85eef31dd047572ea.jpg', '20190125/9515f153a5e35ee85eef31dd047572ea.jpg', '', '691827a46cadeacdfaf578052effaecf24150dc5', '1548398980', '1548398980', '1');
INSERT INTO `blog_picture` VALUES ('196', '446082daeac4c1f190ab2ebdd8e23e61.jpg', '20190125/446082daeac4c1f190ab2ebdd8e23e61.jpg', '', '843a65301836baa63c1893f53ca3061db585a4a1', '1548398980', '1548398980', '1');
INSERT INTO `blog_picture` VALUES ('197', '9c0f9268ad19aac50e893bdfd28a69b9.jpg', '20190125/9c0f9268ad19aac50e893bdfd28a69b9.jpg', '', '152cece5dbac38b44a8aa12ba8ac606cf18986bf', '1548399009', '1548399009', '1');
INSERT INTO `blog_picture` VALUES ('198', '37cd63541c4508101133fbdfd7f9b3d3.jpg', '20190125/37cd63541c4508101133fbdfd7f9b3d3.jpg', '', '34ddab93e9fd065557ea526d5f999ffdb4fe2751', '1548404626', '1548404626', '1');
INSERT INTO `blog_picture` VALUES ('199', '4299cfcb73d90733429f5b6bc1242315.jpg', '20190131/4299cfcb73d90733429f5b6bc1242315.jpg', '', '45b77e4763c1a1abe36370a1ae31c9a90cb82f9e', '1548906702', '1548906702', '1');
INSERT INTO `blog_picture` VALUES ('200', '09566bdaaf53bafdab0802877d8876ab.jpg', '20190211/09566bdaaf53bafdab0802877d8876ab.jpg', '', 'c1456ec0e406ec6b45f838547701ec0fa896f160', '1549854336', '1549854336', '1');
INSERT INTO `blog_picture` VALUES ('201', '3a26296c35f121256fb10a43cce9feb6.jpg', '20190213/3a26296c35f121256fb10a43cce9feb6.jpg', '', '0dea38339eeb16d2991162c5f2a891166914af7b', '1550045499', '1550045499', '1');
INSERT INTO `blog_picture` VALUES ('202', '53d909ec67d75e3ea74ca362958092ba.jpg', '20190225/53d909ec67d75e3ea74ca362958092ba.jpg', '', '6444dc6a271f7af7d5fdcafb4ed58f051926f4b7', '1551085598', '1551085598', '1');
INSERT INTO `blog_picture` VALUES ('203', '719c21a71177022dc61ed7af02d3ca7b.jpg', '20190227/719c21a71177022dc61ed7af02d3ca7b.jpg', '', '1d72d50a512f253b6b937cdca0bc6f30fe2fb49e', '1551259746', '1551259746', '1');
INSERT INTO `blog_picture` VALUES ('204', '7d81c96a25facc61cc321983050c7851.jpg', '20190227/7d81c96a25facc61cc321983050c7851.jpg', '', 'e9dadf2260c72e8175c14b36d9f7a63579a7a6d4', '1551259915', '1551259915', '1');
INSERT INTO `blog_picture` VALUES ('205', '1162d1661e8fbb4833bc7122858f9e72.jpg', '20190227/1162d1661e8fbb4833bc7122858f9e72.jpg', '', '91d55949521e8491c1c795660b73643e6cfe5984', '1551260049', '1551260049', '1');
INSERT INTO `blog_picture` VALUES ('206', 'd1c0d12cd69adc15dbe7516079d242af.jpg', '20190227/d1c0d12cd69adc15dbe7516079d242af.jpg', '', '86fc35a914ab785a7c0e4650ef8d60fc397df3c0', '1551260928', '1551260928', '1');
INSERT INTO `blog_picture` VALUES ('207', '6be760e252b866826521d46d7a1ac2eb.jpg', '20190227/6be760e252b866826521d46d7a1ac2eb.jpg', '', '5172b8083083f6f16d42f1f1c4a081ce8310ca7d', '1551261493', '1551261493', '1');
INSERT INTO `blog_picture` VALUES ('208', '6bc2ef73c82c80d3b0f11ae7daa8922a.jpg', '20190227/6bc2ef73c82c80d3b0f11ae7daa8922a.jpg', '', '08f91685af2bef416e8fe35fcb2e925e4bfbd7a0', '1551261505', '1551261505', '1');
INSERT INTO `blog_picture` VALUES ('209', '3cd901006a1ccbed3151b0952184ef19.png', '20190227/3cd901006a1ccbed3151b0952184ef19.png', '', '1e84902297fd137fb6b808fae2dca3a183f89d98', '1551261562', '1551261562', '1');
INSERT INTO `blog_picture` VALUES ('210', 'cb722f0c9149225ce37763f25dea6397.jpg', '20190228/cb722f0c9149225ce37763f25dea6397.jpg', '', '45671227cfb15c4a5d58178f8a7c562a88fa440f', '1551334331', '1551334331', '1');
INSERT INTO `blog_picture` VALUES ('211', 'c82086a7efa56d5e2740ada95214dc55.jpg', '20190228/c82086a7efa56d5e2740ada95214dc55.jpg', '', '741866517d954f7526a5e93c5dbec93cd9a9124c', '1551336320', '1551336320', '1');
INSERT INTO `blog_picture` VALUES ('212', '2356a42a0098fc03b54b1484ff36d538.jpg', '20190228/2356a42a0098fc03b54b1484ff36d538.jpg', '', 'c95afd180a23d0d0965e358f413562e0c53efb9d', '1551336333', '1551336333', '1');
INSERT INTO `blog_picture` VALUES ('213', '265416b4ab92e33d1da1dc34f2d6a092.jpg', '20190228/265416b4ab92e33d1da1dc34f2d6a092.jpg', '', 'f6a7f2fa78a07968df7f8b8e1c58ca5743e3a5ed', '1551337369', '1551337369', '1');
INSERT INTO `blog_picture` VALUES ('214', '84157eb375bca3abfbace95fa72ab798.jpg', '20190228/84157eb375bca3abfbace95fa72ab798.jpg', '', '606179d3c9f562a4c34e1a11033e57c69d21cd6c', '1551337622', '1551337622', '1');
INSERT INTO `blog_picture` VALUES ('215', '796cc397763bba07ed507cab3c5481be.jpg', '20190228/796cc397763bba07ed507cab3c5481be.jpg', '', '139809f5a5dbdb127760992d5cd1e1b8c46a3cd4', '1551337696', '1551337696', '1');
INSERT INTO `blog_picture` VALUES ('216', 'f3d1648df151f4ca287b8f732f5992db.png', '20190301/f3d1648df151f4ca287b8f732f5992db.png', '', 'e539a079d6478c76f93cc4047aa0fd04e05186b2', '1551423191', '1551423191', '1');
INSERT INTO `blog_picture` VALUES ('217', '71876f4427fb4bdb6748aebc595bac4c.png', '20190301/71876f4427fb4bdb6748aebc595bac4c.png', '', '9ef64b5b19d0488afa629e3bfba69adddb9ca729', '1551423300', '1551423300', '1');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', '0', '1548654009', '1548655116', '-1', '1', '0');
INSERT INTO `blog_tag` VALUES ('2', '0', '1548654083', '1548655116', '-1', '1', '0');
INSERT INTO `blog_tag` VALUES ('3', '0', '1548654211', '1550030799', '-1', '1', '0');
INSERT INTO `blog_tag` VALUES ('4', '222', '1548655051', '1550030799', '-1', '1', '0');
INSERT INTO `blog_tag` VALUES ('5', '212121', '1548655070', '1550030824', '-1', '1', '0');
INSERT INTO `blog_tag` VALUES ('6', '函数', '1548655185', '1550030821', '-1', '1', '2');
INSERT INTO `blog_tag` VALUES ('13', 'PHP', '1550046174', '1550046174', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('7', '设计模式', '1548655388', '1550030830', '-1', '1', '0');
INSERT INTO `blog_tag` VALUES ('8', '接口', '1548655400', '1548655490', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('9', 'thinkPHP', '1548655437', '1548655437', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('10', 'MVC', '1548655447', '1548655447', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('11', '模板', '1548655459', '1548655459', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('12', '微信', '1548655485', '1548655485', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('14', 'JavaScript', '1550046192', '1550046192', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('15', 'SESSION', '1551082203', '1551082203', '1', '1', '0');
INSERT INTO `blog_tag` VALUES ('16', '插件', '1551339182', '1551339182', '1', '1', '0');

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` char(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `avatar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('10', 'mess', '412424561@qq.com', '17bcecc8bb4fcc80f5039509319f290f', '', '1551337698', '1549877776', '1', '211');
INSERT INTO `blog_user` VALUES ('11', '2121', '412424522@qq.com', '17bcecc8bb4fcc80f5039509319f290f', '', '1550027987', '1550027987', '1', '0');
INSERT INTO `blog_user` VALUES ('12', 'mess', '555555@qq.com', '17bcecc8bb4fcc80f5039509319f290f', '', '1551320053', '1551320053', '1', '0');

-- ----------------------------
-- Table structure for blog_word
-- ----------------------------
DROP TABLE IF EXISTS `blog_word`;
CREATE TABLE `blog_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en` varchar(255) NOT NULL DEFAULT '',
  `cn` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_word
-- ----------------------------
INSERT INTO `blog_word` VALUES ('1', 'Act enthusiastic and you will be enthusiastic.', '带着激情做事，你就会有激情。(卡耐基)', '1');
INSERT INTO `blog_word` VALUES ('2', 'Life consists not in holding good cards but in playing those you hold well.', '人生不在于抓到一副好牌，而在于打好你手里的牌。(Josh Billings)', '1');
INSERT INTO `blog_word` VALUES ('3', 'Success is the sum of small efforts, repeated day in and day out.', '成功就是日复一日那一点点小小努力的积累。', '1');
INSERT INTO `blog_word` VALUES ('4', 'After climbing a great hill, one only finds that there are many more hills to climb.', '登上高峰后，你会发现还有更多的山峰要翻越。', '1');
INSERT INTO `blog_word` VALUES ('5', 'A man is not old until his regrets take place of his dreams.', '只有当遗憾取代了梦想，人才算老。', '1');
INSERT INTO `blog_word` VALUES ('6', 'Nothing can help us endure dark times better than our faith.', '没有什么比信念更能支撑我们度过艰难的时光了。《纸牌屋》', '1');
INSERT INTO `blog_word` VALUES ('7', 'Figure out what you like. Try to become the best in the world of it.', '找到你喜欢做的事，并努力成为这个领域里的顶尖人物。', '1');
INSERT INTO `blog_word` VALUES ('8', 'If you can do what you do best and be happy, you\'re further along in life than most people.', '只要能把自己的事做好，并让自己快乐，你就领先于大多数人了。(莱昂纳多·迪卡普里奥)', '1');
INSERT INTO `blog_word` VALUES ('9', 'Things to do today:1.Get up; 2.Be awesome; 3.Go back to bed.', '今天的计划：1、起床；2、做牛B的事；3、睡觉。', '1');
INSERT INTO `blog_word` VALUES ('10', 'Pains make you stronger, tears make you braver, and heartbreaks make you wiser. So thank the past for a better future.', '伤痛让你更坚强，眼泪让你更勇敢，心碎让你更明智，所以，感谢过去，给我们带来更好的未来。', '1');
INSERT INTO `blog_word` VALUES ('11', 'Time waits for no one. Treasure every moment you have.', '时间不等人，珍惜你所拥有的每分每秒吧！', '1');
INSERT INTO `blog_word` VALUES ('12', 'No one but ourselves can degrade us.', '没人能够贬低我们，除非是我们自己。', '1');
INSERT INTO `blog_word` VALUES ('13', 'What is any ocean but a multitude of drops?', '没有众多的水滴又哪来的海洋呢？', '1');
INSERT INTO `blog_word` VALUES ('14', 'Life does not have to be perfect to be wonderful.', '精彩的人生不必苛求完美。(Annette Funicello)', '1');
INSERT INTO `blog_word` VALUES ('15', 'That there\'s some good in this world, and it\'s worth fighting for.', '这世上一定存在着善良，值得我们奋战到底。', '1');
INSERT INTO `blog_word` VALUES ('16', 'The beginning is the most important part of the work.', '开始阶段是工作最重要的部分。', '1');
INSERT INTO `blog_word` VALUES ('17', 'There\'s no one I\'d rather be than me.', '除了我自己，我不愿作任何人。', '1');
INSERT INTO `blog_word` VALUES ('18', 'We\'ll have a fresh start for the year ahead.', '一元复始，万象更新。', '1');
INSERT INTO `blog_word` VALUES ('19', 'Take a few minutes to appreciate what you have and how far you\'ve come.', '稍稍沉下心来，欣赏自己拥有的和所完成的。', '1');
INSERT INTO `blog_word` VALUES ('20', 'I\'m not old! Age is nothing!', '我不老！年龄不是问题！(李娜)', '1');
INSERT INTO `blog_word` VALUES ('21', 'Today, at the edge of our hope, at the end of our time, we have chosen not only to believe in ourselves, but in each other.', '今天，在希望的边缘，在时代的终结，我们不仅仅选择了相信自己，还选择了相信彼此。', '1');
INSERT INTO `blog_word` VALUES ('22', 'The rough road often leads to the top.', '艰难的道路经常通往高处。', '1');
INSERT INTO `blog_word` VALUES ('23', 'All the advantage isn\'t in running fast, but rather in getting an early start.', '优势不在于跑得快，而在于起身早。', '1');
INSERT INTO `blog_word` VALUES ('24', 'It does not matter how slowly you go as long as you do not stop.', '前进缓慢没关系，只要你别停下脚步。', '1');
INSERT INTO `blog_word` VALUES ('25', 'Try and fail, but don\'t fail to try.', '尝试后可能会放弃，但千万不能放弃尝试。', '1');
INSERT INTO `blog_word` VALUES ('26', 'If you really want to do something, you\'ll find a way. If you don\'t, you\'ll find an excuse.', '如果你真的想做什么事，你会找到方法。如果你不想，那你只能找到借口。', '1');
INSERT INTO `blog_word` VALUES ('27', 'In life, patience is the key. It\'s much better to be going somewhere slowly than nowhere fast.', '人生，关键是要有耐心。奔着目标，慢慢走，会好过毫无目标，傻傻往前冲。', '1');
INSERT INTO `blog_word` VALUES ('28', 'Try your best, even if the task seems difficult.', '全力以赴，即使任务看起来超有难度。', '1');
INSERT INTO `blog_word` VALUES ('29', 'Hello 2014!May all my wishes come true.', '你好，2014！希望一切愿望都能实现！', '1');
INSERT INTO `blog_word` VALUES ('30', 'Forget all the reasons why it won\'t work, and believe the one reason why it will.', '忘掉所有那些“不可能”的借口，去坚持那一个“可能”的理由。', '1');
INSERT INTO `blog_word` VALUES ('31', 'The distance between your dreams and reality is called action.', '梦想和现实之间的那段距离，叫做行动。', '1');
INSERT INTO `blog_word` VALUES ('32', 'We must face tomorrow, whatever it may hold, with determination, joy, and bravery.', '无论明天怎样，我们都要带着决心、快乐和勇气去面对。', '1');
INSERT INTO `blog_word` VALUES ('33', 'Life is a roller coaster. You can scream every time you hit a bump, or you can throw your hands up and enjoy the ride.', '生活就像过山车，你可以在每次颠簸的时候尖叫，你也可以高举双手享受整个过程。', '1');
INSERT INTO `blog_word` VALUES ('34', 'Death is so final, whereas life is so full of possibilities.', '死了可什么都没了，而活着就有无限的可能。《权力的游戏》', '1');
INSERT INTO `blog_word` VALUES ('35', 'Progress is impossible without change, and those who cannot change their minds cannot change anything.', '没有改变，不可能会有进步。无法改变想法的人，什么事情也改变不了。（萧伯纳）', '1');
INSERT INTO `blog_word` VALUES ('36', 'It\'s better to have fought and lost, than never to have fought at all.', '奋战过失败，胜过不战而败。', '1');
INSERT INTO `blog_word` VALUES ('37', 'Life is too short for us to wake up in the morning with regrets.', '人生苦短，所以每天不要带着遗憾醒来。', '1');
INSERT INTO `blog_word` VALUES ('38', 'Doing what you like is freedom. Liking what you do is happiness.', '自由是做你喜欢做的事，幸福是喜欢你做的事。', '1');
INSERT INTO `blog_word` VALUES ('39', 'If you want something you\'ve never had, you must be willing to do something you\'ve never done.', '如果你想拥有从未有过的东西，那么你必须去做你从未做过的事。(Thomas Jefferson)', '1');
INSERT INTO `blog_word` VALUES ('40', 'Every day may not be good, but there\'s something good in every day.', '也许不是每天都那么美好，但每天都会有一些小美好存在。', '1');
INSERT INTO `blog_word` VALUES ('41', 'Be strong, believe in who you are; be strong, believe in what you feel.', '强大一些，要相信你自己；强大一些，要相信自己的感觉。', '1');
INSERT INTO `blog_word` VALUES ('42', 'If you\'re lucky enough to be different, don\'t ever change.', '如果你很幸运能够与别人不同，请不要改变。', '1');
INSERT INTO `blog_word` VALUES ('43', 'Everything will be okay in the end. If it\'s not okay, it\'s not the end.', '每件事最后都会是好事。如果不是好事，说明还没到最后。', '1');
INSERT INTO `blog_word` VALUES ('44', 'Hope my warm \'Hello\' will brighten up your World Hello Day.', '让我的温暖的问候照亮你的世界问候日。', '1');
INSERT INTO `blog_word` VALUES ('45', 'Don\'t give up, just be you. Because life\'s too short to be anybody else.', '不要放弃做自己，人生很短，根本没时间模仿别人。', '1');
INSERT INTO `blog_word` VALUES ('46', 'Smile and let everyone know that today you\'re a lot stronger than you were yesterday.', '用微笑告诉世人，今天的你比昨天更加强大。', '1');
INSERT INTO `blog_word` VALUES ('47', 'Great minds have purpose, others have wishes.', '伟大的人有目标，平庸的人只有愿望。', '1');
INSERT INTO `blog_word` VALUES ('48', 'A strong man stands up for himself. A stronger man stands up for others.', '强人为自己，更强的人为大家。', '1');
INSERT INTO `blog_word` VALUES ('49', 'The only person you should try to be better than, is who you were yesterday.', '你唯一应该超越的人，是昨天的自己。', '1');
INSERT INTO `blog_word` VALUES ('50', 'All you can do is to try your best. Even with those small steps, you\'re closer to your goal than you were yesterday.', '我们能做的只是拼尽全力，即使迈出的步子再小，也比昨天要更接近自己的目标。', '1');
INSERT INTO `blog_word` VALUES ('51', 'A smile is the shortest distance between two people.', '微笑是人与人之间最短的距离。', '1');
INSERT INTO `blog_word` VALUES ('52', 'Do or do not. There is no try.', '要么做，要么滚！没有试试看这一说。', '1');
INSERT INTO `blog_word` VALUES ('53', 'Courage is being afraid but going on anyhow.', '勇气就是虽感恐惧，但仍会前行。', '1');
INSERT INTO `blog_word` VALUES ('54', 'A man can be destroyed but not defeated.', '人可以被毁灭，但不可以被打败。', '1');
INSERT INTO `blog_word` VALUES ('55', 'A truly happy person is one who can enjoy the scenery while on a detour.', '真正快乐的人是那种在走弯路时也不忘享受风景的人。', '1');
INSERT INTO `blog_word` VALUES ('56', 'No dream is too big, and no dreamer is too small.', '梦想再大也不嫌大，追梦的人再小也不嫌小。', '1');
INSERT INTO `blog_word` VALUES ('57', 'It doesn\'t matter how many times you fail. What matters is how many times you stand up and try again.', '失败多少次不重要，重要的是你能重新站起来多少次，并且继续前行。', '1');
INSERT INTO `blog_word` VALUES ('58', 'Silence is the most powerful cry.', '沉默是最有力的呐喊。《美丽人生》', '1');
INSERT INTO `blog_word` VALUES ('59', 'A little consideration, a little thought for others makes all the difference.', '一点点体贴，一点点为他人着想，会让一切都不一样。', '1');
INSERT INTO `blog_word` VALUES ('60', 'Stop waiting for things to happen.Go out and make them happen.', '别指望事情会自然发生，行动起来，让它们变成可能！', '1');
INSERT INTO `blog_word` VALUES ('61', 'Don\'t look forward to tomorrow, don\'t miss yesterday, to grasp today.', '不憧憬明天，不留念昨天，只把握今天。', '1');
INSERT INTO `blog_word` VALUES ('62', 'Now we don\'t call it alive. It\'s just not to die.', '我们现在不叫活着，这只是没有死去。《疯狂原始人》', '1');
INSERT INTO `blog_word` VALUES ('63', 'You can change your life if you want to. Sometimes you have to be hard on yourself, but you can change it completely.', '有志者事竟成。有时虽劳其筋骨，但命运可以彻底改变。《唐顿庄园》', '1');
INSERT INTO `blog_word` VALUES ('64', 'Time will bring a surprise, if you believe.', '时间会带来惊喜，如果你相信的话。《浮生物语》', '1');
INSERT INTO `blog_word` VALUES ('65', 'What others think is not important . How you feel about yourself is all that matters.', '别人怎么想并不重要，你怎么看自己才是关键。', '1');
INSERT INTO `blog_word` VALUES ('66', 'Don\'t cry because it is over,smile because it happened.', '不要因为结束而哭泣，微笑吧，因为你曾经拥有。', '1');
INSERT INTO `blog_word` VALUES ('67', 'Tomorrow is never clear. Our time is here.', '明天是未知的，我们还是享受此刻吧！《摇滚夏令营》', '1');
INSERT INTO `blog_word` VALUES ('68', 'Life is either a daring adventure or nothing at all.', '生活要么大胆尝试，要么什么都不是。', '1');
INSERT INTO `blog_word` VALUES ('69', 'Pursue excellence and success will follow.', '追求卓越，成功自然来。《三傻大闹宝莱坞》', '1');
INSERT INTO `blog_word` VALUES ('70', 'Climb mountains not so the world can see you, but so you can see the world.', '爬上山顶并不是为了让全世界看到你，而是让你看到整个世界。', '1');
INSERT INTO `blog_word` VALUES ('71', 'Every step towards your dream today is a step away from your regret tomorrow.', '今日为梦想所付出的每一份努力都会减少明日的一份后悔。', '1');
INSERT INTO `blog_word` VALUES ('72', 'It\'s never too late to be what you might have been.', '勇敢做自己，永远都不迟。（乔治·艾略特）', '1');
INSERT INTO `blog_word` VALUES ('73', 'It\'s time to start living the life you\'ve imagined.', '是时候开始过自己想要的生活了！', '1');
INSERT INTO `blog_word` VALUES ('74', 'There\'s nothing more beautiful than a smile that struggles through tears.', '世上最美的，莫过于从泪水中挣脱出来的那个微笑。', '1');
INSERT INTO `blog_word` VALUES ('75', 'When you want to succeed as bad as you want to breathe, then you\'ll be successful.', '当你对成功的渴望犹如呼吸般得不可或缺，你就一定会成功。', '1');
INSERT INTO `blog_word` VALUES ('76', 'When you have choices, choose the best. When you have no choice, do your best.', '有选择时，选最好的。没选择时，尽力做到最好。', '1');
INSERT INTO `blog_word` VALUES ('77', 'Don\'t follow others\' steps when making your own trip.', '不要踩着别人的脚印，找自己的路。', '1');
INSERT INTO `blog_word` VALUES ('78', 'Life is not the amount of breaths you take, it\'s the moments that take your breath away.', '生命的真谛不在于你呼吸的次数，而在于那些令你怦然心动到无法呼吸的时刻。', '1');
INSERT INTO `blog_word` VALUES ('79', 'Every new day is another chance to change your life.', '每天都会是改变命运的机会。', '1');
INSERT INTO `blog_word` VALUES ('80', 'Stop trying to find a rewind.It\'s life, not a movie.', '别妄想着倒带，这是生活，不是电影。', '1');
INSERT INTO `blog_word` VALUES ('81', 'The man who has made up his mind to win will never say \' Impossible\'.', '凡是决心取得胜利的人从来不说“不可能”。(拿破仑)', '1');
INSERT INTO `blog_word` VALUES ('82', 'Done is better than perfect.', '比完美更重要的是完成。', '1');
INSERT INTO `blog_word` VALUES ('83', 'I can make it through the rain. I can stand up once again on my own.', '我可以穿越云雨，也可以东山再起。(玛丽亚·凯莉)', '1');
INSERT INTO `blog_word` VALUES ('84', 'There is no point in living if you can\'t feel alive.', '活着没有生气，那活着也没有意义。', '1');
INSERT INTO `blog_word` VALUES ('85', 'Turn the page on yesterday. Only ever think about today and tomorrow.', '把昨天翻过去，只去考虑今天和明天。', '1');
INSERT INTO `blog_word` VALUES ('86', 'Chance favors only the prepared mind.', '机会总眷顾有准备的人。', '1');
INSERT INTO `blog_word` VALUES ('87', 'Trust is like an eraser. It gets smaller and smaller after every mistake.', '信任就像橡皮擦，每犯一次错，就会变小一点。', '1');
INSERT INTO `blog_word` VALUES ('88', 'Life is tough, but I\'m tougher.', '生活很艰苦，但我更坚强。', '1');
INSERT INTO `blog_word` VALUES ('89', 'If you do not think about your future, you cannot have it.', '如果你不思考未来，你就不会有未来。', '1');
INSERT INTO `blog_word` VALUES ('90', 'Do what you can, with what you have, where you are.', '在你所处的位置，用你所有的资源，做你力所能及的事。(西奥多·罗斯福)', '1');
INSERT INTO `blog_word` VALUES ('91', 'There are no perfect relationships. It\'s how you accept the imperfections that makes it perfect.', '没有完美的情感，重要的是你如何接受不完美而让它完美。', '1');
INSERT INTO `blog_word` VALUES ('92', 'You can\'t have a better tomorrow if you\'re still thinking about yesterday.', '如果你还在纠结于昨天，就不会拥有更美好的明天。', '1');
INSERT INTO `blog_word` VALUES ('93', 'It is not because things are difficult that we do not dare, it is because we do not dare that things are difficult.', '并不是因为事情难我们才不敢做，而是因为我们不敢做事情才难。(Seneca Roman)', '1');
INSERT INTO `blog_word` VALUES ('94', 'Your heart is free. Have the courage to follow it.', '你的心是自由的，要有勇气追随它。', '1');
INSERT INTO `blog_word` VALUES ('95', 'How can men succumb to force?', '男人怎么能屈服于“武力”之下？《海贼王》', '1');
INSERT INTO `blog_word` VALUES ('96', 'Life is like live TV show. There is no rehearsal.', '人生没有彩排，只有现场直播。', '1');
INSERT INTO `blog_word` VALUES ('97', 'Dress shabbily and they remember the dress; dress impeccably and they remember the woman.', '穿着破旧，人们记住衣服；穿着无瑕，人们则记住衣服里的女人。(Coco Chanel)', '1');
INSERT INTO `blog_word` VALUES ('98', 'Hope is a good thing, maybe the best of things. And no good thing ever dies.', '希望是一件好事，也许是人间至善，而美好的事永不消逝。《肖申克的救赎》', '1');
INSERT INTO `blog_word` VALUES ('99', 'There are so many beautiful reasons to be happy.', '有太多太多美好的理由让你笑对生活。', '1');
INSERT INTO `blog_word` VALUES ('100', 'Where the more different you are, the better.', '你们之间越是不同，越好。(Glee)', '1');
INSERT INTO `blog_word` VALUES ('101', 'I\'m only brave when I have to be. Being brave doesn\'t mean you go looking for trouble.', '我只在必要时才勇敢，勇敢并不代表你要到处闯祸。《狮子王》', '1');
INSERT INTO `blog_word` VALUES ('102', 'Behind every successful man there\'s a lot of unsuccessful years.', '每个牛B的成功者都经历过苦B的岁月。(鲍博.布朗)', '1');
INSERT INTO `blog_word` VALUES ('103', 'If you want something done, do it yourself.', '靠谁都不如靠自己。《第五元素》', '1');
INSERT INTO `blog_word` VALUES ('104', 'Life is a wonderful journey. Make it your journey and not someone else\'s.', '生命是一段精彩旅程，要活的有自己的样子，而不是别人的影子。', '1');
INSERT INTO `blog_word` VALUES ('105', 'No matter how many mistakes you make or how slowly you progress, you are already ahead of those who never tried.', '无论你犯了多少错，或者进步得有多慢，你都走在了那些不曾尝试的人的前面。', '1');
INSERT INTO `blog_word` VALUES ('106', 'Some things are so important that they force us to overcome our fears.', '总有些更重要的事情，赋予我们打败恐惧的勇气。', '1');
INSERT INTO `blog_word` VALUES ('107', 'Say to yourself: \'No matter how many obstacles I encounter in life, I will do all that I can to complete the whole course.\'', '请对自己说：无论生活之路上会遇到多少障碍，我会竭尽所能地跑完这一程。', '1');
INSERT INTO `blog_word` VALUES ('108', 'No cross, no crown.', '不经历风雨，怎么见彩虹。', '1');
INSERT INTO `blog_word` VALUES ('109', 'Try not to become a man of success but rather try to become a man of value.', '与其努力成功，不如努力成为有价值的人。(爱因斯坦)', '1');
INSERT INTO `blog_word` VALUES ('110', 'Remember when life\'s path is steep to keep your mind even.', '记住：当人生很苦逼的时候，你要保持淡定。', '1');
INSERT INTO `blog_word` VALUES ('111', 'If you\'re brave enough to say GOODBYE, life will reward you with a new HELLO.', '只要你勇敢地说出再见，生活一定会给你一个新的开始。', '1');
INSERT INTO `blog_word` VALUES ('112', 'Sometimes the right path is not the easiest one.', '对的那条路，往往不是最好走的。', '1');
INSERT INTO `blog_word` VALUES ('113', 'Just trust yourself, then you will know how to live.', '只要相信自己，你就会懂得如何去生活。', '1');
INSERT INTO `blog_word` VALUES ('114', 'In life it\'s not where you go. It\'s who you travel with.', '生命中，重要的不是你去哪里，而是与谁同行。', '1');
INSERT INTO `blog_word` VALUES ('115', 'Life is like a rainbow. You don\'t always know what\'s on the other side, but you know it\'s there.', '生活像一道彩虹，你不知道另一端通向哪里，但你会知道，它总是在那里。', '1');
INSERT INTO `blog_word` VALUES ('116', 'When the world says,\'Give up!\'Hope whispers,\'Try it one more time.\'', '当全世界都在说“放弃”的时候，希望却在耳边轻轻地说：“再试一次吧”！', '1');
INSERT INTO `blog_word` VALUES ('117', 'I don\'t care about other questions and I just try to be myself.', '我不在乎别人的质疑，我只会做好自己。', '1');
INSERT INTO `blog_word` VALUES ('118', 'Attempt doesn\'t necessarily bring success, but giving up definitely leads to failure.', '努力不一定成功，但放弃一定失败！', '1');
INSERT INTO `blog_word` VALUES ('119', 'The best preparation for tomorrow is doing your best today.', '对明天最好的准备就是今天做到最好。', '1');
INSERT INTO `blog_word` VALUES ('120', 'You are already naked. There is no reason not to follow your heart.', '你已经一无所有，没有什么道理不顺心而为。(乔布斯)', '1');
INSERT INTO `blog_word` VALUES ('121', 'Life is a journey, one that is much better traveled with a companion by our side.', '人生是一场旅程，我们最好结伴同行。', '1');
INSERT INTO `blog_word` VALUES ('122', 'Sometimes you have to fall before you can fly.', '有时候，你得先跌下去，才能飞起来。', '1');
INSERT INTO `blog_word` VALUES ('123', 'If you are able to appreciate beauty in the ordinary, your life will be more vibrant.', '如果你擅于欣赏平凡中的美好，你的生活会更加多姿多彩。', '1');
INSERT INTO `blog_word` VALUES ('124', 'Be who you are, and never ever apologize for that!', '坚持做自己，并永远不要为此而后悔！', '1');
INSERT INTO `blog_word` VALUES ('125', 'Consider the bad times as down payment for the good times. Hang in there.', '把苦日子当做好日子的首付，坚持就是胜利！', '1');
INSERT INTO `blog_word` VALUES ('126', 'Do not pray for easy lives, pray to be stronger.', '与其祈求生活平淡点，还不如祈求自己强大点。', '1');
INSERT INTO `blog_word` VALUES ('127', 'Everybody can fly without wings when they hold on to their dreams.', '坚持自己的梦想，即使没有翅膀也能飞翔。', '1');
INSERT INTO `blog_word` VALUES ('128', 'There is no such thing as a great talent without great will power.', '没有伟大的意志力，便没有雄才大略。', '1');
INSERT INTO `blog_word` VALUES ('129', 'You can\'t change your situation. The only thing that you can change is how you choose to deal with it.', '境遇难以改变，你能改变的唯有面对它时的态度。', '1');
INSERT INTO `blog_word` VALUES ('130', 'Whatever is worth doing at all is worth doing well.', '凡是值得做的事，就值得做好。', '1');
INSERT INTO `blog_word` VALUES ('131', 'Perfection is not just about control.It\'s also about letting go.', '完美不仅在于控制，也在于释放。 《黑天鹅》', '1');
INSERT INTO `blog_word` VALUES ('132', 'Dream is what makes you happy, even when you are just trying.', '梦想就是一种让你感到坚持就是幸福的东西。', '1');
INSERT INTO `blog_word` VALUES ('133', 'Never frown,because you never know who is falling in love with your smile.', '别愁眉不展，因为你不知道谁会爱上你的笑容。', '1');
INSERT INTO `blog_word` VALUES ('134', 'It\'s easy once you know how.', '一旦你明白，就会很简单。', '1');
INSERT INTO `blog_word` VALUES ('135', 'In order to be irreplaceable, one must always be different.', '要做到不可替代，就要与众不同。', '1');
INSERT INTO `blog_word` VALUES ('136', 'I honestly think it is better to be a failure at something you love than to be a success at something you hate.', '宁愿失败地做你爱做的事情，也不要成功地做你恨做的事情。(George Burns)', '1');
INSERT INTO `blog_word` VALUES ('137', 'Don\'t hide. Run! You\'ll make it to tomorrow.', '别躲避，奔跑吧，你就会找到明天。', '1');
INSERT INTO `blog_word` VALUES ('138', 'Life comes with many challenges.The ones that should not scare us are the ones we can take on and take control of.', '生活充满了挑战，唯有勇敢面对并自我掌控，我们才能克服恐惧。(安吉丽娜·朱莉)', '1');
INSERT INTO `blog_word` VALUES ('139', 'Life doesn\'t just happen to you; you receive everything in your life based on what you\'ve given.', '一切发生在你身上的都不是碰巧。你获得什么，在于你付出了什么。', '1');
INSERT INTO `blog_word` VALUES ('140', 'You are more beautiful than you think.', '你，要比你想象的更美丽。', '1');
INSERT INTO `blog_word` VALUES ('141', 'Throughout life\'s complications, you should maintain such a sense of elegance.', '不管生活有多不容易，你都要守住自己的那一份优雅。', '1');
INSERT INTO `blog_word` VALUES ('142', 'When you feel like giving up, remember why you held on so long in the first place.', '每当你想要放弃的时候，就想想是为了什么才一路坚持到现在。', '1');
INSERT INTO `blog_word` VALUES ('143', 'Enjoy your youth.You\'ll never be younger than you are at this very moment.', '好好享受青春，你再也不会有哪个时刻会比此时更年轻了。', '1');
INSERT INTO `blog_word` VALUES ('144', 'You\'d better bring, cause I\'ll bring every I\'ve got it.', '你最好全神贯注，因为我定会全力以赴！', '1');
INSERT INTO `blog_word` VALUES ('145', 'Take time to enjoy the simple things in life.', '慢慢享受生活中的简单。', '1');
INSERT INTO `blog_word` VALUES ('146', 'As long as you are still alive, you will definitely encounter the good things in life.', '只要活着就一定会遇上好事。', '1');
INSERT INTO `blog_word` VALUES ('147', 'Hold on, it gets better than you know.', '挺住，事情会比你想像中要好！', '1');
INSERT INTO `blog_word` VALUES ('148', 'If you are fine,the sun will always shine.', '你若安好，便是晴天。', '1');
INSERT INTO `blog_word` VALUES ('149', 'What doesn\'t kill you makes you stronger.', '磨难会让你更强大。', '1');
INSERT INTO `blog_word` VALUES ('150', 'Every life deserves our respect.', '每一个生命都应该被尊重。', '1');
INSERT INTO `blog_word` VALUES ('151', 'The best feeling in the world is when you know your heart is smiling.', '世间最美好的感受，就是发现自己的心在笑。', '1');
INSERT INTO `blog_word` VALUES ('152', 'Don\'t ever underestimate the heart of a champion.', '永远不要低估一颗冠军的心。(Rudy Tomjanovich)', '1');
INSERT INTO `blog_word` VALUES ('153', 'There is nothing permanent except change.', '唯一不变的是变化。', '1');
INSERT INTO `blog_word` VALUES ('154', 'The difference between successful persons and others is that they really act.', '成功者和其他人最大的区别就是，他们真正动手去做了。', '1');
INSERT INTO `blog_word` VALUES ('155', 'Don\'t follow the crowd, let the crowd follow you.', '不要随波逐流，要引领潮流。(Margaret Thatcher)', '1');
INSERT INTO `blog_word` VALUES ('156', 'People pay in advance for a coffee meant for someone who cannot afford a warm beverage.', '人们提前买咖啡，让付不起的人享受温暖。', '1');
INSERT INTO `blog_word` VALUES ('157', 'No one is born a genius.Just keep on doing what you like and that itself is a talent.', '哪有什么天才！坚持做你喜欢的事情，这本身就是一种天赋。(大野智)', '1');
INSERT INTO `blog_word` VALUES ('158', 'The world is a book, and those who do not travel read only one page.', '世界是一本书，不旅行的人只读了其中一页。', '1');
INSERT INTO `blog_word` VALUES ('159', 'You can create something more glorious than the championship.', '你可以创造比冠军更荣耀的事。', '1');
INSERT INTO `blog_word` VALUES ('160', 'You never get a second chance to make a first impression.', '永远没有第二次机会，给人留下第一印象。', '1');
INSERT INTO `blog_word` VALUES ('161', 'You can always be a worse version of \'him\', or better version of yourself.', '你不是要做一个单纯优秀的人，而是要做一个不可替代的人。', '1');
INSERT INTO `blog_word` VALUES ('162', 'Give every day the chance to become the most beautiful day of your life.', '让每一天都有机会成为你人生中最美好的一天。', '1');
INSERT INTO `blog_word` VALUES ('163', 'Honesty is the best policy.', '做人以诚信为本。', '1');
INSERT INTO `blog_word` VALUES ('164', 'To a crazy ship all winds are contrary.', '对于一只漫无目标的船而言，任何方向的风都是逆风。', '1');
INSERT INTO `blog_word` VALUES ('165', 'The outer world you see is a reflection of your inner self.', '你看到什么样的世界，你就拥有什么样的内心。', '1');
INSERT INTO `blog_word` VALUES ('166', 'Strike while the iron is hot.', '趁热打铁。', '1');
INSERT INTO `blog_word` VALUES ('167', 'Knowing what you cannot do is far more important than knowing what you are capable of.', '知道自己不能做什么远比知道自己能做什么重要。', '1');
INSERT INTO `blog_word` VALUES ('168', 'People cry, not because they\'re weak. It\'s because they\'ve been strong for too long.', '哭泣，不代表脆弱，只因坚强了太久。', '1');
INSERT INTO `blog_word` VALUES ('169', 'Don\'t let yesterday use up too much of today.', '别留念昨天了，把握好今天吧。(Will Rogers)', '1');
INSERT INTO `blog_word` VALUES ('170', 'If you are not brave enough, no one will back you up.', '你不勇敢，没人替你坚强。', '1');
INSERT INTO `blog_word` VALUES ('171', 'If you don\'t build your dream, someone will hire you to build theirs.', '如果你没有梦想，那么你只能为别人的梦想打工。', '1');
INSERT INTO `blog_word` VALUES ('172', 'Beauty is all around, if you just open your heart to see.', '只要你给自己机会，你会发现你的世界可以很美丽。', '1');
INSERT INTO `blog_word` VALUES ('173', 'The difference in winning and losing is most often...not quitting.', '赢与输的差别通常是--不放弃。(华特·迪士尼)', '1');
INSERT INTO `blog_word` VALUES ('174', 'I am ordinary yet unique.', '我很平凡，但我独一无二。', '1');
INSERT INTO `blog_word` VALUES ('175', 'I like people who make me laugh in spite of myself.', '我喜欢那些让我笑起来的人，就算是我不想笑的时候。', '1');
INSERT INTO `blog_word` VALUES ('176', 'Image a new story for your life and start living it.', '为你的生命想一个全新剧本，并去倾情出演吧！', '1');
INSERT INTO `blog_word` VALUES ('177', 'I\'d rather be a happy fool than a sad sage.', '做个悲伤的智者，不如做个开心的傻子。', '1');
INSERT INTO `blog_word` VALUES ('178', 'The future belongs to those who believe in the beauty of their dreams.', '未来属于那些相信梦想之美的人。(埃莉诺·罗斯福)', '1');
INSERT INTO `blog_word` VALUES ('179', 'Even if you get no applause, you should accept a curtain call gracefully and appreciate your own efforts.', '即使没有人为你鼓掌，也要优雅的谢幕，感谢自己的认真付出。', '1');
INSERT INTO `blog_word` VALUES ('180', 'Don\'t let dream just be your dream.', '别让梦想只停留在梦里。', '1');
INSERT INTO `blog_word` VALUES ('181', 'A day without laughter is a day wasted.', '没有笑声的一天是浪费了的一天。(卓别林)', '1');
INSERT INTO `blog_word` VALUES ('182', 'Travel and see the world; afterwards, you will be able to put your concerns in perspective.', '去旅行吧，见的世面多了，你会发现原来在意的那些结根本算不了什么。', '1');
INSERT INTO `blog_word` VALUES ('183', 'The key to acquiring proficiency in any task is repetition.', '任何事情成功关键都是熟能生巧。《生活大爆炸》', '1');
INSERT INTO `blog_word` VALUES ('184', 'You can be happy no matter what.', '开心一点吧，管它会怎样。', '1');
INSERT INTO `blog_word` VALUES ('185', 'A good plan today is better than a perfect plan tomorrow.', '今天的好计划胜过明天的完美计划。', '1');
INSERT INTO `blog_word` VALUES ('186', 'Nothing is impossible, the word itself says \'I\'m possible\'!', '一切皆有可能！“不可能”的意思是：“不，可能。”(奥黛丽·赫本)', '1');
INSERT INTO `blog_word` VALUES ('187', 'Life isn\'t fair, but no matter your circumstances, you have to give it your all.', '生活是不公平的，不管你的境遇如何，你只能全力以赴。', '1');
INSERT INTO `blog_word` VALUES ('188', 'No matter how hard it is, just keep going because you only fail when you give up.', '无论多么艰难，都要继续前进，因为只有你放弃的那一刻，你才输了。', '1');
INSERT INTO `blog_word` VALUES ('189', 'It requires hard work to give off an appearance of effortlessness.', '你必须十分努力，才能看起来毫不费力。', '1');
INSERT INTO `blog_word` VALUES ('190', 'Life is like riding a bicycle.To keep your balance,you must keep moving.', '人生就像骑单车，只有不断前进，才能保持平衡。(爱因斯坦)', '1');
INSERT INTO `blog_word` VALUES ('191', 'Be thankful for what you have.You\'ll end up having more.', '拥有一颗感恩的心，最终你会得到更多。', '1');
INSERT INTO `blog_word` VALUES ('192', 'Beauty is how you feel inside, and it reflects in your eyes.', '美是一种内心的感觉，并反映在你的眼睛里。(索菲亚·罗兰)', '1');
INSERT INTO `blog_word` VALUES ('193', 'Friendship doubles your joys, and divides your sorrows.', '朋友的作用，就是让你快乐加倍，痛苦减半。', '1');
INSERT INTO `blog_word` VALUES ('194', 'When you long for something sincerely, the whole world will help you.', '当你真心渴望某样东西时，整个宇宙都会来帮忙。', '1');
INSERT INTO `blog_word` VALUES ('195', 'Say your love today, the chance may come late.', '爱就要勇敢表白，谁知道明天和意外哪个先来。', '1');
INSERT INTO `blog_word` VALUES ('196', 'There\'s a crack in everything.That\'s how the light gets in.', '万物皆有裂痕，那是光照进的地方。', '1');
INSERT INTO `blog_word` VALUES ('197', 'Do something today that your future self will thank you for.', '让未来的你，感谢今天的你所付出的努力。', '1');
INSERT INTO `blog_word` VALUES ('198', 'You miss 100% of the shots you never take.', '不试，100%没希望。(希尼·克罗斯比)', '1');
INSERT INTO `blog_word` VALUES ('199', 'Things have a way of working out when you least expect it.', '山重水复疑无路，柳暗花明又一村。《绯闻女孩》', '1');
INSERT INTO `blog_word` VALUES ('200', 'Whatever your past has been, you have a spotless future.', '无论过去如何，未来总是崭新的。', '1');
INSERT INTO `blog_word` VALUES ('201', 'Dare and the world always yields.', '大胆挑战，世界总会让步。(W.M. 萨克雷)', '1');
INSERT INTO `blog_word` VALUES ('202', 'With enough hard work and dedication, anything is possible.', '努力过，付出过，就没什么不可能！', '1');
INSERT INTO `blog_word` VALUES ('203', 'Happiness consists in contentment.', '知足常乐。', '1');
INSERT INTO `blog_word` VALUES ('204', 'Your future depends on your dreams.', '你的梦想决定着你的未来。', '1');
INSERT INTO `blog_word` VALUES ('205', 'Today is an opportunity to get better.Don\'t waste it.', '今天是一个让一切变得更好的机会，别浪费。', '1');
INSERT INTO `blog_word` VALUES ('206', 'Happiness is good health and a bad memory.', '幸福是良好的健康加上糟糕的记性。', '1');
INSERT INTO `blog_word` VALUES ('207', 'You learn to take life as it comes at you.', '要学会接受生活。《泰坦尼克号》', '1');
INSERT INTO `blog_word` VALUES ('208', 'However long the night, the dawn will break.', '不管黑夜多长，黎明总会到来。', '1');
INSERT INTO `blog_word` VALUES ('209', 'We all have our places in the world.', '天生我才必有用。《功夫熊猫》', '1');
INSERT INTO `blog_word` VALUES ('210', 'It\'s okay to have flaws, which makes you real.', '有点缺点没关系，这样才真实。', '1');
INSERT INTO `blog_word` VALUES ('211', 'Just hold to your dream and never give up.', '坚持你的梦想，永不放弃。', '1');
INSERT INTO `blog_word` VALUES ('212', 'It\'s dogged that does it.', '世上无难事，只怕有心人。', '1');
INSERT INTO `blog_word` VALUES ('213', 'My success is based on persistence, not luck.', '我的成功基于坚持，而非运气。(雅诗·兰黛)', '1');
INSERT INTO `blog_word` VALUES ('214', 'Whether you fail or fly, at least you tried.', '不管是一飞冲天还是跌入谷底，至少，你尝试过！', '1');
INSERT INTO `blog_word` VALUES ('215', 'People tend to confuse bad decisions with bad luck.', '没有糟糕的运气，只有糟糕的决定。', '1');
INSERT INTO `blog_word` VALUES ('216', 'The purpose of life is to enjoy every moment.', '享受每时每刻才是生活的真谛。', '1');
INSERT INTO `blog_word` VALUES ('217', 'After a hurricane comes a rainbow.', '风雨之后总会见彩虹。', '1');
INSERT INTO `blog_word` VALUES ('218', 'Our attitude defines life.', '态度决定命运。', '1');
INSERT INTO `blog_word` VALUES ('219', 'Do one thing at a time, and do it well.', '一次只做一件事，并做到最好！', '1');
INSERT INTO `blog_word` VALUES ('220', 'To be is to do!', '活着就是奋斗！', '1');
INSERT INTO `blog_word` VALUES ('221', 'Take the moment and make it perfect.', '抓住当下，让它成为完美时刻。', '1');
INSERT INTO `blog_word` VALUES ('222', 'He who laughs last,laughs best.', '谁笑到最后，谁就笑得最好。', '1');
INSERT INTO `blog_word` VALUES ('223', 'Keep trying!Don\'t give up the ship.', '继续努力! 别放弃!', '1');
INSERT INTO `blog_word` VALUES ('224', 'Sometimes you have to be your own hero.', '有时候，你必须做自己的英雄。', '1');
INSERT INTO `blog_word` VALUES ('225', 'Have the faith for a better tomorrow.', '要相信明天会更好！', '1');
INSERT INTO `blog_word` VALUES ('226', 'You got a dream.You gotta protect it.', '如果你有梦想的话，就要去捍卫它。《当幸福来敲门》', '1');
INSERT INTO `blog_word` VALUES ('227', 'I can accept failure,but I can\'t accept not trying.', '我可以接受失败，但我不能接受从不去尝试。(迈克·乔丹)', '1');
INSERT INTO `blog_word` VALUES ('228', 'Dreams are made possible if you try.', '只要努力，梦想就会实现。', '1');
INSERT INTO `blog_word` VALUES ('229', 'Nothing really matters except to live or die.', '世上除了生死，其他都是小事。', '1');
INSERT INTO `blog_word` VALUES ('230', 'Chance favors the prepared mind.', '机会是为有准备的人准备的。', '1');
INSERT INTO `blog_word` VALUES ('231', 'One today is worth two tomorrows.', '今日之时最珍贵，明日之时不可待。', '1');
INSERT INTO `blog_word` VALUES ('232', 'The darkest hour is that before the dawn.', '黎明前是最黑暗的。', '1');
INSERT INTO `blog_word` VALUES ('233', 'The good seaman is known in bad weather.', '惊涛骇浪，方显英雄本色。', '1');
INSERT INTO `blog_word` VALUES ('234', 'Goals determine what you\'re going to be.', '奋斗目标决定你将成为怎样的人。', '1');
INSERT INTO `blog_word` VALUES ('235', 'Any time spent being unhappy is wasted.', '任何不快乐的时光都是浪费。', '1');
INSERT INTO `blog_word` VALUES ('236', 'The devil is always in the details.', '细节决定成败。', '1');
INSERT INTO `blog_word` VALUES ('237', 'I feel strongly that I can make it.', '我坚信，我会成功。', '1');
INSERT INTO `blog_word` VALUES ('238', 'Always be a first-rate version of yourself.', '做最好的自己！', '1');
INSERT INTO `blog_word` VALUES ('239', 'God helps those who help themselves.', '天助自助者。', '1');
INSERT INTO `blog_word` VALUES ('240', 'Think big goals and win big success.', '目标远大则成就伟大。', '1');
INSERT INTO `blog_word` VALUES ('241', 'You have to believe in yourself.That\'s the secret of success.', '你必须相信自己，这是成功的秘诀。', '1');
INSERT INTO `blog_word` VALUES ('242', 'A glamorous life is quite different to a life of luxury.', '人生的精彩，与奢华无关。（Lady GaGa）', '1');
