locals {
   environment_prefix = (terraform.workspace != "prod" ? "${terraform.workspace}" : "")
   website-domain-direct = join("", ["${local.environment_prefix}"],["${var.sns_name}"])

}