# Subnets of the network.
resource "yandex_vpc_subnet" "public-subnet" {
  folder_id      = yandex_resourcemanager_folder.kubernetes-folder.id
  name           = "public-subnet"
  description    = "Cluster public subnet"
  v4_cidr_blocks = [var.ipv4_cidr_blocks_public]
  zone           = var.yandex-cloud-zone
  network_id     = yandex_vpc_network.public-network.id
}
