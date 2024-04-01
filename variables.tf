# environment variables
variable "region" {
  description = "region to create resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "project name"
  type        = string
  default     = "Dev-EC2"
}

#VPC variable
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

#public subnet availabilty zone 1 cidr variable
variable "public_subnet_az1_cidr" {
  description = "public subnet availabilty zone one cidr"
  type        = string
  default     = "10.0.6.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "ami_id" {
  description = "The AMI to use"
  type        = string
  default     = "ami-0df435f331839b2d6"
}


#security-group variable
variable "ssh_location" {
  description = "ip address that can ssh into the server, it should be manually changed after provisioning"
  type        = string
  default     = "41.216.203.213/32"
}

variable "host_os" {
  type    = string
  default = "linux"
}

variable "hostzone" {
  type = string
}