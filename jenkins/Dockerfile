# 使用基于 Debian 的 Jenkins 镜像作为基础
FROM jenkins/jenkins:lts

# 切换到 root 用户
USER root

# 安装 Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# 安装 pnpm
RUN npm install -g pnpm

# 安装 yarn
RUN npm install -g yarn

# 切换回 Jenkins 用户
USER jenkins

EXPOSE 8080