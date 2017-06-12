#!/bin/bash

apt-get update
apt-get install docker.io docker-compose awscli -y
systemctl start docker
systemctl enable docker 

