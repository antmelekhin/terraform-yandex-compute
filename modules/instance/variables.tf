variable "name" {
  description = "The name of the instance."
  type        = string
  default     = null
}

variable "description" {
  description = "A description of the instance."
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The ID of the folder that the compute instance belongs to."
  type        = string
  default     = null
}

variable "zone" {
  description = "The availability zone where the compute instance will be created."
  type        = string
  default     = null
}

variable "hostname" {
  description = "Hostname for the instance."
  type        = string
  default     = null
}

variable "platform_id" {
  description = "The type of instance to create. See official documentation https://cloud.yandex.com/en/docs/compute/concepts/vm-platforms"
  type        = string
  default     = "standard-v3"
}

variable "service_account_id" {
  description = "ID of existing service account authorized for this instance."
  type        = string
  default     = null
}

variable "allow_stopping_for_update" {
  description = "If true, allows Terraform to stop the instance in order to update its properties."
  type        = bool
  default     = true
}

variable "cores" {
  description = "CPU cores for the instance."
  type        = number
  default     = 2
}

variable "core_fraction" {
  description = "Specifies baseline performance for a core as a percent."
  type        = number
  default     = 100
}

variable "gpus" {
  description = "GPUs for the instance."
  type        = number
  default     = null
}

variable "memory" {
  description = "Memory size in GB."
  type        = number
  default     = 2
}

variable "boot_disk_source_type" {
  description = "Source type for the boot disk. The allowed values are `disk`, `snapshot`, `image`."
  type        = string
  default     = "image"
}

variable "boot_disk_source_id" {
  description = "Source id for the boot disk to initialize from."
  type        = string
}

variable "boot_disk_auto_delete" {
  description = "Defines whether the disk will be auto-deleted when the instance is deleted."
  type        = bool
  default     = true
}

variable "boot_disk_device_name" {
  description = "This value can be used to reference the device under `/dev/disk/by-id/`."
  type        = string
  default     = null
}

variable "boot_disk_mode" {
  description = "Type of access to the disk resource."
  type        = string
  default     = null
}

variable "boot_disk_name" {
  description = "The name of the boot disk."
  type        = string
  default     = null
}

variable "boot_disk_description" {
  description = "A description of the boot disk."
  type        = string
  default     = null
}

variable "boot_disk_size" {
  description = "Size of the boot disk in GB."
  type        = number
  default     = null
}

variable "boot_disk_block_size" {
  description = "Block size of the disk, specified in bytes."
  type        = number
  default     = 4096
}

variable "boot_disk_type" {
  description = "The boot disk type. The allowed values are `network-hdd`, `network-ssd`, `network-ssd-nonreplicated`."
  type        = string
  default     = null
}

variable "secondary_disk_ids" {
  description = "IDs of the disk that is attached to the instance."
  type        = list(string)
  default     = null
}

variable "secondary_disk_auto_delete" {
  description = "Whether the disk is auto-deleted when the instance is deleted."
  type        = bool
  default     = false
}

variable "network_interfaces" {
  description = "Networks to attach to the instance."
  type        = list(any)
}

variable "network_acceleration_type" {
  description = "Type of network acceleration. The allowed values are `standard`, `software_accelerated`."
  type        = string
  default     = "standard"
}

variable "scheduling_policy_preemptible" {
  description = "Specifies if the instance is preemptible."
  type        = bool
  default     = false
}

variable "metadata" {
  description = "The metadata to provide when launching the instance."
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = null
}

variable "metadata_options" {
  description = "Options allow user to configure access to instance's metadata."
  type        = map(string)
  default     = {}
}

variable "maintenance_policy" {
  description = "Behaviour on maintenance events. Values: `unspecified`, `migrate`, `restart`."
  type        = string
  default     = null
}

variable "maintenance_grace_period" {
  description = "Time between notification via metadata service and maintenance. E.g., 60s."
  type        = string
  default     = null
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the instance."
  type        = map(string)
  default     = {}
}
