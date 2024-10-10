#######################################################
# Set the Projects IDs for the different environments #
#######################################################
# Shared Projects
host_project_id                 = "allos-network-hub"
host_project_num                = "485328609235"

# Service Projects
service_project_id              = "allostech-digital-dev"
service_project_num             = "497353369355"

########################
# Define Enviroment ID #
########################
env                             = "dev"

################################################
# Define the region and zone for the resources #
################################################
# Region
region_id                       = "us-east1"

# Zones
zone_01_id                      = "us-east1-b"

########################################
# Define the network and subnets names #
########################################
dev_vpc                         = "vpc-digital-dev"
dev_sub                         = "sb-digital-dev-gke-us-east-1"


#########################
# Database's properties #
#########################

# Cluster name preffix #
database_name_preffix           = "allostech-digital-db"

# Database tier
database_tier                   = "db-f1-micro"

# Database vesion
database_version                = "MYSQL_8_0"

# User Cloud SQL Service Account
cloudsql_mysql_sa               = ""

# User Cloud SQL E-mails
cloudsql_mysql_email            = ""   

# DB Admin's E-mail
cloudsql_mysql_dbadmin_email    = ""

# DB Admin's E-mail ID
cloudsql_mysql_dbadmin_email_id = ""