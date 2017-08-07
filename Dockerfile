FROM ubuntu
MAINTAINER wushenghui <wu_hust@126.com>
ENV REFRESHED_AT 2017-8-7

RUN apt-get update

RUN apt-get install -y python3 python3-pip libmysqlclient-dev

RUN apt-get install -y python-dev
RUN apt-get -y -q install nginx
RUN pip3 install pymysql 
RUN pip3 install flask 
RUN pip3 install -U flask-cors
RUN apt-get -y -q install curl
RUN apt-get -y install uwsgi
RUN apt-get install uwsgi-plugin-python
RUN pip3 install uwsgi

RUN mkdir -p /home/web-index /home/web-index/web

COPY init.sh /home/web-index/init.sh
COPY www /home/web-index/web

RUN ln -s /home/web-index/web/nginx.conf /etc/nginx/conf.d/

RUN chmod +x /home/web-index/init.sh 
RUN chmod -R 755 /home/web-index/web

EXPOSE 8012 8756

CMD ["/home/web-index/init.sh"]