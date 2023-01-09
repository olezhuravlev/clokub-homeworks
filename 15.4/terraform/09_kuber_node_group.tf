resource "yandex_kubernetes_node_group" "<имя группы узлов>" {
  cluster_id = yandex_kubernetes_cluster.k8s-cluster.id
  name       = "worker-nodes-с"
  version    = "1.20"


  instance_template {
    platform_id = "standard-v3"
    network_interface {
      nat                = true
      subnet_ids         = [<идентификатор_облачной_подсети>]
    security_group_ids = [
      yandex_vpc_security_group.k8s-main-sg.id,
      yandex_vpc_security_group.k8s-nodes-ssh-access.id,
      yandex_vpc_security_group.k8s-public-services.id
    ]
    ...
  }
  ...
}
scale_policy {
auto_scale {
min     = <минимальное количество узлов в группе>
max     = <максимальное количество узлов в группе>
initial = <начальное количество узлов в группе>
}
}

}