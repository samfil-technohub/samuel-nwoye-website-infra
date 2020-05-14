variable "project_columns" {
  description = "Project Columns"
  type        = "list"

  default = [
    "To-Do",
    "Doing",
    "Done"
  ]
  
}

variable "repo_name" {
  description = "The Repository Name"
  type        = "string"
}