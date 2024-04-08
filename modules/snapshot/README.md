# Terraform Yandex Compute Snapshot module

This module is used to create compute snapshots using [compute_snapshot](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_snapshot) resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.114.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.114.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_snapshot.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_snapshot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_source_disk_id"></a> [source\_disk\_id](#input\_source\_disk\_id) | ID of the disk to create a snapshot from. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of a snapshot. | `string` | `null` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder that snapshot belongs to. If it is not provided, the default provider folder is used. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to a snapshot. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | A name of a snapshot. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_snapshot_name"></a> [snapshot\_name](#output\_snapshot\_name) | A name of a snapshot. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
