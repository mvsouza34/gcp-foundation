resource "google_project" "aiqfome_project_dev" {
  auto_create_network = false
  org_id              = "${var.org_id}"
  billing_account     = "${var.billing_account}"
  # folder_id           = "${var.folder_aiqfome_id}"
  name                = "${var.aiqfome_project_id}-${var.env}-${random_id.name_suffix.hex}"
  project_id          = "${var.aiqfome_project_id}-${var.env}-${random_id.name_suffix.hex}"
  # deletion_policy = "DELETE"
}

output "aiqfome_project_id" {
  value = "${google_project.aiqfome_project_dev.id}"
}
output "aiqfome_host_project_name" {
  value = "${google_project.aiqfome_project_dev.name}"
}
# output "aiqfome_project_number" {
#   value = "${google_project.aiqfome_project_dev.number}"
# }

########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "aiqfome_project" {
  content = jsonencode({
    aiqfome_project_id = google_project.aiqfome_project_dev.id
    aiqfome_project_name = google_project.aiqfome_project_dev.name
    # aiqfome_project_number = google_project.aiqfome_project_dev.number
  })
  filename = "../local/aiqfome_project.json"
}

################################
# Enable the required services #
################################
# Enable Compute Engine API
resource "google_project_service" "compute_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "compute.googleapis.com"
  disable_on_destroy = false
}
# Enable Database Migration API
resource "google_project_service" "datamigration_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "datamigration.googleapis.com"
  disable_on_destroy = false
}
# Enable Kubernetes Engine API
resource "google_project_service" "container_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "container.googleapis.com"
  disable_on_destroy = false
}
# Enable Nework Management API
resource "google_project_service" "networkmanagement_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "networkmanagement.googleapis.com"
  disable_on_destroy = false
}
# Enable Service Networking API
resource "google_project_service" "servicenetworking_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud resource Manager API
resource "google_project_service" "cloudresourcemanager_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}
# Enable Service Usage API
resource "google_project_service" "serviceusage_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "serviceusage.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud SQL API
resource "google_project_service" "sql_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "sqladmin.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Storage API
resource "google_project_service" "storage_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "storage-component.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Build API
resource "google_project_service" "cloudbuild_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Run API
resource "google_project_service" "run_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "run.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Functions API
resource "google_project_service" "functions_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "cloudfunctions.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Pub/Sub API
resource "google_project_service" "pubsub_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "pubsub.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Firestore API
resource "google_project_service" "firestore_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "firestore.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Scheduler API
resource "google_project_service" "scheduler_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "cloudscheduler.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud Billing API
resource "google_project_service" "cloudbilling_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "cloudbilling.googleapis.com"
  disable_on_destroy = false
}
# Enable Cloud IAM API
resource "google_project_service" "iam_google_api_aiqfome_dev" {
  project = google_project.aiqfome_project_dev.name
  service = "iam.googleapis.com"
  disable_on_destroy = false
}