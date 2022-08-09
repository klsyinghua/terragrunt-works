locals {
  terraform-module-catalogue-tag = get_env("TERRAFORM_MODULE_CATALOGUE_TAG")
  api_token                      = get_env("API_TOKEN")
  terraform_token                = get_env("TERRAFORM_TOKEN")
}
