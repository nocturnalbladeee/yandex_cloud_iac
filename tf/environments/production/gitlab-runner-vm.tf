module "gitlab_runner_vm" {
  source = "../../modules/gitlab-runner-vm"

  vm_name        = "${var.project_name}-runner"
  folder_id      = var.folder_id
  subnet_id      = module.network.yandex_vpc_subnet.id
  zone           = var.zone
  cores          = var.runner_vm_cores
  memory         = var.runner_vm_memory
  disk_size      = var.runner_vm_disk_size
  image_id       = "fd84gg15m6kjdembasoq"
  ssh_public_key = file(var.ssh_public_key_path)
  ssh_user       = "ubuntu"
  platform_id    = "standard-v3"

  labels = {
    environment = var.environment
    project     = var.project_name
  }
}
