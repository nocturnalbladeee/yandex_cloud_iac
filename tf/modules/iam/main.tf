resource "yandex_iam_service_account" "this" {
  for_each    = var.service_accounts
  name        = each.value.name
  description = each.value.description
  folder_id   = var.folder_id
}

resource "yandex_resourcemanager_folder_iam_member" "this" {
  for_each = {
    for pair in flatten([
      for sa_key, sa_val in var.service_accounts : [
        for r in sa_val.roles : {
          sa_key = sa_key
          role   = r
        }
      ]
    ]) : "${pair.sa_key}-${pair.role}" => pair
  }

  folder_id = var.folder_id
  role      = each.value.role
  member    = "serviceAccount:${yandex_iam_service_account.this[each.value.sa_key].id}"
}