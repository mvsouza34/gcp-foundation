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
variable "shared_folder_id" {
  description = "The ID of the shared network folder"
  type        = string
}
variable "environment_folder_id" {
  description = "The ID of the environment folder"
  type        = string
}
variable "project_folder_id" {
  description = "The ID of the app folder"
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
variable "host_project_id" {
  description = "The ID of the app project"
  type        = string
}
variable "service_project_id" {
  description = "The ID of the private project"
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
variable "service_vpc_name" {
  description = "The name of the network"
  type        = string
}
#############################
# Default Project CIRDs #
variable "subnet_cidr_service_range" {
  description = "The CIDR of the service subnet"
  type        = string
}
variable "subnet_cidr_application_range" {
  description = "The CIDR of the application subnet"
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
# Cluster Private Connection subnet CIDR
variable "subnet_cidr_cluster_private_ip_address" {
  description = "The CIDR of the private IP address"
  type        = string
}
# Private Connection subnet mask length
variable "ip_mask_length_cluster_private_ip_address" {
  description = "The mask length of the private IP address"
  type        = string
}