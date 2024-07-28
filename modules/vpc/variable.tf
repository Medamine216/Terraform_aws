#VPC

variable "vpc_cidr_block" {
  description = "VPC Network"
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  default = "Tf-vpc"
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet "
  default     = "10.0.2.0/24"
}