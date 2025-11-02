variable "region" { default = "ap-south-1" }
variable "env" { default = "dev" }

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-01760eea5c574eb86" # example Amazon Linux 2 in ap-south-1
}

variable "instance_type" {
  default = "t2.nano"
}

variable "key_name" {
  description = "Key pair name"
  default     = "my-dev-keypair"
}

variable "tags" {
  default = {
    Project     = "terraform-multienv"
    Environment = "dev"
  }
}
