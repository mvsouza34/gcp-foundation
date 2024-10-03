# # google_compute_shared_vpc_service_project.service_project_aiqfome_dev

# # Enable shared VPC for the host project.
# # gcloud beta compute shared-vpc enable network-host-project-dev
# #
# # Enable Shared-VPC, and add the private networt and dmz network in host project network_host_project


# Create a resource shared VPC network in the host project.
resource "google_compute_shared_vpc_host_project" "shared_vpc_host_project" {
  project = local.projects.host_project.name
}

# Define the shared VPC network in the service project aiqfome_project_id
resource "google_compute_shared_vpc_service_project" "service_project_dev" {
  service_project = local.projects.service_project.name
  host_project    = local.projects.host_project.name

  depends_on = [ google_compute_network.vpc_shared_network,
                 google_compute_shared_vpc_host_project.shared_vpc_host_project ]
}
# # Define the shared VPC network in the service project aiqentrega_project_id
# resource "google_compute_shared_vpc_service_project" "aiqentrega_service_project_dev" {
#   service_project = local.projects.service_project_02.name
#   host_project    = local.projects.host_project.name

#   depends_on = [ google_compute_network.vpc_network_aiqentrega_dev,
#                  google_compute_shared_vpc_host_project.shared_vpc_host_project_dev ]
# }
# # Define the shared VPC network in the service project plusdelivery_project_id
# resource "google_compute_shared_vpc_service_project" "plusdelivery_service_project_dev" {
#   service_project = projects.service_project_03.name
#   host_project    = local.projects.host_project.name

#   depends_on = [ google_compute_network.vpc_network_plusdelivery_dev,
#                  google_compute_shared_vpc_host_project.shared_vpc_host_project_dev ]
# }
