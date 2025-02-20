output "efs_id" {
  description = "EFS File System ID"
  value       = module.efs.efs_id
}

output "efs_sg_id" {
  description = "EFS Security Group ID"
  value       = module.efs_sg.security_group_id
}


