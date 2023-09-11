################################################################
# Group variables
################################################################

variable "name" {
  description = "The name of the instance group."
  type        = string
  default     = null
}

variable "description" {
  description = "A description of the instance group."
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The ID of the folder that the instance group belongs to."
  type        = string
  default     = null
}

variable "service_account_id" {
  description = "ID of existing service account authorized for this instance group."
  type        = string
  default     = null
}

variable "service_account_name" {
  description = "Name of the service account authorized for this instance group."
  type        = string
  default     = null
}

variable "variables" {
  description = "A set of key/value variables pairs to assign to the instance group."
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "Flag that protects the instance group from accidental deletion."
  type        = bool
  default     = false
}

variable "zones" {
  description = "A list of availability zones where the instance group will be created."
  type        = set(string)
  default     = null
}

variable "deploy_policy" {
  description = "The deployment policy of the instance group."
  type        = map(string)
  default     = {}
}

variable "scale_policy" {
  description = "The scaling policy of the instance group."
  type        = map(any)
  default     = {}
}

variable "auto_scale_custom_rules" {
  description = "A list of custom rules for autoscale policy."
  type        = list(any)
  default     = []
}

variable "health_check" {
  description = "Health check specifications."
  type        = map(string)
  default     = null
}

variable "max_checking_health_duration" {
  description = "Timeout for waiting for the VM to become healthy."
  type        = number
  default     = null
}

variable "load_balancer" {
  description = "Load balancing specifications."
  type        = map(string)
  default     = null
}

variable "application_load_balancer" {
  description = "Application Load balancing (L7) specifications."
  type        = map(string)
  default     = null
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the instance group."
  type        = map(string)
  default     = {}
}

################################################################
# Instance template variables
################################################################

variable "instance_name" {
  description = "The name of the instance."
  type        = string
  default     = null
}

variable "instance_description" {
  description = "A description of the instance."
  type        = string
  default     = null
}

variable "instance_hostname" {
  description = "Hostname for the instance."
  type        = string
  default     = null
}

variable "instance_platform_id" {
  description = "The type of instance to create."
  type        = string
  default     = "standard-v3"
}

variable "instance_service_account_id" {
  description = "ID of existing service account authorized for this instance."
  type        = string
  default     = null
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
  description = "Source type for the boot disk. The allowed values are `snapshot` or `image`."
  type        = string
  default     = "image"
}

variable "boot_disk_source_id" {
  description = "Source id for the boot disk to initialize from."
  type        = string
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

variable "boot_disk_type" {
  description = "Boot disk type. The allowed values are `network-hdd`, `network-ssd`, `network-ssd-nonreplicated`."
  type        = string
  default     = null
}

variable "secondary_disks" {
  description = "A list of disks to attach to the instance."
  type        = list(map(string))
  default     = []
}

variable "network_interfaces" {
  description = "Networks to attach to the instance."
  type        = list(any)
}

variable "network_acceleration_type" {
  description = "Type of network acceleration. The allowed values are `STANDARD`, `SOFTWARE_ACCELERATED`, `HARDWARE_ACCELERATED`."
  type        = string
  default     = "STANDARD"
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

variable "instance_labels" {
  description = "A set of key/value label pairs to assign to the instance."
  type        = map(string)
  default     = {}
}
