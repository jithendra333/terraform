aws_region      = "eu-central-1"
efs_name        = "my-filesystem"
vpc_id          = "vpc-01e2ab8bd05a0af30"
subnet_ids      = ["subnet-0d5e2f68123e087df", "subnet-06ecc2701bee2d072", "subnet-0e9ec21506cbf8ef7"]
security_groups = ["sg-0b21adcb292a1d2c3"]
enable_backup   = false # Set to false to disable backups
