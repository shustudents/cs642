FROM centos:7
MAINTAINER SHU

RUN yum -y --setopt=tsflags=nodocs update && \    
yum -y --setopt=tsflags=nodocs install rsyslog && \   
yum -y --setopt=tsflags=nodocs install initscripts && \
 yum clean all

EXPOSE 514
EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD rsyslog.conf /etc/rsyslog.conf
ADD run-syslog.sh /run-syslog.sh

#RUN chmod -v +x /run-syslog.sh
#CMD ["/run-syslog.sh"]

#CMD /usr/sbin/service rsyslog restart
ENTRYPOINT ["/usr/sbin/rsyslogd"]
CMD ["-n"]
