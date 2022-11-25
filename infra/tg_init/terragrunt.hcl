terraform {
  source = "${get_terragrunt_dir()}/../terraform//init"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  region = "europe-west2"
}