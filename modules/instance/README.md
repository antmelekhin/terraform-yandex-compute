# Terraform Yandex Compute Instance module

This module is used to create compute instance(s) using [compute_instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) resource.

## Requirements

| Name      | Version   |
|-----------|-----------|
| terraform | >= 0.13.0 |
| yandex    | >= 0.71   |

## Providers

| Name   | Version   |
|--------|-----------|
| yandex | >= 0.71   |

## Inputs

| Name                            | Description                                                                                                                  | Type           | Default       | Required |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------|----------------|---------------|:--------:|
| name                            | The name of the instance.                                                                                                    | `string`       | `null`        | no       |
| description                     | A description of the instance.                                                                                               | `string`       | `null`        | no       |
| folder\_id                      | The ID of the folder that the compute instance belongs to.                                                                   | `string`       | `null`        | no       |
| zone                            | The availability zone where the compute instance will be created.                                                            | `string`       | `null`        | no       |
| hostname                        | Hostname for the instance.                                                                                                   | `string`       | `null`        | no       |
| platform\_id                    | The type of instance to create. See [official documentation](https://cloud.yandex.com/en/docs/compute/concepts/vm-platforms) | `string`       | `standard-v3` | no       |
| service\_account\_id            | ID of existing service account authorized for this instance.                                                                 | `string`       | `null`        | no       |
| cores                           | CPU cores for the instance.                                                                                                  | `number`       | `2`           | no       |
| core\_fraction                  | Specifies baseline performance for a core as a percent.                                                                      | `number`       | `100`         | no       |
| gpus                            | GPUs for the instance.                                                                                                       | `number`       | `null`        | no       |
| memory                          | Memory size in GB.                                                                                                           | `number`       | `2`           | no       |
| boot\_disk\_size                | Size of the boot disk in GB.                                                                                                 | `number`       | `10`          | no       |
| boot\_disk\_type                | Boot disk type. The allowed values are `network-hdd`, `network-ssd`, `network-ssd-nonreplicated`.                            | `string`       | `null`        | no       |
| boot\_disk\_image\_id           | A disk image to initialize this disk from.                                                                                   | `string`       | `null`        | yes      |
| boot\_disk\_snapshot\_id        | A snapshot to initialize this disk from.                                                                                     | `string`       | `null`        | no       |
| secondary\_disk\_ids            | IDs of the disk that is attached to the instance.                                                                            | `list(string)` | `null`        | no       |
| secondary\_disk\_auto\_delete   | Whether the disk is auto-deleted when the instance is deleted.                                                               | `bool`         | `false`       | no       |
| network\_interfaces             | Networks to attach to the instance.                                                                                          | `list(any)`    | ``            | yes      |
| scheduling\_policy\_preemptible | Specifies if the instance is preemptible.                                                                                    | `bool`         | `false`       | no       |
| metadata                        | The metadata to provide when launching the instance.                                                                         | `map(string)`  | `{}`          | no       |
| user\_data                      | The user data to provide when launching the instance.                                                                        | `string`       | `null`        | no       |
| labels                          | A set of key/value label pairs to assign to the instance.                                                                    | `map(string)`  | `{}`          | no       |

## Outputs

| Name             | Description                                    |
|------------------|------------------------------------------------|
| fqdn             | The fully qualified DNS name of this instance. |
| ip\_address      | The internal IP address of the instance.       |
| nat\_ip\_address | The external IP address of the instance.       |
