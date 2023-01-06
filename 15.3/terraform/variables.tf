# Cloud ID.
variable "yandex-cloud-id" {
  default = "b1g8mq58h421raomnd64"
}

# Zone.
variable "yandex-cloud-zone" {
  default = "ru-central1-a"
}

# CIDR for public subnet.
variable "ipv4_cidr_subnet" {
  default = "192.168.10.0/24"
}

# CIDR for private subnet.
variable "ipv4_cidr_subnet2" {
  default = "192.168.20.0/24"
}

variable "bucket_id" {
  default = "bucket-zhuravlev-oe-20230103"
}

variable "bucket_https_id" {
  default = "testrefcom"
}

variable "picture_key" {
  default = "spruce.png"
}

variable "picture_source" {
  default = "../images/spruce.png"
}

variable "index_html_key" {
  default = "index.html"
}

variable "index_html_source" {
  default = "../index.html"
}

variable "picture_link" {
  default = "'http://storage.yandexcloud.net/bucket-zhuravlev-oe-20230103/spruce.png'"
}

