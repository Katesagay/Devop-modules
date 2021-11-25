locals {
   environment_prefix = (terraform.workspace != "prod" ? "${terraform.workspace}" : "")
   bucket_name = join("", ["${local.environment_prefix}"],["${var.domain_name}"])
   # (each.value != "*.css" ? "text/html" : "text/css")

}