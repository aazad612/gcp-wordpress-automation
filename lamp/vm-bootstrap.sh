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
EXECDIR="/var/log/bootstrap"
# VMNAME=$(curl http://metadata.google.internal/computeMetadata/v1/instance/hostname -H "Metadata-Flavor: Google")
VMNAME=`hostname`

. bootstrap.var ${VMNAME}
#======================================
#  Copy Files
#======================================
mkdir -p ${EXECDIR}
cd ${EXECDIR}
gsutil cp -r gs://${BUCKET}/config .

#======================================
#  Copy Files
#======================================










