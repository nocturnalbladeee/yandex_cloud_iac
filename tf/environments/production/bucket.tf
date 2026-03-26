resource "yandex_iam_service_account" "tfstate" {
  name        = "${var.project_name}-tfstate-sa"
  description = "Service account for Terraform state bucket access"
  folder_id   = var.folder_id
}

resource "yandex_resourcemanager_folder_iam_member" "tfstate_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.tfstate.id}"
}

resource "yandex_iam_service_account_static_access_key" "tfstate" {
  service_account_id = yandex_iam_service_account.tfstate.id
  description        = "Static access key for Terraform state bucket"
}

module "tfstate_bucket" {
  source = "github.com/terraform-yacloud-modules/terraform-yandex-storage-bucket"
  
  bucket_name = var.tfstate_bucket_name
  folder_id   = var.folder_id
  storage_admin_service_account = {
    existing_account_id = yandex_iam_service_account.tfstate.id
  }

  versioning = {
    enabled = true  
  }
  
  server_side_encryption_configuration = {
    enabled       = true
    sse_algorithm = "aws:kms"
  }
  
  max_size = 10737418240 
  
  tags = {
    Name        = "Terraform State"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "yandex_lockbox_secret" "tfstate" {
  name        = "${var.project_name}-tfstate-secrets"
  description = "Access keys for Terraform state bucket"
  folder_id   = var.folder_id
}

resource "yandex_lockbox_secret_version" "tfstate" {
  secret_id = yandex_lockbox_secret.tfstate.id
  
  entries {
    key        = "access_key"
    text_value = yandex_iam_service_account_static_access_key.tfstate.access_key
  }
  
  entries {
    key        = "secret_key"
    text_value = yandex_iam_service_account_static_access_key.tfstate.secret_key
  }
  
  entries {
    key        = "bucket_name"
    text_value = module.tfstate_bucket.bucket_name
  }
}

