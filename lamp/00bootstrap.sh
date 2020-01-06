#!/usr/bin/env bash
# #!/bin/bash
# Name       : vm-bootstrap.sh
# Usage Info : VM Startup Script for the Wordpress Stack
#
# ==================================
# Modification Log
# ==================================
# Date       : Author     : Comments
# ----------------------------------
# 2020/01/04 : Johney A   : created
#=============================================================================
. .profile
#======================================
#  Variables
#======================================
# VMNAME=$(curl http://metadata.google.internal/computeMetadata/v1/instance/hostname -H "Metadata-Flavor: Google")
BUCKETNAME="gcp-youtube-reference-scripts"

VMNAME=`hostname`
EXECDIR="/var/log/bootstrap"
mkdir -p ${EXECDIR}
cd ${EXECDIR}

#======================================
#  Copy Files
#======================================
gsutil cp -r gs://${BUCKETNAME}/lamp/config .
gsutil cp gs://${BUCKETNAME}/lamp/00bootstrap.var .
gsutil cp gs://${BUCKETNAME}/lamp/201-install-lamp.sh .
gsutil cp gs://${BUCKETNAME}/lamp/301-install-wordpress.sh .
chmod 700 *

#======================================
#  Execute the bootstrap sequence
#======================================
# populate variables
. bootstrap.var ${VMNAME} > bootstrap.log
# install LAMP stack
. 201-install-lamp.sh > 201lamp.log
# install wordpress stack
. 301-install-wordpress.sh > 301lamp.log

#=============================================================================

export alias cdbs='cd ${EXECDIR}'