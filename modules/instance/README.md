# Terraform Yandex Compute Instance module

This module is used to create compute instance(s) using [compute_instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) resource.

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
| [yandex_compute_instance.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_disk_source_id"></a> [boot\_disk\_source\_id](#input\_boot\_disk\_source\_id) | Source id for the boot disk to initialize from. | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | Networks to attach to the instance. | `list(any)` | n/a | yes |
| <a name="input_allow_stopping_for_update"></a> [allow\_stopping\_for\_update](#input\_allow\_stopping\_for\_update) | If true, allows Terraform to stop the instance in order to update its properties. | `bool` | `true` | no |
| <a name="input_boot_disk_auto_delete"></a> [boot\_disk\_auto\_delete](#input\_boot\_disk\_auto\_delete) | Defines whether the disk will be auto-deleted when the instance is deleted. | `bool` | `true` | no |
| <a name="input_boot_disk_block_size"></a> [boot\_disk\_block\_size](#input\_boot\_disk\_block\_size) | Block size of the disk, specified in bytes. | `number` | `4096` | no |
| <a name="input_boot_disk_description"></a> [boot\_disk\_description](#input\_boot\_disk\_description) | A description of the boot disk. | `string` | `null` | no |
| <a name="input_boot_disk_device_name"></a> [boot\_disk\_device\_name](#input\_boot\_disk\_device\_name) | This value can be used to reference the device under `/dev/disk/by-id/`. | `string` | `null` | no |
| <a name="input_boot_disk_mode"></a> [boot\_disk\_mode](#input\_boot\_disk\_mode) | Type of access to the disk resource. | `string` | `null` | no |
| <a name="input_boot_disk_name"></a> [boot\_disk\_name](#input\_boot\_disk\_name) | The name of the boot disk. | `string` | `null` | no |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Size of the boot disk in GB. | `number` | `null` | no |
| <a name="input_boot_disk_source_type"></a> [boot\_disk\_source\_type](#input\_boot\_disk\_source\_type) | Source type for the boot disk. The allowed values are `disk`, `snapshot`, `image`. | `string` | `"image"` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | The boot disk type. The allowed values are `network-hdd`, `network-ssd`, `network-ssd-nonreplicated`. | `string` | `null` | no |
| <a name="input_core_fraction"></a> [core\_fraction](#input\_core\_fraction) | Specifies baseline performance for a core as a percent. | `number` | `100` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | CPU cores for the instance. | `number` | `2` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the instance. | `string` | `null` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder that the compute instance belongs to. | `string` | `null` | no |
| <a name="input_gpus"></a> [gpus](#input\_gpus) | GPUs for the instance. | `number` | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname for the instance. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the instance. | `map(string)` | `{}` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory size in GB. | `number` | `2` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | The metadata to provide when launching the instance. | `map(string)` | `{}` | no |
| <a name="input_metadata_options"></a> [metadata\_options](#input\_metadata\_options) | Options allow user to configure access to instance's metadata. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the instance. | `string` | `null` | no |
| <a name="input_network_acceleration_type"></a> [network\_acceleration\_type](#input\_network\_acceleration\_type) | Type of network acceleration. The allowed values are `standard`, `software_accelerated`. | `string` | `"standard"` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | The type of instance to create. See official documentation https://cloud.yandex.com/en/docs/compute/concepts/vm-platforms | `string` | `"standard-v3"` | no |
| <a name="input_scheduling_policy_preemptible"></a> [scheduling\_policy\_preemptible](#input\_scheduling\_policy\_preemptible) | Specifies if the instance is preemptible. | `bool` | `false` | no |
| <a name="input_secondary_disk_auto_delete"></a> [secondary\_disk\_auto\_delete](#input\_secondary\_disk\_auto\_delete) | Whether the disk is auto-deleted when the instance is deleted. | `bool` | `false` | no |
| <a name="input_secondary_disk_ids"></a> [secondary\_disk\_ids](#input\_secondary\_disk\_ids) | IDs of the disk that is attached to the instance. | `list(string)` | `null` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | ID of existing service account authorized for this instance. | `string` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to provide when launching the instance. | `string` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The availability zone where the compute instance will be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The fully qualified DNS name of this instance. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The internal IP address of the instance. |
| <a name="output_nat_ip_address"></a> [nat\_ip\_address](#output\_nat\_ip\_address) | The external IP address of the instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
