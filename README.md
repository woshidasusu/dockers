# dockers

云服务上，所有通过 docker 跑的服务：  

### nginx

nginx 服务，映射80端口，根据二级域名进行转发，如：  

- [http://blog.dasu.fun](http://blog.dasu.fun)
- [http://jenkins.dasu.fun](http://jenkins.dasu.fun)
- [http://gitbook.dasu.fun](http://gitbook.dasu.fun)
- [http://nextcloud.dasu.fun](http://nextcloud.dasu.fun)

### blog

nginx 运行的个人博客网站，跑在 9000 端口上  
[http://blog.dasu.fun](http://blog.dasu.fun:9000)  

### jenkins

jenkins 服务，自动更新个人博客网站和 gitbook，跑在 9001 端口上  
[http://jenkins.dasu.fun](http://jenkins.dasu.fun:9001)

### gitbook

gitbook 搭建的各种速查笔记，方便查阅，跑在 9002端口上
[http://gitbook.dasu.fun](http://gitbook.dasu.fun:9002)

### nextCloudy

nextCloud 搭建的个人网盘，跑在 9003 端口上
[http://nextcloud.dasu.fun](http://nextcloud.dasu.fun:9003)
