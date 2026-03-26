output "yandex_vpc_network" {
  value = yandex_vpc_network.this
}

output "yandex_vpc_subnet" {
  value = yandex_vpc_subnet.this
}

output "default_security_group_id" {
  description = "ID of the default security group"
  value       = try(yandex_vpc_default_security_group.this[0].id, null)
}

output "gitlab_security_group_id" {
  description = "ID of the GitLab security group"
  value       = try(yandex_vpc_security_group.gitlab[0].id, null)
}

output "kubernetes_security_group_id" {
  description = "ID of the Kubernetes security group"
  value       = try(yandex_vpc_security_group.kubernetes[0].id, null)
}
output "k8s_nodes_security_group_id" {
  description = "ID of the Kubernetes security group"
  value       = yandex_vpc_security_group.k8s_nodes[*].id
}