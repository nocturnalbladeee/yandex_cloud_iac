resource "yandex_gitlab_instance" "my_gitlab_instance" {
  count                     = var.gitlab_enabled ? 1 : 0
  name                      = "${var.project_name}-gitlab"
  description               = "Managed GitLab for ${var.project_name}"
  resource_preset_id        = var.gitlab_resource_preset
  disk_size                 = var.gitlab_disk_size
  admin_login               = var.gitlab_admin_username
  admin_email               = var.gitlab_admin_email
  domain                    = "gitlab-${var.project_name}.gitlab.yandexcloud.net"
  subnet_id                 = module.network.yandex_vpc_subnet.id
  backup_retain_period_days = var.gitlab_backup_retain_days
  approval_rules_id         = "NONE"
}

