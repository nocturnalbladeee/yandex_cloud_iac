resource "yandex_container_registry" "app_registry" {
  name = "java-app-prod-registry"
  
  labels = {
    environment = "production"
    project     = "java-app-prod"
  }
}