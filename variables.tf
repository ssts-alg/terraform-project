variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidir" {
  default = "192.178.0.0/16"
}

variable "vpc_name" {
  type    = "string"
  default = "CITY_VPC"
}

variable "public_subnet_cidrs" {
  type    = "list"
  default = ["192.178.0.0/25", "192.178.0.128/25"]
}

variable "azs" {
  type    = "list"
  default = ["ap-south-1a", "ap-south-1b"]
}
variable "private_subnet_cidrs" {
  type    = "list"
  default = ["192.178.1.0/25", "192.178.1.128/25"]
}

variable "pubic_subnet_name" {
  default = "CITY_PUBLIC_SUBNET"
}
variable "private_subnet_name" {
  default = "CITY_PRIVATE_SUBNET"
}

variable "igw_name" {
  default = "CITY_IGW"
}

variable "public_rt_name" {
  default = "CITY_PUBLIC"
}

variable "cidr" {
  default = "0.0.0.0/0"
}
variable "private_rt_name" {
  default = "CITY_PRIVATE"
}

variable "nat_name" {
  default = "CITY_NAT"
}

variable "eip_name" {
  default = "CITY_EIP"
}
