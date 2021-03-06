variable "ami" {
  description = "The AMI for the Server"
  type        = "string"
}

variable "delete_volume_on_termination_enabled" {
  description = "Delete Volume on Instance Termination"
  type        = "string"
}

variable "environment" {
  description = "The Server Environment"
  type        = "string"
}

variable "instance_type" {
  description = "AWS Instance Type"
  type        = "string"
}

variable "monitoring_enabled" {
  description = "Enable Monitoring i.e true or false"
  type        = "string"
}

variable "project" {
  description = "The Project Name"
  type        = "string"
}

variable "public_key_path" {
  description = "The Path to SSH Public Key"
  type        = "string"
}

variable "volume_size" {
  description = "AWS Instance Volume Size"
  type        = "string"
}

variable "volume_type" {
  description = "AWS Instance Volume Type"
  type        = "string"
}

variable "vpc_security_group_ids" {
  description = "The Security Groups to Apply"
  type        = "list"
}