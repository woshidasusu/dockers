# 使用基于 Debian 的 Jenkins 镜像作为基础
FROM jenkins/jenkins:lts

# 切换到 root 用户
USER root

# 将 Node.js 镜像复制到 Jenkins 镜像中
COPY --from=node:latest /usr/local/bin/node /usr/local/bin/node

# 将 Node.js 添加到环境变量
ENV PATH="/usr/local/bin/node:${PATH}"

# 安装 pnpm
RUN npm install -g pnpm

# 安装 yarn
RUN npm install -g yarn

# 切换回 Jenkins 用户
USER jenkins

EXPOSE 8080