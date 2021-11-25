locals {
  environment_prefix  = (terraform.workspace != "prod" ? terraform.workspace : "")
  website_domain_name = join("", [local.environment_prefix], [var.domain_name])

}