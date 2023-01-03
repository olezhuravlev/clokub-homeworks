# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet" {
  folder_id      = yandex_resourcemanager_folder.application-folder.id
  name           = "vpc-subnet"
  v4_cidr_blocks = [var.ipv4_cidr_subnet]
  zone           = var.yandex-cloud-zone
  network_id     = yandex_vpc_network.vpc-network.id
}
