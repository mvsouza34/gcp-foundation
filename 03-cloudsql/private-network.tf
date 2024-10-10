# ##############################################################
# # Create the PRIVATE SERVICES ACCESS in Network Host Project #
# ##############################################################
# resource "google_compute_global_address" "service_project_private_ip_address_dev" {
#   provider = google-beta

# #   project = "${var.network_host_project_id}" # not in terraform documentation
#     project = var.host_project_id

#   name          = "${var.host_project_id}-private-ip-address-${var.env}"
#   purpose       = "VPC_PEERING"
#   address       = "${var.subnet_cidr_cluster_private_ip_address}"
#   address_type  = "INTERNAL"
#   prefix_length = "${var.ip_mask_length_cluster_private_ip_address}"
#   network       = "https://www.googleapis.com/compute/v1/projects/allos-network-hub/global/networks/vpc-digital-dev"
# }

# resource "google_service_networking_connection" "service_project_private_vpc_connection_dev" {
#   provider = google-beta

#   network                 = "https://www.googleapis.com/compute/v1/projects/allos-network-hub/global/networks/vpc-digital-dev"
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.service_project_private_ip_address_dev.name]

#   depends_on = [ google_compute_global_address.service_project_private_ip_address_dev ]
# }

# output "private_ip_address_dev" {
#   value = google_compute_global_address.service_project_private_ip_address_dev.name
# }
# output "private_vpc_connection_dev" {
#   value = google_service_networking_connection.service_project_private_ip_address_dev.network
# }

# resource "local_file" "service_project_private_psn_connection" {
#   content = jsonencode({
#     private_ip_address = google_compute_global_address.service_project_private_ip_address_dev.name
#     private_vpc_connection = google_service_networking_connection.service_project_private_ip_address_dev.network
#   })
#     filename = "../local/service_project_private_ip_address_dev_psn.json"
# }


# #########################################################################################################################


