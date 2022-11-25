terraform {
  source = "${get_terragrunt_dir()}/../terraform//app"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  region = "europe-west2"
}