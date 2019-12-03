cd /var/jenkins_home/blog/codes
pwd
whoami
git status
git pull

sleep 5

date>log
git add log
sleep 1
git config user.email 295207731@qq.com
git config user.name woshidasusu
git commit -m "this is commit by jenkins"
git push origin master
