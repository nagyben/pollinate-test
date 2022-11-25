resource "google_artifact_registry_repository" "docker_repo" {
  repository_id = "pollinate-cr"
  description = "Docker container registry"
  format = "DOCKER"
  location = var.region

  depends_on = [time_sleep.wait_30_seconds_after_api_enable]
}

resource "time_sleep" "wait_30_seconds_after_api_enable" {
  depends_on = [google_project_service.apis]

  create_duration = "30s"
}