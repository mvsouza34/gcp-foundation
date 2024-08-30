terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.80.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
}

# Configure the local provider
provider "local" {}

# Configure the Google Cloud Provider
provider "google" {
#   credentials = var.credentials
  # project     = google_project.aiqfome_host_project_sdx.id

  region      = var.region_id
  zone        = var.zone_01_id
}

#####################################################
# Just a random id for the sql instance name suffix #
#####################################################
resource "random_id" "name_suffix" {
  byte_length = 2
}








# ###############################
# # Enable Google services APIs #
# ###############################
# resource "google_project_service" "billing_api" {
#   project = google_project.network_host_project_sdx.project_id
#   service = "cloudbilling.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }

# # enable the cloud functions api
# resource "google_project_service" "cloud_functions_api" {
#   service = "cloudfunctions.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable the cloud logging api
# resource "google_project_service" "cloud_logging_api" {
#   service = "logging.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable the secret manager api
# resource "google_project_service" "secret_manager_api" {
#   service = "secretmanager.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable compute engine api
# resource "google_project_service" "compute_engine_api" {
#   service = "compute.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # Enable the pubsub api
# resource "google_project_service" "pubsub_api" {
#   service = "pubsub.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable API Gateway api
# resource "google_project_service" "api_gateway_api" {
#   service = "apigateway.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable the cloud build api
# resource "google_project_service" "cloud_build_api" {
#   service = "cloudbuild.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable the cloud scheduler api
# resource "google_project_service" "cloud_scheduler_api" {
#   service = "cloudscheduler.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# # enable the cloud run api
# resource "google_project_service" "cloud_run_api" {
#   service = "run.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# resource "google_project_service" "service_networking_api" {
#   service = "servicenetworking.googleapis.com"
#   disable_dependent_services = true
#   disable_on_destroy = false
# }
# ##############################################################