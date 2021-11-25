#!/bin/bash

terraform init -input=false
terraform workspace show
terraform workspace new dev 
echo "Commencing plan and save to directory...."

terraform plan -out="development_plan_terraform.json"
echo "Commencing apply...."

terraform apply -auto-approve -var-file="development/terraform.tfvars" 
sleep 60
WEB=http://$(terraform output website) 
echo "${WEB}"
echo "Please copy and paste ' curl -I ${WEB} ' to your command line to check if the application is running"

echo "Please complete this step under 1 minute as this module will be destroyed"
sleep 60
# destroy
echo "Commencing destroy...."

terraform destroy -auto-approve

echo "Successful Build 🏗️  and Destroy 🔥"

