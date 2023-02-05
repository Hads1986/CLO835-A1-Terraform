# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Hector"
    "App"   = "Tier-2"
  }
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

# Name prefix
variable "prefix" {
  default     = "clo835"
  type        = string
  description = "Name prefix"
}

variable "vpc_cidr" {
  default     = "10.15.0.0/16"
  type        = string
  description = "Public Subnet CIDR"
}

variable "public_subnet_cidr" {
  default     = "10.15.0.0/24"
  type        = string
  description = "Public Subnet CIDR"
}