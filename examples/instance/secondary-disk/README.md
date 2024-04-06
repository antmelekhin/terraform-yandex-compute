# Create instance with secondary disk

This example demonstrates how to use the instance module to create VM instances with additional persistent disks.

To provision this example configure provider by the environment variables:

```bash
export YC_CLOUD_ID=`yc config get cloud-id`
export YC_FOLDER_ID=`yc config get folder-id`
export YC_TOKEN=`yc config get token`
export YC_ZONE=`yc config get compute-default-zone`
```

Then run from within this directory:

* `terraform init` to get the plugins
* `terraform plan` to see the infrastructure plan
* `terraform apply` to apply the infrastructure build
* `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.114 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.114 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instances_multiple_secondary_disks"></a> [instances\_multiple\_secondary\_disks](#module\_instances\_multiple\_secondary\_disks) | ../../../modules/instance | n/a |
| <a name="module_instances_secondary_disk"></a> [instances\_secondary\_disk](#module\_instances\_secondary\_disk) | ../../../modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_compute_disk.data_one](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_compute_disk.data_two](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_compute_disk.secondary_disk](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_vpc_network.compute_cloud](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.compute_cloud](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_compute_image.ubuntu_2004](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
