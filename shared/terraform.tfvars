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
# folder_shared_id = "268838456059"
# folder_aiqfome_id = "799183227888"
# folder_aiqentrega_id = "808700580973"
# folder_plusdelivery_id = "549607786790"

########################
# Define Enviroment ID #
########################
env = "dev"

#######################################################
# Set the Projects IDs for the different environments #
#######################################################
# Shared Projects
aiqfome_host_project_id = "aiqfome-host-project"
aiqfome_shared_project_id = "aiqfome-shared-proj"
# Service Projects
aiqfome_project_id = "aiqfome-project"
aiqentrega_project_id = "aiqentrega-project"
plusdelivery_project_id = "plusdelivery-project"

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
region_id = "us-east1"
zone_01_id = "us-east1-a"
zone_02_id = "us-east1-b"
zone_03_id = "us-east1-c"
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
################################################################################
# Cluster network
network_cluster_name = "aiqfome-cluster-vpc"
################################################################################
# Cluster subnets
subnet_cluster_service = "aiqfome-cluster-subnet"
################################################################################
# Cluster subnets CIDR
subnet_cidr_cluster_range_control = "10.64.48.0/28"
subnet_cidr_cluster_range_primary = "10.64.0.0/20"
subnet_cidr_cluster_range_secondary_services = "172.17.0.0/17"
subnet_cidr_cluster_range_secondary_pods = "172.16.0.0/17"
############################################################################
# # Cluster Private Connection subnet CIDR
# subnet_cidr_cluster_private_ip_address = "10.64.64.0" # Private IP Address to Private Connetion
# # Cluster Private Connection subnet mask length
# ip_mask_length_cluster_private_ip_address = "20"

#######################
# AiQFome VPC Network #
#######################
# AiQFome network
network_aiqfome_name = "aiqfome-vpc-network"
################################################################################
# AiQFome subnets
subnet_aiqfome_service = "aiqfome-subnet-service"
subnet_aiqfome_application = "aiqfome-subnet-application"
subnet_aiqfome_database = "aiqfome-subnet-database"
################################################################################
# AiQFome subnets CIDR
subnet_cidr_aiqfome_range_service = "10.65.0.0/20" # Service Network
subnet_cidr_aiqfome_range_application = "10.65.16.0/20" # Application Network
subnet_cidr_aiqfome_range_database = "10.65.48.0/20" # Database Network
################################################################################
# AiQFome Connection subnet CIDR
subnet_cidr_aiqfome_private_ip_address = "10.65.32.0" # Private IP Address to Private Connetion
# Private Connection subnet mask length
ip_mask_length_aiqfome_private_ip_address = "20"

##########################
# AiQEntrega VPC Network #
##########################
# AiQEntrega network
network_aiqentrega_name = "aiqentrega-vpc-network"
################################################################################
# AiQEntrega subnets
subnet_aiqentrega_service = "aiqentrega-subnet-service"
subnet_aiqentrega_application = "aiqentrega-subnet-application"
################################################################################
# AiQEntrega subnets CIDR
subnet_cidr_aiqentrega_range_service = "10.66.0.0/20"
subnet_cidr_aiqentrega_range_application = "10.66.16.0/20"
################################################################################
# AiQEntrega Private Connection subnet CIDR
subnet_cidr_aiqentrega_private_ip_address = "10.66.32.0" # Private IP Address to Private Connetion
# AiQEntrega Private Connection subnet mask length
ip_mask_length_aiqentrega_private_ip_address = "20"

##########################
# PlusDelivery VPC Network #
##########################
# PlusDelivery network
network_plusdelivery_name = "plusdelivery-vpc-network"
################################################################################
# PlusDelivery subnets
subnet_plusdelivery_service = "plusdelivery-subnet-service"
subnet_plusdelivery_application = "plusdelivery-subnet-application"
################################################################################
# PlusDelivery subnets CIDR
subnet_cidr_plusdelivery_range_service = "10.67.0.0/20"
subnet_cidr_plusdelivery_range_application = "10.67.16.0/20"
################################################################################
# PlusDelivery Private Connection subnet CIDR
subnet_cidr_plusdelivery_private_ip_address = "10.67.32.0" # Private IP Address to Private Connetion
# PlusDelivery Private Connection subnet mask length
ip_mask_length_plusdelivery_private_ip_address = "20"
