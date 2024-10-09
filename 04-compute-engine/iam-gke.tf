# #############################
# # Access to Service Account #
# #############################

module "projects_iam_bindings" {
  source                                   = "terraform-google-modules/iam/google//modules/projects_iam"
  version                                  = "~> 8.0"

  projects                                 = [var.service_project_id, var.host_project_id]

  mode                                     = "additive"

  bindings = {
    "roles/compute.securityAdmin"          = [
      "serviceAccount:service-${var.service_project_num}@container-engine-robot.iam.gserviceaccount.com",
    ]

    "roles/compute.networkUser"            = [
      "serviceAccount:service-${var.service_project_num}@container-engine-robot.iam.gserviceaccount.com",
    ]

    "roles/container.hostServiceAgentUser" = [
      "serviceAccount:service-${var.service_project_num}@container-engine-robot.iam.gserviceaccount.com",
    ]

    "roles/container.serviceAgent"        = [
      "serviceAccount:service-${var.service_project_num}@container-engine-robot.iam.gserviceaccount.com",
    ]
    "roles/container.nodeServiceAccount"  = [
      "serviceAccount:service-${var.service_project_num}@container-engine-robot.iam.gserviceaccount.com",
    ]
  }
}