resource "yandex_kubernetes_node_group" "this" {
  cluster_id = var.cluster_id
  name       = var.name

  instance_template {
    platform_id = var.platform_id
    network_interface {
      nat       = var.nat
      subnet_ids = [var.subnet_ids]
      security_group_ids = var.node_security_group_ids
    }
    boot_disk {
      type = var.instance_template_boot_disk_type
      size = var.instance_template_boot_disk_size
    }
    resources {
      cores  = var.instance_template_resources_core
      memory = var.instance_template_resources_memory
    }
  }

  scale_policy {
    fixed_scale {
      size = var.node_count
    }
  }
}
