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

########################################
# Define the network and subnets names #
########################################
# Link to IP distribuition list https://docs.google.com/spreadsheets/d/1Jtw4-wJaHHsyIf31eghvgcwIYUr_HuJy/edit?usp=sharing&ouid=100727001565538824661&rtpof=true&sd=true
################################################################################
#######################
# Cluster VPC Network #
#######################
service_vpc_name = "service-vpc"
application_vpc_name = "application-vpc"
################################################################################
# Default Project CIRDs #
subnet_cidr_service_range = "10.192.0.0/20"
subnet_cidr_application_range = "10.192.16.0/20"
################################################################################
# Cluster subnets
subnet_cluster_name = "cluster-vpc"
subnet_cidr_environment = "10.192.0.0/10"
################################################################################
# Cluster subnets CIDR
subnet_cidr_cluster_range_primary            = "10.192.48.0/20"
subnet_cidr_cluster_range_secondary_services = "10.192.64.0/20"
subnet_cidr_cluster_range_secondary_pods     = "10.192.80.0/20"
# Cluster subnets CIDR /28 Break 10.192.48.0/20 in /28 https://jodies.de/ipcalc?host=10.192.48.0&mask1=20&mask2=28
subnet_cidr_cluster_range_control            = "10.192.96.0/28"
subnet_cidr_cluster_range_redis              = "10.192.96.16/28"
############################################################################
# Cluster Private Connection subnet CIDR
subnet_cidr_private_ip_address = "10.192.32.0" # Private IP Address to Private Connetion
# Cluster Private Connection subnet mask length
ip_mask_length_private_ip_address = "20"