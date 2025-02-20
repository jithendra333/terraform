variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "efs_name" {
  description = "Name of the EFS file system"
  type        = string
  default     = "my-efs"
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

variable "backup_vault_name" {
  description = "AWS Backup Vault Name"
  type        = string
  default     = "efs-backup-vault"
}

