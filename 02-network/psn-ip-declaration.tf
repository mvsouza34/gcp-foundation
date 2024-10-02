
##############################################################
# Create the PRIVATE SERVICES ACCESS in Network Host Project #
##############################################################
# Create a PSN IP Global Address to the Private Connection
resource "google_compute_global_address" "service_project_private_ip_address" {
  provider = google-beta

  project = "${var.host_project_id}"

  name          = "${var.service_project_id}-private-ip-address-${var.env}"
  purpose       = "VPC_PEERING"
  address       = "${var.subnet_cidr_private_ip_address}"
  address_type  = "INTERNAL"
  prefix_length = "${var.ip_mask_length_private_ip_address}"
  network       = google_compute_network.vpc_shared_network.self_link

  # depends_on = [ google_compute_shared_vpc_service_project.aiqfome_service_project_prd ]
}
output "service_project_private_ip_address_prd" {
  value = google_compute_global_address.service_project_private_ip_address.self_link
}
output "service_project_private_ip_address_prd_name" {
  value = google_compute_global_address.service_project_private_ip_address.name
}