---
title: How to Understand an Open Source Project
date: 2024-01-30 11:16:31
tags:
- Java编程项目
- 开源项目
- 阅读项目源码技巧
categories: 
- web开发
---

## 快速了解项目

![Snipaste_2024-01-30_11-45-52.png](https://github.com/yfchenkeepgoing/image/blob/main/Snipaste_2024-01-30_11-45-52.png?raw=true)


从0带读Java小说项目。项目：[小说精品屋](https://novel.xxyopen.com/)

首先看代码的简介（README），然后看代码的更新频率（几年没更新的就不用看了）。

接着看项目的介绍，看项目的技术栈和我们自己的技术栈是否匹配。

接着看包结构（项目结构）。

看技术选型。高级的技术：ShardingSphere-JDBC（数据库分库分表支持）、分布式缓存支持、搜索引擎服务、开源消息中间件、文件存储、对象存储。

接着看**核心：项目如何安装，如何启动**。

## 了解项目依赖

通过github1s（在线查看项目的工具）看项目。

==看项目从整体到局部，先看项目的架构及关键配置文件==

比如assets放静态文件，sql放SQL语句。根目录下的pom.xml定义了父工程的配置。在父工程的配置中又定义了子模块，可以达到多包同时编译的效果。

dockerfile：可以用其来生成一个docker镜像

Java的项目主要分为两部分：resources放一些资源文件和配置，另一部分是java的核心代码。

看resources/application.yml：跑起这个项目需要启动哪些服务。

resources/mybatis：放一些SQL语句

resources/static：放前端的文件，比如javascript, css等等。

resources/templates：用的是thymeleaf，拓展标签可以动态地把一些后台数据渲染到页面。

resources/application-dev.yml：是项目的开发环境的配置。

resources/application-prod.yml：是项目生成环境的配置。

resources/logback.yml：日志

## 了解项目结构

现在java项目的目录结构比较清晰和规范。都是mvc结构：model view controller。

controller：控制层，接收用户的请求，给予一些响应，业务逻辑一般不写在其中

core：项目核心的类

mapper：mybatis的映射文件，在这个文件中定义操作数据库的方法

page：控制页面的返回。用户请求一个地址，请求发送到controller，会响应并返回某个页面给用户，和前端的模板有关联。

service：编写业务的逻辑

vo：返回给页面的数据

springboot的启动类，会自动帮助我启动一个tomcat服务器

## 追踪请求（了解分层）



## 参考

[带你读懂一个开源项目，学习通用套路！程序员阅读项目源码技巧、Java 编程项目分享](https://www.bilibili.com/video/BV13q4y1U7JU/?spm_id_from=333.337.search-card.all.click&vd_source=bf2f8cedefdf16acd0e7a14d8e4669fd)

[编程导航](https://www.code-nav.cn/)

[小说精品屋](https://novel.xxyopen.com/)
