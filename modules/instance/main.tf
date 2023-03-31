resource "yandex_compute_instance" "this" {
  name               = var.name
  description        = var.description
  folder_id          = var.folder_id
  zone               = var.zone
  hostname           = var.hostname
  platform_id        = var.platform_id
  service_account_id = var.service_account_id

  allow_stopping_for_update = true
  network_acceleration_type = var.network_acceleration_type

  resources {
    cores         = var.cores
    core_fraction = var.core_fraction
    gpus          = var.gpus
    memory        = var.memory
  }

  boot_disk {
    initialize_params {
      size        = var.boot_disk_size
      type        = var.boot_disk_type
      image_id    = var.boot_disk_image_id
      snapshot_id = var.boot_disk_snapshot_id
    }
  }

  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      subnet_id          = network_interface.value.subnet_id
      ipv4               = try(network_interface.value.ipv4, null)
      ip_address         = try(network_interface.value.ip_address, null)
      ipv6               = try(network_interface.value.ipv6, null)
      ipv6_address       = try(network_interface.value.ipv6_address, null)
      nat                = try(network_interface.value.nat, null)
      nat_ip_address     = try(network_interface.value.nat_ip_address, null)
      security_group_ids = try(network_interface.value.security_group_ids, [])

      dynamic "dns_record" {
        for_each = try([network_interface.value.dns_record], [])
        content {
          fqdn        = dns_record.value.fqdn
          dns_zone_id = try(dns_record.value.dns_zone_id, null)
          ttl         = try(dns_record.value.ttl, null)
          ptr         = try(dns_record.value.ptr, null)
        }
      }

      dynamic "ipv6_dns_record" {
        for_each = try([network_interface.value.ipv6_dns_record], [])
        content {
          fqdn        = ipv6_dns_record.value.fqdn
          dns_zone_id = try(ipv6_dns_record.value.dns_zone_id, null)
          ttl         = try(ipv6_dns_record.value.ttl, null)
          ptr         = try(ipv6_dns_record.value.ptr, null)
        }
      }

      dynamic "nat_dns_record" {
        for_each = try([network_interface.value.nat_dns_record], [])
        content {
          fqdn        = nat_dns_record.value.fqdn
          dns_zone_id = try(nat_dns_record.value.dns_zone_id, null)
          ttl         = try(nat_dns_record.value.ttl, null)
          ptr         = try(nat_dns_record.value.ptr, null)
        }
      }
    }
  }

  scheduling_policy {
    preemptible = var.scheduling_policy_preemptible
  }

  dynamic "secondary_disk" {
    for_each = var.secondary_disk_ids == null ? [] : var.secondary_disk_ids
    content {
      disk_id     = secondary_disk.value
      auto_delete = var.secondary_disk_auto_delete
    }
  }

  metadata = merge(
    var.metadata,
    tomap({ user-data = var.user_data })
  )

  labels = var.labels
}
