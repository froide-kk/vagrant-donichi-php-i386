#!/usr/bin/env bash

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
yum install -y httpd
yum install -y mysql-server
yum install -y php
yum install -y epel-release
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
yum install -y phpMyAdmin
ln -s /mnt/fuelphp /home/vagrant/fuelphp
cp /mnt/fuelphp/vagrant/*.conf /etc/httpd/conf.d
curl get.fuelphp.com/oil | sh
sed -i "s/;date.timezone =/date.timezone = Asia\/Tokyo/" /etc/php.ini
chkconfig httpd on
chkconfig mysqld on
service httpd start
service mysqld start
mysqladmin -u root password root
