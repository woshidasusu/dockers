# blog
cd /var/jenkins_home/blog/codes
pwd
whoami
git status
git pull

sleep 5



# gitbook
#!/bin/sh

echo "1.====================基本信息============================"

cd /var/jenkins_home/gitbook/codes
pwd
whoami

echo "2.========================同步============================"

git status
git pull

#sleep 5


/usr/bin/ssh -o StrictHostKeyChecking=no 192.168.5.1 "
echo "3.=======================ssh宿主机========================";
pwd;
cd /usr/local/etc/github/Doc/;
pwd;
cp ./面试题/README.md ./gitbook/面试题积累/README.md;
cd gitbook/;
pwd;
gitbook build;

echo "4.========================拷贝gitbook网站========================";

pwd;
rm -rf /usr/local/etc/docker/gitbook/html/*;
cp -fr ./_book/* /usr/local/etc/docker/gitbook/html/;
ls /usr/local/etc/docker/gitbook/html/ -all;

exit 0;
"
#sleep 5


echo "5.========================更新仓库========================"
git add .
#sleep 5
git commit -m '@gitbook #auto this is update by jenkins'
#sleep 5
git status
git config user.email 295207731@qq.com
git config user.name woshidasusu
git push origin master
