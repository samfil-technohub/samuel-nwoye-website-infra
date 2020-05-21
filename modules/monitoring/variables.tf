variable "environment" {
  description = "The Server Environment"
  type        = "string"
}

variable "instance_id" {
  description = "The Server Instance ID to Monitor"
  type        = "string"
}

variable "project" {
  description = "The Project Name"
  type        = "string"
}

variable "region" {
  description = "AWS Region"
  type        = "string"
}