## Create network load balancer for instance group.
#resource "yandex_lb_network_load_balancer" "network-load-balancer" {
#  folder_id = yandex_resourcemanager_folder.application-folder.id
#  name      = "network-load-balancer"
#
#  listener {
#    name = "network-load-balancer-listener"
#    port = 80
#    external_address_spec {
#      ip_version = "ipv4"
#    }
#  }
#
#  attached_target_group {
#    target_group_id = yandex_compute_instance_group.lamp-instance-group.load_balancer[0].target_group_id
#
#    healthcheck {
#      name                = "http-80-healthcheck"
#      interval            = 5
#      timeout             = 2
#      unhealthy_threshold = 2
#      healthy_threshold   = 2
#
#      http_options {
#        port = 80
#        path = "/"
#      }
#    }
#  }
#}
