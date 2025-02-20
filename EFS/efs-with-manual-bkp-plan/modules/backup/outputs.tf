output "backup_vault_name" {
  description = "Backup Vault Name"
  value       = aws_backup_vault.efs_backup_vault.name
}

output "iam_role_arn" {
  description = "IAM Role ARN for AWS Backup"
  value       = aws_iam_role.efs_backup_role.arn
}

