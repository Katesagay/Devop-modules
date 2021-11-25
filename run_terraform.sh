#!/bin/bash

# Initialise the configuration
terraform init -input=false
# Plan and deploy andauto approve and then destroy outputname of website then / if it fails run terraform taint
terraform workspace show
terraform workspace new dev 

terraform plan -var-file="development/terraform.tfvars"
terraform apply -auto-approve
# wait a minute after successful deployment 
sleep 60
#  curl
curl -I http://$(terraform output website)
# destroy
terraform destroy -auto-approve

