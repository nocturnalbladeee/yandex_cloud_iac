resource "yandex_compute_instance" "runner" {
  name        = var.vm_name
  description = "GitLab Runner VM"
  zone        = var.zone
  folder_id   = var.folder_id
  platform_id = var.platform_id
  
  resources {
    cores  = var.cores
    memory = var.memory
  }
  
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk_size
      type     = "network-ssd"
    }
  }
  
  network_interface {
    subnet_id = var.subnet_id
    nat       = true  
  }
  
  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }
  
  labels = merge(var.labels, {
    environment = "production"
    service     = "gitlab-runner"
    managed_by  = "terraform"
  })
}