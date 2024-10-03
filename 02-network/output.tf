########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "export_network" {
  content = jsonencode({
    vpc_shared_network = {
      name = google_compute_network.vpc_shared_network.name,
      id = google_compute_network.vpc_shared_network.id,
      self_link = google_compute_network.vpc_shared_network.self_link,
      }
    subnet_services = {
      name = google_compute_subnetwork.subnet_services.name,
      id = google_compute_subnetwork.subnet_services.id,
      self_link = google_compute_subnetwork.subnet_services.self_link,
      }
    subnet_application = {
        name = google_compute_subnetwork.subnet_application.name,
        id = google_compute_subnetwork.subnet_application.id,
        self_link = google_compute_subnetwork.subnet_application.self_link,
        }
    gke_subnet_services = {
        name = google_compute_subnetwork.gke_subnet_services.name,
        id = google_compute_subnetwork.gke_subnet_services.id,
        self_link = google_compute_subnetwork.gke_subnet_services.self_link,
        ip_cidr_range = google_compute_subnetwork.gke_subnet_services.ip_cidr_range,
        secondary_ip_range = {
            services_range = google_compute_subnetwork.gke_subnet_services.secondary_ip_range.0.ip_cidr_range,
            services_range_name = google_compute_subnetwork.gke_subnet_services.secondary_ip_range[0].range_name,
            pod_range = google_compute_subnetwork.gke_subnet_services.secondary_ip_range.1.ip_cidr_range,
            pod_range_name = google_compute_subnetwork.gke_subnet_services.secondary_ip_range[1].range_name,
            }
        }
    service_project_private_ip_address = {
        name = google_compute_global_address.service_project_private_ip_address.name,
        id = google_compute_global_address.service_project_private_ip_address.id,
        self_link = google_compute_global_address.service_project_private_ip_address.self_link,
        }
    service_private_vpc_connection = {
        network = google_service_networking_connection.service_private_vpc_connection.network,
        id = google_service_networking_connection.service_private_vpc_connection.id,
        # self_link = google_service_networking_connection.service_private_vpc_connection.self_link
        }
  })
    filename = "./network.json"
}