# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-public1" {
  folder_id      = yandex_resourcemanager_folder.application-folder.id
  name           = "vpc-subnet-public1"
  v4_cidr_blocks = [var.ipv4_cidr_subnet3]
  zone           = var.yandex-cloud-zone1
  network_id     = yandex_vpc_network.vpc-network.id
}

# Subnet of the network.
resource "yandex_vpc_subnet" "vpc-subnet-public2" {
  folder_id      = yandex_resourcemanager_folder.application-folder.id
  name           = "vpc-subnet-public2"
  v4_cidr_blocks = [var.ipv4_cidr_subnet4]
  zone           = var.yandex-cloud-zone2
  network_id     = yandex_vpc_network.vpc-network.id
}
