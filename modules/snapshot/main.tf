resource "yandex_compute_snapshot" "this" {
  name           = var.name
  description    = var.description
  folder_id      = var.folder_id
  source_disk_id = var.source_disk_id

  labels = var.labels
}
