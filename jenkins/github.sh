#!/bin/sh
# 在 jenkins 上创建项目，配置每天2点定时构建：H 2 * * *
# 配置执行脚本：
# cd /var/jenkins_home/dockers
# pwd
# git pull
# cd jenkins
# bash github.sh
####################################################################

pwd
whoami

echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

cd /var/jenkins_home/doc
pwd
git status
git pull

echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

cd /var/jenkins_home/uidoc
pwd
git status
git pull


echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

cd /var/jenkins_home/lowcode
pwd
git status
git pull

echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

exit 0
