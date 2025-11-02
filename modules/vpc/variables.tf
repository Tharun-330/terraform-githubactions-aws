variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
