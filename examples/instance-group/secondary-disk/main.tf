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

data "yandex_client_config" "client" {}

################################################################
# Autoscaled instance group with secodary disk
################################################################

module "variables_ig" {
  source = "../../../modules/instance-group"

  name                 = "sd-ig"
  folder_id            = data.yandex_client_config.client.folder_id
  service_account_name = "sd-ig-sa"
  zones                = local.zones

  boot_disk_source_id = data.yandex_compute_image.ubuntu_2004.id

  network_interfaces = [
    {
      network_id = yandex_vpc_network.compute_cloud.id
      subnet_ids = local.subnet_ids
    }
  ]

  secondary_disks = [
    {
      description = "Additional persistent disk"
    }
  ]

  scale_policy = {
    auto_scale = {
      initial_size           = 3
      measurement_duration   = 60
      cpu_utilization_target = 75
      min_zone_size          = 1
      max_size               = 15
      warmup_duration        = 60
      stabilization_duration = 120
    }
  }
}
