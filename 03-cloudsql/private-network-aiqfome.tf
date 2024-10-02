# ##############################################################
# # Create the PRIVATE SERVICES ACCESS in Network Host Project #
# ##############################################################
# resource "google_compute_global_address" "private_ip_address_dev" {
#   provider = google-beta

# #   project = "${var.network_host_project_id}" # not in terraform documentation
#     project = local.aiqfome_host_project.host_project_name

#   name          = "${var.aiqfome_host_project_id}-private-ip-address-${var.env}"
#   purpose       = "VPC_PEERING"
#   address       = "${var.subnet_cidr_aiqfome_private_ip_address}"
#   address_type  = "INTERNAL"
#   prefix_length = "${var.ip_mask_length_aiqfome_private_ip_address}"
#   network       = local.shared_vpcs.aiqfome_vpc_self_link

#   # depends_on = [ google_compute_shared_vpc_service_project.aiqfome_service_project_dev ]
# }

# resource "google_service_networking_connection" "private_vpc_connection_dev" {
#   provider = google-beta

#   network                 = local.shared_vpcs.aiqfome_vpc_self_link
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_address_dev.name]

#   depends_on = [ google_compute_global_address.private_ip_address_dev ]
# }

# output "private_ip_address_dev" {
#   value = google_compute_global_address.private_ip_address_dev.name
# }
# output "private_vpc_connection_dev" {
#   value = google_service_networking_connection.private_vpc_connection_dev.network
# }

# resource "local_file" "aiqfome_psn_connection" {
#   content = jsonencode({
#     private_ip_address = google_compute_global_address.private_ip_address_dev.name
#     private_vpc_connection = google_service_networking_connection.private_vpc_connection_dev.network
#   })
#     filename = "../local/aiqfome_psn.json"
# }