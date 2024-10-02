# This file contains the variables used by the terraform scripts
# Global variables
# This file is used by the terraform scripts to create the infrastructure
############################################
# Credentials file for the service account #
############################################
org_id = "13995541191"
###########################################
# Declarate information to Project Create #
###########################################
billing_account = "01372B-DAAE88-F20731"
shared_folder_id = "value"
environment_folder_id = "value"
project_folder_id = "value"

########################
# Define Enviroment ID #
########################
env = "dev"

#######################################################
# Set the Projects IDs for the different environments #
#######################################################
# Shared Projects
host_project_id = "dt-sandbox-host-proj"
# Service Projects
service_project_id = "dt-sandbox-service-proj"
###########################
# Define the machine type #
###########################
machine_type = "e2-micro"
# machine_type_medium = "e2-medium"
# machine_type_large = "e2-standard-2"

########################
# Define default image #
########################
linux_image = "cos-cloud/cos-stable"

################################################
# Define the region and zone for the resources #
################################################
region_id = "us-central1"
zone_01_id = "us-central1-a"
zone_02_id = "us-central1-b"
zone_03_id = "us-central1-f"
# zone_02_id = "us-central1-b"
# zone_03_id = "us-central1-c"

########################################
# Define the network and subnets names #
########################################
# Link to IP distribuition list https://docs.google.com/spreadsheets/d/1Jtw4-wJaHHsyIf31eghvgcwIYUr_HuJy/edit?usp=sharing&ouid=100727001565538824661&rtpof=true&sd=true
################################################################################
#######################
# Cluster VPC Network #
#######################
# Cluster network
service_vpc_name = "service-cluster-vpc"
################################################################################
# Default Project CIRDs #
subnet_cidr_service_range = "value"
subnet_cidr_application_range = "value"
################################################################################
# Cluster subnets
subnet_cluster_service = "subnet-cluster-subnet"
################################################################################
# Cluster subnets CIDR
subnet_cidr_cluster_range_control = "10.64.48.0/28"
subnet_cidr_cluster_range_primary = "10.64.0.0/20"
subnet_cidr_cluster_range_secondary_services = "10.64.16.0/20"
subnet_cidr_cluster_range_secondary_pods = "10.64.32.0/20"
############################################################################
# Cluster Private Connection subnet CIDR
subnet_cidr_cluster_private_ip_address = "10.64.64.0" # Private IP Address to Private Connetion
# Cluster Private Connection subnet mask length
ip_mask_length_cluster_private_ip_address = "20"