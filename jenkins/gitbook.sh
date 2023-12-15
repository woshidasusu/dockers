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
cd /root/github/Doc/;
pwd;
cp ./面试题/README.md ./gitbook/面试题积累/README.md;
cd gitbook/;
pwd;
npm install
npm run build;

echo "4.========================拷贝gitbook网站========================";

pwd;
rm -rf /root/gitbook/html/*;
cp -fr ./_book/* /root/gitbook/html/;
ls /root/gitbook/html/ -all;

exit 0;
"
#sleep 5
