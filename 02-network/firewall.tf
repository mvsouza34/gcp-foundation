resource "google_compute_firewall" "allow_iap" {
    allow {
        protocol = "tcp"
    }

    direction     = "INGRESS"
    name          = "allow-iap"
    network       = google_compute_network.vpc_shared_network.self_link   # "https://www.googleapis.com/compute/v1/projects/aiqfome-shared-proj-stg/global/networks/gke-vpc-network-stg"
    priority      = 1000
    project       = var.host_project_id
    source_ranges = ["35.235.240.0/20"]

    allow {
        protocol = "tcp"
    }
}