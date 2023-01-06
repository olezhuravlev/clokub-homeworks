# Common variables.
locals {
  # CPU total 32 max!
  cores = {
    lamp-instance-group = 2
  }

  # RAM total 128Gb max!
  memory = {
    lamp-instance-group = 2
  }

  # HDD total 500Gb max!
  boot_disk_size = {
    lamp-instance-group = 4
  }

  image_id = {
    lamp-instance-group = "fd827b91d99psvq5fjit" # fd8av51mqc8msh1milmt
  }
}
