#!/bin/bash

#Patches
yum update -y --exclude=kernel

#Tools
yum install -y subl git unzip screen

#php
yum install -y php php-cli php-common php-devel php-mysql

#mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#Download started content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/sidmat13/vagrantest/master/files/intex.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/sidmat13/vagrantest/master/files/info.php

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start
