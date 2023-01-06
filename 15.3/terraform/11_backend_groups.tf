## Create Backend Group.
#resource "yandex_alb_backend_group" "alb-backend-group-80" {
#  folder_id = yandex_resourcemanager_folder.application-folder.id
#  name      = "alb-backend-group-80"
#  session_affinity {
#    connection {
#      source_ip = true
#    }
#  }
#
#  http_backend {
#    name             = "alb-http-backend-group-80"
#    weight           = 1
#    port             = 80
#    target_group_ids = [
#      yandex_compute_instance_group.lamp-instance-group.application_load_balancer[0].target_group_id,
#    ]
#    http2 = "false" # Preference "Protocol settings"
#
#    load_balancing_config {
#      panic_threshold = 0
#    }
#
#    healthcheck {
#      timeout             = "5s"
#      interval            = "5s"
#      healthy_threshold   = 1
#      unhealthy_threshold = 3
#      healthcheck_port    = 80
#
#      http_healthcheck {
#        host  = "blablabla" # Healthcheck for ALB doesn't work without a string in "HOST" header.
#        path  = "/"
#        http2 = "false" # Preference "HTTP healthcheck"
#      }
#    }
#  }
#}
#
## Create Backend Group.
#resource "yandex_alb_backend_group" "alb-backend-group-8080" {
#  folder_id = yandex_resourcemanager_folder.application-folder.id
#  name      = "alb-backend-group-8080"
#  session_affinity {
#    connection {
#      source_ip = true
#    }
#  }
#
#  http_backend {
#    name             = "alb-http-backend-group-8080"
#    weight           = 1
#    port             = 80
#    target_group_ids = [
#      yandex_compute_instance_group.lamp-instance-group-2.application_load_balancer[0].target_group_id
#    ]
#    http2 = "false" # Preference "Protocol settings"
#
#    load_balancing_config {
#      panic_threshold = 0
#    }
#
#    healthcheck {
#      timeout             = "5s"
#      interval            = "5s"
#      healthy_threshold   = 1
#      unhealthy_threshold = 3
#      healthcheck_port    = 80
#
#      http_healthcheck {
#        host  = "blablabla" # Healthcheck for ALB doesn't work without a string in "HOST" header.
#        path  = "/"
#        http2 = "false" # Preference "HTTP healthcheck"
#      }
#    }
#  }
#}
