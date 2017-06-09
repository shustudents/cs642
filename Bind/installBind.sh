#!/bin/bash

# make the needed directories
sudo chmod 755 /etc/named
sudo mkdir /etc/named/zones

# move files nessisary locations
mv /named.conf /etc/named.conf
mv /named.conf.local /etc/named/named.conf.local
mv /db.cs642-shu.com /etc/named/zones/db.cs642-shu.com
mv /db.173.31 /etc/named/zones/db.173.31

# check services
sudo named-checkconf

# start services
/etc/init.d/named start

# configure it to start on startup
sudo chkconfig named on
