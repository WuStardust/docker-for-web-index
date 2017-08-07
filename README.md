# docker-for-web-index
Docker files for web-index project

本工程是为web-index工程搭建docker而创建的.
dockerflie只完成了一部分的配置工作,需要在docker镜像建立起来后在容器中进一步进行的工作主要为安装mysql,并建立数据库.
最终的docker镜像链接如下:
https://hub.docker.com/r/wustardust/web-index/

运行镜像: 
docker run -t -i -p 80:8012 -p 8080:8756 --name=web-index web-index:v4 /bin/bash
service mysql start
/etc/init.d/nginx start
uwsgi --ini /home/web-index/web/uwsgi.ini

运行镜像之后,访问页面可以通过访问<容器ip>:8012或者127.0.0.1:80(建立容器时的映射端口)来访问通讯录页面.
