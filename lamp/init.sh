










http://34.70.1.226/


http://34.70.1.226/index.php

gcloud compute

debian-9-stretch-v20191210


gcloud compute images list


###############

gcloud compute instances create gcp-wordpress \
--image-family=debian-9 \
--image-project=debian-cloud \
--machine-type=f1-micro \
--preemptible


gcloud compute instances create lamp-mono-script-test \
--image-family=debian-9 \
--image-project=debian-cloud \
--machine-type=f1-micro \
--network-tier=standard \
--preemptible


https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04

dir.conf
sudo vi /var/www/html/wp-config.php



sudo apt update
sudo apt install apache2
sudo apt install php libapache2-mod-php php-mysql
sudo apt install mysql-server
sudo apt install phpmyadmin
sudo apt install php-cli





sudo mysql_secure_installation

sudo systemctl restart apache2
sudo systemctl status apache2








http://10.128.0.3/phpinfo.php

sudo apt-get install mysql-server php5-mysql php-pear






# Debian/Ubuntu
# * Select apache2.
# * Select yes to use dbconfig-common for database setup.
# * Enter the database administrator's password that you chose during MySQL configuration.
# * Enter a password for the phpMyAdmin application.


sudo mysql
SELECT user,authentication_string,plugin,host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
SELECT user,authentication_string,plugin,host FROM mysql.user;


-----------

https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lamp-on-ubuntu-16-04


CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

sudo apt-get update
sudo apt-get install php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc


sudo systemctl restart apache2

sudo vi /etc/apache2/apache2.conf
<Directory /var/www/html/>
    AllowOverride All
</Directory>

sudo a2enmod rewrite
sudo apache2ctl configtest
sudo systemctl restart apache2

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
curl -s https://api.wordpress.org/secret-key/1.1/salt/


<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>


curl http://10.128.0.3:80

http://34.70.1.226


GCLOUD WIDE FLAGS
    These flags are available to all commands: --account, --billing-project,
    --configuration, --flags-file, --flatten, --format, --help,
    --impersonate-service-account, --log-http, --project, --quiet,
    --trace-token, --user-output-enabled, --verbosity
