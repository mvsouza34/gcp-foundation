############################################
# Credentials file for the service account #
############################################
variable "org_id" {
  description = "The organization ID"
  type        = string
}
###########################################
# Declarate information to Project Create #
###########################################
variable "billing_account" {
  description = "The billing account ID"
  type        = string
}
variable "folder_shared_id" {
  description = "The ID of the shared network folder"
  type        = string
}
variable "folder_aiqfome_id" {
  description = "The ID of the app folder"
  type        = string
}
variable "folder_aiqentrega_id" {
  description = "The ID of the private folder"
  type        = string
}
variable "folder_plusdelivery_id" {
  description = "The ID of the DMZ folder"
  type        = string
}
########################
# Define Enviroment ID #
########################
variable "env" {
  description = "The name of the environment"
  type        = string
 }

#######################################################
# Set the Projects IDs for the different environments #
#######################################################
variable "aiqfome_project_id" {
  description = "The ID of the app project"
  type        = string
}
variable "aiqentrega_project_id" {
  description = "The ID of the private project"
  type        = string
}
variable "plusdelivery_project_id" {
  description = "The ID of the DMZ project"
  type        = string
}
variable "aiqfome_host_project_id" {
  description = "The ID of the app host project"
  type        = string
}
variable "aiqfome_shared_project_id" {
  description = "The ID of the shared network project"
  type        = string
}

###########################
# Define the machine type #
###########################
variable "machine_type" {
  description = "The machine type"
  type        = string
}

########################
# Define default image #
########################
variable "linux_image" {
  description = "The default image"
  type        = string
}

################################################
# Define the region and zone for the resources #
################################################
variable "region_id" {
  description = "The region for the resources"
  type        = string
}
variable "zone_01_id" {
  description = "The zone for the resources"
  type        = string
}
variable "zone_02_id" {
  description = "The zone for the resources"
  type        = string
}
variable "zone_03_id" {
  description = "The zone for the resources"
  type        = string
}

########################################
# Define the network and subnets names #
########################################
# Link to IP distribuition list https://docs.google.com/spreadsheets/d/1Jtw4-wJaHHsyIf31eghvgcwIYUr_HuJy/edit?usp=sharing&ouid=100727001565538824661&rtpof=true&sd=true
##########################################
# Private Network Cluster VPC and Subnet #
##########################################
################################################################################
# Cluster network
variable "network_cluster_name" {
  description = "The name of the network"
  type        = string
}
################################################################################
# Cluster subnets
variable "subnet_cluster_service" {
  description = "The name of the service subnet"
  type        = string
}
############################################################################
# Cluster subnets CIDR
variable "subnet_cidr_cluster_range_control" {
  description = "The CIDR of the service subnet"
  type        = string
}
variable "subnet_cidr_cluster_range_primary" {
  description = "The CIDR of the service subnet"
  type        = string
}
variable "subnet_cidr_cluster_range_secondary_services" {
  description = "The CIDR of the application subnet"
  type        = string
}
variable "subnet_cidr_cluster_range_secondary_pods" {
  description = "The Secondary CIDR to Cluster"
  type = string
}
############################################################################
# # Cluster Private Connection subnet CIDR
# variable "subnet_cidr_cluster_private_ip_address" {
#   description = "The CIDR of the private IP address"
#   type        = string
# }
# # Private Connection subnet mask length
# variable "ip_mask_length_cluster_private_ip_address" {
#   description = "The mask length of the private IP address"
#   type        = string
# }

##########################################
# Private Network AiQFome VPC and Subnet #
##########################################
# Private network
variable "network_aiqfome_name" {
  description = "The name of the network"
  type        = string
}
################################################################################
# Private subnets
variable "subnet_aiqfome_service" {
  description = "The name of the service subnet"
  type        = string
}
variable "subnet_aiqfome_application" {
  description = "The name of the application subnet"
  type        = string
}
variable "subnet_aiqfome_database" {
  description = "The name of the database subnet"
  type        = string
}
################################################################################
# Private subnets CIDR
variable "subnet_cidr_aiqfome_range_service" {
  description = "The CIDR of the service subnet"
  type        = string
}
variable "subnet_cidr_aiqfome_range_application" {
  description = "The CIDR of the application subnet"
  type        = string
}
variable "subnet_cidr_aiqfome_range_database" {
  description = "The CIDR of the database subnet"
  type        = string
}
################################################################################
# Private Connection subnet CIDR
variable "subnet_cidr_aiqfome_private_ip_address" {
  description = "The CIDR of the private IP address"
  type        = string
}
# Private Connection subnet mask length
variable "ip_mask_length_aiqfome_private_ip_address" {
  description = "The mask length of the private IP address"
  type        = string
}

#############################################
# Private Network AiQEntrega VPC and Subnet #
#############################################
# AiQEntrega network
variable "network_aiqentrega_name" {
  description = "The name of the network"
  type        = string
}
################################################################################
# AiQEntrega subnets
variable "subnet_aiqentrega_service" {
  description = "The name of the service subnet"
  type        = string
}
variable "subnet_aiqentrega_application" {
  description = "The name of the application subnet"
  type        = string
}
################################################################################
# AiQEntrega subnets CIDR
variable "subnet_cidr_aiqentrega_range_service" {
  description = "The CIDR of the service subnet"
  type        = string
}
variable "subnet_cidr_aiqentrega_range_application" {
  description = "The CIDR of the application subnet"
  type        = string
}
################################################################################
# AiQEntrega Private Connection subnet CIDR
variable "subnet_cidr_aiqentrega_private_ip_address" {
  description = "The CIDR of the private IP address"
  type        = string
}
# Private Connection subnet mask length
variable "ip_mask_length_aiqentrega_private_ip_address" {
  description = "The mask length of the private IP address"
  type        = string
}

##########################
# PlusDelivery VPC Network #
##########################
# PlusDelivery network
variable "network_plusdelivery_name" {
  description = "The name of the network"
  type        = string
}
################################################################################
# PlusDelivery subnets
variable "subnet_plusdelivery_service" {
  description = "The name of the service subnet"
  type        = string
}
variable "subnet_plusdelivery_application" {
  description = "The name of the application subnet"
  type        = string
}
################################################################################
# PlusDelivery subnets CIDR
variable "subnet_cidr_plusdelivery_range_service" {
  description = "The CIDR of the service subnet"
  type        = string
}
variable "subnet_cidr_plusdelivery_range_application" {
  description = "The CIDR of the application subnet"
  type        = string
}
################################################################################
# PlusDelivery Private Connection subnet CIDR
variable "subnet_cidr_plusdelivery_private_ip_address" {
  description = "The CIDR of the private IP address"
  type        = string
}
# PlusDelivery Private Connection subnet mask length
variable "ip_mask_length_plusdelivery_private_ip_address" {
  description = "The mask length of the private IP address"
  type        = string
}