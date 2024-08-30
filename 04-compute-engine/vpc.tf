# # Description: This file is responsible for creating a GKE Autopilot cluster.
# ##############################################
# # Create a Network to Cluster VPC and Subnet #
# ##############################################
# # Create a Network to Cluster VPC
# resource "google_compute_network" "network_cluster_vpc_dev" {
#     name = "${var.network_cluster_name}-${var.env}"
#     project = local.host_projects.host_project_name

#     auto_create_subnetworks  = false
#     # enable_ula_internal_ipv6 = true
# }

# # Create a Subnet to Cluster VPC and Subnet to use in GKE Autopilot
# resource "google_compute_subnetwork" "subnet_cluster_service_dev" {
#     name    = "${var.subnet_cluster_service}-${var.env}"
#     project = local.host_projects.host_project_name
#     region  = var.region_id

#     ip_cidr_range = var.subnet_cidr_cluster_range_primary

#   # stack_type       = "IPV4"
#     # ipv6_access_type = "INTERNAL" # Change to "EXTERNAL" if creating an external loadbalancer

#     network = google_compute_network.network_cluster_vpc_dev.self_link
#     secondary_ip_range {
#         range_name    = "services-range"
#         ip_cidr_range = var.subnet_cidr_cluster_range_secondary_services
#     }
#     secondary_ip_range {
#         range_name    = "pod-ranges"
#         ip_cidr_range = var.subnet_cidr_cluster_range_secondary_pods
#     }
# }

# output "subnet_cluster_service" {
#     value = google_compute_subnetwork.subnet_cluster_service_dev.self_link
# }
# output "subnet_cidr_cluster_range_primary" {
#     value = google_compute_subnetwork.subnet_cluster_service_dev.ip_cidr_range
# }
# output "subnet_cidr_cluster_range_secondary_services" {
#     value = google_compute_subnetwork.subnet_cluster_service_dev.secondary_ip_range[0].ip_cidr_range
# }
# output "subnet_cidr_cluster_range_secondary_pods" {
#     value = google_compute_subnetwork.subnet_cluster_service_dev.secondary_ip_range[1].ip_cidr_range
# }

# resource "local_file" "aiqfome_shared_project" {
#   content = jsonencode({
#     subnet_cluster_service = google_compute_subnetwork.subnet_cluster_service_dev.self_link
#     subnet_cidr_cluster_range_primary = google_compute_subnetwork.subnet_cluster_service_dev.ip_cidr_range
#     subnet_cidr_cluster_range_secondary_services = google_compute_subnetwork.subnet_cluster_service_dev.secondary_ip_range[0].ip_cidr_range
#     subnet_cidr_cluster_range_secondary_pods = google_compute_subnetwork.subnet_cluster_service_dev.secondary_ip_range[1].ip_cidr_range
#   })
#   filename = "../local/gcp_aiqfome_cluster_vpc.json"
# }

###########################################
# Add the VPC network to the host project #
###########################################
# Create a resource shared VPC network in the host project.
# resource "google_compute_shared_vpc_host_project" "shared_vpc_host_project_dev" {
#   project = local.host_projects.host_project_name
# }

# # Define the shared VPC network in the service project aiqfome_project_id
# resource "google_compute_shared_vpc_service_project" "aiqfome_service_project_dev" {
#   service_project = local.aiqfome_shared_project.aiqfome_shared_project_name
#   host_project    = local.host_projects.host_project_name
# }