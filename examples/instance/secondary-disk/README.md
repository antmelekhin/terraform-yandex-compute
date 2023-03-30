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
