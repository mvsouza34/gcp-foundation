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
    aiqentrega_project = jsondecode(file("../local/aiqentrega_project.json"))
    aiqfome_host_project = jsondecode(file("../local/aiqfome_host_project.json"))
    aiqfome_project = jsondecode(file("../local/aiqfome_project.json"))
    aiqfome_shared_project = jsondecode(file("../local/aiqfome_shared_proj.json"))
    plusdelivery_project = jsondecode(file("../local/plusdelivery_project.json"))
    # Networks
    shared_vpcs = jsondecode(file("../local/shared_vpcs.json"))
    # Subnets
    subnets = jsondecode(file("../local/subnet.json"))
    gke_vpc = jsondecode(file("../local/gke_vpc.json"))
    # aiqfome_cluster_vpc = jsondecode(file("../local/aiqfome_cluster_vpc.json"))
    # Private Services Network
    # aiqfome_psn = jsondecode(file("../local/aiqfome_psn.json"))
    # CloudSQL Instance
    # aiqfome_sql_instance = jsondecode(file("../local/aiqfome_sql_instance.json"))
}

# Configure the Google Cloud Provider
provider "google" {
#   credentials = var.credentials
  # project     = gterroogle_project.aiqfome_host_project_sdx.id

  region      = var.region_id
  zone        = var.zone_01_id
}

