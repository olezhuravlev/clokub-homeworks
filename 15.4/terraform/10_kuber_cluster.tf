#resource "yandex_kubernetes_cluster" "kubernetes-cluster-regional" {
#  name                    = "kubernetes-cluster-regional"
#  network_id              = yandex_vpc_network.vpc-network.id
#  service_account_id      = yandex_iam_service_account.kuber-cluster-service-account.id
#  node_service_account_id = yandex_iam_service_account.kuber-nodes-service-account.id
#  release_channel         = "RAPID"
#  network_policy_provider = "CALICO"
#
#  labels = {
#    app = "neto15_4"
#  }
#
#  master {
#    version   = "1.20"
#    public_ip = true
#
#    regional {
#      region = "ru-central1"
#
#      location {
#        zone      = "${yandex_vpc_subnet.vpc-subnet-private1.zone}"
#        subnet_id = "${yandex_vpc_subnet.vpc-subnet-private1.id}"
#      }
#
#      location {
#        zone      = "${yandex_vpc_subnet.vpc-subnet-private2.zone}"
#        subnet_id = "${yandex_vpc_subnet.vpc-subnet-private2.id}"
#      }
#
#      location {
#        zone      = "${yandex_vpc_subnet.vpc-subnet-private3.zone}"
#        subnet_id = "${yandex_vpc_subnet.vpc-subnet-private3.id}"
#      }
#    }
#
#    maintenance_policy {
#      auto_upgrade = true
#
#      maintenance_window {
#        day        = "monday"
#        start_time = "15:00"
#        duration   = "3h"
#      }
#
#      maintenance_window {
#        day        = "friday"
#        start_time = "10:00"
#        duration   = "4h30m"
#      }
#    }
#
#    security_group_ids = [
#      yandex_vpc_security_group.k8s-main-sg.id,
#      yandex_vpc_security_group.k8s-public-services.id,
#      yandex_vpc_security_group.k8s-nodes-ssh-access.id,
#      yandex_vpc_security_group.k8s-master-whitelist.id
#    ]
#
#    maintenance_policy {
#      auto_upgrade = true
#      # Any time when omitted.
#      #      maintenance_window {
#      #        start_time = "15:00"
#      #        duration   = "3h"
#      #      }
#    }
#  }
#
#  kms_provider {
#    key_id = yandex_kms_symmetric_key.key-a.id
#  }
#}