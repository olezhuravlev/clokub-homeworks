# Parameters.
locals {
  # CPU total 32 max!
  cores = {
    nat-instance        = 2
    public-ip-instance  = 2
    private-ip-instance = 2
  }

  # RAM total 128Gb max!
  memory = {
    nat-instance        = 2
    public-ip-instance  = 2
    private-ip-instance = 2
  }

  # HDD total 500Gb max!
  boot_disk_size = {
    nat-instance        = 51
    public-ip-instance  = 51
    private-ip-instance = 51
  }

  ipv4_internals = {
    nat-instance        = "192.168.10.254"
    public-ip-instance  = ""
    private-ip-instance = ""
  }

  image_family = {
    nat-instance        = "nat-instance-ubuntu" # image_id: fd8o8aph4t4pdisf1fio
    public-ip-instance  = "ubuntu-2004-lts"
    private-ip-instance = "ubuntu-2004-lts"
  }

  users = {
    nat-instance        = "ubuntu"
    public-ip-instance  = "ubuntu"
    private-ip-instance = "ubuntu"
  }
}
