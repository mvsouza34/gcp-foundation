resource "google_sql_database_instance" "service_postgres_instance" {
  provider = google-beta
  project = "${var.service_project_id}"

  name             = "${var.service_project_id}-cloudsql-instance-01"
  region           = var.region_id
  database_version = "POSTGRES_12"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled                                  = true
      allocated_ip_range                            = local.network.service_project_private_ip_address.name

      private_network                               = local.network.service_private_vpc_connection.network
      enable_private_path_for_google_cloud_services = true

      authorized_networks {
        name = "carlokos-vpn-br"
        value = "129.148.29.13/32"
      }
    }
  }

  # depends_on = [ local.network.service_private_vpc_connection ]

}