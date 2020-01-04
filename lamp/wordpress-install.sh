#!/usr/bin/env bash
# #!/bin/bash
# Name       : gcp-lamp-wordpress.sh
# Usage Info : This script will setup all components for a LAMP backed
#              wordpress Stack
#
# Reference :
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04
# https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-ubuntu-16-04
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
#  Wordpress Install
#=============================================================================

sudo apt --assume-yes update
sudo apt install --assume-yes php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc

ROOTPASS="password"
DBNAME="wordpress"
WPUSER="wordpressuser"
WPPASS="wppass"
WPHOST="lcoalhost"
sudo mysql --host=${WPHOST} --user=root --password=${ROOTPASS} <<EOF
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO '${WPUSER}'@'${WPHOST}' IDENTIFIED BY '${WPPASS}';
FLUSH PRIVILEGES;
EOF


# mysql -h "server-name" -u root "password" "database-name" < "filename.sql"

cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

touch /tmp/wordpress/.htaccess
chmod 660 /tmp/wordpress/.htaccess

cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php

mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/html

sudo useradd -m gcpwp -g www-data
sudo chown -R gcpwp:www-data /var/www/html
sudo find /var/www/html -type d -exec chmod g+s {} \;
sudo chmod g+w /var/www/html/wp-content
sudo chmod -R g+w /var/www/html/wp-content/themes
sudo chmod -R g+w /var/www/html/wp-content/plugins

gsutil cp -r gs://gcp-youtube-reference-scripts/config .
#  /etc/apache2/mods-enabled/dir.conf
#  /var/www/html/wp-config.php

sudo cp ./config/dir.conf /etc/apache2/mods-enabled/dir.conf
sudo cp ./config/wp-config.php /var/www/html/wp-config.php
sudo cp ./config/apache2.conf /etc/apache2/apache2.conf
# Release 2
# Secure
# curl -s https://api.wordpress.org/secret-key/1.1/salt/

sudo systemctl restart apache2
sudo a2enmod rewrite
sudo apache2ctl configtest

