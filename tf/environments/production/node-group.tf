module "node_group" {
  source                  = "../../modules/node-group"
  cluster_id              = module.k8s_cluster.cluster_id
  name                    = "k8s-node-group-prod"
  node_security_group_ids = module.network.k8s_nodes_security_group_id
  node_count              = var.node_count
  platform_id             = "standard-v3"
  subnet_ids              = module.network.yandex_vpc_subnet.id
}
