remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket                      = "pollinate-tfstate"
    prefix                      = "pollinate-test/${path_relative_to_include()}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF

variable "project" {
  default = "pollinate-test-369608"
}

provider "google" {
  project         = var.project
  request_timeout = "30s"
}
EOF
}