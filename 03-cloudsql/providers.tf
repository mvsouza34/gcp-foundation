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
    # aiqentrega_project = jsondecode(file("../local/aiqentrega_project.json"))
    # aiqfome_host_project = jsondecode(file("../local/aiqfome_host_project.json"))
    # aiqfome_project = jsondecode(file("../local/aiqfome_project.json"))
    # aiqfome_shared_project = jsondecode(file("../local/aiqfome_shared_proj.json"))
    # plusdelivery_project = jsondecode(file("../local/plusdelivery_project.json"))
    # Networks
    network = jsondecode(file("../02-network/02_network.json"))
    # # Subnets
    # subnets = jsondecode(file("../local/subnet.json"))
    # gke_vpc = jsondecode(file("../local/gke_vpc.json"))
}

# Configure the Google Cloud Provider
provider "google" {
#   credentials = var.credentials
  # project     = gterroogle_project.aiqfome_host_project_sdx.id

  region      = var.region_id
  zone        = var.zone_01_id
}

