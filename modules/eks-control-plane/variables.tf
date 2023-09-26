variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "control_plane_version" {
  type = string
}

variable "endpoint_private_access" {
  type    = bool
  default = false
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "2526"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "DEL"
    "Environment"   = "dev"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }
}
/* <<<<<<< HEAD
}
=======
}

>>>>>>> 9b730721f32a74618d015157f838e4483fd93fe2 */
