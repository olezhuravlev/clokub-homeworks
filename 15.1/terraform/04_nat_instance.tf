# VM "NAT instance".
module "nat-instance" {
  source         = "./modules/instance"
  folder_id      = yandex_resourcemanager_folder.kubernetes-folder.id
  subnet_id      = yandex_vpc_subnet.public-subnet.id
  #sec_group_id   = yandex_vpc_security_group.nodes-ssh-access.id
  cores          = local.cores["${each.key}"]
  memory         = local.memory["${each.key}"]
  boot_disk_size = local.boot_disk_size["${each.key}"]
  boot_disk_type = "network-hdd"

  image_family = local.image_family["${each.key}"]
  users        = local.users["${each.key}"]

  for_each      = toset(["nat-instance"])
  instance_name = "${each.key}"
  nat           = true
  ipv4_internal = local.ipv4_internals["${each.key}"]
}
