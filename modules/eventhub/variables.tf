variable "resource_group_name" {
  description = "The name of the resource group. Required for consumer groups."
  type        = string
}

variable "name" {
  description = "Specifies the name of the EventHub resource."
  type        = string
}

variable "environment" {
  description = "Specifies the environment the EventHub Namespace belongs to."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "tst", "acc", "stg", "prd", "mgmt", "shared", "common"], var.environment)
    error_message = "Invalid value for environment. Must be one of: `dev`, `tst`, `acc`, `stg`, `prd`, `mgmt`, `shared`, `common`."
  }
}

variable "namespace_id" {
  description = "Specifies the ID of the EventHub Namespace."
  type        = string
}

variable "namespace_name" {
  description = "The name of the EventHub Namespace. Required for consumer groups."
  type        = string
}

variable "partition_count" {
  description = "Specifies the current number of shards on the Event Hub."
  type        = number
  validation {
    condition     = var.partition_count >= 1
    error_message = "Partition count must be at least 1."
  }
}

variable "message_retention" {
  description = "Specifies the number of days to retain the events for this Event Hub."
  type        = number
  validation {
    condition     = var.message_retention >= 1
    error_message = "Message retention must be at least 1 day."
  }
}

variable "status" {
  description = "Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled."
  type        = string
  default     = "Active"
  validation {
    condition     = contains(["Active", "Disabled", "SendDisabled"], var.status)
    error_message = "Invalid value for status. Must be one of: `Active`, `Disabled`, `SendDisabled`."
  }
}

# Capture description variables
variable "capture_enabled" {
  description = "Whether to enable capture for the EventHub."
  type        = bool
  default     = false
}

variable "capture_encoding" {
  description = "Specifies the Encoding used for the Capture Description. Possible values are `Avro` and `AvroDeflate`."
  type        = string
  default     = "Avro"
  validation {
    condition     = contains(["Avro", "AvroDeflate"], var.capture_encoding)
    error_message = "Invalid value for capture_encoding. Must be one of: `Avro`, `AvroDeflate`."
  }
}

variable "capture_interval_in_seconds" {
  description = "Specifies the time interval in seconds at which the capture will happen."
  type        = number
  default     = 300

  validation {
    condition     = var.capture_interval_in_seconds >= 60 && var.capture_interval_in_seconds <= 900
    error_message = "Capture interval must be between 60 and 900 seconds."
  }
}

variable "capture_size_limit_in_bytes" {
  description = "Specifies the amount of data built up in your EventHub before a Capture Operation occurs."
  type        = number
  default     = 314572800

  validation {
    condition     = var.capture_size_limit_in_bytes >= 10485760 && var.capture_size_limit_in_bytes <= 524288000
    error_message = "Capture size limit must be between 10485760 and 524288000 bytes."
  }
}

variable "capture_skip_empty_archives" {
  description = "Specifies if empty files should not be emitted if no events occur during the Capture time window."
  type        = bool
  default     = false
}

variable "capture_archive_name_format" {
  description = "The Blob naming convention for archiving events."
  type        = string
  default     = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
}

variable "capture_blob_container_name" {
  description = "The name of the Container within the Blob Storage Account where messages should be archived."
  type        = string
  default     = "sensors"
}

variable "capture_storage_account_id" {
  description = "The ID of the Blob Storage Account where messages should be archived."
  type        = string
  default     = null
}

variable "consumer_groups" {
  description = "A list of consumer group names to create for the EventHub."
  type        = list(string)
  default     = []
}

variable "consumer_groups_metadata" {
  description = "A mapping of consumer group names to user metadata for the EventHub."
  type        = map(string)
  default     = {}
}

variable "role_assignments" {
  description = "A mapping of role assignments to create for the EventHub."
  type = map(object({
    principal_id         = string
    role_definition_name = string
  }))
  default = {}
}
