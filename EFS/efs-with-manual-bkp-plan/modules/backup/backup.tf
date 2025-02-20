resource "aws_iam_role" "efs_backup_role" {
  name = "efs-backup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "backup.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "efs_backup_attachment" {
  name       = "efs-backup-policy-attachment"
  roles      = [aws_iam_role.efs_backup_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_backup_vault" "efs_backup_vault" {
  name = var.backup_vault
}

resource "aws_backup_plan" "efs_backup_plan" {
  name = "efs-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.efs_backup_vault.name
    schedule          = "cron(0 12 * * ? *)"

    lifecycle {
      delete_after = 35 # Retain backups for 35 days
    }
  }
}

resource "aws_backup_selection" "efs_backup_selection" {
  name         = "efs-backup-selection"
  plan_id      = aws_backup_plan.efs_backup_plan.id
  iam_role_arn = aws_iam_role.efs_backup_role.arn

  resources = [
    "arn:aws:elasticfilesystem:${var.aws_region}:${var.account_id}:file-system/${var.efs_id}"
  ]
}


