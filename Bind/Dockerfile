FROM centos:7
MAINTAINER SHU

RUN yum -y --setopt=tsflags=nodocs update && \    
yum -y --setopt=tsflags=nodocs install bind bind-utils && \   
 yum clean all

ADD named.conf /named.conf
ADD named.conf.local /named.conf.local
ADD db.cs642-shu.com /db.cs642-shu.com
ADD db.173.31 /db.173.31

EXPOSE 53

# Script to move config files into place and start services
ADD installBind.sh /installBind.sh

RUN chmod -v +x /installBind.sh

CMD ["/installBind.sh"]
