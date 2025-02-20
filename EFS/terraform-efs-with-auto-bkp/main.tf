module "efs" {
  source          = "./modules/efs"
  efs_name        = var.efs_name
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  security_groups = [module.efs_sg.security_group_id]
  enable_backup   = var.enable_backup
}

module "efs_sg" {
  source = "./modules/security_group"
  vpc_id = var.vpc_id
}


