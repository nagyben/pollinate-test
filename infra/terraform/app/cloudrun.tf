resource "google_cloud_run_service" "run_default" {
  name     = "pollinate-api"
  location = var.region

  template {
    spec {
      containers {
        image = var.api_image
        ports {
          container_port = 8000
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Use an explicit depends_on clause to wait until API is enabled
  depends_on = [
    google_project_service.apis
  ]
}

resource "time_sleep" "wait_30_seconds_after_api_enable" {
  depends_on = [google_project_service.apis]

  create_duration = "30s"
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.run_default.location
  project     = google_cloud_run_service.run_default.project
  service     = google_cloud_run_service.run_default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}