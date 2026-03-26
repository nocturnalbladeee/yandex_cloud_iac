module "gitlab_secrets" {
  source = "github.com/terraform-yacloud-modules/terraform-yandex-lockbox"

  count = var.gitlab_enabled ? 1 : 0

  name        = "${var.project_name}-gitlab-secrets"
  folder_id   = var.folder_id
  description = "Secrets for GitLab instance"

  entries = {
    "gitlab_sa_key" = yandex_iam_service_account_key.gitlab.private_key
  }

  depends_on = [yandex_gitlab_instance.my_gitlab_instance]
}
