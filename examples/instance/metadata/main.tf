provider "yandex" {
  zone = "ru-central1-a"
}

################################################################
# Common resources
################################################################

resource "yandex_vpc_network" "compute_cloud" {
  name = "compute-cloud"
}

resource "yandex_vpc_subnet" "compute_cloud" {
  name = "compute-cloud"

  network_id     = yandex_vpc_network.compute_cloud.id
  v4_cidr_blocks = ["10.0.0.0/16"]
}

data "yandex_compute_image" "ubuntu_2004" {
  family = "ubuntu-2004-lts"
}

################################################################
# Compute Instance with metadata and user_data
################################################################

module "metadata" {
  source = "../../../modules/instance"

  boot_disk_source_id = data.yandex_compute_image.ubuntu_2004.id
  network_interfaces = [
    {
      subnet_id = yandex_vpc_subnet.compute_cloud.id
      nat       = true
    }
  ]

  metadata = {
    foo                = "bar"
    serial-port-enable = 1
  }
  user_data = templatefile(
    "${path.module}/userdata/linux.yml.tpl",
    {
      username = "admin",
      ssh-key  = file("~/.ssh/id_rsa.pub")
    }
  )
}
