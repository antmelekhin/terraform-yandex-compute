output "group_id" {
  description = "The ID of the instance group."
  value       = yandex_compute_instance_group.this.id
}

output "load_balancer_target_group_id" {
  description = "The ID of the target group."
  value       = try(yandex_compute_instance_group.this.load_balancer[0].target_group_id, null)
}

output "instance_id" {
  description = "The ID of the instance."
  value       = yandex_compute_instance_group.this.instances[*].instance_id
}

output "name" {
  description = "The name of the managed instance."
  value       = yandex_compute_instance_group.this.instances[*].name
}

output "fqdn" {
  description = "The fully qualified DNS name of this instance."
  value       = yandex_compute_instance_group.this.instances[*].fqdn
}

output "ip_address" {
  description = "The internal IP address of the instance."
  value       = yandex_compute_instance_group.this.instances[*].network_interface[0].ip_address
}

output "nat_ip_address" {
  description = "The external IP address of the instance."
  value       = try(yandex_compute_instance_group.this.instances[*].network_interface[0].nat_ip_address, null)
}
