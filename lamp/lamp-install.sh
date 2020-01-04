#!/usr/bin/env bash
# #!/bin/bash
# Name       : gcp-lamp-wordpress.sh
# Usage Info : This script will setup all components for a LAMP backed
#              wordpress Stack
#
# Reference :
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04
# https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-ubuntu-16-04
#
#
# Relese 2 - DB Admin Product
# Debian/Ubuntu
# * Select apache2.
# * Select yes to use dbconfig-common for database setup.
# * Enter the database administrator's password that you chose during MySQL configuration.
# * Enter a password for the phpMyAdmin application.
# ==================================
# Modification Log
# ==================================
# Date       : Author     : Comments
# ----------------------------------
# 2020/01/04 : Johney A   : created
#=============================================================================
#!/bin/bash
. $HOME/.profile
. $HOME/.bashrc

#=============================================================================
#  Lamp Install
#=============================================================================

sudo apt update
# Apache
# release?
sudo apt install --assume-yes apache2
# php
# release?
sudo apt install --assume-yes php libapache2-mod-php php-mysql
# Mysql
# release?
sudo apt install --assume-yes mysql-server
# Are these needed?
# sudo apt install phpmyadmin
# sudo apt install php-cli
# php5-mysql php-pear


ROOTPASS="password"
DBNAME="wordpress"
WPUSER="wordpressuser"
WPPASS="wppass"
WPHOST="lcoalhost"

# MYSQL Setup Needs GUI
sudo mysql -u root <<EOF
UPDATE mysql.user SET Password=PASSWORD('$ROOTPASS') WHERE User='root';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF


sudo systemctl restart apache2


