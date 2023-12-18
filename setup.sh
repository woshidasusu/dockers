#!/bin/bash

log_file="setup.log"

# 函数：打印日志
log() {
  local datetime=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[$datetime] $1" >> "$log_file"
  echo "$1"
}


cd /root/
mkdir blog
mkdir github
mkdir postgres
mkdir doc
mkdir gitbook

# 拉取 github 仓库
log "拉取 github 仓库..."
cd /root/
git clone git@github.com:woshidasusu/dockers.git

cd /root/blog
git clone git@github.com:woshidasusu/woshidasusu.github.io.git

cd /root/github
git clone git@github.com:woshidasusu/Doc.git


# 更新软件库
sudo yum update -y
# 安装 Docker 环境
log "开始安装 Docker 环境..."
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo usermod -aG docker $USER
log "Docker 环境安装完成。"

# 安装 Docker Compose 环境
log "开始安装 Docker Compose 环境..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
log "Docker Compose 环境安装完成。"
docker-compose --version

# 安装 Git 环境
log "开始安装 Git 环境..."
sudo yum install -y git
log "Git 环境安装完成。"
git --version

# 安装 nvm 和 Node.js 环境
log "开始安装 nvm 和 Node.js 环境..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node
log "nvm 和 Node.js 环境安装完成。"
node -v

# 安装 Whistle 环境
log "开始安装 Whistle 环境..."
npm install whistle -g
log "Whistle 环境安装完成。"
w2 start

# 构建 gitbook
log "开始构建 gitbook..."
cd /root/github/Doc/gitbook
npm install
npm run build
rm -rf /root/gitbook/html/*;
cp -fr ./_book/* /root/gitbook/html/;
ls /root/gitbook/html/ -all;


log "所有环境安装完成。"


