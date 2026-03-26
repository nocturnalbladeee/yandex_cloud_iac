module "k8s-sa-secrets" {
  source = "github.com/terraform-yacloud-modules/terraform-yandex-lockbox"
  
  count = var.create_sa_secrets ? 1 : 0 
  
  name        = "${var.project_name}-k8s-sa-keys"
  folder_id   = var.folder_id
  description = "Service account keys for cluster components"
  
  entries = {
    "eso_sa_key"      = yandex_iam_service_account_key.eso.private_key
    "cert_manager_key" = yandex_iam_service_account_key.cert_manager.private_key
  }
}
