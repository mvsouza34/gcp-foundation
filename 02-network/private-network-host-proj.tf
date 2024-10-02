##############################################################
# Create the PRIVATE SERVICES ACCESS in Network Host Project #
##############################################################

# Create a PSN Connection to the Private Connection
resource "google_service_networking_connection" "service_private_vpc_connection" {
  provider = google-beta

  network                 = google_compute_network.vpc_shared_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [
            google_compute_global_address.service_project_private_ip_address.name
                    ]

  depends_on = [
      google_compute_global_address.service_project_private_ip_address
               ]
}

output "service_private_vpc_connection" {
  value = google_service_networking_connection.service_private_vpc_connection.id
}
output "service_private_vpc_connection_network" {
  value = google_service_networking_connection.service_private_vpc_connection.network
}
# output "service_private_vpc_connection_self_link" {
#   value = google_service_networking_connection.service_private_vpc_connection.self_link
  
# }