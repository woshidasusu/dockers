# 使用基于 Debian 的 Jenkins 镜像作为基础
FROM jenkins/jenkins:lts

# 切换到 root 用户
USER root

# 安装 nvm
RUN curl -o- https://gitee.com/mirrors/nvm/raw/v0.39.0/install.sh | bash
RUN /bin/bash -c "source ~/.bashrc"
RUN nvm --version
RUN nvm install --lts
RUN npm config set registry https://registry.npm.taobao.org

# 安装 pnpm
RUN npm install -g pnpm

# 安装 yarn
RUN npm install -g yarn

# 切换回 Jenkins 用户
USER jenkins

EXPOSE 8080