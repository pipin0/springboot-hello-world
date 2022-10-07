terraform {
  required_version = ">= 0.12.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.82.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}
