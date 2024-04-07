output "fqdn" {
  description = "The fully qualified DNS name of this instance."
  value       = yandex_compute_instance.this[*].fqdn
}

output "boot_disk_id" {
  description = "ID of the disk that is attached to the instance."
  value       = yandex_compute_instance.this.boot_disk[0].disk_id
}

output "ip_address" {
  description = "The internal IP address of the instance."
  value       = yandex_compute_instance.this[*].network_interface[0].ip_address
}

output "nat_ip_address" {
  description = "The external IP address of the instance."
  value       = try(yandex_compute_instance.this[*].network_interface[0].nat_ip_address, null)
}
