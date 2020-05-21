variable "any_ip" {
  default     = "0.0.0.0/0"
  description = "Any IP Address"
  type        = "string"
}

variable "environment" {
  description = "The Server Environment"
  type        = "string"
}

variable "http_port" {
  default     = "80"
  description = "The Communication Port for HTTP"
  type        = "string"
}

variable "project" {
  description = "The Project Name"
  type        = "string"
}

variable "ssh_cidr_block" {
  description = "A Specified CIDR Block"
  type        = "string"
}

variable "ssh_port" {
  default     = "22"
  description = "The secure port to getting into the servers"
  type        = "string"
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = "string"
}