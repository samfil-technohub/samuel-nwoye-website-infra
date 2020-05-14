variable "description" {
  description = "The Description of the Repository"
  type        = "string"
}

variable "github_administrator" {
  description = "The Github Admin User"
  type        = "string"
}

variable "github_users" {
  description = "Create/Add Github Users"
  type        = "list"
}

variable "privacy_status" {
  description = "Is the Team Closed or Secret"
  default = "closed"
  type        = "string"
}

variable "repo_names" {
  description = "The Repository Name"
  type        = "list"
}

variable "team_name" {
  description = "The Name of the Team i.e Project-[Dev or Op]"
  type        = "string"
}