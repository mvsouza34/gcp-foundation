resource "google_sql_database_instance" "postgres_to_delete" {
  provider = google-beta
  project = local.projects.service_project.name

  name                = "${var.service_project_id}-postgres-instance-${var.env}"
  region              = var.region_id
  database_version    = "POSTGRES_16"

  instance_type       = "CLOUD_SQL_INSTANCE"
  

  settings {
    tier = "db-f1-micro"
    # tier = "db-custom-2-8192"

    pricing_plan = "PER_USE"
  
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    backup_configuration {
      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }
      enabled                        = false
    #   location                       = "us"
    #   point_in_time_recovery_enabled = false
    #   start_time                     = "20:00"
    #   transaction_log_retention_days = 7
    }

    connector_enforcement = "NOT_REQUIRED"
    disk_autoresize       = true
    disk_autoresize_limit = 0
    disk_size             = 10
    disk_type             = "PD_SSD"
    edition               = "ENTERPRISE"

    ip_configuration {
      ipv4_enabled       = true
      allocated_ip_range = local.network.service_project_private_ip_address.name
      
      private_network    = local.network.service_private_vpc_connection.network
      enable_private_path_for_google_cloud_services = true

      authorized_networks {
        name = "carlokos-vpn-br"
        value = "129.148.29.13/32"
      }
    }

    location_preference {
      zone = var.zone_01_id
    }
  }

  deletion_protection = false
}