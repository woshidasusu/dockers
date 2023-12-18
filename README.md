# dockers

云服务上，所有通过 docker 跑的服务：

### nginx

nginx 服务，映射 80 端口，根据二级域名进行转发，如：

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

gitbook 搭建的各种速查笔记，方便查阅，跑在 9002 端口上
[http://gitbook.dasu.fun](http://gitbook.dasu.fun:9002)

### nextCloud

nextCloud 搭建的个人网盘，跑在 9003 端口上
[http://nextcloud.dasu.fun](http://nextcloud.dasu.fun:9003)

## 教程 - 手动版

### 服务器环境准备

- 云服务器上生成 ssh 密钥，并把 id_rsa.pub 配置到 github 账号后台上
  - `ssh-keygen -t rsa -b 4096 -C "295207731@qq.com"`
- 开放云服务器的 80 和 443 端口访问
  - 直接在控制台的安全组入方向操作
  - 协议（TCP），端口范围（80/80，443/443），授权对象（0.0.0.0/0）
  - 如果没有域名，想通过 ip:port 直接访问，还需要将对应端口放开
- 安装 docker 环境
  - 直接在阿里云控制台的操作：
  - 云服务器 ECS/实例/实例详情/定时与自动化任务/安装软件/开源社区提供的软件-Docker 社区版
- 安装 docker-compose 环境
  - `sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
  - `sudo chmod +x /usr/local/bin/docker-compose`
  - `docker-compose --version`
- 安装 git 环境
  - `sudo yum install git`
  - `git --version`
- 安装 nvm 和 node 环境
  - `curl -o- https://gitee.com/mirrors/nvm/raw/v0.39.0/install.sh | bash`
  - `source ~/.bashrc`
  - `nvm install node`
  - `node -v`
- 安装 whistle 环境
  - `npm install whistle -g`
  - `w2 start`

### 拉取 github 项目

- 进入 `/root/` 目录，创建一下这些目录：

  - `mkdir blog` # hexo 构建生成的博客资源
  - `mkdir github` # 源代码目录
  - `mkdir postgres` # 数据库
  - `mkdir doc` # gitbook 构建 Doc 仓库生成的资源（主要是平时的积累）
  - `mkdir gitbook` # gitbook 构建 gitbook 仓库生成的资源（主要是一些速查笔记）

### docker-compose up -d

- 进入 `/root/dockers` 目录，执行：
  - `docker-compose up -d` # 一键创建、启动后台运行的容器, -d 表示后台运行

## 教程 - 脚本版

### 服务器环境准备

- 云服务器上生成 ssh 密钥，并把 id_rsa.pub 配置到 github 账号后台上
  - `ssh-keygen -t rsa -b 4096 -C "295207731@qq.com"`
- 开放云服务器的 80 和 443 端口访问
  - 直接在控制台的安全组入方向操作
  - 协议（TCP），端口范围（80/80，443/443），授权对象（0.0.0.0/0）
  - 如果没有域名，想通过 ip:port 直接访问，还需要将对应端口放开

### 服务器环境脚本

- 在服务器上执行：

```bash
cat << 'EOF' > setup.sh

#!/bin/bash

# 函数：打印日志
log() {
  echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  echo "$1"
}

# 更新软件库
sudo yum update -y
# 安装 Docker 环境
log "开始安装 Docker 环境..."
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo cp /etc/docker/daemon.json /etc/docker/daemon.json.bak
sudo tee /etc/docker/daemon.json <<-'EOF2'
{
  "registry-mirrors": ["https://docker.mirrors.tuna.tsinghua.edu.cn"]
}
EOF2
sudo systemctl start docker
sudo usermod -aG docker $USER
docker -v
log "Docker 环境安装完成。"

# 安装 Docker Compose 环境
log "开始安装 Docker Compose 环境..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
log "Docker Compose 环境安装完成。"
docker-compose --version

# 安装 Git 环境
log "开始安装 Git 环境..."
sudo yum install -y git
log "Git 环境安装完成。"
git --version

# 安装 nvm 和 Node.js 环境
log "开始安装 nvm 和 Node.js 环境..."
curl -o- https://gitee.com/mirrors/nvm/raw/v0.39.0/install.sh | bash
source ~/.bashrc
nvm --version
nvm install --lts
npm config set registry https://registry.npm.taobao.org
log "nvm 和 Node.js 环境安装完成。"
node -v

# 安装 Whistle 环境
log "开始安装 Whistle 环境..."
npm install whistle -g
log "Whistle 环境安装完成。"
w2 start


# 拉取 github 仓库
log "拉取 github 仓库..."

cd /root/
mkdir blog
mkdir github
mkdir postgres
mkdir doc
mkdir gitbook

echo -e "Host github.com\n  StrictHostKeyChecking no" >> ~/.ssh/config
git clone git@github.com:woshidasusu/dockers.git

cd /root/blog
git clone git@github.com:woshidasusu/woshidasusu.github.io.git

cd /root/github
git clone git@github.com:woshidasusu/Doc.git


# 构建 gitbook
log "开始构建 gitbook..."
cd /root/github/Doc/gitbook
rm -rf node_modules
npm install
npm run build
mkdir /root/gitbook/html
rm -rf /root/gitbook/html/*;
cp -fr ./_book/* /root/gitbook/html/
ls /root/gitbook/html/ -all

log "所有环境安装完成。"
docker -v
docker-compose --version
node -v


EOF

```

- 执行后，会在当前目录下生成一份 setup.sh 文件，继续执行：
- `chmod +x setup.sh` # 将文件设置成可执行
- `bash setup.sh` # 执行脚本

脚本会自动去安装 docker, docker-compose, git, nvm, node, whistle 以及拉取 github 的项目
注：有些下载源是 github 的可能会失败，如果失败了需要手动执行

### docker-compose up -d

进入上述脚本下载的 dockers 目录，在该目录执行：
`docker-compose up -d`
