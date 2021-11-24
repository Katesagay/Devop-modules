locals {
   environment_prefix = (terraform.workspace != "prod" ? "${terraform.workspace}-" : "")
}