**1.Redis:**  （Remote Dictionary Server )，即远程字典服务，是一个开源的使用ANSI C语言编写、
          支持网络、可基于内存亦可持久化的日志型、Key-Value数据库，并提供多种语言的API。          

​    windows下Redis的安装和使用参考--https://www.cnblogs.com/liuqingzheng/p/9831331.html
​      
​    redis的安装与配置参考--https://www.cnblogs.com/shaojiang/p/10350269.html（安装，配置，使用）

**2.RabbitMQ:**  MQ即Message Queue(消息队列)，一种程序对程序的通信方法。
             RabbitMQ一款是实现了高级消息队列协议（AMQP）的开源消息代理软件（亦称面向消息的中间件）。
             RabbitMQ服务器是用Erlang语言编写的，而集群和故障转移是构建在开放电信平台框架上的。
             所有主要的编程语言均有与代理接口通讯的客户端库。
             

​         Windows 下安装RabbitMQ服务器及基本配置参考--https://www.cnblogs.com/vaiyanzi/p/9531607.html
​       
​         win10下Rabbitmq的安装和配置--https://blog.51cto.com/ccj168/2362486

**3.Node.js：**  简单的说 Node.js 就是运行在服务端的 JavaScript。
             Node.js 是一个基于Chrome JavaScript 运行时建立的一个平台。
             Node.js是一个采用事件驱动、非阻塞式I/O模型，基于Google的V8引擎的JavaScript运行环境。
             V8引擎执行Javascript的速度非常快，性能非常好。
             

​         Node.js安装及环境配置之Windows篇参考--https://www.cnblogs.com/liuqiyun/p/8133904.html

**4.Consul:**   consul是google开源的一个使用go语言开发的微服务发现、配置管理中心。
            启动地址：http://localhost:8500
            

Windows系统下consul的安装、启动、配置参考--https://www.cnblogs.com/SCscHero/p/SCscHero.html



### 安装QRCode依赖

项目的二维码生成功能是依赖QRCode.jar这个jar包的，该jar包在源码的`docs/deploy`目录下，需要手动执行命令安装到本地的maven仓库，进入windos命令行，输入具体命令如下，注意文件目录替换成你jar包存放在本地实际的目录：

`mvn install:install-file -Dfile=QRCode.jar -DgroupId=QRCode -DartifactId=QRCode -Dversion=3.0 -Dpackaging=jar -Dfile=D:\ProgramData\GitKraken_Repository\spring-microservice-exam\docs\deploy\QRCode.jar`



### 启动环境

1.启动Consul:  命令行输入 -- `consul agent -dev`

2.启动Redis:  命令行输入--`redis-cli`

3.启动RabbitMQ:命令行输入 --`rabbitmqctl status` ,检查其是否在运行状态



### 部署所遇问题

1. I/O error on POST request for "http://localhost:9411/api/v2/spans": Connect timed out; 

Caused by: java.net.SocketTimeoutException: Connect timed out

原因：依赖中含有 `zipkin` 依赖，但是没有配置 zipkin-server, 默认提交9411

解决：进行 zipkin-server配置，参考--https://blog.csdn.net/suolongdse/article/details/108065111



2.![image](docs\images\MyDeployNotes\image-20201104171717053.png)

运行ui时出现如上错误。

解决：从别处找到一个如下文件夹，放入到路径：D:\ProgramData\GitKraken_Repository\spring-microservice-exam\frontend\spring-microservice-exam-ui\node_modules

![image](docs\images\MyDeployNotes\image-20201104173228165.png)