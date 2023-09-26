variable "aws_region" {
  type    = string
}

variable "desired_size" {
  type    = string
}

variable "min_size" {
  type    = string
}

variable "max_size" {
  type    = string
}

variable "common_tags" {
  type = map(any)
  default = {

  }
}

variable "ec2_ssh_key" {
  type    = string
}

variable "ami_type" {
  type    = string
}

variable "capacity_type" {
  type    = string
}

variable "disk_size" {
  type    = string
}

variable "force_update_version" {
  type    = bool
}

variable "instance_types" {
  type = list(string)
}

variable "eks-version" {
  type    = string
}

variable "label_name" {
  type    = string
}
