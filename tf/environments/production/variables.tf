variable "name" {
  description = "The name of the Kubernetes cluster"
  default = "k8s-cluster-prod"
}

variable "zone" {
  description = "The availability zone for the Kubernetes cluster"
}

variable "v4_cidr_blocks" {
  type = list(string)
  description = "The CIDR blocks for the VPC network"
  default = [ "172.16.0.0/16" ]
}

variable "folder_id" {
  description = "The ID of the Yandex.Cloud folder"
}

variable "role" {
  description = "The role assigned to the IAM service account"
  default = "editor"
}

variable "node_count" {
  description = "The number of nodes in the node group"
  default = 2
}

variable "platform_id" {
  description = "The platform ID for the node group"
  default = "standard-v1"
}


variable "labels" {
  description = "Labels to assign to resources"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The environment name"
  default = "production"
}

variable "project_name" {
  description = "The name of the project"
  default = "java-app-prod"
}

variable "gitlab_enabled" {
  description = "Enable GitLab integration"
  default = false
}
variable "tfstate_bucket_name" {
  description = "Tfstate bucket name"
  type = string
}
variable "create_sa_secrets" {
  description = "Whether to store service account keys in Lockbox"
  type        = bool
  default     = true
}
variable "create_k8s_node_sg" {
  description = "Create security group for Kubernetes nodes"
  type        = bool
  default     = true
}