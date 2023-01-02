# Subnets of the network.
resource "yandex_vpc_subnet" "private-subnet" {
  folder_id      = yandex_resourcemanager_folder.kubernetes-folder.id
  name           = "private-subnet"
  description    = "Cluster private subnet"
  v4_cidr_blocks = [var.ipv4_cidr_blocks_private]
  zone           = var.yandex-cloud-zone
  network_id     = yandex_vpc_network.public-network.id
  route_table_id = yandex_vpc_route_table.route-table.id
}
