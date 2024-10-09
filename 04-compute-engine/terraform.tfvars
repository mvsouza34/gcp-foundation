#######################################################
# Set the Projects IDs for the different environments #
#######################################################
# Shared Projects
host_project_id             = "allos-network-hub"
host_project_num            = "485328609235"

# Service Projects
service_project_id          = "allostech-digital-dev"
service_project_num         = "497353369355"

########################
# Define Enviroment ID #
########################
env                         = "dev"

################################################
# Define the region and zone for the resources #
################################################
# Region
region_id                   = "us-east1"

# Zones
zone_01_id                  = "us-east1-b"

########################################
# Define the network and subnets names #
########################################
dev_vpc                     = "vpc-digital-dev"
dev_sub                     = "sb-digital-dev-gke-us-east-1"


###################################
# Define the cluster's properties #
###################################

# Cluster name preffix #
cluster_name_preffix        = "allostech-digital"

# Cluster's ranges #
subnet_cidr_services_name   = "sip-services-gke-dev"
subnet_cidr_pods_name       = "sip-pods-gke-dev"

# Master Authorized Networks
master_cidr_block           = "10.131.136.0/23"
