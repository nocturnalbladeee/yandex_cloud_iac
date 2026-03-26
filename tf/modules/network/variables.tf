variable "name" {

}

variable "zone" {

}

variable "v4_cidr_blocks" {
  type = list(string)
}

variable "labels" {
  description = "Labels to assign to resources"
  type        = map(string)
  default     = {}
}

variable "create_default_sg" {
  description = "Create default security group"
  type        = bool
  default     = true
}

variable "create_gitlab_sg" {
  description = "Create security group for GitLab"
  type        = bool
  default     = false
}

variable "create_k8s_sg" {
  description = "Create security group for Kubernetes"
  type        = bool
  default     = false
}

variable "create_k8s_node_sg" {
  description = "Create security group for Kubernetes nodes"
  type        = bool
  default     = true
}