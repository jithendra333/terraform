module "efs" {
  source          = "./modules/efs"
  efs_name        = var.efs_name
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  security_groups = [module.efs_sg.security_group_id]
}

module "efs_sg" {
  source = "./modules/security_group"
  vpc_id = var.vpc_id
}

module "efs_backup" {
  source       = "./modules/backup"
  efs_id       = module.efs.efs_id
  backup_vault = var.backup_vault_name
  aws_region   = var.aws_region
  account_id   = data.aws_caller_identity.current.account_id
}

