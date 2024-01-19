#!/bin/sh
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
