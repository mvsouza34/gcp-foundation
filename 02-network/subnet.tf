######################################################
# Create a Private subnet in the Template VPC Network #
######################################################
# # Create a google vpc subnet
resource "google_compute_subnetwork" "subnet_services" {
    name          = "${var.service_project_id}-${var.service_vpc_name}-${var.env}"
    project       = local.projects.host_project.name
    ip_cidr_range = "${var.subnet_cidr_service_range}"
    network       = google_compute_network.vpc_shared_network.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_shared_network ]
}
output "subnet_aiqfome_service" {
  value = google_compute_subnetwork.subnet_services.self_link
}
# # Create a google vpc subnet
resource "google_compute_subnetwork" "subnet_application" {
    name          = "${var.service_project_id}-${var.application_vpc_name}-${var.env}"
    project       = local.projects.host_project.name
    ip_cidr_range = "${var.subnet_cidr_application_range}"
    network       = google_compute_network.vpc_shared_network.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_shared_network ]
}
output "subnet_aiqfome_application" {
  value = google_compute_subnetwork.subnet_application.self_link
}

###################################
# Create a VPC Subnetwork for GKE #
###################################
resource "google_compute_subnetwork" "gke_subnet_services" {
  name = "${var.service_project_id}-${var.subnet_cluster_name}-${var.env}"
  project = local.projects.host_project.name
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  purpose = "PRIVATE"

  ip_cidr_range = var.subnet_cidr_cluster_range_primary
  region        = var.region_id

  stack_type       = "IPV4_ONLY"

  network       = google_compute_network.vpc_shared_network.self_link
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.subnet_cidr_cluster_range_secondary_services
  }

  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = var.subnet_cidr_cluster_range_secondary_pods
  }
}
output "gke_subnet_services" {
  value = google_compute_subnetwork.gke_subnet_services.self_link
}
output "gke_subnet_services_id" {
  value = google_compute_subnetwork.gke_subnet_services.id
}
output "gke_vpc_subnet_service_range" {
  value = google_compute_subnetwork.gke_subnet_services.secondary_ip_range[0].range_name
}
output "gke_vpc_subnet_pod_range" {
  value = google_compute_subnetwork.gke_subnet_services.secondary_ip_range[1].range_name
}