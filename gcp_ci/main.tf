resource "google_cloudbuild_trigger" "build_trigger" {
  project     = var.project
  description = "bravo bravo bravo"
  name        = "triggerello"

  github {
    owner = var.github_owner
    name  = var.github_repository

    push {
      branch = "master"
    }
  }

  build {
    images  = ["gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA"]
    timeout = "599s"
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA", "-f", "Dockerfile", "."]
    }
  }
}
