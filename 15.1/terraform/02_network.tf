# Network.
resource "yandex_vpc_network" "public-network" {
  folder_id   = yandex_resourcemanager_folder.kubernetes-folder.id
  name        = "public-network"
  description = "Public cluster network"
}
