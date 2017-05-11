#!/bin/bash

#Patches
yum update -y --exclude=kernel

#Tools
yum install -y subl git unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

#php
yum intsall -y php php-cli php-common php-devel php-mysql

#mysql
yum intsall -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#Download started content


service httpd start