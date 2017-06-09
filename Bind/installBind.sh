#!/bin/bash

# make the needed directories
chmod 755 /etc/named
mkdir /etc/named/zones

# move files nessisary locations
mv /named.conf /etc/named.conf
mv /named.conf.local /etc/named/named.conf.local
mv /db.cs642-shu.com /etc/named/zones/db.cs642-shu.com
mv /db.173.31 /etc/named/zones/db.173.31

# check services
named-checkconf

# start services
/etc/init.d/named start

# configure it to start on startup
chkconfig named on
