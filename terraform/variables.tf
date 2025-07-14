variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}

variable "public_key" {
  description = "Public key for AWS key pair"
  type        = string
}

variable "private_key" {
  description = "Private key for SSH connection"
  type        = string
  sensitive   = true
}
