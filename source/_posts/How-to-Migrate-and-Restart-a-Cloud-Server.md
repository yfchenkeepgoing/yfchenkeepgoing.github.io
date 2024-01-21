---
title: How to Migrate and Restart a Cloud Server
date: 2024-01-21 19:31:01
tags:
- Cloud Server
categories: 
- 工具使用
---
# 迁移云服务器
## 1、租云服务器，配置其免密登录

将本地的公钥复制到云服务器的~/.ssh/authorized_keys中，或者使用云服务器平台提供的密钥，在本地的.ssh文件夹中添加密钥在本地的位置
第一次登录云服务器（未配置免密登录）的具体流程可以参照以下步骤：

IR_Group_7_project Demo Instruction

1. Login our VM instance
   Move key to secure location (eg. ~/.ssh in linux), then

```bash
chmod 600 path/to/shaoxi_key.pem
ssh -i path/to/shaoxi_key.pem shaoxi@52.174.147.101
```

## 2、在云服务器中安装docker

安装步骤参见官网：https://docs.docker.com/engine/install/ubuntu/
一般安装的版本为20.10.9，使用命令：`VERSION_STRING=5:20.10.9~3-0~ubuntu-focal`
查看docker是否安装成功：`docker --version`

## 3、在云服务器平台开放以下端口

22， 8000， 443， 80， 20000，协议均为TCP，源和目的地都为任何（0.0.0.0）

## 4、将本地的C:\Users\chen yi fan\django_lesson_1.tar上传到云服务器里

在powershell中执行的具体的命令为：
`scp .\django_lesson_1.tar azureuser@20.123.135.13:~/`

## 5、将镜像xxxx从本地文件xxxx.tar中加载出来

`sudo docker load -i xxxx.tar`

## 6、查看镜像是否成功加载出来

查看所有镜像的命令: `sudo docker images`

##  7、使用镜像重新创建并运行容器

`docker run -p 20000:22 -p 8000:8000 -p 80:80 -p 443:443 --name django_server -itd django_lesson:1.1`

## 8、登录到容器中

`sudo docker attach django_server`
登录为root用户

## 9、创建非root用户

`adduser acs`
赋予其sudo权限：`usermod -aG sudo acs`
设置密码

## 10、配置容器的免密登录

配置免密登录的过程是：在容器的.ssh/authorized_keys中写入本地的.ssh文件夹（C:\Users\chen yi fan\.ssh）中的公钥的内容
然后修改本地的.ssh/config文件，添加容器的信息，例如：

```
Host django_azure
    HostName 20.123.135.13
    User acs
    Port 20000
```

## 11、从本地/其他云服务器上登录到容器的命令

`ssh acs@ip -p 20000`
退出容器时注意不要关闭容器，而是挂起容器：ctrl+p ctrl+q

## 12、完成容器的一些配置：

nginx配置：
（1）修改yxc的acapp中的服务器IP
（2）将服务器的IP添加到项目的settings.py的ALLOWED_HOSTS中
（3）将yxc提供的nginx.conf写入容器的/etc/nginx/nginx.conf文件中
（4）将yxc提供的acapp.key写入容器的/etc/nginx/cert/acapp.key文件中
（5）将yxc提供的acapp.pem写入容器的/etc/nginx/cert/acapp.pem文件中
（6）启动nginx服务：`sudo /etc/init.d/nginx start`
（7）启动uwsgi服务：`uwsgi --ini scripts/uwsgi.ini`

redis配置：
（1）安装redis：`pip install django_redis`
（2）启动redis-server：`sudo redis-server /etc/redis/redis.conf`
（3）用`top`命令看有没有进程叫redis-server

django channels配置：
（1）安装channels_redis：`pip install channels_redis`
（2）启动django_channels：
  在~/acapp目录下执行：`daphne -b 0.0.0.0 -p 5015 acapp.asgi:application`

同时启动https（uwsgi）和wss（daphne）协议的服务后，项目就应该可以正常运行

## 13、启动https和wss服务

启动https服务：`uwsgi --ini scripts/uwsgi.ini`

启动wss服务：`daphne -b 0.0.0.0 -p 5015 acapp.asgi:application`

****************************************

# 重启云服务器

在云平台暂停云服务器后重新启动服务器并进入容器

## 1. 在云平台启动云服务器

需要等待5-10分钟才能完成重启的过程

## 2. 查看云服务器中已有的容器

运行命令：`sudo docker ps -a`

## 3. 启动被暂停/退出的容器

运行命令：`sudo docker start django_server`

## 4. 进入容器

在vscode上选择django_azure，点击进入即可

## 5. 启动容器中的服务

主要需要启动以下五个服务：

启动nginx服务：`sudo /etc/init.d/nginx start`

启动redis-server：`sudo redis-server /etc/redis/redis.conf`

启动uwsgi（https）服务：`uwsgi --ini scripts/uwsgi.ini`

启动wss服务：`daphne -b 0.0.0.0 -p 5015 acapp.asgi:application`

启动match system服务：`./main.py`
