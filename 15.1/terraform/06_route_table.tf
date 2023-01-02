# Route table.
resource "yandex_vpc_route_table" "route-table" {
  name       = "route-table"
  folder_id  = yandex_resourcemanager_folder.kubernetes-folder.id
  network_id = yandex_vpc_network.public-network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = local.ipv4_internals.nat-instance
  }
}
