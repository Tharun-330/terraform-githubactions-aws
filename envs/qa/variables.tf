variable "region" { default = "ap-south-1" }
variable "env" { default = "qa" }
variable "vpc_cidr" { default = "10.10.0.0/16" }
variable "public_subnets" { default = ["10.10.1.0/24", "10.10.2.0/24"] }
variable "azs" { default = ["ap-south-1a", "ap-south-1b"] }
variable "instance_type" { default = "t3.small" }
variable "key_name" { default = "qa-keypair" }
variable "ami_id" { default = "" }
variable "ami_owner" { default = "137112412989" }
variable "tags" {
  type = map(string)
  default = {
    Project = "MultiEnvInfra"
    Owner   = "DevOpsTeam"
    Env     = "qa"
  }
}
