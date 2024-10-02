terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.80.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}

locals {
    # Projects
    
    }

# Configure the Google Cloud Provider
provider "google" {
#   credentials = var.credentials
  # project     = gterroogle_project.aiqfome_host_project_dev.id

  region      = var.region_id
  zone        = var.zone_01_id
}

