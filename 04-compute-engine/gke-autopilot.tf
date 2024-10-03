##################################
# Create a GKE AutoPilot Cluster #
##################################
resource "google_container_cluster" "gke_cluster" {
    name = "${var.service_project_id}-gke-cluster-${var.env}"
    project = var.service_project_id

    location = var.zone_01_id # Choose region for Regional GKE cluster, or zone for Zonal GKE cluster
    enable_autopilot         = true
    enable_l4_ilb_subsetting = true

    network    = local.networks.vpc_shared_network.self_link
    subnetwork = local.networks.gke_subnet_services.self_link

    ip_allocation_policy {
        stack_type                    = "IPV4_IPV6"
        services_secondary_range_name = local.networks.gke_subnet_services.secondary_ip_range.services_range_name
        cluster_secondary_range_name  = local.networks.gke_subnet_services.secondary_ip_range.pod_range_name
    }

    # Set `deletion_protection` to `true` will ensure that one cannot
    # accidentally delete this instance by use of Terraform.
    deletion_protection = false
}