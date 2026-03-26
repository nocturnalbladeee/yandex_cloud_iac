variable "name" {

}

variable "zone" {

}


variable "network_id" {

}

variable "service_account_id" {

}

variable "node_service_account_id" {

}

variable "subnet_id" {

}
variable "security_group_ids" {
  description = "Security group IDs for the cluster"
  type        = list(string)
  default     = []
}
