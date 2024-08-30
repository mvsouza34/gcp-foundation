# resource "google_service_account" "default" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }

resource "google_container_cluster" "aiqfome_cluster_01_dev" {
  name     = "${var.aiqfome_shared_project_id}-cluster-${var.env}-01"
  project  = local.aiqfome_shared_project.aiqfome_shared_project_name
  location = var.region_id

  network = google_compute_network.aiqfome_cluster_vpc_network.name

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.aiqfome_shared_project_id}-nodepool-${var.env}-01"
  location   = var.region_id
  cluster    = google_container_cluster.aiqfome_cluster_01_dev.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = "705645257315-compute@developer.gserviceaccount.com"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}





















# # google_client_config and kubernetes provider must be explicitly specified like the following.
# data "google_client_config" "default" {}

# provider "kubernetes" {
#   host                   = "https://${module.gke.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }

# module "gke" {
#   source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
#   version                    = "27.0.0"
#   project_id                 = local.aiqfome_shared_project.aiqfome_shared_project_name
#   name                       = "${var.aiqfome_shared_project_id}-cluster-${var.env}"
#   region                     = "${var.region_id}"
#   zones                      = [
#                                 "${var.zone_01_id}",
#                                 "${var.zone_02_id}",
#                                 "${var.zone_03_id}"
#                                 ]
# #   network                    = "vpc-01"
#   network                    = google_compute_network.aiqfome_cluster_vpc_network.name
# #   subnetwork                 = "us-central1-01"
#   subnetwork                 = google_compute_subnetwork.subnet_aiqfome_cluster_dev.name
# #   ip_range_pods              = "us-central1-01-gke-01-pods"
#   ip_range_pods              = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[1].range_name  
# #   ip_range_services          = "us-central1-01-gke-01-services"
#   ip_range_services          = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[0].range_name
  
#   http_load_balancing        = false
#   network_policy             = false
#   horizontal_pod_autoscaling = true
#   filestore_csi_driver       = false
#   enable_private_endpoint    = true
#   enable_private_nodes       = true
#   master_ipv4_cidr_block     = var.subnet_cidr_cluster_range_control

#   node_pools = [
#     {
#       name                      = "default-node-pool"
#       machine_type              = "e2-medium"
#       node_locations            = "us-central1-b,us-central1-c"
#       min_count                 = 1
#       max_count                 = 100
#       local_ssd_count           = 0
#       spot                      = false
#       disk_size_gb              = 100
#       disk_type                 = "pd-standard"
#       image_type                = "COS_CONTAINERD"
#       enable_gcfs               = false
#       enable_gvnic              = false
#       auto_repair               = true
#       auto_upgrade              = true
#     #   service_account           = "project-service-account@${local.aiqfome_shared_project.aiqfome_shared_project_name}.iam.gserviceaccount.com"
#       service_account           = "705645257315-compute@developer.gserviceaccount.com"
#       preemptible               = false
#       initial_node_count        = 80
#     },
#   ]

#   node_pools_oauth_scopes = {
#     all = [
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]
#   }

#   node_pools_labels = {
#     all = {}

#     default-node-pool = {
#       default-node-pool = true
#     }
#   }

#   node_pools_metadata = {
#     all = {}

#     default-node-pool = {
#       node-pool-metadata-custom-value = "my-node-pool"
#     }
#   }

#   node_pools_taints = {
#     all = []

#     default-node-pool = [
#       {
#         key    = "default-node-pool"
#         value  = true
#         effect = "PREFER_NO_SCHEDULE"
#       },
#     ]
#   }

#   node_pools_tags = {
#     all = []

#     default-node-pool = [
#       "default-node-pool",
#     ]
#   }

#   depends_on =  [ 
#         google_compute_network.aiqfome_cluster_vpc_network, 
#         google_compute_subnetwork.subnet_aiqfome_cluster_autopilot_dev 
#                 ]
# }