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
  for_each = {
    "a" = "10.10.0.0/16"
    "b" = "10.11.0.0/16"
    "c" = "10.12.0.0/16"
  }

  name           = "compute-cloud-${each.key}"
  zone           = "ru-central1-${each.key}"
  network_id     = yandex_vpc_network.compute_cloud.id
  v4_cidr_blocks = [each.value]
}

locals {
  subnet_ids = [for subnet in yandex_vpc_subnet.compute_cloud : subnet.id]
  zones      = [for subnet in yandex_vpc_subnet.compute_cloud : subnet.zone]
}

data "yandex_compute_image" "ubuntu_2004" {
  family = "ubuntu-2004-lts"
}

################################################################
# Compute Instances with secodary disk
################################################################

resource "yandex_compute_disk" "secondary_disk" {
  count = 2

  size = 20
  type = "network-hdd"
  zone = element(local.zones, count.index)
}

module "instances_secondary_disk" {
  source = "../../../modules/instance"

  count = 2

  zone = element(local.zones, count.index)
  network_interfaces = [
    {
      subnet_id = element(local.subnet_ids, count.index)
    }
  ]

  boot_disk_image_id = data.yandex_compute_image.ubuntu_2004.id
  secondary_disk_ids = [element(yandex_compute_disk.secondary_disk[*].id, count.index)]
}

################################################################
# Compute Instances with multiple secodary disks
################################################################

resource "yandex_compute_disk" "data_one" {
  count = 2

  size = 10
  type = "network-hdd"
  zone = element(local.zones, count.index)
}

resource "yandex_compute_disk" "data_two" {
  count = 2

  size = 20
  type = "network-hdd"
  zone = element(local.zones, count.index)
}

module "instances_multiple_secondary_disks" {
  source = "../../../modules/instance"

  count = 2

  zone = element(local.zones, count.index)
  network_interfaces = [
    {
      subnet_id = element(local.subnet_ids, count.index)
    }
  ]

  boot_disk_image_id = data.yandex_compute_image.ubuntu_2004.id
  secondary_disk_ids = [
    element(yandex_compute_disk.data_one[*].id, count.index),
    element(yandex_compute_disk.data_two[*].id, count.index),
  ]
}
