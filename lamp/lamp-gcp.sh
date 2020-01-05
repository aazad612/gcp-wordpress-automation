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

#=============================================================================
#   Setup GCP Resources
#=============================================================================

gcloud compute firewall-rules create lamp-allow-http \
--action allow \
--target-tags lamp-http-tags \
--rules tcp:80

#  Create the compute instance
#======================================
gcloud compute instances create lamp-mono-script-test-php-gd \
--image-family=debian-9 \
--image-project=debian-cloud \
--machine-type=f1-micro \
--network-tier=standard \
--preemptible \
--tags lamp-http-tags \
--metadata-from-file startup-script=vm-bootstrap.sh

#  Create bucket to hold the config scripts
#  /etc/apache2/mods-enabled/dir.conf
#  /var/www/html/wp-config.php
#  /etc/apache2/apache2.conf
#======================================
gsutil mb gs://gcp-youtube-reference-scripts

gsutil cp -r config gs://gcp-youtube-reference-scripts


# Release 2
# Secure
# curl -s https://api.wordpress.org/secret-key/1.1/salt/
















