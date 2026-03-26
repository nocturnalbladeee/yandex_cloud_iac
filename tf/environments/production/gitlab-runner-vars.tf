variable "runner_vm_cores" {
  description = "CPU cores for runner VM"
  type        = number
  default     = 2
}

variable "runner_vm_memory" {
  description = "RAM in GB for runner VM"
  type        = number
  default     = 4
}

variable "runner_vm_disk_size" {
  description = "Disk size in GB for runner VM"
  type        = number
  default     = 40
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
}