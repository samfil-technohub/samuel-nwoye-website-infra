variable "ami_name" {
  description = "The Name of the Golden Image"
  type        = "string"
}

variable "ami_tag" {
  description = "The Tag of the Golden Image"
  type        = "string"
}

variable "any_ip" {
  default     = "0.0.0.0/0"
  description = "Any IP Address"
  type        = "string"
}

variable "automation_server_uri" {
  description = "Jenkins or any Automation Application Domain Name or IP"
  type        = "string"
}

variable "github_organization" {
  description = "Github Organization"
  type        = "string"
}

variable "github_token" {
  description = "Github Token"
  type        = "string"
}

variable "http_port" {
  default     = "80"
  description = "The Communication Port for HTTP"
  type        = "string"
}

variable "instance_type" {
  description = "AWS Istance Type"
  type        = "string"
}

variable "profile" {
  description = "The AWS Profile in Credentials Path to Use"
  type        = "string"
}

variable "project" {
  description = "The Project Name"
  type        = "string"
}

variable "project_columns" {
  description = "Project Columns"
  type        = "list"

  default = [
    "To Do",
    "Doing",
    "Done"
  ] 
}

# variable "protect_branches" {
#   description = "Branches to Protect"
#   type        = "list"
#   default = [
#     "master",
#     "release"
#   ] 
# }

variable "region" {
  description = "AWS Region"
  type        = "string"
}

variable "ssh_port" {
  default     = "22"
  description = "The secure port to getting into the servers"
  type        = "string"
}
