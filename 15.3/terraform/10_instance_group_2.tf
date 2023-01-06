## Create Instance Group.
#resource "yandex_compute_instance_group" "lamp-instance-group-2" {
#  folder_id           = yandex_resourcemanager_folder.application-folder.id
#  name                = "lamp-instance-group-2"
#  service_account_id  = "${yandex_iam_service_account.instance-group-service-account.id}"
#  deletion_protection = false
#
#  health_check {
#    healthy_threshold   = 2
#    interval            = 6
#    timeout             = 3
#    unhealthy_threshold = 2
#
#    http_options {
#      path = "/"
#      port = 80
#    }
#  }
#
#  instance_template {
#    platform_id = "standard-v1"
#
#    resources {
#      cores  = local.cores["lamp-instance-group"]
#      memory = local.memory["lamp-instance-group"]
#    }
#
#    boot_disk {
#      mode = "READ_WRITE"
#      initialize_params {
#        image_id = local.image_id["lamp-instance-group"]
#        size     = local.boot_disk_size["lamp-instance-group"]
#      }
#    }
#
#    network_interface {
#      network_id = yandex_vpc_network.vpc-network.id
#      subnet_ids = [yandex_vpc_subnet.vpc-subnet2.id]
#      nat        = true
#    }
#
#    metadata = {
#      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
#      user-data : "#!/bin/bash\n currtime=$(date +'%T.%3N'); echo '<html><h1>Merry Christmas 2023!</h1><img src=${var.picture_link} height='100'/><h2>'$currtime'</h2></html>' > /var/www/html/index.html\n"
#    }
#
#    network_settings {
#      type = "STANDARD"
#    }
#  }
#
#  scale_policy {
#    fixed_scale {
#      size = 3
#    }
#  }
#
#  allocation_policy {
#    zones = [var.yandex-cloud-zone]
#  }
#
#  deploy_policy {
#    max_unavailable = 3
#    max_creating    = 3
#    max_expansion   = 1
#    max_deleting    = 3
#  }
#
#  application_load_balancer {
#    target_group_name        = "lamp-instance-target-group-2"
#    target_group_description = "Application Load Balancer of LAMP instance group #2"
#  }
#}
