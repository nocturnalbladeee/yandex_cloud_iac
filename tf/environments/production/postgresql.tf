module "postgresql" {
  source = "github.com/terraform-yacloud-modules/terraform-yandex-mdb-postgresql"

  name        = "java-app-prod-db"
  environment = "PRODUCTION"
  network_id  = module.network.yandex_vpc_network.id
  description = "PostgreSQL cluster for applications"

  resource_preset_id = "s2.micro"
  disk_size          = 20
  disk_type_id       = "network-ssd"
  postgresql_version = "17"

  hosts = [
    {
      zone             = var.zone
      subnet_id        = module.network.yandex_vpc_subnet.id
      assign_public_ip = false
    }
  ]

  databases = [
    {
      name       = "keycloak"
      owner      = "keycloak"
      extensions = ["uuid-ossp", "pgcrypto"]
    },
    {
      name       = "java-db"
      owner      = "java-user"
      extensions = ["uuid-ossp", "pg_trgm"]
    }
  ]

  owners = [
    {
      name = "keycloak"
    },
    {
      name = "java-user"
    }
  ]

  users = []

  access = {
    web_sql = true
  }

  backup_window_start = {
    hours   = 3
    minutes = 0
  }
  backup_retain_period_days = 7

  depends_on = [module.network]
}

