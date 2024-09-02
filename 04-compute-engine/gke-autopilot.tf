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