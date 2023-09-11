# Create compute instance with metadata and user_data

This example demonstrates how to use the instance module to create VM instances with provisioning by metadata and userdata.

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
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.71 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.71 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_metadata"></a> [metadata](#module\_metadata) | ../../../modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.compute_cloud](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.compute_cloud](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_compute_image.ubuntu_2004](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_ip_address"></a> [nat\_ip\_address](#output\_nat\_ip\_address) | The external IP address of this module. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
