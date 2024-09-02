# module "vpc" {
#     source  = "terraform-google-modules/network/google"
#     version = "~> 9.1"

#     project_id   = local.aiqfome_host_project.host_project_name
#     network_name = "${var.network_cluster_name}-${var.env}"
#     routing_mode = "GLOBAL"

#     subnets = [
#         {
#             subnet_name           = "${var.network_cluster_name}-subnet-${var.env}"
#             subnet_ip             = "${var.subnet_cidr_cluster_range_primary}"
#             subnet_region         = "${var.region_id}"
#         }
#     ]
#     secondary_ranges = {
#         "${var.network_cluster_name}-subnet-${var.env}" = [
#             {
#                 range_name = "services-range"
#                 ip_cidr_range = "${var.subnet_cidr_cluster_range_secondary_services}"
#             },
#             {
#                 range_name = "pod-ranges"
#                 ip_cidr_range = "${var.subnet_cidr_cluster_range_secondary_pods}"
#             }
#         ]         
#     }
   
#     routes = [
#         {
#             name                   = "egress-internet"
#             description            = "route through IGW to access internet"
#             destination_range      = "0.0.0.0/0"
#             tags                   = "egress-inet"
#             next_hop_internet      = "true"
#         },
#     ]
# }

# output "aiqfome_cluster_vpc" {
#     value = "module.vpc.network_name"
# }
# output "subnet_aiqfome_cluster" {
#     value = "module.vpc.subnets[0].subnet_name"
# }
# output "subnet_cidr_cluster_range_primary" {
#     value = "module.vpc.subnets[0].name"
# }
# output "subnet_cidr_cluster_range_secondary_services" {
#     value = "module.vpc.secondary_ranges.subnet-01[0].range_name"
# }
# output "subnet_cidr_cluster_range_secondary_pods" {
#     value = "module.vpc.secondary_ranges.subnet-02[0].range_name"
# }

# # Create a output to use in other modules
# output "vpc_self_link" {
#     value = module.vpc.network_self_link
# }

# # Create a JSON output file to use in other modules
# resource "local_file" "vpc" {
#     content  = jsonencode(module.vpc)
#     filename = "../local/gke_vpc.json"
# }

# # Attach the Shared VPN in the Service Project 
# resource "google_compute_shared_vpc_service_project" "aiqfome_shared_project" {
#     host_project    = local.aiqfome_host_project.host_project_name
#     service_project = local.aiqfome_shared_project.aiqfome_shared_project_name

#     depends_on = [ module.vpc ]
# }
