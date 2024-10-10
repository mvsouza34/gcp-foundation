# # # # Create a resource CloudSQL instance in prv project and connect it to the shared VPC network.
# resource "google_sql_database_instance" "service_project_sql_instance" {
#   provider = google-beta

#   name = "${var.service_project_id}-mysql-${var.env}"	
#   region = var.region_id
#   database_version = "MYSQL_8_0"

#   project = "${var.service_project_id}-${var.env}"

#   settings {
#     tier = "db-f1-micro"
#       ip_configuration {
#         ipv4_enabled = false # Disable public IP, switch to private IP update for true
#         allocated_ip_range = google_compute_global_address.service_project_private_ip_address_dev.name
        
#         private_network = google_service_networking_connection.service_project_private_vpc_connection_dev.id
#         enable_private_path_for_google_cloud_services = true
#       }
#     }

#     deletion_protection = false
# }

# output "service_project_sql_instance" {
#     value = google_sql_database_instance.service_project_sql_instance.name
# }

# resource "local_file" "service_project_sql_instance" {
#     content = jsonencode({
#         service_project_sql_instance = google_sql_database_instance.service_project_sql_instance.name
#     })
#     filename = "../local/service_project_sql_instance.json"
# }


#########################################################################################################################

resource "random_id" "suffix" {
  byte_length = 5
}

locals {
  /*
    Random instance name needed because:
    "You cannot reuse an instance name for up to a week after you have deleted an instance."
    See https://cloud.google.com/sql/docs/mysql/delete-instance for details.
  */
  network_name = "${var.dev_vpc}-safer-${random_id.suffix.hex}"
}

module "network-safer-mysql-simple" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.0"

  project_id   = var.service_project_id
  network_name = local.network_name

  subnets = []
}

module "private-service-access" {
  source  = "terraform-google-modules/sql-db/google//modules/private_service_access"
  version = "~> 22.0"

  project_id      = var.host_project_id
  vpc_network     = module.network-safer-mysql-simple.network_name
  deletion_policy = "ABANDON"
}

module "safer-mysql-db" {
  source  = "terraform-google-modules/sql-db/google//modules/safer_mysql"
  version = "~> 22.0"

  name                 = "${var.env}-${var.database_name_preffix}"
  random_instance_name = true
  project_id           = var.service_project_id

  deletion_protection = false

  database_version = var.database_version
  region           = var.region_id
  zone             = var.zone_01_id
  tier             = var.database_tier

  database_flags = [
    {
      name  = "cloudsql_iam_authentication"
      value = "on"
    },
  ]

  // By default, all users will be permitted to connect only via the
  // Cloud SQL proxy.
  # additional_users = [
  #   {
  #     name            = "app"
  #     password        = "PaSsWoRd"
  #     host            = "localhost"
  #     type            = "BUILT_IN"
  #     random_password = false
  #   },
  #   {
  #     name            = "readonly"
  #     password        = "PaSsWoRd"
  #     host            = "localhost"
  #     type            = "BUILT_IN"
  #     random_password = false
  #   },
  # ]

  # Supports creation of both IAM Users and IAM Service Accounts with provided emails
  # iam_users = [
  #   {
  #     id    = var.cloudsql_mysql_sa,
  #     email = var.cloudsql_mysql_email
  #   },
  #   {
  #     id    = var.cloudsql_mysql_dbadmin_email_id,
  #     email = var.cloudsql_mysql_dbadmin_email
  #   }
  # ]

  assign_public_ip   = false
  vpc_network        = module.network-safer-mysql-simple.network_self_link
  allocated_ip_range = module.private-service-access.google_compute_global_address_name

  // Optional: used to enforce ordering in the creation of resources.
  module_depends_on = [module.private-service-access.peering_completed]
}