#!/usr/bin/env zsh

gsutil -m cp -r lamp gs://gcp-youtube-reference-scripts
. lamp/100-create-gcp-resources.sh $1
gcloud compute ssh $1
