#!/bin/bash

terraform init -input=false
terraform workspace show
terraform workspace new prod 
echo "Commencing plan and save to directory...."

terraform plan -out="production_plan_terraform.json"
terraform apply -auto-approve -var-file="production/terraform.tfvars"
echo "Commencing apply...."
sleep 60
WEB=http://$(terraform output website)
echo "${WEB}"
echo "Please copy and paste ' curl -I ${WEB} ' to your command line to check if the application is running"

echo "Successful Build 🏗️  and Deployment 🚀"


