#######################################################
# Set the Projects IDs for the different environments #
#######################################################
variable "service_project_id" {
    description = "The ID for all the Digital Resources"
    type = string
}
variable "service_project_num" {
  description = "Project number"
  type = string
}
variable "host_project_id" {
  description = "The ID of the app host project"
  type        = string
}
variable "host_project_num" {
  description = "Host project number"
  type = string
}

########################
# Define Enviroment ID #
########################
variable "env" {
  description = "The name of the environment"
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

########################################
# Define the network and subnets names #
########################################
variable "dev_vpc" {
  description = "The dev vpc path"
  type = string
}

variable "dev_sub" {
  description = "The dev sub path"
  type = string
}

###################################
# Define the cluster's properties #
###################################
variable "cluster_name_preffix" {
  description = "The cluster name preffix"
  type = string
}
variable "subnet_cidr_services_name" {
  description = "The services range name for the gke cluster"
  type = string
}
variable "subnet_cidr_pods_name" {
  description = "The pods range name for the gke cluster"
  type        = string
}
variable "master_cidr_block" {
  description = "Master authorized networks"
  type        = string
}

