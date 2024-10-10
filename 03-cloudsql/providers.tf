# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = ">= 4.80.0"
#     }
#     local = {
#       source  = "hashicorp/local"
#       version = "~> 2.1"
#     }
#   }
# }

# locals {
#   # Projects
#   service_project_id     = jsondecode(file("../local/service_project_id.json"))
#   host_project_id   = jsondecode(file("../local/host_project_id.json"))
#   output_nat_ip          = jsondecode(file("../local/output_nat_ip.json"))
#   # Networks
#   shared_vpcs = jsondecode(file("../local/shared_vpcs.json"))
#   psn_connection = jsondecode(file("../local/shared_psn_connection.json"))
#   # Subnets
#   subnets = jsondecode(file("../local/subnet.json"))
# }

# # Configure the Google Cloud Provider
# provider "google" {
#   region = var.region_id
#   zone   = var.zone_01_id
# }

