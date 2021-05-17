# sz-education 轼辙云在线考务系统

本系统主要基于Spring Cloud微服务框架实现了以下功能：

- 学生前台考试子系统的在线考试、成绩回顾；
- 后台管理子系统中包含
  - 系统管理模块（路由管理、菜单管理、单位管理）
  - 系统监控模块（日志监控、Consul监控、Zipkin链路监控、Spring Boot Admin服务监控、Swagger API文档）
  - 考务管理模块（课程管理、考试管理、题库管理、成绩管理、知识库管理）
  - 附件管理模块
  - 个人信息管理模块

此外利用Git进行版本管理，在根目录中的`.github`文件夹内文件用于启动Github自带的Github Actions功能，用于代码规范性的Lint Code检验。在每次push动作发起时候进行检测并更新日志在根目录的`super-linter.log`文件中，为防止日志文件过大，在本仓库的`watched`状态为`start`时清除此日志。关于Github Action的相关其他用法可见[本篇博客](https://shimmerjordan.site/2021/02/01/DeployGithubActions/)。

这里暂将博客记录作为README，以为只是本科毕业设计，合计也不会有外人来维护。图片链接换成了Gitee仓库图片，如果无法显示可以查看原文。以下为[博客原文](https://shimmerjordan.site/2021/03/08/introToSZ-education/)。



轼辙云 (sz-education)  is a new generation of microservices teaching management platform based on Spring Cloud, providing multi-tenancy, permission management, exams and exercises. 

The exams support single choice, multiple choice, indefinite choice, judgement and short answer questions.

轼 means handrail at the front of the car and 辙 means the tyre tracks left by the car going by. By naming the platform this way, I want to express that the ultimate victory will come to those who are forward-looking and have a habit of looking back and taking stock of the past.

# 1. Function Overview

The project is divided into two parts: the front-end website and the back-end management. The front-end mainly provides examination functions, while the back-end provides basic management and examination management functions.

The frontend mainly provides online examination and online learning functions

Backstage management is divided into: [system management](#1), [system monitoring](#2), [examination management](#3), [attachment management](#4), [personal management](#5)

<div id="1" ><b>System management: provides basic management of users, departments, roles and permissions, etc.</b></div>

> - User management: add, delete, change, import and export user information
> - Department management: add, delete and check department information
> - Role management: add, delete and check role information and assign permissions
> - Menu management: add, delete, change and check menu information, import and export
> - Terminal management: management of OAuth 2.0 clients, such as client_id, client_secret, access_token validity time, etc.
> - Routing management: gateway routing management, including the addition, deletion and checking of routes, refreshing routes, etc.

<div id="2" ><b>System monitoring: monitoring services, logs, etc.</b></div>

> - Log monitoring: view system logs
> - consul monitoring: consul service monitoring
> - zipkin monitoring: monitoring service call links
> - Service monitoring: spring boot admin service monitoring
> - Interface documentation: swagger api documentation

<div id="3" ><b>Examination Management: Provide management of courses, examinations, question banks, results, etc.</b></div>

> - Course management: add, delete, change and check course information
> - Exam management: add, delete and check exam information, question management, issue and recycle, question management supports simple text, rich text input, add from the question bank, etc.
> - Question bank management: add, delete and check question categories, add, delete and check question information
> - Results management: view results, export results
> - Knowledge base: add, delete and check knowledge base, upload attachments

<div id="4" ><b>Attachment management: all attachments of the project are stored in fastDfs, providing a unified management portal</b></div>

> - Attachment list: manage all attachments, such as user avatars, exam attachments, knowledge base attachments, etc.

<div id="5" ><b>Personal management: manage personal data and change passwords</b></div>

> - Personal information: modification of basic information such as name and avatar
> - Change password: change password

## System function diagram

<center>
    <img style="border-radius: 0.3125em;
    box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" 
    src="https://cdn.jsdelivr.net/gh/shimmerjordan/sz-education@master/docs/images/system-functions-en.png" width="100%">
    <br>
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;
    display: inline-block;
    color: #999;
    padding: 2px;">System Functions</div>
</center>


# 2.  Technology Selection

|          Technology Name           |                     Tool                      |
| :--------------------------------: | :-------------------------------------------: |
| Service Registration and Discovery |                   `Consul`                    |
|                Fuse                |             `Hystrix` + `Turbine`             |
|     Client-side load balancing     |                   `Ribbon`                    |
|       Internal service calls       |                    `Feign`                    |
|              Gateway               |            `Spring Cloud Gateway`             |
|      Authentication Forensics      |        `Spring Cloud OAuth2 ` + `JWT`         |
|         Program Monitoring         | `Spring Boot Admin ` / `Spring Boot Actuator` |
|  Distributed Configuration Center  |             `Spring Cloud Config`             |
| Distributed call chain monitoring  |       `Spring Cloud Sleuth` + `Zipkin`        |
|              Database              |                    `MySQL`                    |
|             Deployment             |          `Docker` + `docker-compose`          |
|            Build Tools             |                    `Maven`                    |
|     Back-end API Documentation     |                   `Swagger`                   |
|           Message Queue            |                  `RabbitMQ`                   |
|            File Storage            |                   `七牛云`                    |
|               Cache                |                    `Redis`                    |
|             Front-end              |                     `vue`                     |

# 3. System Architecture Diagram

<center>
    <img style="border-radius: 0.3125em;
    box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" 
    src="https://cdn.jsdelivr.net/gh/shimmerjordan/sz-education@master/docs/images/system-architecture-en.png" width="100%">
    <br>
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;
    display: inline-block;
    color: #999;
    padding: 2px;">System Architecture Diagram</div>
</center>


# 4. Core Dependencies

|      Name      |     Version      |
| :------------: | :--------------: |
| `Spring Boot`  | `2.1.11.RELEASE` |
| `Spring Cloud` | `Greenwich.SR4`  |

# 5. Project Structure

```c++
common                // System Common Module 
    ├── common-core         //System Common Core Module
    |						//Encapsulate generic configuration, constants, exceptions, base entities, etc.
    ├── common-feign        //System public feign module
    |						//Encapsulate generic feign configuration for carrying access_token between service calls
    ├── common-log          //System public log module
    |						//Encapsulate logging logic to record logs asynchronously
    ├── common-config		//General Basic Configuration
    ├── common-basic		//Public base configuration
    						//encapsulating basic configuration including Redis startup, gender enumeration, etc.
    ├── common-oss			//oss configuration, ecapsulating the oss configuration including FastDfs
    └── common-security     //System public security module, including resource server configuration
    						//Encapsulating the common configuration of resource servers in OAuth 2.0
    
modules               //Business Modules 
    |-- auth-service-parent     //Certification Authorization Services
        |-- auth-service-api          //Authentication authorization service api
        |-- auth-service             //Authentication authorization service specific implementation
    |-- user-service-parent     //user service
        |-- user-service-api         //user service api
        |-- user-service             //User services specific implementation
    |── exam-service-parent     //exam service
        |-- exam-service-api         //exam service api
        |-- exam-service             //exam service specific implementation
    └── msc-service-parent      //message center
        |-- msc-service-api          //message center api
        |-- msc-service              //message center specific implementation
frontend               //Frontend page
    ├── sz-education-ui         //Backend management front-end page
    ├── sz-education-web        //User front-end page
config-service         //Configuration Center (local repository)
gateway-service        //Gateway (dynamic routing)
monitor-service        //Spring boot amdin monitoring service
```

# 6. Interface Display

## Front Desk Examination Subsystem

| ![Front Login](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_login.png) | ![Front Home](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_home.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![Courses List](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/image/images_web_courses.png) | ![Exams List](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_exams.png) |
| ![Exam Interface one](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_exam.png) | ![Exam Interface two](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_exam1.png) |
| ![Exam records](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_record.png) | ![Answer Details](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_web_incorrect_answer.png) |

## Back office management subsystem

| ![Backend Login](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_login.png) | ![Backend Exam Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_exam.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![Backend Exam Share](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_exam_share.png) | ![Backend Exam Add](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_addExam.png) |
| ![Backend Exam Add Detail](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_addExam_detail1.png) | ![Backend Score Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_score_manage.png) |
| ![Backend Score Details](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_score_detail.png) | ![Backend Score Mark](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_score_mark.png) |
| ![Backend Subjects Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_subjects_manage.png) | ![Backend Subjects Adding Rich Edit](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_subjects_rich_edit.png) |
| ![Backend Menu Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_menu_manage.png) | ![Backend Client Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_client_manage.png) |
| ![Backend Role Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_role_manage.png) | ![Backend Route Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_route_manage.png) |
| ![Backend User Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_user_manage.png) | ![Backend Msg Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_msg.png) |

## Systems Monitoring

| ![Consul Monitor](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_consul.png) | ![Log Management](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_log_manage.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![Spring Boot Admin Monitor](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_spring_boot_admin.png) | ![Spring Boot Admin Monitor Detail](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_spring_boot_admin01.png) |
| ![Zipkin Monitor one](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_zipkin1.png) | ![Zipkin Monitor two](https://gitee.com/shimmerjordan/sz-education/raw/master/docs/images/images_ui_zipkin2.png) |

# System deployment

See more details on [Instruction for deploying sz-education locally](https://shimmerjordan.site/2021/03/10/sz-educationLocalDeploy/)

**Article token access is currently not available to everyone, please [contact me](https://shimmerjordan.site/2020/01/18/about) if you need token unlocking**

