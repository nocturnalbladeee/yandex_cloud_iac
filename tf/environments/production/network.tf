module "network" {
  source = "../../modules/network"
  name = "prod-subnet"
  zone = var.zone
  v4_cidr_blocks = ["172.16.0.0/16"]

  create_default_sg = true
  create_gitlab_sg  = var.gitlab_enabled  
  create_k8s_sg     = true            
  
  labels = {
    environment = var.environment
    project     = var.project_name
    managed_by  = "terraform"
  }
}