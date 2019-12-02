# dockers

云服务上，所有通过 docker 跑的服务：  

### blog

nginx 运行的个人博客网站
[http://blog.dasu.fun](http://blog.dasu.fun:9000)  

### jenkins

jenkins 服务，自动更新个人博客网站
[http://jenkins.dasu.fun](http://jenkins.dasu.fun:9001)

### nginx

nginx 服务，映射80端口，根据二级域名进行转发，如：  

- [http://blog.dasu.fun](http://blog.dasu.fun)
- [http://jenkins.dasu.fun](http://jenkins.dasu.fun)

