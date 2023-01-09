resource "yandex_kubernetes_cluster" "kubernetes-cluster" {
  name = "kubernetes-cluster"

  master {
    version = "1.20"
    zonal {
      zone      = "ru-central1-a"
      subnet_id = <идентификатор_облачной_подсети>
    }

    security_group_ids = [
      yandex_vpc_security_group.k8s-main-sg.id,
      yandex_vpc_security_group.k8s-master-whitelist.id
    ]
    ...
  }

  maintenance_policy {
    auto_upgrade = true
    maintenance_window {
      start_time = "23:59"
      duration   = "120"
    }
  }
}