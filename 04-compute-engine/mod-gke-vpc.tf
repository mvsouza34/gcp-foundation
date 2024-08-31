module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 9.1"

    project_id   = local.aiqfome_host_project.host_project_name
    network_name = "${var.network_cluster_name}-${var.env}"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "${var.network_cluster_name}"
            subnet_ip             = "${var.subnet_cidr_cluster_range_primary}"
            subnet_region         = "${var.region_id}"
        }
    ]
    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "services-range"
                ip_cidr_range = "${var.subnet_cidr_cluster_range_secondary_services}"
            },
        ]
        subnet-02 = [
            {
                range_name    = "pod-range"
                ip_cidr_range = "${var.subnet_cidr_cluster_range_secondary_pods}"
            },
        ]
    }
    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        },
    ]
}

output "aiqfome_cluster_vpc" {
    value = "module.vpc.network_name"
}
output "subnet_aiqfome_cluster" {
    value = "module.vpc.subnets[0].subnet_name"
}
output "subnet_cidr_cluster_range_primary" {
    value = "module.vpc.subnets[0].name"
}
output "subnet_cidr_cluster_range_secondary_services" {
    value = "module.vpc.secondary_ranges.subnet-01[0].range_name"
}
output "subnet_cidr_cluster_range_secondary_pods" {
    value = "module.vpc.secondary_ranges.subnet-02[0].range_name"
}

resource "local_file" "aiqfome_cluster_vpc" {
    content  = module.vpc.network_name
    filename = "${path.module}/aiqfome_cluster_vpc.txt"
}
