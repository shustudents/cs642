#!/bin/bash

rm -rf /run/httpd/* /tmp/httpd*
# start service
exec /usr/sbin/apachectl -DFOREGROUND
