#pull centos 7 base image
FROM centos:7
MAINTAINER SHU

RUN yum -y --setopt=tsflags=nodocs update && \    
yum -y --setopt=tsflags=nodocs install httpd && \   
 yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh

ADD httpd.conf /etc/httpd/conf/httpd.conf
RUN chmod -v +r /etc/httpd/conf/httpd.conf
ADD game1.py /var/www/cgi-bin/game1.py
RUN chmod -v +x /var/www/cgi-bin/game1.py
ADD testProjClient.js /var/www/html/testProjClient.js
ADD GamePage.htm /var/www/html/GamePage.htm
RUN chmod -v +r /var/www/html/testProjClient.js
RUN chmod -v +r /var/www/html/GamePage.htm


RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]

