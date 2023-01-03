# Create Application Load Balancer.
resource "yandex_alb_load_balancer" "alb-load-balancer" {
  folder_id  = yandex_resourcemanager_folder.application-folder.id
  name       = "alb-load-balancer"
  network_id = yandex_vpc_network.vpc-network.id

  allocation_policy {
    location {
      zone_id   = var.yandex-cloud-zone
      subnet_id = yandex_vpc_subnet.vpc-subnet2.id
    }
  }

  listener {
    name = "alb-load-balancer-listener-80"

    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }

    http {
      handler {
        http_router_id = yandex_alb_http_router.alb-http-router-80.id
      }
    }
  }

  listener {
    name = "alb-load-balancer-listener-8080"

    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [8080]
    }

    http {
      handler {
        http_router_id = yandex_alb_http_router.alb-http-router-8080.id
      }
    }
  }

  log_options {
    discard_rule {
      http_code_intervals = ["HTTP_2XX"]
      discard_percent     = 75
    }
  }
}
