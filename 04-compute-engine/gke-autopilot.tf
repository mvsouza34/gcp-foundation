###################################
# Create a Auto Pilot GKE Cluster #
###################################

# # google_client_config and kubernetes provider must be explicitly specified like the following.
# data "google_client_config" "default" {}

# provider "kubernetes" {
#   host                   = "https://${module.gke.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }

module "kubernetes_engine_beta_autopilot_public_cluster" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  # version = "27.0.0"
  name                       = "${var.aiqfome_shared_project_id}-cluster-${var.env}"
  project_id                 = local.aiqfome_shared_project.aiqfome_shared_project_name
  region                     = "${var.region_id}"
  # zones                      = ["us-central1-a", "us-central1-b", "us-central1-f"]
  network                    = module.vpc.network_name
  subnetwork                 = module.vpc.subnets.subnet_name
  ip_range_services          = module.vpc.secondary_ip_range[0].range_name
  ip_range_pods              = module.vpc.secondary_ip_range[1].range_name
  horizontal_pod_autoscaling = true
  # filestore_csi_driver       = false
  dns_cache                  = false
  
  grant_registry_access = true
  create_service_account = true


depends_on = [
  module.vpc.network_name,
  module.vpc.subnets
    ]

}


# # # ########################
# # # # Create a GKE Cluster #
# # # ########################
# # # # google_client_config and kubernetes provider must be explicitly specified like the following.
# # # data "google_client_config" "default" {}

# # # provider "kubernetes" {
# # #   host                   = "https://${module.gke.endpoint}"
# # #   token                  = data.google_client_config.default.access_token
# # #   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# # # }

# # # module "gke" {
# # #   source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
# # #   project_id                 = "<PROJECT ID>"
# # #   name                       = "gke-test-1"
# # #   region                     = "us-central1"
# # #   zones                      = ["us-central1-a", "us-central1-b", "us-central1-f"]
# # #   network                    = "vpc-01"
# # #   subnetwork                 = "us-central1-01"
# # #   ip_range_pods              = "us-central1-01-gke-01-pods"
# # #   ip_range_services          = "us-central1-01-gke-01-services"
# # #   http_load_balancing        = false
# # #   network_policy             = false
# # #   horizontal_pod_autoscaling = true
# # #   filestore_csi_driver       = false
# # #   enable_private_endpoint    = true
# # #   enable_private_nodes       = true
# # #   master_ipv4_cidr_block     = "10.0.0.0/28"

# # #   node_pools = [
# # #     {
# # #       name                      = "default-node-pool"
# # #       machine_type              = "e2-medium"
# # #       node_locations            = "us-central1-b,us-central1-c"
# # #       min_count                 = 1
# # #       max_count                 = 100
# # #       local_ssd_count           = 0
# # #       spot                      = false
# # #       disk_size_gb              = 100
# # #       disk_type                 = "pd-standard"
# # #       image_type                = "COS_CONTAINERD"
# # #       enable_gcfs               = false
# # #       enable_gvnic              = false
# # #       auto_repair               = true
# # #       auto_upgrade              = true
# # #       service_account           = "project-service-account@<PROJECT ID>.iam.gserviceaccount.com"
# # #       preemptible               = false
# # #       initial_node_count        = 80
# # #     },
# # #   ]

# # #   node_pools_oauth_scopes = {
# # #     all = [
# # #       "https://www.googleapis.com/auth/logging.write",
# # #       "https://www.googleapis.com/auth/monitoring",
# # #     ]
# # #   }

# # #   node_pools_labels = {
# # #     all = {}

# # #     default-node-pool = {
# # #       default-node-pool = true
# # #     }
# # #   }

# # #   node_pools_metadata = {
# # #     all = {}

# # #     default-node-pool = {
# # #       node-pool-metadata-custom-value = "my-node-pool"
# # #     }
# # #   }

# # #   node_pools_taints = {
# # #     all = []

# # #     default-node-pool = [
# # #       {
# # #         key    = "default-node-pool"
# # #         value  = true
# # #         effect = "PREFER_NO_SCHEDULE"
# # #       },
# # #     ]
# # #   }

# # #   node_pools_tags = {
# # #     all = []

# # #     default-node-pool = [
# # #       "default-node-pool",
# # #     ]
# # #   }
# # # }

# # # # # google_client_config and kubernetes provider must be explicitly specified like the following.
# # # # data "google_client_config" "default" {}

# # # # provider "kubernetes" {
# # # #   host                   = "https://${module.gke.endpoint}"
# # # #   token                  = data.google_client_config.default.access_token
# # # #   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# # # # }

# # # # module "gke" {
# # # #   source                     = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"
# # # #   project_id                 = local.aiqfome_shared_project.aiqfome_shared_project_name
# # # #   name                       = "${var.aiqfome_shared_project_id}-cluster-${var.env}"
# # # #   region                     = "${var.region_id}"
# # # #   # zones                      = ["${var.zone_01_id}", "${var.zone_02_id}", "${var.zone_03_id}"]
# # # #   network                    = google_compute_network.aiqfome_cluster_vpc_network.name
# # # #   subnetwork                 = google_compute_subnetwork.subnet_aiqfome_cluster_dev.name
# # # #   ip_range_pods              = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[1].range_name
# # # #   ip_range_services          = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[0].range_name
# # # #   horizontal_pod_autoscaling = true
# # # #   # filestore_csi_driver       = false
# # # #   enable_private_endpoint    = true
# # # #   enable_private_nodes       = true
# # # #   master_ipv4_cidr_block     = "10.0.0.0/28"
# # # #   dns_cache                  = false

# # # # }

# # # # # ####################################
# # # # # # Create a Auto Pilote GKE Cluster #
# # # # # ####################################
# # # # # resource "google_container_cluster" "aiqfome_shared_cluster_dev" {
# # # # #   name = "${var.aiqfome_shared_project_id}-cluster-${var.env}"
# # # # #   project = local.aiqfome_shared_project.aiqfome_shared_project_name

# # # # #   location                 = var.region_id
# # # # #   enable_autopilot         = true
# # # # #   # enable_l4_ilb_subsetting = true

# # # # #   network    = google_compute_network.aiqfome_cluster_vpc_network.self_link
# # # # #   subnetwork = google_compute_subnetwork.subnet_aiqfome_cluster_dev.self_link

# # # # #   ip_allocation_policy {
# # # # #     # stack_type                    = "IPV4_IPV6"
# # # # #     services_secondary_range_name = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[0].range_name
# # # # #     cluster_secondary_range_name  = google_compute_subnetwork.subnet_aiqfome_cluster_dev.secondary_ip_range[1].range_name
# # # # #   }

# # # # #   # Set `deletion_protection` to `true` will ensure that one cannot
# # # # #   # accidentally delete this instance by use of Terraform.
# # # # #   deletion_protection = false
# # # # # }

# # # # # output "aiqfome_shared_cluster_self_link" {
# # # # #   value = google_container_cluster.aiqfome_shared_cluster_dev.self_link
# # # # # }
# # # # # output "aiqfome_shared_cluster_name" {
# # # # #   value = google_container_cluster.aiqfome_shared_cluster_dev.name
# # # # # }

# # # # # resource "local_file" "aiqfome_shared_cluster" {
# # # # #   content = jsonencode({
# # # # #     aiqfome_shared_cluster_self_link = google_container_cluster.aiqfome_shared_cluster_dev.self_link
# # # # #     aiqfome_shared_cluster_name = google_container_cluster.aiqfome_shared_cluster_dev.name
# # # # #   })
# # # # #   filename = "../local/aiqfome_shared_cluster.json"
# # # # # }