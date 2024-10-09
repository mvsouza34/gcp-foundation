#######################################################
# Set the Projects ID                                 #
#######################################################
variable "service_project_id" {
    description = "The ID for all the Digital Resources"
    type = string
}
variable "service_project_num" {
  description = "Project number"
  type = string
}

################################################
# Define the region and zone for the resources #
################################################
variable "region_id" {
  description = "The region for the resources"
  type        = string
}

