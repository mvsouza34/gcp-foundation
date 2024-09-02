################################
# Create a VPC Network for GKE #
################################
resource "google_compute_network" "gke_vpc_network" {
    name = "gke-vpc-network"
    project = local.aiqfome_shared_project.aiqfome_shared_project_name
    # project = local.aiqfome_host_project.host_project_name

    auto_create_subnetworks  = false
    enable_ula_internal_ipv6 = true
}

###################################
# Create a VPC Subnetwork for GKE #
###################################
resource "google_compute_subnetwork" "gke_vpc_subnet" {
    name = "gke-vpc-subnet"
    project = local.aiqfome_shared_project.aiqfome_shared_project_name
    # project = local.aiqfome_host_project.host_project_name

    ip_cidr_range = var.subnet_cidr_cluster_range_primary
    region        = var.region_id

    stack_type       = "IPV4_IPV6"
    ipv6_access_type = "INTERNAL" # Change to "EXTERNAL" if creating an external loadbalancer

    network = google_compute_network.gke_vpc_network.id
    secondary_ip_range {
        range_name    = "services-range"
        ip_cidr_range = var.subnet_cidr_cluster_range_secondary_services
    }

    secondary_ip_range {
        range_name    = "pod-ranges"
        ip_cidr_range = var.subnet_cidr_cluster_range_secondary_pods
    }
}

# #########################################
# # Create a Shared VPC to Shared Project #
# #########################################
# resource "google_compute_shared_vpc_service_project" "aiqfome_shared_project" {
#     host_project    = local.aiqfome_host_project.host_project_name
#     service_project = local.aiqfome_shared_project.aiqfome_shared_project_name
# }

# #######################################
# # Create a Peering to AiQFome Project #
# #######################################
resource "google_compute_network_peering" "perring_aiqfome_to_cluster" {
    name         = "peering-aiqfome-to-cluster"
    network      = google_compute_network.gke_vpc_network.self_link
    peer_network = local.shared_vpcs.aiqfome_vpc_self_link
    
    stack_type = "IPV4_IPV6"

    import_custom_routes = true
    export_custom_routes = true
    import_subnet_routes_with_public_ip = true
    export_subnet_routes_with_public_ip = true
}

resource "google_compute_network_peering" "peering_cluster_to_aiqfome" {
    name         = "peering-cluster-to-aiqfome"
    network      = local.shared_vpcs.aiqfome_vpc_self_link
    peer_network = google_compute_network.gke_vpc_network.self_link
  
    stack_type = "IPV4_IPV6"

    import_custom_routes = true
    export_custom_routes = true
    import_subnet_routes_with_public_ip = true
    export_subnet_routes_with_public_ip = true
}

##################################
# Create a GKE AutoPilot Cluster #
##################################
resource "google_container_cluster" "gke_cluster" {
    name = "${var.aiqfome_shared_project_id}-gke-cluster-${var.env}"
    project = local.aiqfome_shared_project.aiqfome_shared_project_name

#   location                 = "us-central1"
    location = var.region_id
    enable_autopilot         = true
    enable_l4_ilb_subsetting = true

    network    = google_compute_network.gke_vpc_network.id
    subnetwork = google_compute_subnetwork.gke_vpc_subnet.id

    ip_allocation_policy {
        stack_type                    = "IPV4_IPV6"
        services_secondary_range_name = google_compute_subnetwork.gke_vpc_subnet.secondary_ip_range[0].range_name
        cluster_secondary_range_name  = google_compute_subnetwork.gke_vpc_subnet.secondary_ip_range[1].range_name
    }

    # Set `deletion_protection` to `true` will ensure that one cannot
    # accidentally delete this instance by use of Terraform.
    deletion_protection = false
}