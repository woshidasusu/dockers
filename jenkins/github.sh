#!/bin/sh
pwd
whoami

echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

cd /root/Doc
pwd
git status
git pull

echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

cd /root/uidoc
pwd
git status
git pull


echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

cd /root/lowcode
pwd
git status
git pull

echo "分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>分割线"

exit 0
