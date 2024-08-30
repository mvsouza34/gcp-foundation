################################
# Create a AiQFome VPC Network #
################################
# Create a google vpc network
resource "google_compute_network" "vpc_network_aiqfome_dev" {
    name                    = "${var.aiqfome_project_id}-vpc-dev"
    project                 = local.aiqfome_host_project.host_project_name
  # ipv4_range              = "10.65.0.0/16"
    auto_create_subnetworks = false
}

output "aiqfome-vpc-network" {
    value = "${google_compute_network.vpc_network_aiqfome_dev.self_link}"
}

###################################
# Create a AiQEntrega VPC Network #
###################################
# # Create a google vpc network
resource "google_compute_network" "vpc_network_aiqentrega_dev" {
    name                    = "${var.aiqentrega_project_id}-vpc-dev"
    project                 = local.aiqfome_host_project.host_project_name 
    # ipv4_range              = "10.66.0.0/16"
    auto_create_subnetworks = false
}

output "aiqentrega-vpc-network" {
    value = "${google_compute_network.vpc_network_aiqentrega_dev.self_link}"
}

###################################
# Create a Plus Delivery VPC Network #
###################################
# # Create a google vpc network
resource "google_compute_network" "vpc_network_plusdelivery_dev" {
    name                    = "${var.plusdelivery_project_id}-vpc-dev"
    project                 = local.aiqfome_host_project.host_project_name 
    # ipv4_range              = "10.67.0.0/16"
    auto_create_subnetworks = false
}

output "plusdelivery-vpc-network" {
    value = "${google_compute_network.vpc_network_plusdelivery_dev.self_link}"
}

########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "export_network" {
    content = jsonencode({
        aiqfome_vpc_self_link = google_compute_network.vpc_network_aiqfome_dev.self_link
        aiqentrega_vpc_self_link = google_compute_network.vpc_network_aiqentrega_dev.self_link
        plusdelivery_vpc_self_link = google_compute_network.vpc_network_plusdelivery_dev.self_link
    })
    filename = "../local/shared_vpcs.json"
}