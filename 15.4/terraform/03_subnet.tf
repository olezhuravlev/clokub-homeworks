# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet1" {
  folder_id      = yandex_resourcemanager_folder.application-folder.id
  name           = "vpc-subnet1"
  v4_cidr_blocks = [var.ipv4_cidr_subnet1]
  zone           = var.yandex-cloud-zone1
  network_id     = yandex_vpc_network.vpc-network.id
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet2" {
  folder_id      = yandex_resourcemanager_folder.application-folder.id
  name           = "vpc-subnet2"
  v4_cidr_blocks = [var.ipv4_cidr_subnet2]
  zone           = var.yandex-cloud-zone2
  network_id     = yandex_vpc_network.vpc-network.id
}
