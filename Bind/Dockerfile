FROM centos:7
MAINTAINER SHU

RUN yum -y --setopt=tsflags=nodocs update && \    
yum -y --setopt=tsflags=nodocs install bind bind-utils && \   
 yum clean all

# run the script to setup the enviroment
ADD setup_env.sh /setup_env.sh
RUN chmod 755 /setup_env.sh
RUN /setup_env.sh

# make the needed directories 
RUN mkdir /named/etc/named/ && mkdir /named/etc/named/zones
ADD named.conf /named/etc/named.conf
ADD named.conf.local /named/etc/named/named.conf.local
ADD db.cs642-shu.com /named/etc/named/zones/db.cs642-shu.com
ADD db.173.31 /named/etc/named/zones/db.173.31

# setup rndc key
RUN rndc-confgen -a -c /etc/rndc.key && \
    chown named:named /etc/rndc.key && \
    chmod 755 /etc/rndc.key 

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/usr/sbin/named", "-c", "/named/etc/named.conf", "-g", "-u", "named"]
