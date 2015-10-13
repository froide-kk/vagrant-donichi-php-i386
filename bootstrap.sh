#!/usr/bin/env bash

yum install -y httpd
yum install -y mysql-server
yum install -y php
yum install -y epel-release
yum install -y phpMyAdmin
yum update -y
ln -s /mnt/fuelphp /home/vagrant/fuelphp
cp /mnt/fuelphp/vagrant/*.conf /etc/httpd/conf.d
curl get.fuelphp.com/oil | sh
sed -ie "s/;date.timezone =/date.timezone = Asia\/Tokyo/" /etc/php.ini
chkconfig httpd on
chkconfig mysqld on
service httpd start
service mysqld start
mysqladmin -u root password root
