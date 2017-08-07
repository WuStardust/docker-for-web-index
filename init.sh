#!/bin/bash

service mysql start
/etc/init.d/nginx restart
uwsgi --ini /home/web-index/web/uwsgi.ini
