module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 6.0"

  name          = "${var.service_project_id}-bucket"
  project_id    = var.service_project_id
  location      = var.region_id

  force_destroy = false
  public_access_prevention = "enforced"
  versioning    = true

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age            = 365
      with_state     = "ANY"
      matches_prefix = var.service_project_id
    }
  }]

  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "serviceAccount:service-${var.service_project_num}@container-engine-robot.iam.gserviceaccount.com"
  },
#   {
#     role   = "roles/storage.objectViewer"
#     member = "group:group-identifier"
#   }
  
  ]

  autoclass  = true
  encryption = { default_kms_key_name = null }
}