#!/usr/bin/env zsh
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
# 2020/01/02 : Johney-Aazad    : Created
# 2020/01/04 : Zander-Aazad    : Modularized and parameterized all blocks
# 2020/01/05 : Lisa-Aazad      : Added Cleanup Scripts
#=============================================================================
#!/bin/bash
#. $HOME/.profile
. $HOME/.zshrc

#======================================
#  Variables
#======================================
if [ -z "$1" ]
then
      echo "You didnt specify the VM name young man"
      exit 0
else
      VM=$1
fi

VMNAME=${VM}
FWRULENAME=wpgcp-allow-http-icmp-ssh
FWRULES="tcp:80,icmp,tcp:22"
FWTAGS="allow-http-icmp-ssh"
VMTYPE="f1-micro"
BUCKETNAME="gcp-youtube-reference-scripts"
# BUCKETNAME="${VMNAME}-config-bucket"
ENV="prod"
SME="trainingwp"

#=============================================================================
#  Gcloud Resource Creation
#=============================================================================
# Create firewall for HTTP, PING, SSH
gcloud compute firewall-rules create ${FWRULENAME}  \
--action=allow \
--target-tags=${FWTAGS} \
--rules=${FWRULES}

# Create compute instance,
# Storage-RW added to write config files to S3
gcloud compute instances create ${VMNAME} \
--image-family=debian-9 \
--image-project=debian-cloud \
--machine-type=${VMTYPE} \
--preemptible \
--tags=${FWTAGS} \
--scopes=storage-rw,default \
--labels="env=${ENV},sme=${SME}" \
--metadata startup-script-url=gs://gcp-youtube-reference-scripts/lamp/00bootstrap.sh

# Create Bucket to hold GCP Resources
# gsutil mb gs://${BUCKETNAME}

#=============================================================================
#  Gcloud Resource Cleanup & Verify
#=============================================================================
# gsutil rm -r gs://${BUCKETNAME}
# gcloud compute instances delete ${VMNAME} -q
# gcloud compute firewall-rules delete ${FWRULENAME} -q

# gsutil ls
# gcloud compute instances list
# gcloud compute firewall-rules list

echo #!/usr/bin/env zsh" > cleanup.sh
echo "gsutil rm -r gs://${BUCKETNAME}" >> cleanup.sh
echo "gcloud compute instances delete ${VMNAME} " >> cleanup.sh
echo "gcloud compute firewall-rules delete ${FWRULENAME} " >> cleanup.sh

echo "gsutil ls" >> cleanup.sh
echo "gcloud compute instances list" >> cleanup.sh
echo "gcloud compute firewall-rules list" >> cleanup.sh

chmod 700 cleanup.sh
#=============================================================================

