resource "google_project" "service_project" {
  auto_create_network = false
  # org_id              = "${var.org_id}"
  billing_account     = "${var.billing_account}"
  folder_id = "351671931898"
  # folder_id           = "${var.folder_aiqfome_id}"
  name                = "${var.service_project_id}-${var.env}-${random_id.name_suffix.hex}"
  project_id          = "${var.service_project_id}-${var.env}-${random_id.name_suffix.hex}"
  deletion_policy = "DELETE"
}

output "service_project_id" {
  value = "${google_project.service_project.id}"
}
output "aiqfome_host_project_name" {
  value = "${google_project.service_project.name}"
}
# output "service_project_number" {
#   value = "${google_project.service_project.number}"
# }

########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "service_project" {
  content = jsonencode({
    service_project_id = google_project.service_project.id
    service_project_name = google_project.service_project.name
    # service_project_number = google_project.service_project.number
  })
  filename = "../local/service_project.json"
}

################################
# Enable the required services #
################################
# Enable Compute Engine API
resource "google_project_service" "compute_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "compute.googleapis.com"
  disable_on_destroy = false
}
# Enable Database Migration API
resource "google_project_service" "datamigration_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "datamigration.googleapis.com"
  disable_on_destroy = false
}
# Enable Kubernetes Engine API
resource "google_project_service" "container_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "container.googleapis.com"
  disable_on_destroy = false
}
# Enable Nework Management API
resource "google_project_service" "networkmanagement_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "networkmanagement.googleapis.com"
  disable_on_destroy = false
}
# Enable Service Networking API
resource "google_project_service" "servicenetworking_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud resource Manager API
resource "google_project_service" "cloudresourcemanager_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}
# Enable Service Usage API
resource "google_project_service" "serviceusage_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "serviceusage.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud SQL API
resource "google_project_service" "sql_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "sqladmin.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Storage API
resource "google_project_service" "storage_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "storage-component.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Build API
resource "google_project_service" "cloudbuild_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Run API
resource "google_project_service" "run_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "run.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Functions API
resource "google_project_service" "functions_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "cloudfunctions.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Pub/Sub API
resource "google_project_service" "pubsub_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "pubsub.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Firestore API
resource "google_project_service" "firestore_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "firestore.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Scheduler API
resource "google_project_service" "scheduler_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "cloudscheduler.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Billing API
resource "google_project_service" "cloudbilling_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "cloudbilling.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud IAM API
resource "google_project_service" "iam_google_api_aiqfome_dev" {
  project = google_project.service_project.name
  service = "iam.googleapis.com"
  disable_on_destroy = false
}