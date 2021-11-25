

# Welcome to My DevOps Challenge!
## Requirements

Hi! 
To deploy and run this application  follow the steps below:

 1.  Clone this repo
 2. Provide the relevent values for the variables in both the d`evelopment/terraform.tfvars` file and the `production/terraform.tfvars`. 
 3. Provide `access keys`, `secret keys` and a `region` to deploy the infrastructure to your environment -  make use of the `providers.tf` file in the root directory.
 4.  To test the application in development, please run `run_terraform_development.sh`
 5. To deploy the application in production, please run `run_terraform_development.sh`
 6. Please follow the instructions given in the console
 

# Required input variable
Before creating the resources you will need to provide input these variables in the `terraform.tfvars` file.

    domain_name
    
    bucket_acl
    
    force_destroy
    
    cloudfront_actions_enabled
    
    S3_actions_enabled
     
    email_address
    
    topic_name
    
    sns
    
    account-id
  # Architecture 
![image](https://user-images.githubusercontent.com/37669567/143487020-4b959b9d-c6f6-4e37-bbf3-2863f20cc3df.png)



## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_distribution_alarm"></a> [alert\_distribution\_alarm](#module\_alert\_distribution\_alarm) | ./global/cloudwatch/modules/alert_distribution/ | n/a |
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | ./modules/cloudfront/ | n/a |
| <a name="module_cloudfront_alarm"></a> [cloudfront\_alarm](#module\_cloudfront\_alarm) | ./global/cloudwatch/modules/cloudfront/ | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ./modules/route53/ | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/s3/ | n/a |
| <a name="module_s3_alarm"></a> [s3\_alarm](#module\_s3\_alarm) | ./global/cloudwatch/modules/s3/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_S3_actions_enabled"></a> [S3\_actions\_enabled](#input\_S3\_actions\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | n/a | `any` | n/a | yes |
| <a name="input_cloudfront_actions_enabled"></a> [cloudfront\_actions\_enabled](#input\_cloudfront\_actions\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_distribution_id"></a> [distribution\_id](#input\_distribution\_id) | n/a | `any` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | n/a | `any` | n/a | yes |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | n/a | `any` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `any` | n/a | yes |
| <a name="input_sns"></a> [sns](#input\_sns) | n/a | `any` | n/a | yes |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_website"></a> [website](#output\_website) | n/a |
