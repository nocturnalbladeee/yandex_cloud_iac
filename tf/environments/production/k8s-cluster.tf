module "k8s_cluster" {
  source = "../../modules/k8s-cluster"
  name = "k8s-cluster-prod"
  zone = module.network.yandex_vpc_subnet.zone
  network_id = module.network.yandex_vpc_network.id
  service_account_id = module.iam.service_accounts["k8s"].id
  node_service_account_id = module.iam.service_accounts["k8s"].id
  subnet_id = module.network.yandex_vpc_subnet.id
  security_group_ids = [module.network.kubernetes_security_group_id]
}