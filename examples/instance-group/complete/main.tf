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
# Use variables in a fixed-size instance group
################################################################

module "variables_ig" {
  source = "../../../modules/instance-group"

  name                 = "variables-ig"
  folder_id            = data.yandex_client_config.client.folder_id
  service_account_name = "variables-ig-sa"
  zones                = local.zones
  variables = {
    short_zone_var_ru-central1-a = "rc1a"
    short_zone_var_ru-central1-b = "rc1b"
    short_zone_var_ru-central1-c = "rc1c"
  }

  instance_name      = "production-{short_zone_var_{instance.zone_id}}-{instance.index}"
  instance_hostname  = "production-{instance.index}"
  boot_disk_image_id = data.yandex_compute_image.ubuntu_2004.id
  network_interfaces = [
    {
      network_id = yandex_vpc_network.compute_cloud.id
      subnet_ids = local.subnet_ids
    }
  ]

  scale_policy = {
    fixed_scale = {
      size = 3
    }
  }
}

################################################################
# Autoscaled instance group with custom rule
################################################################

module "autoscaled_ig" {
  source = "../../../modules/instance-group"

  name                 = "autoscaled-ig"
  folder_id            = data.yandex_client_config.client.folder_id
  service_account_name = "autoscaled-ig-sa"
  zones                = local.zones

  boot_disk_image_id = data.yandex_compute_image.ubuntu_2004.id
  network_interfaces = [
    {
      network_id = yandex_vpc_network.compute_cloud.id
      subnet_ids = local.subnet_ids
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
  auto_scale_custom_rules = [
    {
      rule_type   = "WORKLOAD"
      metric_type = "GAUGE"
      metric_name = "queue.messages.stored_count"
      target      = 5
      service     = "message-queue"
      labels = {
        queue = "queue-autoscale-queue"
      }
    }
  ]
}
