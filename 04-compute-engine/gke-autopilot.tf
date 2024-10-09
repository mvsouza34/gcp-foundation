# ##################################
# # Create a GKE AutoPilot Cluster #
# ##################################


locals {
  cluster_type           = "dev-autopilot-private"
}


data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"
  version = "~> 33.0"

  project_id                      = var.service_project_id
  name                            = "${var.cluster_name_preffix}-cluster-${var.env}"
  region                          = var.region_id
  network_project_id              = var.host_project_id
  network                         = var.dev_vpc
  subnetwork                      = var.dev_sub
  ip_range_pods                   = var.subnet_cidr_pods_name
  ip_range_services               = var.subnet_cidr_services_name
  release_channel                 = "REGULAR"
  create_service_account          = false
  enable_fqdn_network_policy = true
  enable_vertical_pod_autoscaling = true
  enable_l4_ilb_subsetting        = true
  enable_private_endpoint         = true
  enable_private_nodes            = true
  network_tags                    = [local.cluster_type]
  deletion_protection             = false

  master_authorized_networks = [
    {
      cidr_block   = "${var.master_cidr_block}"
      display_name = "VPC"
    },
  ]

  depends_on = [ 
    module.projects_iam_bindings
  # google_project_iam_member.host-proj-security-admin,
  # google_project_iam_member.host-proj-network-user,
  # google_project_iam_member.host-proj-k8s-agent-user,
  # google_project_iam_member.host-proj-k8s-agent,
  # google_project_iam_member.service-proj-k8s-agent,
  # google_project_iam_member.service-proj-k8s-svc-acc-usr
               ]
 }