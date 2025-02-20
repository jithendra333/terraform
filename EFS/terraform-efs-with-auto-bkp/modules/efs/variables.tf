variable "efs_name" {
  description = "Name of the EFS file system"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EFS mount targets"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group for EFS"
  type        = list(string)
}

variable "enable_backup" {
  description = "Enable or disable automatic backups for EFS"
  type        = bool
  default     = false # Change to true if you want backups enabled by default
}


