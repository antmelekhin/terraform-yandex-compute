# Terraform Yandex Compute Instance Group module

This module is used to create compute instance group using [compute_instance_group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance_group) resource.

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

| Name                            | Description                                                                                                                                                                                   | Type           | Default       | Required |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|---------------|:--------:|
| name                            | The name of the instance group.                                                                                                                                                               | `string`       | `null`        | no       |
| description                     | A description of the instance group.                                                                                                                                                          | `string`       | `null`        | no       |
| folder\_id                      | The ID of the folder that the instance group belongs to.                                                                                                                                      | `string`       | `null`        | no       |
| service\_account\_id            | ID of existing service account authorized for this instance group.                                                                                                                            | `string`       | `null`        | no       |
| service\_account\_name          | Name of the service account authorized for this instance group.                                                                                                                               | `string`       | `null`        | no       |
| variables                       | A set of key/value variables pairs to assign to the instance group. See [official documentation](https://cloud.yandex.com/en/docs/compute/concepts/instance-groups/variables-in-the-template) | `map(string)`  | `{}`          | no       |
| deletion\_protection            | Name of the service account authorized for this instance group.                                                                                                                               | `bool`         | `false`       | no       |
| zones                           | A list of availability zones where the instance group will be created.                                                                                                                        | `string`       | `null`        | no       |
| deploy\_policy                  | The deployment policy of the instance group. See [official documentation](https://cloud.yandex.com/en/docs/compute/concepts/instance-groups/policies/deploy-policy)                           | `map(string)`  | `{}`          | no       |
| scale\_policy                   | The scaling policy of the instance group. See [official documentation](https://cloud.yandex.com/en/docs/compute/concepts/instance-groups/policies/scale-policy)                               | `map(any)`     | `{}`          | no       |
| auto\_scale\_custom\_rules      | A list of custom rules for autoscale policy.                                                                                                                                                  | `list(any)`    | `[]`          | no       |
| health\_check                   | Health check specifications.                                                                                                                                                                  | `map(string)`  | `null`        | no       |
| max\_checking\_health\_duration | Timeout for waiting for the VM to become healthy.                                                                                                                                             | `number`       | `null`        | no       |
| load\_balancer                  | Load balancing specifications.                                                                                                                                                                | `map(string)`  | `null`        | no       |
| application\_load\_balancer     | Application Load balancing (L7) specifications.                                                                                                                                               | `map(string)`  | `null`        | no       |
| labels                          | A set of key/value label pairs to assign to the instance group.                                                                                                                               | `map(string)`  | `{}`          | no       |
| instance\_name                  | The name of the instance.                                                                                                                                                                     | `string`       | `null`        | no       |
| instance\_description           | A description of the instance.                                                                                                                                                                | `string`       | `null`        | no       |
| instance\_hostname              | Hostname for the instance.                                                                                                                                                                    | `string`       | `null`        | no       |
| instance\_platform\_id          | The type of instance to create. See [official documentation](https://cloud.yandex.com/en/docs/compute/concepts/vm-platforms)                                                                  | `string`       | `standard-v3` | no       |
| instance\_service\_account\_id  | ID of existing service account authorized for this instance.                                                                                                                                  | `string`       | `null`        | no       |
| cores                           | CPU cores for the instance.                                                                                                                                                                   | `number`       | `2`           | no       |
| core\_fraction                  | Specifies baseline performance for a core as a percent.                                                                                                                                       | `number`       | `100`         | no       |
| gpus                            | GPUs for the instance.                                                                                                                                                                        | `number`       | `null`        | no       |
| memory                          | Memory size in GB.                                                                                                                                                                            | `number`       | `2`           | no       |
| boot\_disk\_source\_type        | Source type for the boot disk. The allowed values are `snapshot` or `image`.                                                                                                                  | `string`       | `image`       | no       |
| boot\_disk\_source\_id          | Source id for the boot disk to initialize from.                                                                                                                                               | `string`       | ``            | yes      |
| boot\_disk\_device\_name        | This value can be used to reference the device under `/dev/disk/by-id/`.                                                                                                                      | `string`       | `null`        | no       |
| boot\_disk\_mode                | Type of access to the disk resource.                                                                                                                                                          | `string`       | `null`        | no       |
| boot\_disk\_description         | A description of the boot disk.                                                                                                                                                               | `string`       | `null`        | no       |
| boot\_disk\_size                | Size of the boot disk in GB.                                                                                                                                                                  | `number`       | `null`        | no       |
| boot\_disk\_type                | Boot disk type. The allowed values are `network-hdd`, `network-ssd`, `network-ssd-nonreplicated`.                                                                                             | `string`       | `null`        | no       |
| network\_interfaces             | Networks to attach to the instance.                                                                                                                                                           | `list(any)`    | ``            | yes      |
| network\_acceleration\_type     | Type of network acceleration. The allowed values are `STANDARD`, `SOFTWARE_ACCELERATED`, `HARDWARE_ACCELERATED`.                                                                              | `string`       | `STANDARD`    | no       |
| scheduling\_policy\_preemptible | Specifies if the instance is preemptible.                                                                                                                                                     | `bool`         | `false`       | no       |
| metadata                        | The metadata to provide when launching the instance.                                                                                                                                          | `map(string)`  | `{}`          | no       |
| user\_data                      | The user data to provide when launching the instance.                                                                                                                                         | `string`       | `null`        | no       |
| labels                          | A set of key/value label pairs to assign to the instance.                                                                                                                                     | `map(string)`  | `{}`          | no       |

## Outputs

| Name                              | Description                                    |
|-----------------------------------|------------------------------------------------|
| group\_id                         | The ID of the instance group.                  |
| load\_balancer\_target\_group\_id | The ID of the load balancer target group.      |
| instance\_id                      | The ID of the instance.                        |
| name                              | The name of the managed instance.              |
| fqdn                              | The fully qualified DNS name of this instance. |
| ip\_address                       | The internal IP address of the instance.       |
| nat_ip_address                    | The external IP address of the instance.       |
