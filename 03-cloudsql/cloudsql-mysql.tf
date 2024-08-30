# # # # Create a resource CloudSQL instance in prv project and connect it to the shared VPC network.
resource "google_sql_database_instance" "aiqfome_sql_instance_dev" {
    provider = google-beta

    name = "${var.aiqfome_project_id}-private-instance-${var.env}"	
    region = var.region_id
    database_version = "MYSQL_8_0"

    project = local.aiqfome_project.aiqfome_project_name

    # depends_on = [ local.private_services_network.aiqfome_private_services_network_dev ]

    settings {
      tier = "db-f1-micro"
      ip_configuration {
        ipv4_enabled = false
        # private_network = google_compute_network.aiqfome_pvt_private_network_dev.self_link
        private_network = google_service_networking_connection.private_vpc_connection_dev.network
        enable_private_path_for_google_cloud_services = true
      }
    }
}

output "aiqfome_sql_instance" {
    value = google_sql_database_instance.aiqfome_sql_instance_dev.name
}

resource "local_file" "aiqfome_sql_instance" {
    content = jsonencode({
        aiqfome_sql_instance = google_sql_database_instance.aiqfome_sql_instance_dev.name
    })
    filename = "../local/aiqfome_sql_instance.json"
}