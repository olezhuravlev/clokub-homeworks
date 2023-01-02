# Cloud ID.
variable "yandex-cloud-id" {
  default = "b1g8mq58h421raomnd64"
}

# Zone.
variable "yandex-cloud-zone" {
  default = "ru-central1-a"
}

# CIDR for public subnet.
variable "ipv4_cidr_blocks_public" {
  default = "192.168.10.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_blocks_private" {
  default = "192.168.20.0/24"
}
