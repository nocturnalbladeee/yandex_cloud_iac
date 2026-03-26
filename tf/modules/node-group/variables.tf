variable "cluster_id" {
  
}
variable "name" {
  
}

variable "node_count" {
    default = 1
}

variable "platform_id" {
    default = "standard-v1"
}
variable "subnet_ids" {
  
}
variable "instance_template_boot_disk_type" {
    default = "network-ssd"
}
variable "instance_template_boot_disk_size" {
    default = 40
}
variable "instance_template_resources_core" {
    default = 2
}
variable "instance_template_resources_memory" {
    default = 4
}
variable "nat" {
    default = true
}
variable "node_security_group_ids" {
    type = list(string)
    default = []
}