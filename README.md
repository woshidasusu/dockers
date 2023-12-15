# dockers

云服务上，所有通过 docker 跑的服务：  

### nginx

nginx 服务，映射80端口，根据二级域名进行转发，如：  

- [http://blog.dasu.fun](http://blog.dasu.fun)
- [http://jenkins.dasu.fun](http://jenkins.dasu.fun)
- [http://gitbook.dasu.fun](http://gitbook.dasu.fun)
- [http://nextcloud.dasu.fun](http://nextcloud.dasu.fun)

### blog

nginx 运行的个人博客网站，跑在 9000 端口上  
[http://blog.dasu.fun](http://blog.dasu.fun:9000)  

### jenkins

jenkins 服务，自动更新个人博客网站和 gitbook，跑在 9001 端口上  
[http://jenkins.dasu.fun](http://jenkins.dasu.fun:9001)

### gitbook

gitbook 搭建的各种速查笔记，方便查阅，跑在 9002端口上
[http://gitbook.dasu.fun](http://gitbook.dasu.fun:9002)

### nextCloud

nextCloud 搭建的个人网盘，跑在 9003 端口上
[http://nextcloud.dasu.fun](http://nextcloud.dasu.fun:9003)

## 教程

### 第一步 服务器环境准备

- 云服务器上生成 ssh 密钥，并把 id_rsa.pub 配置到 github 账号后台上 
  - `ssh-keygen -t rsa -b 4096 -C "295207731@qq.com"`
- 安装 docker 环境
  - 直接在阿里云控制台的操作：
  - 云服务器ECS/实例/实例详情/定时与自动化任务/安装软件/开源社区提供的软件-Docker社区版
- 安装 docker-compose 环境
  - `sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
  - `sudo chmod +x /usr/local/bin/docker-compose`
  - `docker-compose --version`
- 安装 git 环境
  - `sudo yum update`
  - `sudo yum install git`
  - `git --version`
- 安装 nvm 和 node 环境
  - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
  - `source ~/.bashrc`
  - `nvm install node`
  - `node -v`

### 第二步 拉取github项目

- 进入 `/root/` 目录，创建一下这些目录：
  - `mkdir blog`
  - `mkdir github`
  - `mkdir postgres`

- cd

### 第三步 docker-compose up -d
- `cd dockers`
- `docker-compose up -d` # 一键创建、启动后台运行的容器, -d 表示后台运行