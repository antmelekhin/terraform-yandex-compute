# Terraform Yandex Compute Instance Group module

This module is used to create compute instance group using [compute_instance_group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group) resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.71 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.71 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance_group.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group) | resource |
| [yandex_iam_service_account.service_account](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_resourcemanager_folder_iam_member.service_account](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_disk_source_id"></a> [boot\_disk\_source\_id](#input\_boot\_disk\_source\_id) | Source id for the boot disk to initialize from. | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | Networks to attach to the instance. | `list(any)` | n/a | yes |
| <a name="input_application_load_balancer"></a> [application\_load\_balancer](#input\_application\_load\_balancer) | Application Load balancing (L7) specifications. | `map(string)` | `null` | no |
| <a name="input_auto_scale_custom_rules"></a> [auto\_scale\_custom\_rules](#input\_auto\_scale\_custom\_rules) | A list of custom rules for autoscale policy. | `list(any)` | `[]` | no |
| <a name="input_boot_disk_description"></a> [boot\_disk\_description](#input\_boot\_disk\_description) | A description of the boot disk. | `string` | `null` | no |
| <a name="input_boot_disk_device_name"></a> [boot\_disk\_device\_name](#input\_boot\_disk\_device\_name) | This value can be used to reference the device under `/dev/disk/by-id/`. | `string` | `null` | no |
| <a name="input_boot_disk_mode"></a> [boot\_disk\_mode](#input\_boot\_disk\_mode) | Type of access to the disk resource. | `string` | `null` | no |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Size of the boot disk in GB. | `number` | `null` | no |
| <a name="input_boot_disk_source_type"></a> [boot\_disk\_source\_type](#input\_boot\_disk\_source\_type) | Source type for the boot disk. The allowed values are `snapshot` or `image`. | `string` | `"image"` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | Boot disk type. The allowed values are `network-hdd`, `network-ssd`, `network-ssd-nonreplicated`. | `string` | `null` | no |
| <a name="input_core_fraction"></a> [core\_fraction](#input\_core\_fraction) | Specifies baseline performance for a core as a percent. | `number` | `100` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | CPU cores for the instance. | `number` | `2` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Flag that protects the instance group from accidental deletion. | `bool` | `false` | no |
| <a name="input_deploy_policy"></a> [deploy\_policy](#input\_deploy\_policy) | The deployment policy of the instance group. | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the instance group. | `string` | `null` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder that the instance group belongs to. | `string` | `null` | no |
| <a name="input_gpus"></a> [gpus](#input\_gpus) | GPUs for the instance. | `number` | `null` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check specifications. | `map(string)` | `null` | no |
| <a name="input_instance_description"></a> [instance\_description](#input\_instance\_description) | A description of the instance. | `string` | `null` | no |
| <a name="input_instance_hostname"></a> [instance\_hostname](#input\_instance\_hostname) | Hostname for the instance. | `string` | `null` | no |
| <a name="input_instance_labels"></a> [instance\_labels](#input\_instance\_labels) | A set of key/value label pairs to assign to the instance. | `map(string)` | `{}` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the instance. | `string` | `null` | no |
| <a name="input_instance_platform_id"></a> [instance\_platform\_id](#input\_instance\_platform\_id) | The type of instance to create. | `string` | `"standard-v3"` | no |
| <a name="input_instance_service_account_id"></a> [instance\_service\_account\_id](#input\_instance\_service\_account\_id) | ID of existing service account authorized for this instance. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the instance group. | `map(string)` | `{}` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | Load balancing specifications. | `map(string)` | `null` | no |
| <a name="input_max_checking_health_duration"></a> [max\_checking\_health\_duration](#input\_max\_checking\_health\_duration) | Timeout for waiting for the VM to become healthy. | `number` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory size in GB. | `number` | `2` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | The metadata to provide when launching the instance. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the instance group. | `string` | `null` | no |
| <a name="input_network_acceleration_type"></a> [network\_acceleration\_type](#input\_network\_acceleration\_type) | Type of network acceleration. The allowed values are `STANDARD`, `SOFTWARE_ACCELERATED`, `HARDWARE_ACCELERATED`. | `string` | `"STANDARD"` | no |
| <a name="input_scale_policy"></a> [scale\_policy](#input\_scale\_policy) | The scaling policy of the instance group. | `map(any)` | `{}` | no |
| <a name="input_scheduling_policy_preemptible"></a> [scheduling\_policy\_preemptible](#input\_scheduling\_policy\_preemptible) | Specifies if the instance is preemptible. | `bool` | `false` | no |
| <a name="input_secondary_disks"></a> [secondary\_disks](#input\_secondary\_disks) | A list of disks to attach to the instance. | `list(map(string))` | `[]` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | ID of existing service account authorized for this instance group. | `string` | `null` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of the service account authorized for this instance group. | `string` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to provide when launching the instance. | `string` | `null` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | A set of key/value variables pairs to assign to the instance group. | `map(string)` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A list of availability zones where the instance group will be created. | `set(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The fully qualified DNS name of this instance. |
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | The ID of the instance group. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the instance. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The internal IP address of the instance. |
| <a name="output_load_balancer_target_group_id"></a> [load\_balancer\_target\_group\_id](#output\_load\_balancer\_target\_group\_id) | The ID of the target group. |
| <a name="output_name"></a> [name](#output\_name) | The name of the managed instance. |
| <a name="output_nat_ip_address"></a> [nat\_ip\_address](#output\_nat\_ip\_address) | The external IP address of the instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
