# ##############################################
# # Create a Network to Cluster VPC and Subnet #
# ##############################################
# # Create a Network to Cluster VPC
# resource "google_compute_network" "aiqfome_cluster_vpc_network" {
#     name = "${var.network_cluster_name}-${var.env}"
#     project = local.aiqfome_host_project.host_project_name
#     region = var.region_id

#     auto_create_subnetworks  = false
#     # routing_mode             = "GLOBAL"
# }

# # Create a Subnet to Cluster VPC and Subnet to use in GKE Autopilot
# resource "google_compute_subnetwork" "subnet_aiqfome_control_cluster_dev" {
#     name = "${var.subnet_cluster_service}-control-${var.env}"
#     project = local.aiqfome_host_project.host_project_name
#     region = var.region_id
#     network = google_compute_network.aiqfome_cluster_vpc_network.self_link

#     ip_cidr_range = var.subnet_cidr_cluster_range_control
  
# }

# resource "google_compute_subnetwork" "subnet_aiqfome_cluster_dev" {
#     name    = "${var.subnet_cluster_service}-${var.env}"
#     project = local.aiqfome_host_project.host_project_name
#     region  = var.region_id
#     network = google_compute_network.aiqfome_cluster_vpc_network.self_link

#     ip_cidr_range = var.subnet_cidr_cluster_range_primary

#     secondary_ip_range {
#         range_name    = "services-range"
#         ip_cidr_range = var.subnet_cidr_cluster_range_secondary_services
#     }
#     secondary_ip_range {
#         range_name    = "pod-ranges"
#         ip_cidr_range = var.subnet_cidr_cluster_range_secondary_pods
#     }
# }

# ################################################
# # Attach the Shared VPN in the Service Project #
# ################################################
# # Attach the Shared VPN in the Service Project
# resource "google_compute_shared_vpc_service_project" "aiqfome_shared_project" {
#     host_project = local.aiqfome_host_project.host_project_name
#     service_project = local.aiqfome_shared_project.aiqfome_shared_project_name
# }

# ###################################
# # Outputs to use in other modules #
# ###################################
# output "aiqfome_cluster_vpc" {
#     value = google_compute_network.aiqfome_cluster_vpc_network.self_link
# }
# output "subnet_aiqfome_cluster" {
#     value = google_compute_subnetwork.subnet_aiqfome_cluster_dev.self_link
# }
# output "subnet_cidr_cluster_range_primary" {
#     value = google_compute_subnetwork.subnet_aiqfome_cluster_dev.name
# }
# output "subnet_cidr_cluster_range_secondary_services" {
#     value = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[0].range_name
# }
# output "subnet_cidr_cluster_range_secondary_pods" {
#     value = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[1].range_name
# }

# resource "local_file" "aiqfome_cluster_vpc" {
#     content = jsonencode({
#         aiqfome_cluster_vpc = google_compute_network.aiqfome_cluster_vpc_network.self_link
#         subnet_aiqfome_cluster = google_compute_subnetwork.subnet_aiqfome_cluster_dev.self_link
#         subnet_cidr_cluster_range_primary = google_compute_subnetwork.subnet_aiqfome_cluster_dev.ip_cidr_range
#         subnet_cidr_cluster_range_secondary_services = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[0].ip_cidr_range
#         subnet_cidr_cluster_range_secondary_pods = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[1].ip_cidr_range
#     })
#     filename = "../local/aiqfome_cluster_vpc.json"
  
# }