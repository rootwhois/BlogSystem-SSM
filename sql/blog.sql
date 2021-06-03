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

 Date: 03/06/2021 10:45:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
    `user_id`              int         NOT NULL AUTO_INCREMENT,
    `user_name`            varchar(20) NOT NULL,
    `user_password`        varchar(20) NOT NULL,
    `user_nickname`        varchar(20) NOT NULL,
    `user_avatar`          varchar(100)         DEFAULT NULL,
    `user_email`           varchar(50) NOT NULL,
    `user_birthday`        date                 DEFAULT NULL,
    `user_last_login_ip`   varchar(50)          DEFAULT NULL,
    `user_last_login_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `question1`            varchar(50) NOT NULL,
    `question2`            varchar(50) NOT NULL,
    `question3`            varchar(50) NOT NULL,
    `answer1`              varchar(50) NOT NULL,
    `answer2`              varchar(50) NOT NULL,
    `answer3`              varchar(50) NOT NULL,
    PRIMARY KEY (`user_id`) USING BTREE,
    KEY `user_id` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin`
VALUES (1, 'admin', '123456', 'Chan', 'static/upload/image/1622688173887avatar.gif', 'admin@localhost.com',
        '1999-06-18', '0:0:0:0:0:0:0:1', '2021-06-02 21:44:25', '你的生日是什么时候？', '你的小名是什么？', '你是哪里人？', '你猜', '你再猜', '继续猜');
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`
(
    `article_id`          int                                                           NOT NULL AUTO_INCREMENT,
    `article_user_id`     int                                                           NOT NULL,
    `article_title`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `article_content`     mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    `article_sort_id`     int                                                           NOT NULL,
    `article_tag_id`      int                                                           NOT NULL,
    `article_date`        timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `article_views_count` int                                                                    DEFAULT '0',
    `article_like_count`  int                                                                    DEFAULT '0',
    PRIMARY KEY (`article_id`),
    KEY `article_user_id` (`article_user_id`),
    KEY `article_tag_id` (`article_tag_id`),
    KEY `article_sort_id` (`article_sort_id`),
    CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_user_id`) REFERENCES `admin` (`user_id`),
    CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_tag_id`) REFERENCES `tag` (`tag_id`),
    CONSTRAINT `article_ibfk_3` FOREIGN KEY (`article_sort_id`) REFERENCES `sort` (`sort_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article`
VALUES (1, 1, 'Hello World', '你好，世界！', 1, 2, '2021-06-01 09:26:40', NULL, NULL);
INSERT INTO `article`
VALUES (2, 1, '从技术谈到管理，把系统优化的技术用到企业管理',
        '<p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">很多技术人员在职业上对自己要求高，工作勤奋，承担越来越大的责任，最终得到信任，被提拔到管理岗位。但是往往缺乏专业的管理知识，在工作中不能从整体范围优化工作流程，仍然是“个人贡献者”的工作方式，遇到问题自己上，经常耽误了本职工作。于是翻了很多书，看了很多文章，学习了很多“为人处世的艺术”和“企业发展的战略”，最终把自己干成了研发部主管，技术却逐渐荒废。管理工作是什么呢，技术和管理是截然不同的两条发展方向吗？</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">不是的。技术和管理都要做到量化分析，全局优化，存在很多相似的方法。这里用一个系统性能优化的场景举个例子，大家可以体会一下：</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">公司里有一个程序，运行在10台服务器的集群上。现在业务量增加了，请求处理不完。老板把你找来，要你优化这个程序。接到这个头疼的任务，你把开发测试运维各个部门的人都找来开会想办法，有人说数据库该升级了，有人说代码写的太烂要优化，有人说机器太少再加5台，还有人说我们要改架构上云，上了云以后就再也没有这种问题了。你该听谁的呢？</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">先别着急动手。有一句话叫做“没有度量就没有优化”，首先要“度量”这个现象。先把设计人员找来，了解一下这个程序是什么功能，工作流程是什么样的。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">程序架构：这个程序处理图片识别的业务，从网络端口接收图片，识别图片里面的信息，然后在图片库里进行对比，最后输出相似图片。处理过程是这样的：</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">&nbsp;</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\"><img src=\"https://img2020.cnblogs.com/blog/4701/202009/4701-20200917145230997-1857130510.png\" alt=\"\"/></p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">&nbsp;</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">搞清楚程序架构，接下来我们需要度量数据。有一些数据很容易得到，还有一些数据似乎没人搞得清。于是你给研发团队布置了一个任务，让他们在程序里面埋点，尽快收集一些数据指标。开发人员改了一版程序，部署上去。在生产线上跑了一天，得到一些数据指标：&nbsp;</p><ul style=\"white-space: normal; margin-left: 30px; padding-left: 0px; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\" class=\" list-paddingleft-2\"><li><p>输入：每天需要处理100万张图片，这是从上游工序收集到的</p></li><li><p>识别函数：识别1张图片平均时间是0.5秒</p></li><li><p>比对函数：比对1个图片的平均时间是0.4秒</p></li></ul><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">现在我们计算一下：处理1张图片的时间是0.9秒（0.5 + 0.4），1台机器1天可以处理图片96000（86400 / 0.9），10 台机器1天可以处理图片96万（96000 * 10），达不到100万。要完成每天100万的处理量，需要服务器10.4台（100万 / 96000），约等于11台。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">是不是告诉老板必须要买服务器了呢：“需要买1台服务器，带GPU的！”。先别着急。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">我们分析一下程序运行过程：识别函数和比对函数是串行执行的。识别函数忙碌的时候，比对函数是空闲的，它在等待识别的结果。同样的，比对函数忙碌的时候，识别函数也是无事可做的。也就是说，服务器的资源并没有得到充分利用，GPU卡和数据库的资源都有很大的浪费。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">怎样提高资源利用率呢？可以改变一下程序的架构，调整成下面这样：</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">&nbsp;</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\"><img src=\"https://img2020.cnblogs.com/blog/4701/202009/4701-20200917145256422-475990692.png\" alt=\"\" class=\"medium-zoom-image\"/></p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">&nbsp;</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">把原来的程序一分为二，分别部署在两台服务器上，中间用一个消息队列交换数据。现在两个程序都可以充分利用服务器的资源。我们再来计算一下吞吐量：&nbsp;</p><ul style=\"white-space: normal; margin-left: 30px; padding-left: 0px; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\" class=\" list-paddingleft-2\"><li><p>程序X：处理一个图片需要0.5秒，1台服务器1天处理图片172800（86400 / 0.5），100万图片需要服务器 5.8 台（100万 / 172800），约等于6台。</p></li><li><p>程序Y：处理一个图片需要0.4秒，1台服务器1天处理图片216000（86400 / 0.4），100万图片需要服务器 4.6台（100万 / 216000），约等于5台。</p></li></ul><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">仍然需要服务器11台，好像没有什么改进嘛。我们再分析一下：原方案需要11台带GPU的服务器，现在只需要6台，我们省下了5块GPU卡，这已经是一笔不少的费用。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">架构师又提供了一个信息：在原方案里面，识别函数和比对函数串行执行，所以只能用同样的并发线程数执行。新方案已经分离到两个程序中，所以比对函数就可以设置更高的并发线程数，可以提高到原来的4倍。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">这是一个好消息，程序Y的吞吐量可以提高4倍，这样一来，只需要1.16台服务器就可以处理完100万数据，约等于2台。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">按照改进后的架构，只需要6台带GPU的服务器，再加2台不带GPU的服务器，总计需要8台服务器。不仅可以完成处理任务，还可以预留一些GPU卡，以备以后业务发展。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">例子说完了，以上就是优化一个IT系统运行效率的过程。其实，企业管理也是相似的过程，只是优化的对象不再是机器和程序，而是人的活动。在一家软件企业，有需求收集、产品研发、项目实施等多个流程，有时这些流程会有卡顿、缓慢的现象，看上去和一个IT系统的问题是一样的。有一个著名的问题是：“在你的团队里，只涉及一行代码的变更需要多久才能上线？” 从需求到交付，这个路程有多远。我们可能经常会遇到这样的问题：某个现场运维反馈了一个缺陷，看上去只是很小的问题，修复也不麻烦，却花了很长时间才解决。事后回顾这个问题，每个部门的人都有话要说：</p><ul style=\"white-space: normal; margin-left: 30px; padding-left: 0px; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\" class=\" list-paddingleft-2\"><li><p>运维：我一发现这个问题，就在Jira平台上提出来了，当时开发也没有回复，我就下班了。</p></li><li><p>开发：我当时正在开发新版本的功能，写一段很复杂的代码。看到这个问题的时候，已经是下班时间了。运维只描述了问题现象，没有说明现场部署的版本。我不知道在哪个版本上修复这个问题，只好在最新的发布版上先把它改掉了，然后把包发给测试。我在Jira上也回了消息，要求运维把现场版本号发出来；</p></li><li><p>测试：我收到开发的包，打算做一下测试。整个集成环境已经升级了，我需要把测试环境恢复到老的版本。这事我搞了一上午，下午的时候搞了一遍测试，发现几个缺陷，把问题提给开发了。</p></li><li><p>开发：我收到测试提的Bug，修改以后又发了一个版。这次应该没问题了。</p></li><li><p>运维：环境上的包没有版本标识，我花了很长时间核对所有版本的Md5码，才找到了版本号，在Jira上回了。这个问题很紧急，我想尽快解决，于是就拿测试给我的最新版，想尝试安装一下。我不知道这个包能不能兼容现场的环境，只能试试看。我在预发布环境上搞了一天，也没把他装上去，看起来是不行的。</p></li><li><p>开发：我看到现场版本号，这是一个非常老的版本，已经一年多了。我进入这个项目才三个月，在微信上AT了好几个人。代码基线也不知道在哪里，找了很久才找到。修复之后已经很晚了。还是要交给测试测一下。</p></li><li><p>测试：集成环境还是要恢复一下，我搞了三个小时。测试确认没有问题，就交给运维了。</p></li><li><p>运维：我收到安装包，在预发布环境上试了一下，没什么问题。生产环境要麻烦一些，我一开始只更新了一个节点，发现问题仍然间歇性的出现。后来才知道要还有2个节点也要部署。这次搞了一天，下次再有这样的情况，我就知道怎么做了。</p></li></ul><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">从每个人的角度看，自己都很忙碌，花了很多时间解决问题。但是从缺陷解决的角度看，事情在不断的卡顿、等待。在这些劳动过程中，真正有效的、能产生价值的劳动占多少呢？这就是DevOps需要解决的价值流动问题，需要建立一套体系，衡量这个流程，不断优化它。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">&nbsp;</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\"><img src=\"https://img2020.cnblogs.com/blog/4701/202009/4701-20200917145324270-1932864463.png\" alt=\"\" class=\"medium-zoom-image\"/></p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">&nbsp;</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">从上面一个缺陷解决的过程来看，技术部门存在很多问题，有一些问题是单点的，比如：</p><ul style=\"white-space: normal; margin-left: 30px; padding-left: 0px; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\" class=\" list-paddingleft-2\"><li><p>代码管理：代码基线不明确，版本无法回溯</p></li><li><p>发布管理：发布文档没有妥善保管</p></li><li><p>版本管理：版本号没有明确的烙印，编号不清楚。无法判断新老版本的兼容关系</p></li><li><p>基础设施管理：研发人员没有办法迅速得到基础设施，为了建立一个测试环境需要花很长时间</p></li><li><p>部署管理：测试人员手工部署，需要花很久才能完成一次部署</p></li><li><p>环境管理：现场的服务器上部署了哪些进程，没有一套管理办法，需要登录上去查看</p></li></ul><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">看到这些问题，是不是就可以开始改进了呢？还是不要着急。像优化一个IT系统一样，我们要搞清楚工作流程，然后度量这个流程，再整体优化。在整体情况不清楚的情况下，局部优化是没有用的，优化一个局部的效率，可能适得其反，造成更大的浪费。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">把整体流程搞清楚，当然是存在很多困难的。一个大问题就是：企业工作流程不像IT系统流程一样清楚。IT系统一般有各种文档，至少有源代码可以查看。企业工作流程经常存在一些模糊的地方，部门和岗位职责的定义不是十分清楚。人也不会像程序一样“听话”，为了完成自己的工作任务，人是有创造性的。所以每个企业都要整理岗位和工作流程，努力把这些模糊的流程整理清楚，按照自己的业务特点制定一套流程规范，这是十分必要的工作。技术岗位上的人更熟悉实际的工作流程，他们走上管理岗位，在这方面是有优势的。</p><p style=\"white-space: normal; margin: 10px auto; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;\">工作流程明确之后，就可以对流程节点进行度量。我们可以采用可视化技术对数据进行分析，比如看板、资源投入状态、任务燃尽图等等，寻找卡顿活动，判断瓶颈资源。这方面有一些科学的方法，软件行业也在从制造行业学习精益生产的理论。对于一个大规模的软件企业，在管理方面有所改善，形成的效率提升是巨大的。</p><p><br/></p>',
        2, 1, '2021-06-01 09:33:08', NULL, NULL);
INSERT INTO `article`
VALUES (3, 1, '索斯盖特：贝林厄姆是现象级球员，他在欧冠中的表现打动了我',
        '<p>多特中场贝林厄姆入选了英格兰欧洲杯最终大名单，英格兰主帅索斯盖特接受采访时透露了他选择这名17岁小将的原因。</p><p>&nbsp; &nbsp;<img src=\"https://csimg2.qunliao.info/fastdfs6/M00/06/26/rBUESWB3PRKAKhPVAAHqFjTw46E291.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZz9pbWFnZVZpZXcyLzAvdy8xNzA=/dissolve/100/dx/20/dy/10\"/> &nbsp; &nbsp;</p><p>被记者问及贝林厄姆，索斯盖特说：“Jude(贝林厄姆)是现象级的，在最近几天的训练中，我们看到一个17岁的孩子想要和老球员竞争，他不仅有技术，而且有竞争力和一定的成熟度，他是一个令人非常兴奋的球员。”</p><p>&nbsp;</p><p>“他将会是英格兰队重要的一员，我们不只是带他去体验欧洲杯。这次经历对他和未来的英格兰主帅来说都是非常重要的，我在他的性格中没有看到任何会让他不成功的东西。”</p><p>&nbsp;</p><p>“他在多特踢球，在欧冠比赛中的精彩表现确实打动了我们。在那些重要时刻，他站了出来，这是我们真正评估球员的时刻。”</p><p>&nbsp;</p><p>贝林厄姆赛季下半程表现很出色，在欧冠1/4决赛中攻破曼城球门，这名小将去年夏天从英冠球队伯明翰转会到多特，本赛季出场46次，有4球4助攻入账。</p><p><br/><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:25:13', NULL, NULL);
INSERT INTO `article`
VALUES (4, 1, '体图：除非通过卖球员筹到资金，否则多特今夏不再引援',
        '<p>多特夏窗已经签下瑞士门将科贝尔，据《体育图片报》报道，除非通过卖球员筹到资金，否则大黄蜂不再买新球员。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs5/M00/61/DA/rB8CCl_vU9iAFhtbAAHc4-dcESk036.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZz9pbWFnZVZpZXcyLzAvdy8xNzA=/dissolve/100/dx/20/dy/10\"/> &nbsp; &nbsp;</p><p>多特此前免签了法国中卫库利巴利，花1500万欧从斯图加特签下门将科贝尔。大黄蜂的财政状况并不理想，2020-21赛季预计亏损7500万欧。</p><p>&nbsp;</p><p>《体育图片报》称，只有卖球员拿到转会资金，多特才有可能继续签新球员。多特阵中的桑乔传出离队绯闻，天空体育报道称他和曼联达成个人条款不成问题，不过红魔还没有正式向多特送出报价，这笔转会处于目前停滞状态。</p><p>&nbsp;</p><p>多特左后卫舒尔茨、后腰德莱尼、中场布兰特以及门将布尔基也被传今夏离队。</p><p><br/><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:30:02', NULL, NULL);
INSERT INTO `article`
VALUES (5, 1, '踢球者：多特蒙德看重科贝尔的出球能力和领袖能力',
        '<p>多特蒙德签下了瑞士的23岁门将科贝尔，科贝尔的转会费是1500万欧，是德甲历史上转会费第二高的门将。德国足球媒体《踢球者》分析了多特对科贝尔的期待。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/B8/rBUESWC3ZVOAEmeLAAF_XcqLKPU923.jpg\"/> &nbsp; &nbsp;</p><p>23岁的科贝尔还有很大的潜力，《踢球者》称赞科贝尔处理球冷静。另外除了守门能力出色之外，在斯图加特科贝尔还经常作为进攻的第一发起者。在斯图加特他经常从禁区里传球组织进攻。</p><p>&nbsp;</p><p>本赛季科贝尔在《踢球者》的场均得分是2.86分，排在诺伊尔、奥尔特加、吉凯维奇之后，与卡斯特尔斯并列德甲第四。</p><p>&nbsp;</p><p>另外年轻的科贝尔已经具备不俗的领袖能力，他在球场上和更衣室都经常发言。而且科贝尔斗志出色，非常渴望胜利。</p><p><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:47:26', NULL, NULL);
INSERT INTO `article`
VALUES (6, 1, '多特蒙德和世界花式足球协会启动多特蒙德全球花式足球大挑战',
        '<p>多特蒙德足球俱乐部和世界花式足球协会（WFFA）宣布于2021年6月2日在全球范围开启<strong>多特蒙德首届#花式足球大挑战#</strong>。该活动由赢创独家赞助，旨在为足球和花式足球搭建一个桥梁，进一步深化人们对于花式足球的了解。多特蒙德俱乐部借此机会邀请全世界的横迷秀出有创意的花式足球技巧，并将由评委和大众选出三位获胜者，获胜者们将赢取价值600欧元的多特蒙德大礼盒！<br/>多特蒙德亚太地区总监Suresh Letchmanan说：“我们很高兴WFFA加入多特蒙德大家庭，来帮助我们找到最棒的花式足球高手。通过这场全球大挑战，花式足球技巧可以在我们架构的平台得以完美的演绎，我们也能给全球的粉丝带来独特的体验。”<br/>作为大挑战的智库团，WFFA特意安排了9位WFFA的花式足球高手，组成了“多特蒙德09花式足球大使”。他们是来自美国的Alex Mendoza和Torin Lynch，德国的Jannik Singpiel，中国的Cheny，韩国的Taehee Kim，新加坡的Valerie Su，越南的Phat Nguyen，马来西亚的Zeem Ahmad和挪威的花式足球世界冠军Erlend Fagerli。</p><p>&nbsp;</p><p>WFFA的联合创始人和合作关系主管Dan Wood说：“和多特蒙德这种具有世界影响力的俱乐部开展合作关系令人很兴奋。我们确信这将是向多特蒙德球迷们展示花式足球魅力的绝好时机。”</p><p>&nbsp;</p><p>5次花式足球世界冠军、多特蒙德花式足球大使Erlend Fagerli表示：“很高兴能和来自世界各地的花式足球伙伴一起参与并筹划多特蒙德俱乐部的全球花式足球大挑战，这是我们宣传花式足球的开始。”</p><p>&nbsp;</p><p>?欲了解更多关于多特蒙德首届#花式足球大挑战#的信息，请点击www.bvb.de/eng/freestylechallenge</p><p>&nbsp; &nbsp;<img src=\"https://bdimg1.qunliao.info/tos-cn-i-j5hyufq5o6/fastdfs6/M00/17/A6/rBUESWC3Md6AC5F8AN0Ampz6GDk906.jpg~tplv-j5hyufq5o6-orign2.image\"/> &nbsp; &nbsp;</p><p><br/></p><p>&nbsp; &nbsp;</p><p><a href=\"https://img.qunliao.info/TSWf1mgR_3839162261.mp4\" target=\"_blank\" class=\"jump-video\"></a></p><p><br/></p><p>&nbsp;</p><p>多特蒙德是德国最成功的的足球俱乐部之一。至2021年，多特蒙德总共赢得了8座联赛冠军、5座德国杯冠军、1座欧冠冠军、1座洲际杯冠军以及1座欧洲优胜者杯冠军。俱乐部会员超过159,000名，是德国5大俱乐部之一，也是世界第7大俱乐部。</p><p>&nbsp;</p><p>关于多特蒙德的更多信息，请访问：</p><p>&nbsp;</p><p>l&nbsp; 微博：多特蒙德足球俱乐部</p><p>&nbsp;</p><p>l&nbsp; 微信小程序：多特蒙德英雄圈</p><p>&nbsp;</p><p>l&nbsp; 微信：多特蒙德足球俱乐部</p><p>&nbsp;</p><p>l&nbsp; 懂球帝：多特蒙德足球俱乐部</p><p>&nbsp;</p><p>l 抖音：多特蒙德足球俱乐部</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>关于WFFA</p><p>&nbsp;</p><p>世界花式足球协是花式足球的管理机构。该协会致力于提高人们对于花式足球的认可度和参与度。WFFA建立在社会和教育发展的基石之上，高度认可这项运动带给世界范围内的年轻人的激励作用。协会遍布世界114个国家和地区，管理世界花式足球排名，组织花式足球比赛，包括“红牛街头风格”和“超级球”。</p><p>&nbsp;</p><p><br/>关于WFFA的更多信息，请访问：</p><p>&nbsp;</p><p>●&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 官网： www.thewffa.org</p><p>&nbsp;</p><p>●&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Instagram: <a href=\"dongqiudi:///user/@thewffa\">@thewffa</a></p><p>&nbsp;</p><p>●&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Facebook: The World of Freestyle Football</p><p>&nbsp;</p><p>●&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Youtube: TheWFFA</p><p><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:31:51', NULL, NULL);
INSERT INTO `article`
VALUES (7, 1, '蓄势待发，桑乔社媒：欧洲杯我们来了',
        '<blockquote><p>在正式入选英格兰代表队2020年欧洲杯的大名单之后，多特蒙德的攻击手桑乔在社交媒体表达了自己对这项赛事的期待。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/89/rBUESWC2yzKAN4xSAAGEV5jmSx0049.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZz9pbWFnZVZpZXcyLzAvdy8xMzg=/dissolve/100/dx/16/dy/10\"/> &nbsp; &nbsp;</p><p>现年21岁的桑乔本赛季代表多特蒙德出战了38场正式比赛，打进16球助攻18次，本届欧洲杯将会是他职业生涯至今首次参加国际大赛。</p><p>&nbsp;</p><p>对此桑乔选择在社交媒体上发布了一张自己身穿英格兰队战袍的照片，并配文写道：“2020年欧洲杯，英格兰我们走吧！”</p><p><br/><br/></p></blockquote>',
        3, 3, '2021-06-02 21:33:05', NULL, NULL);
INSERT INTO `article`
VALUES (8, 1, '踢球者：多特已经签下前莱比锡视频分析师',
        '<p>据《踢球者》报道，多特蒙德已经签下前莱比锡视频分析师阿克曼(Daniel Ackermann)，大黄蜂新的教练团队添一员猛将。</p><p>&nbsp; &nbsp;<img src=\"https://bdimg1.qunliao.info/tos-cn-i-j5hyufq5o6/fastdfs6/M00/17/73/rBUCgGC2SYuAHwpNAADemGmz1u0487.jpg~tplv-j5hyufq5o6-wo.image\"/> <span class=\"img-tips\">图源：踢球者</span> &nbsp;</p><p>据《踢球者》介绍，阿克曼去年夏天离开莱比锡，此前他曾辅佐朗尼克、哈森许特尔、纳格尔斯曼等莱比锡主帅，得到朗尼克的赏识。</p><p>&nbsp;</p><p>此外，《踢球者》表示，罗泽在门兴的教练组将跟随他加盟多特，齐格勒和马里奇担任助教，艾森贝格尔(Patrick Eibenberger)担任体能教练。有迹象表明多特临时泰尔齐奇会留队辅佐罗泽，但还没有最终的结果。</p><p><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:34:02', NULL, NULL);
INSERT INTO `article`
VALUES (9, 1, '图片报：科贝尔不接受替补角色，因此落选瑞士欧洲杯最终名单',
        '<p>瑞士已经公布欧洲杯最终26人大名单，多特新门将科贝尔落选，《图片报》透露了具体原因。</p><p>&nbsp; &nbsp;<img src=\"https://csimg2.qunliao.info/fastdfs6/M00/17/72/rBUCgGC2RQOAFVoxAAdhvIkfEW4622.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZz9pbWFnZVZpZXcyLzAvdy8zNDE=/dissolve/100/dx/40/dy/15\"/> &nbsp; &nbsp;</p><p>科贝尔入选了瑞士初选名单，《图片报》称，据瑞士队内部人士透露，科贝尔野心勃勃，只想首发，不想扮演替补角色，这可能会破坏国家队的和谐，因此被主教练佩特科维奇排除出最终名单，瑞士带的三名门将是索默、姆沃戈以及奥姆林。</p><p>&nbsp;</p><p>现年23岁的科贝尔还没有国家队出场经历，他刚刚从斯图加特转会到多特，转会费1500万欧，德甲门将转会费第二高。</p><p><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:35:05', NULL, NULL);
INSERT INTO `article`
VALUES (10, 1, '英格兰官方：桑乔因轻微的咽喉感染缺席今天的训练',
        '<p>英格兰官方宣布，球队进行对阵奥地利前的最后一练，但桑乔因咽喉感染缺席。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/10/9C/rBUCgGCdfHOAYDsPAAGbRsKiRR8882.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZw==/dissolve/100/ws/0.045\"/> &nbsp; &nbsp;</p><p>英格兰将在周四的友谊赛中与奥地利过招，他们在今天进行了比赛前的最后一堂训练课。</p><p>&nbsp;</p><p>这次训练总共有20名球员参加，而多特边锋桑乔因为轻微的咽喉感染缺席本次训练。</p><p><br/><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:35:51', NULL, NULL);
INSERT INTO `article`
VALUES (11, 1, '鲁尔区大黄蜂，梦回90年代！',
        '<p><em>多特蒙德20-21赛季第四球衣&nbsp;</em></p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/46/rBUESWC1vk6AadO8AAPOsLC7c6g112.jpg\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\">如今的豪门俱乐部为了“讨好“铁杆球迷们可谓是使出各种”招式“，过去从单一赛季推出主、客和第二客场球衣，到如今的不少球队已经在推出单赛季第四球衣、圣诞特别版、德比特别版等五花八门的款式，越来越丰富的“限定“版本球衣面向市场，而死忠粉们除了要准备足够消费预算之外，还要拥有十足的运气和抢购速度。</span></p><p>&nbsp; &nbsp;<img src=\"https://bdimg1.qunliao.info/tos-cn-i-j5hyufq5o6/fastdfs6/M00/17/46/rBUESWC1vvaATLplAAPBrrPzGHk063.jpg~tplv-j5hyufq5o6-orign2.image\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\">今年4月19日，彪马公司联合德甲劲旅多特蒙德俱乐部，推出了一件黄黑配色特别版复古球衣，以此致敬上世纪90年代为俱乐部夺取欧冠冠军和两个德甲冠军，缔造辉煌时代的绿茵英雄。这件在多特蒙德官网被秒光的球衣，也成为了赛季末最具话题性的欧洲俱乐部战袍，今天的话题，我们就来聊聊多特蒙德这件特别版球衣。</span><span style=\"letter-spacing: 0px;\"></span></p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/46/rBUESWC1vnyAc_E_AGfx2jqV5vU000.jpg\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\">每个时代都有自己的故事，每个时代都在历史长河里留下了属于自己的特殊时刻。提起德甲劲旅多特蒙德俱乐部辉煌的90年代，那一抹荧光黄色的球衣是球迷心中永远不可磨灭的记忆，而当年的这股“VOLT”荧光黄配色，在德甲和欧洲的赛场上挂起的那股光电旋风，至今仍然让我记忆犹新。</span></p><p>&nbsp; &nbsp;<img src=\"https://csimg2.qunliao.info/fastdfs6/M00/17/47/rBUESWC1wmOAeoj9AApoTey5QDk410.png\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\">30年后的今天，PUMA让这一抹独特的荧光黄重返赛场，除了让当年的经典配色呈现之外，卡尔-海因茨·里德尔（Karl-Heinz Riedle）、拉尔斯·里肯（Lars Ricken）、蒂亚斯·萨默尔（Matthias Sammer)等数位多特蒙德名宿的群像出现在这件限量版球衣的外包装盒和球衣正面印花上。</span></p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/45/rBUCgGC1wqiAWMVGAEMfNpMxm3E561.jpg\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\">限量版球衣的外盒上写上了“NULL NE90N”的字样，代表了这次特别计划的口号，盒盖内侧印有“Jede Ära beginnt mit dem Willen ihrer Helden（每个时代都开始于英雄们的愿景）”，也点出了这件球衣的内涵。</span><span style=\"letter-spacing: 0px;\"></span></p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/44/rBUCgGC1v_eAD3mtACh5uAYxoGY303.jpg\"/> &nbsp; &nbsp; <img src=\"https://csimg2.qunliao.info/fastdfs6/M00/17/44/rBUCgGC1v72AcfHQAGWLEuj9Sk8821.jpg\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\">球衣内盒也出现了三大赞助商PUMA（彪马）、1&amp;1（1&amp;1电信公司）及OPEL（欧宝汽车）的图标。黑色的球衣上除了呈现类似迷彩灰的名宿群像印花之外，肩膀上拼接了荧光黄的配色，可以说是完美致敬了元年球衣的框架设计。胸前PUMA logo再次与美洲狮图形标同时呈现，而材质和队徽和胸前广告一样，都采用了质感极佳的硅胶材质。手臂上的OPEL汽车广告采用了烫印的材质，球衣背面也照旧烫印上了多特蒙德的队名。</span></p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/46/rBUESWC1vqWAJGO_AGkLwoBNoq4337.jpg\"/> &nbsp; &nbsp;</p><p><span style=\"letter-spacing: 0px;\"></span>球衣的浅V字型衣领也是我比较喜欢的设计之一，黑白双色修饰的罗纹设计简单大方，短袖袖口也用了相同的设计去做了呼应。球衣版型采用了SLIM FIT PRO的修身设计，相较于其他球迷版本的球衣而言偏小一个尺码。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/44/rBUCgGC1wB6ALxgFAAJSxnzZhUU574.jpg\"/> &nbsp; &nbsp; <img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/17/47/rBUESWC1wCqAIb9ZAALJYJzMboQ932.jpg\"/> &nbsp; &nbsp;</p><p>这件“梦回90年代“的限量版战袍已经于4月18日的德甲比赛当中登场亮相，多特蒙德对阵的对手是云达不来梅队。云达不莱梅是上世纪90年代多特蒙德最强劲的对手之一，也是多特蒙德90年代首个德国顶级联赛冠军（1995年）强有力的竞争对手。</p><p><br/><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:36:41', NULL, NULL);
INSERT INTO `article`
VALUES (12, 1, '镜报：切尔西愿意将奥多伊加入桑乔交易',
        '<p>据《镜报》的消息，切尔西愿意将奥多伊加入求购桑乔的交易。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs6/M00/02/40/rBUESWBmdKuAMoj5AALHPczy794210.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZz9pbWFnZVZpZXcyLzAvdy8xNzA=/dissolve/100/dx/20/dy/10\"/> &nbsp; &nbsp;</p><p>桑乔可能在夏天离开多特蒙德，他去年夏天曾被传很有可能加盟曼联。</p><p>&nbsp;</p><p>曼联依然有兴趣签下桑乔，不过报道声称，切尔西相信他们有优势。</p><p>&nbsp;</p><p>切尔西准备将奥多伊加入交易，并支付部分现金给多特蒙德。</p><p>&nbsp;</p><p>奥多伊过去曾接近加盟拜仁慕尼黑，他本赛季各项赛事出场了37次。</p><p><br/><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:47:09', NULL, NULL);
INSERT INTO `article`
VALUES (13, 1, '德媒：多特不放雷纳参加美金杯，他得及时归队开始备战',
        '<p>德国媒体sport.de消息，多特蒙德球员雷纳无法代表美国队出战美金杯，黄黑军团拒绝放人，要求雷纳准时参加下赛季的备战。</p><p>&nbsp; &nbsp;<img src=\"https://xyimg1.qunliao.info/fastdfs5/M00/64/27/rB8CCl_6_RWAf0ivAAJgZtvxo0g913.jpg?watermark/1/image/aHR0cDovL2ltZzEuZG9uZ3FpdWRpLmNvbS9mYXN0ZGZzMi9NMDAvMkEvRTIvQ2hPcU0xb1MtZVdBUERxM0FBQkE1VWdyQlQ4MTQyLnBuZz9pbWFnZVZpZXcyLzAvdy8xNzA=/dissolve/100/dx/20/dy/10\"/> &nbsp; &nbsp;</p><p>目前大多数多特队内的国脚们都在备战欧洲杯，正在美国队集训的雷纳将迎来中北美洲及加勒比海地区国家联赛的半决赛，对手是洪都拉斯。如果能击败洪都拉斯，美国队将在两天后迎来决赛。</p><p>&nbsp;</p><p>本届美金杯定于7月10日在8月1日间举办，作为美国队的绝对主力，雷纳没有得到多特蒙德的放行许可，他无法参加这届赛事。</p><p><br/><br/><br/></p><p><br/></p>',
        3, 3, '2021-06-02 21:37:49', NULL, NULL);
INSERT INTO `article`
VALUES (14, 1, '程序员的六一',
        '<p>进来的兄弟一定是还没有被社会毒打的程序员，哈哈。那程序员要怎么过六一？</p><p><br/></p><p>先来科普一下儿童节的由来：</p><p><br/></p><p>国际儿童节（又称儿童节，International Children&#39;s Day）定于每年的6月1日。为了悼念1942年6月10日的利迪策惨案和全世界所有在战争中死难的儿童，反对虐杀和毒害儿童，以及保障儿童权利。</p><p><br/></p><p>这么说起来，儿童节并非单单是儿童的节日，而是成年人需要给儿童的过得一个节日。那也就是说，儿童节是需要成年人和儿童配合完成的一个节日。那如果没有孩子呢，什么？连对象都没有，那我有什么办法，你没对象你还没有“儿子“吗？找个室友用就好了。</p><p><br/></p><p>好了，正文开始:对于一个程序员的六一。</p><p><br/></p><p>一个拥有童心的程序员是多么的稀有，现在一说工作就会想到摸鱼，每天和主管、老板斗智斗勇，带薪啦..摧枯拉朽已经是最没技术含量的了。现在都是高科技，用那什么带什么射线的显示器，真不是吹，这厂商为了程序员能够更加有效的摸鱼真的用心了，表示尊敬。</p><p><br/></p><p><br/></p><p>如果你实在是没有那个童心了，也不知道这是什么感觉了。这不六一还有一个别名嘛，叫”全名装嫩“。就装呗，平常给自己的代码也没少吹吧，什么史上最强frame,什么最强X，其实你自己可能连代码都看不懂了，还可能代码就不是自己写的。没事，谁都干过，不丢人。</p><p><br/></p><p>想一想以前为什么能够那么开心，</p><p><br/></p><p>小时候没钱，只有快乐，没有ipad,不懂network，只会打三角，打玻璃球，完纸飞机，打10块钱300个手柄小游戏。以前追女孩靠的是深情，比的就是用心。现在追女孩靠的是钱，比的是爹。我们为什么没有了那份快乐，可能只是曾经那个为你负重前行的人身上的担子给了你，这是你的责任，生活总是需要继续的，不需要奢求能够逆风翻盘，向阳而生才是你该做的。</p><p><br/></p><p>总会有那么一个人能够将这份童真带给你的，带给你一份你最需要的生活，给你动力，给你希望，现在要做的是努力，为了这个人，也为了你自己。还有，少熬夜，以防直接跨过这一步，哈哈。</p><p><br/></p><p>祝你六一玩的开心，早日找到女朋友，然后教她写代码。</p><p><br/></p><p><br/></p>',
        4, 4, '2021-06-03 00:40:17', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`
