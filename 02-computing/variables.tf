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

variable "instance_type" {
  default     = "t3.medium"
  type        = string
  description = "Instance type"
}

variable "ecr_name" {
  description = "The list of ecr names to create"
  type        = string
  default     = "clo835-repo"
}
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  default     = "MUTABLE"
}