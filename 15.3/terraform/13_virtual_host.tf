## Create virtual host.
#resource "yandex_alb_virtual_host" "alb-virtual-host-80" {
#  name           = "alb-virtual-host-80"
#  http_router_id = yandex_alb_http_router.alb-http-router-80.id
#
#  route {
#    name = "alb-virtual-host-route-80"
#    http_route {
#      http_route_action {
#        backend_group_id = yandex_alb_backend_group.alb-backend-group-80.id
#        timeout          = "3s"
#      }
#    }
#  }
#}
#
## Create virtual host.
#resource "yandex_alb_virtual_host" "alb-virtual-host-8080" {
#  name           = "alb-virtual-host-8080"
#  http_router_id = yandex_alb_http_router.alb-http-router-8080.id
#
#  route {
#    name = "alb-virtual-host-route-8080"
#    http_route {
#      http_route_action {
#        backend_group_id = yandex_alb_backend_group.alb-backend-group-8080.id
#        timeout          = "3s"
#      }
#    }
#  }
#}
