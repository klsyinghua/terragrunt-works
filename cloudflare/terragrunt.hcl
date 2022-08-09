locals {
  terraform_config = read_terragrunt_config(find_in_parent_folders("terraform_config.hcl"))
  api_token        = local.terraform_config.locals.api_token
  tag = local.terraform_config.locals.terraform-module-catalogue-tag
}


terraform {
  source = "git::git@github.com:AlanLu88/terraform-module-catalogue.git//cloudflare?ref=${local.tag}"
}

inputs = {
  zone_id = "487f31fd3f9a54f578aa0e4916441de5"
  a_record_info = {
    draw     = "10.0.16.11"
    gitea    = "10.0.16.11"
    traefik  = "10.0.16.11"
    waypoint = "10.0.16.11"
  }
  api_token = local.api_token
}