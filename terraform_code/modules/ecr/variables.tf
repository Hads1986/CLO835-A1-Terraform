variable "ecr_name" {
  description = "The name of the ECR registry"
  type        = any
  default     = null
}

variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  default     = "IMMUTABLE"
}


variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  default     = "KMS"
}

variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}

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