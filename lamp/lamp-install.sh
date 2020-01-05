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
# ==================================
# Modification Log
# ==================================
# Date       : Author     : Comments
# ----------------------------------
# 2020/01/04 : Johney A   : created
# 2020/01/05 : Johney A   : Added specific versions for php/mysql/apache2
#=============================================================================
#!/bin/bash
. $HOME/.profile

#=============================================================================
# Package Install
#=============================================================================

sudo apt update
# Apache2
sudo apt install --assume-yes apache2=2.4.25-3+deb9u9
# Php
sudo apt install --assume-yes --install-suggests php=1:7.0+49 libapache2-mod-php=1:7.0+49 php-mysql=1:7.0+49
# MySQL
sudo apt install --assume-yes mysql-server=5.5.9999+default
# suggested
# sudo apt install phpmyadmin php-cli php5-mysql php-pear

#=============================================================================
#  MySQL Setup
#=============================================================================
ROOTPASS="password"
DBNAME="wordpress"
WPUSER="wordpressuser"
WPPASS="wppass"
WPHOST="lcoalhost"

# MYSQL Setup Needs GUI
sudo mysql -u root <<_EOF_
UPDATE mysql.user SET Password=PASSWORD('$ROOTPASS') WHERE User='root';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
_EOF_

sudo systemctl restart apache2
