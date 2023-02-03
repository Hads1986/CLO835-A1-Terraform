# Default tags
variable "default_tags" {
  default = {
    "Owner" = "Hector"
    "App"   = "Web"
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

variable "instance_type" {
  default     = "t3.medium"
  type        = string
  description = "Instance type"
}