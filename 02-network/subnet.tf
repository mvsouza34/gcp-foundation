######################################################
# Create a Private subnet in the AiQFome VPC Network #
######################################################
# # Create a google vpc subnet
resource "google_compute_subnetwork" "subnet_aiqfome_services_dev" {
    name          = "${var.subnet_aiqfome_service}-${var.env}"
    project       = local.aiqfome_host_project.host_project_name
    ip_cidr_range = "${var.subnet_cidr_aiqfome_range_service}"
    network       = google_compute_network.vpc_network_aiqfome_dev.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_network_aiqfome_dev ]
}
output "subnet_aiqfome_service" {
  value = google_compute_subnetwork.subnet_aiqfome_services_dev.self_link
}
# # Create a google vpc subnet
resource "google_compute_subnetwork" "subnet_aiqfome_application_dev" {
    name          = "${var.subnet_aiqfome_application}-${var.env}"
    project       = local.aiqfome_host_project.host_project_name
    ip_cidr_range = "${var.subnet_cidr_aiqfome_range_application}"
    network       = google_compute_network.vpc_network_aiqfome_dev.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_network_aiqfome_dev ]
}
output "subnet_aiqfome_application" {
  value = google_compute_subnetwork.subnet_aiqfome_application_dev.self_link
}

########################################################
# Create a Public subnet in the aiqentrega VPC Network #
########################################################
# # Create a google vpc subnet
resource "google_compute_subnetwork" "vpc_subnet_aiqentrega_services_dev" {
    name          = "${var.subnet_aiqentrega_service}-${var.env}"
    project       = local.aiqfome_host_project.host_project_name
    ip_cidr_range = "${var.subnet_cidr_aiqentrega_range_service}"
    network       = google_compute_network.vpc_network_aiqentrega_dev.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_network_aiqentrega_dev ]
}
output "subnet_aiqentrega_service" {
  value = google_compute_subnetwork.vpc_subnet_aiqentrega_services_dev.name
}
# # Create a google vpc subnet
resource "google_compute_subnetwork" "vpc_subnet_aiqentrega_application_dev" {
    name          = "${var.subnet_aiqentrega_application}-${var.env}"
    project       = local.aiqfome_host_project.host_project_name
    ip_cidr_range = "${var.subnet_cidr_aiqentrega_range_application}"
    network       = google_compute_network.vpc_network_aiqentrega_dev.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_network_aiqentrega_dev ]
}
output "subnet_aiqentrega_application" {
  value = google_compute_subnetwork.vpc_subnet_aiqentrega_application_dev.self_link
}

##########################################################
# Create a Public subnet in the plusdelivery VPC Network #
##########################################################
# # Create a google vpc subnet
resource "google_compute_subnetwork" "vpc_subnet_plusdelivery_services_dev" {
    name          = "${var.subnet_plusdelivery_service}-${var.env}"
    project       = local.aiqfome_host_project.host_project_name
    ip_cidr_range = "${var.subnet_cidr_plusdelivery_range_service}"
    network       = google_compute_network.vpc_network_plusdelivery_dev.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_network_plusdelivery_dev ]
}
output "subnet_plusdelivery_service" {
  value = google_compute_subnetwork.vpc_subnet_plusdelivery_services_dev.name
}
# # Create a google vpc subnet
resource "google_compute_subnetwork" "vpc_subnet_plusdelivery_application_dev" {
    name          = "${var.subnet_plusdelivery_application}-${var.env}"
    project       = local.aiqfome_host_project.host_project_name
    ip_cidr_range = "${var.subnet_cidr_plusdelivery_range_application}"
    network       = google_compute_network.vpc_network_plusdelivery_dev.self_link
    region        = "${var.region_id}"

  depends_on = [ google_compute_network.vpc_network_plusdelivery_dev ]
}
output "subnet_plusdelivery_application" {
  value = google_compute_subnetwork.vpc_subnet_plusdelivery_application_dev.self_link
}

########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "export_subnet" {
  content = jsonencode({
    subnet_aiqfome_service = google_compute_subnetwork.subnet_aiqfome_services_dev.self_link
    subnet_aiqfome_application = google_compute_subnetwork.subnet_aiqfome_application_dev.self_link
    subnet_aiqentrega_service = google_compute_subnetwork.vpc_subnet_aiqentrega_services_dev.self_link
    subnet_aiqentrega_application = google_compute_subnetwork.vpc_subnet_aiqentrega_application_dev.self_link
    subnet_plusdelivery_service = google_compute_subnetwork.vpc_subnet_plusdelivery_services_dev.self_link
    subnet_plusdelivery_application = google_compute_subnetwork.vpc_subnet_plusdelivery_application_dev.self_link
  })
  filename = "../local/subnet.json"
}