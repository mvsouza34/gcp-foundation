########################################################
# Create a Output Files to reuse generated information #
########################################################
resource "local_file" "export_subnet" {
  content = jsonencode({
    host_project = {
      name = google_project.host_project.name,
      id = google_project.host_project.id,
      number = google_project.host_project.number,
      }
    service_project = {
      name = google_project.aiqentrega_project_dev.name,
      id = google_project.aiqentrega_project_dev.id,
      number = google_project.aiqentrega_project_dev.number,
      }
  })
    filename = "../01_projects.json"
}