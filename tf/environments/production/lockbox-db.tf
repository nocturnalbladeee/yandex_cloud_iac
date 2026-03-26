module "db_secrets" {
  source = "github.com/terraform-yacloud-modules/terraform-yandex-lockbox"

  name        = "java-app-db-passwords"
  description = "Database passwords for Keycloak and Java App"
  folder_id   = var.folder_id

  entries = {
    for user in module.postgresql.owners_data : 
    "${user.user}_db_password" => user.password 
  }
  depends_on = [module.postgresql]
}




