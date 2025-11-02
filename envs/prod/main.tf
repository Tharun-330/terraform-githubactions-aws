terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
  env            = var.env
  tags           = var.tags
}

module "ec2" {
  source        = "../../modules/ec2"
  env           = var.env
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.public_subnet_ids
  instance_type = var.instance_type
  ami_id        = var.ami_id
  tags          = var.tags
}

output "ec2_public_ip" { value = module.ec2.public_ip }
