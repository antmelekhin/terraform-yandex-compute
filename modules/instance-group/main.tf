################################################################
# Service account
################################################################

locals {
  service_account_name = var.service_account_id == null ? var.service_account_name : null
}

resource "yandex_iam_service_account" "service_account" {
  count = local.service_account_name == null ? 0 : 1

  name      = var.service_account_name
  folder_id = var.folder_id
}

locals {
  service_account_id = try(yandex_iam_service_account.service_account[0].id, var.service_account_id)
}

resource "yandex_resourcemanager_folder_iam_member" "service_account" {
  count = local.service_account_name == null ? 0 : 1

  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${local.service_account_id}"
}

################################################################
# Instance group
################################################################

locals {
  image_id    = var.boot_disk_source_type == "image" ? var.boot_disk_source_id : null
  snapshot_id = var.boot_disk_source_type == "snapshot" ? var.boot_disk_source_id : null
}

resource "yandex_compute_instance_group" "this" {
  name                = var.name
  description         = var.description
  folder_id           = var.folder_id
  service_account_id  = local.service_account_id
  variables           = var.variables
  deletion_protection = var.deletion_protection

  allocation_policy {
    zones = var.zones
  }

  instance_template {
    name               = var.instance_name
    description        = var.instance_description
    hostname           = var.instance_hostname
    platform_id        = var.instance_platform_id
    service_account_id = var.instance_service_account_id

    resources {
      cores         = var.cores
      core_fraction = var.core_fraction
      gpus          = var.gpus
      memory        = var.memory
    }

    boot_disk {
      device_name = var.boot_disk_device_name
      mode        = var.boot_disk_mode
      initialize_params {
        description = var.boot_disk_description
        size        = var.boot_disk_size
        type        = var.boot_disk_type
        image_id    = local.image_id
        snapshot_id = local.snapshot_id
      }
    }

    dynamic "network_interface" {
      for_each = var.network_interfaces
      content {
        network_id         = network_interface.value.network_id
        subnet_ids         = network_interface.value.subnet_ids
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
      for_each = try(var.secondary_disks, [])
      content {
        disk_id     = try(secondary_disk.value.disk_id, null)
        mode        = try(secondary_disk.value.mode, null)
        device_name = try(secondary_disk.value.device_name, null)
        initialize_params {
          description = try(secondary_disk.value.description, null)
          size        = try(secondary_disk.value.size, null)
          type        = try(secondary_disk.value.type, null)
          image_id    = try(secondary_disk.value.image_id, null)
          snapshot_id = try(secondary_disk.value.snapshot_id, null)
        }
      }
    }

    network_settings {
      type = var.network_acceleration_type
    }

    metadata = merge(
      var.metadata,
      tomap({ user-data = var.user_data })
    )

    labels = merge(var.labels, var.instance_labels)
  }

  dynamic "scale_policy" {
    for_each = [var.scale_policy]
    content {

      dynamic "fixed_scale" {
        for_each = try([scale_policy.value.fixed_scale], can(scale_policy.value.auto_scale) ? [] : [{ size = 1 }])
        content {
          size = fixed_scale.value.size
        }
      }

      dynamic "auto_scale" {
        for_each = try([scale_policy.value.auto_scale], [])
        content {
          initial_size           = auto_scale.value.initial_size
          measurement_duration   = auto_scale.value.measurement_duration
          cpu_utilization_target = auto_scale.value.cpu_utilization_target
          min_zone_size          = try(auto_scale.value.min_zone_size, null)
          max_size               = try(auto_scale.value.max_size, null)
          warmup_duration        = try(auto_scale.value.warmup_duration, null)
          stabilization_duration = try(auto_scale.value.stabilization_duration, null)

          dynamic "custom_rule" {
            for_each = try(var.auto_scale_custom_rules, [])
            content {
              rule_type   = custom_rule.value.rule_type
              metric_type = custom_rule.value.metric_type
              metric_name = custom_rule.value.metric_name
              target      = custom_rule.value.target
              service     = try(custom_rule.value.service, null)
              folder_id   = try(custom_rule.value.folder_id, null)
              labels      = try(custom_rule.value.labels, null)
            }
          }
        }
      }

      dynamic "test_auto_scale" {
        for_each = try([scale_policy.value.test_auto_scale], [])
        content {
          initial_size           = test_auto_scale.value.initial_size
          measurement_duration   = test_auto_scale.value.measurement_duration
          cpu_utilization_target = test_auto_scale.value.cpu_utilization_target
          min_zone_size          = try(test_auto_scale.value.min_zone_size, null)
          max_size               = try(test_auto_scale.value.max_size, null)
          warmup_duration        = try(test_auto_scale.value.warmup_duration, null)
          stabilization_duration = try(test_auto_scale.value.stabilization_duration, null)

          dynamic "custom_rule" {
            for_each = try(var.auto_scale_custom_rules, [])
            content {
              rule_type   = custom_rule.value.rule_type
              metric_type = custom_rule.value.metric_type
              metric_name = custom_rule.value.metric_name
              target      = custom_rule.value.target
              service     = try(custom_rule.value.service, null)
              folder_id   = try(custom_rule.value.folder_id, null)
              labels      = try(custom_rule.value.labels, null)
            }
          }
        }
      }
    }
  }

  dynamic "deploy_policy" {
    for_each = [var.deploy_policy]
    content {
      max_unavailable  = try(deploy_policy.value.max_unavailable, 1)
      max_expansion    = try(deploy_policy.value.max_expansion, 0)
      max_creating     = try(deploy_policy.value.max_creating, null)
      max_deleting     = try(deploy_policy.value.max_deleting, null)
      startup_duration = try(deploy_policy.value.startup_duration, null)
      strategy         = try(deploy_policy.value.strategy, null)
    }
  }

  dynamic "health_check" {
    for_each = var.health_check == null ? [] : [var.health_check]
    content {
      interval            = try(health_check.value.interval, null)
      timeout             = try(health_check.value.timeout, null)
      healthy_threshold   = try(health_check.value.healthy_threshold, null)
      unhealthy_threshold = try(health_check.value.unhealthy_threshold, null)

      dynamic "http_options" {
        for_each = try(health_check.value.http_options, [])
        content {
          port = http_options.value.port
          path = http_options.value.path
        }
      }

      dynamic "tcp_options" {
        for_each = try(health_check.value.tcp_options, [])
        content {
          port = tcp_options.value.port
        }
      }
    }
  }

  max_checking_health_duration = var.max_checking_health_duration

  dynamic "load_balancer" {
    for_each = var.load_balancer == null ? [] : [var.load_balancer]
    content {
      target_group_name            = try(load_balancer.value.target_group_name, null)
      target_group_description     = try(load_balancer.value.target_group_description, null)
      max_opening_traffic_duration = try(load_balancer.value.max_opening_traffic_duration, null)
      target_group_labels          = try(load_balancer.value.target_group_labels, {})
    }
  }

  dynamic "application_load_balancer" {
    for_each = var.application_load_balancer == null ? [] : [var.application_load_balancer]
    content {
      target_group_name            = try(application_load_balancer.value.target_group_name, null)
      target_group_description     = try(application_load_balancer.value.target_group_description, null)
      max_opening_traffic_duration = try(application_load_balancer.value.max_opening_traffic_duration, null)
      target_group_labels          = try(application_load_balancer.value.target_group_labels, {})
    }
  }

  labels = var.labels

  depends_on = [yandex_resourcemanager_folder_iam_member.service_account]
}
