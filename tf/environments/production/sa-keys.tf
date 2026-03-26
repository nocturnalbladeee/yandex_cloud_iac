resource "yandex_iam_service_account_key" "gitlab" {
  service_account_id = module.iam.service_accounts["gitlab"].id
  description        = "Authorized key for GitLab CI/CD"
  format             = "PEM_FILE"
}

resource "yandex_iam_service_account_key" "eso" {
  service_account_id = module.iam.service_accounts["eso"].id
  description        = "Authorized key for External Secrets Operator"
  format             = "PEM_FILE"
}

resource "yandex_iam_service_account_key" "cert_manager" {
  service_account_id = module.iam.service_accounts["cert_manager"].id
  description        = "Authorized key for cert-manager DNS challenges"
  format             = "PEM_FILE"
}