(
    `comment_id`         int       NOT NULL AUTO_INCREMENT,
    `comment_content`    longtext  NOT NULL,
    `comment_time`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `comment_sub_id`     int                DEFAULT NULL,
    `comment_user_id`    int                DEFAULT NULL,
    `comment_nickname`   varchar(50)        DEFAULT NULL,
    `comment_article_id` int       NOT NULL,
    `comment_email`      varchar(50)        DEFAULT NULL,
    PRIMARY KEY (`comment_id`),
    KEY `comment_sub_id` (`comment_sub_id`),
    KEY `comment_ibfk_2` (`comment_article_id`),
    CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_sub_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment`
VALUES (37, '好！', '2021-06-01 09:30:06', NULL, NULL, 'admin', 1, 'admin@admin.com');
INSERT INTO `comment`
VALUES (38, '顶', '2021-06-03 10:27:05', NULL, NULL, '张三', 14, '1@qq.com');
INSERT INTO `comment`
VALUES (39, '板凳', '2021-06-03 10:27:29', NULL, NULL, '李四', 14, '2@qq.com');
INSERT INTO `comment`
VALUES (40, '写得不错哦', '2021-06-03 10:28:04', NULL, NULL, '王五', 14, '3@qq.com');
INSERT INTO `comment`
VALUES (41, '大佬写的好棒，可以互关？欢迎回访哦！', '2021-06-03 10:28:30', NULL, NULL, '老王', 14, '4@qq.com');
INSERT INTO `comment`
VALUES (42, '文章不错喔~', '2021-06-03 10:28:53', NULL, NULL, '王二小', 14, '5@qq.com');
INSERT INTO `comment`
VALUES (43, '顶顶', '2021-06-03 10:29:09', NULL, NULL, '王二狗', 14, '6@qq.com');
INSERT INTO `comment`
VALUES (44, '阅', '2021-06-03 10:29:35', NULL, NULL, '马化腾', 14, '7@qq.com');
INSERT INTO `comment`
VALUES (45, '这道题我拿到手就会做', '2021-06-03 10:30:04', NULL, NULL, '汤家凤', 14, '8@qq.com');
INSERT INTO `comment`
VALUES (46, '我从来没碰过钱', '2021-06-03 10:30:25', NULL, NULL, '马云', 14, '9@qq.com');
INSERT INTO `comment`
VALUES (47, '996', '2021-06-03 10:31:05', NULL, NULL, '程序员', 14, '10@qq.com');
INSERT INTO `comment`
VALUES (48, '在？砍一刀', '2021-06-03 10:31:23', NULL, NULL, '拼多多', 14, '11@qq.com');
INSERT INTO `comment`
VALUES (49, '感谢联通。', '2021-06-03 10:31:38', NULL, NULL, '中国联通', 14, '12@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort`
(
    `sort_id`   int         NOT NULL AUTO_INCREMENT,
    `sort_name` varchar(20) NOT NULL,
    PRIMARY KEY (`sort_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sort
-- ----------------------------
BEGIN;
INSERT INTO `sort`
VALUES (1, '推广');
INSERT INTO `sort`
VALUES (2, '技术');
INSERT INTO `sort`
VALUES (3, '足球');
INSERT INTO `sort`
VALUES (4, '程序人生');
INSERT INTO `sort`
VALUES (5, '中间件');
INSERT INTO `sort`
VALUES (6, '每日工作');
INSERT INTO `sort`
VALUES (7, 'Quick');
INSERT INTO `sort`
VALUES (8, '程序员之家');
INSERT INTO `sort`
VALUES (9, '云动态');
INSERT INTO `sort`
VALUES (10, '新鲜技术分享');
INSERT INTO `sort`
VALUES (11, '工具');
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`
(
    `tag_id`   int         NOT NULL AUTO_INCREMENT,
    `tag_name` varchar(20) NOT NULL,
    PRIMARY KEY (`tag_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag`
VALUES (1, '软件工程实践');
INSERT INTO `tag`
VALUES (2, '广告');
INSERT INTO `tag`
VALUES (3, '多特蒙德');
INSERT INTO `tag`
VALUES (4, '生活记录');
INSERT INTO `tag`
VALUES (7, 'Spring');
INSERT INTO `tag`
VALUES (8, 'MySQL');
INSERT INTO `tag`
VALUES (9, 'MyBatis');
INSERT INTO `tag`
VALUES (10, 'Redis');
INSERT INTO `tag`
VALUES (11, '事务');
INSERT INTO `tag`
VALUES (12, 'SpringCloud');
INSERT INTO `tag`
VALUES (13, 'Git');
INSERT INTO `tag`
VALUES (14, '反射');
INSERT INTO `tag`
VALUES (15, 'Nginx');
INSERT INTO `tag`
VALUES (16, 'ElasticSearch');
COMMIT;

-- ----------------------------
-- Table structure for web
-- ----------------------------
DROP TABLE IF EXISTS `web`;
CREATE TABLE `web`
(
    `web_id`      int         NOT NULL AUTO_INCREMENT,
    `web_user_id` int DEFAULT NULL,
    `web_is_open` tinyint(1)  NOT NULL,
    `web_domain`  varchar(50) NOT NULL,
    `web_name`    varchar(20) NOT NULL,
    PRIMARY KEY (`web_id`),
    KEY `web_user_id` (`web_user_id`),
    CONSTRAINT `web_ibfk_1` FOREIGN KEY (`web_user_id`) REFERENCES `admin` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of web
-- ----------------------------
BEGIN;
INSERT INTO `web`
VALUES (1, NULL, 1, 'http://127.0.0.1', 'Chan的部落格');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
