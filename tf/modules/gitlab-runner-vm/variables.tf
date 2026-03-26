variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "RAM in GB"
  type        = number
  default     = 4
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 30
}

variable "image_id" {
  description = "Image ID for the VM"
  type        = string
  default     = "fd84gg15m6kjdembasoq"
}

variable "ssh_public_key" {
  description = "SSH public key for access"
  type        = string
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
  default     = "ubuntu"
}

variable "labels" {
  description = "Labels for the VM"
  type        = map(string)
  default     = {}
}

variable "platform_id" {
  description = "Platform ID for the VM"
  type        = string
  default     = "standard-v3"
}