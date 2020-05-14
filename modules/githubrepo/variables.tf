variable "automation_server_uri" {
  description = "Automation Application URI i.e IP/DomainName:PORT"
  type        = "string"
}

variable "create_branches" {
  description = "The Branches to Create"
  type        = "list"
}

variable "default_branch" {
  description = "The Default Branch for Repository"
  type        = "string"
}

variable "description" {
  description = "The Description of the Repository"
  type        = "string"
}

variable "events_trigger" {
  description = "Webhook Events Trigger"
  type        = "list"
}

variable "github_webhook_secret" {
  description = "The Webhook Secret for the Repository"
  type        = "string"
}


variable "has_issues" {
  description = "Is the Issues Feature Enabled"
  default = false
  type        = "string"
}

variable "private_enabled" {
  description = "Is the Repository Private"
  default = true
  type        = "string"
}

variable "protect_branches" {
  description = "The Branches to Protect"
  type        = "list"
}

variable "has_projects" {
  description = "Is the Projects Feature Enabled"
  default = false
  type        = "string"
}

variable "repo_name" {
  description = "The Repository Name"
  type        = "string"
}