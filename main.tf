terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.16.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "webserver" {
  source            = "./modules/webserver"
  ec2_instance_type = var.ec2_instance_type
  vpc_id            = module.vpc.vpc_id
  subnet_id         = module.vpc.subnet_id
}