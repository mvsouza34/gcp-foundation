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

#########################
# Database's properties #
#########################
variable "database_name_preffix" {
  description = "The cluster name preffix"
  type = string
}
variable "database_tier" {
  description = "Instance family"
  type = string
}
variable "database_version" {
  description = "Database's version"
  type = string
}
variable "cloudsql_mysql_sa" {
  description = "Cloud SQL Service Account"
  type = string
}
variable "cloudsql_mysql_email" {
  description = "User Cloud SQL E-mail"
  type = string
}
variable "cloudsql_mysql_dbadmin_email" {
  description = "Cloud SQL Service DB Admin's E-mail"
  type = string
}
variable "cloudsql_mysql_dbadmin_email_id" {
  description = "DB Admin E-mail's ID"
  type = string
}