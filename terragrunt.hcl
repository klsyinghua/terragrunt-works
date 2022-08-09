locals {
  environment_config = read_terragrunt_config("regional_config.hcl")
  terraform_config   = read_terragrunt_config("terraform_config.hcl")
  environment        = local.environment_config.locals.environment
  production         = local.environment_config.locals.production
  terraform_token    = local.terraform_config.locals.terraform_token
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "remote" {
  hostname = "app.terraform.io"
  organization = "cloud-native-alankworks"
  token =  "${local.terraform_token}"
    workspaces {
      name = "cloud-native-alankworks-${local.production}-${local.environment}"
    }
  }
}
EOF
}