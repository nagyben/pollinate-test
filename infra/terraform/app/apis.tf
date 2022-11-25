locals {
  apis = [
    "run.googleapis.com",
  ]
}

resource "google_project_service" "apis" {
  project = var.project
  count = length(local.apis)
  service = local.apis[count.index]
  disable_dependent_services = true
}