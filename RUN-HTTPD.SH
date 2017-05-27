#!/bin/bash
# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.

rm -rf /run/httpd/* /tmp/httpd*
exec /usr/sbin/apachectl -DFOREGROUND

#sudo chcon -t httpd_sys_content_t /

mv /gamep.jpg /var/www/html/gamep.jpg
mv /index.html /var/www/html/index.html
mv /login.php /var/www/html/login.php
mv /welcome.php /var/www/html/welcome.php