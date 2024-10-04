# #############################
# # Access to Service Account #
# #############################
resource "google_project_iam_member" "host-proj-security-admin" {
  project = local.projects.host_project.name
  role = "roles/compute.securityAdmin"
  member  = "serviceAccount:service-${local.projects.service_project.number}@container-engine-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "host-proj-network-user" {
  project = local.projects.host_project.name
  role = "roles/compute.networkUser"
  member  = "serviceAccount:service-${local.projects.service_project.number}@container-engine-robot.iam.gserviceaccount.com"
}

# Service Account Host Service Agent User to access to GKE from service projeto to host project
resource "google_project_iam_member" "host-proj-k8s-agent-user" {
  project = local.projects.host_project.name
  role = "roles/container.hostServiceAgentUser"
  member  = "serviceAccount:service-${local.projects.service_project.number}@container-engine-robot.iam.gserviceaccount.com"
}

# Service Account Service Agent access to GKE to own project
resource "google_project_iam_member" "host-proj-k8s-agent" {
    project = local.projects.host_project.name
    role = "roles/container.serviceAgent"
    member  = "serviceAccount:service-${local.projects.host_project.number}@container-engine-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "service-proj-k8s-agent" {
    project = local.projects.service_project.name
    role = "roles/container.serviceAgent"
    member  = "serviceAccount:service-${local.projects.service_project.number}@container-engine-robot.iam.gserviceaccount.com"
}