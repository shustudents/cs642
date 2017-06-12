#!/bin/bash

apt-get update
apt-get install docker.io docker-compose awscli -y
systemctl start docker
systemctl enable docker 

docker run -d \
--name=consul \
-v /mnt:/data \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 53:53/udp \
progrium/consul \
-server \
-advertise $(curl http://169.254.169.254/latest/meta-data/local-ipv4) \
-bootstrap-expect 1








#docker run -d \
#--net=host \
#--name=consul \
#-e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' consul agent \
#-v /home/consul:/consul/data \
#-server \
#-bind=$(curl http://169.254.169.254/latest/meta-data/local-ipv4) \
#-bootstrap-expect=1 
#-retry-join=<root agent ip> \
