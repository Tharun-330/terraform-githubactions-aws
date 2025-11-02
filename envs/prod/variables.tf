variable "region" { default = "ap-south-1" }
variable "env" { default = "prod" }
variable "vpc_cidr" { default = "10.20.0.0/16" }
variable "public_subnets" { default = ["10.20.1.0/24", "10.20.2.0/24"] }
variable "azs" { default = ["ap-south-1a", "ap-south-1b"] }
variable "instance_type" { default = "t3.medium" }
variable "key_name" { default = "prod-keypair" }
variable "ami_id" { default = "" }
variable "ami_owner" { default = "137112412989" }
variable "tags" {
  type = map(string)
  default = {
    Project = "MultiEnvInfra"
    Owner   = "DevOpsTeam"
    Env     = "prod"
  }
}
