gsutil rb gs://wp-lamp-config-bucket
gcloud compute instances delete wp-lamp -q
gcloud compute firewall-rules delete wp-lamp-allow-http-icmp-ssh -q
gsutil rm -r gs://testvm1-config-bucket
gcloud compute instances delete testvm1 
gcloud compute firewall-rules delete testvm1-allow-http-icmp-ssh 
gsutil rm -r gs://testvm12-config-bucket
gcloud compute instances delete testvm12 
gcloud compute firewall-rules delete testvm12-allow-http-icmp-ssh 
gsutil rm -r gs://testvm123-config-bucket
gcloud compute instances delete testvm123 
gcloud compute firewall-rules delete testvm123-allow-http-icmp-ssh 
gsutil rm -r gs://gcp-youtube-reference-scripts
gcloud compute instances delete gcpbootstrap 
gcloud compute firewall-rules delete gcpbootstrap-allow-http-icmp-ssh 
gsutil ls
gcloud compute instances list
gcloud compute firewall-rules list
gsutil rm -r gs://gcp-youtube-reference-scripts
gcloud compute instances delete bootstrapped 
gcloud compute firewall-rules delete bootstrapped-allow-http-icmp-ssh 
gsutil ls
gcloud compute instances list
gcloud compute firewall-rules list
gsutil rm -r gs://gcp-youtube-reference-scripts
gcloud compute instances delete boot2 
gcloud compute firewall-rules delete boot2-allow-http-icmp-ssh 
gsutil ls
gcloud compute instances list
gcloud compute firewall-rules list
gsutil rm -r gs://gcp-youtube-reference-scripts
gcloud compute instances delete boot3 
gcloud compute firewall-rules delete boot3-allow-http-icmp-ssh 
gsutil ls
gcloud compute instances list
gcloud compute firewall-rules list
gsutil rm -r gs://gcp-youtube-reference-scripts
gcloud compute instances delete boot4 
gcloud compute firewall-rules delete wpgcp-allow-http-icmp-ssh 
gsutil ls
gcloud compute instances list
gcloud compute firewall-rules list
gsutil rm -r gs://gcp-youtube-reference-scripts
gcloud compute instances delete boot5 
gcloud compute firewall-rules delete wpgcp-allow-http-icmp-ssh 
gsutil ls
gcloud compute instances list
gcloud compute firewall-rules list
