variable "name" {
  description = "A name of a snapshot."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of a snapshot."
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The ID of the folder that snapshot belongs to. If it is not provided, the default provider folder is used."
  type        = string
  default     = null
}

variable "source_disk_id" {
  description = "ID of the disk to create a snapshot from."
  type        = string
}

variable "labels" {
  description = "A set of key/value label pairs to assign to a snapshot."
  type        = map(string)
  default     = {}
}
