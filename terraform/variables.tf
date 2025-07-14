variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
  
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
  default     = "my-key-pair"
}

variable "public_key" {
  description = "Public key for the key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
}

variable "private_key" {
  description = "Private key for the key pair"
  type        = string
  default     = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA...\n-----END RSA PRIVATE KEY-----"
}
