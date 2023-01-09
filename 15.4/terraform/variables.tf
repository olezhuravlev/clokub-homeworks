# Cloud ID.
variable "yandex-cloud-id" {
  default = "b1g8mq58h421raomnd64"
}

# Zone 1.
variable "yandex-cloud-zone1" {
  default = "ru-central1-a"
}

# Zone 2.
variable "yandex-cloud-zone2" {
  default = "ru-central1-b"
}

# CIDR for private subnet.
variable "ipv4_cidr_subnet1" {
  default = "192.168.10.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_subnet2" {
  default = "192.168.20.0/24"
}

# CIDR for public subnet.
variable "ipv4_cidr_subnet3" {
  default = "192.168.30.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_subnet4" {
  default = "192.168.40.0/24"
}

