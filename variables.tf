variable CidrBlockVpc {
  type        = string
  default     = "10.0.0.0/16"
  description = "Vpc CidrBlock"
}

variable SnPublic {
  type        = string
  default     = "10.0.0.0/24"
  description = "Cidr Block for Public Subnet"
}

variable SnPrivate {
  type        = string
  default     = "10.0.1.0/24"
  description = "Cidr Block for Private Subnet"
}

variable AllTraffic {
  type        = string
  default     = "0.0.0.0/0"
  description = "All Traffic"
}

variable Ami {
  type        = string
  default     = "ami-0aab712d6363da7f9"
  description = "Ami Linux Instance id ap-southeast-2"
}

