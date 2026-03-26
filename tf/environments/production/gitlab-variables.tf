variable "gitlab_admin_email" {
  description = "Admin email for GitLab"
  type        = string
}

variable "gitlab_admin_username" {
  description = "Admin username for GitLab"
  type        = string
}


variable "gitlab_resource_preset" {
  description = "Resource preset for GitLab instance"
  type        = string
  default     = "s2.small"  
}

variable "gitlab_disk_size" {
  description = "Disk size in GB for GitLab"
  type        = number
  default     = 50
}

variable "gitlab_backup_retain_days" {
  description = "Days to retain backups"
  type        = number
  default     = 7
}