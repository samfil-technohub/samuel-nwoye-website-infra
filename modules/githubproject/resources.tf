# Project Management
resource "github_repository_project" "project" {
  name       = "${var.repo_name}"
  repository = "${var.repo_name}"
}

# Project Columns
resource "github_project_column" "project_columns" {
  project_id = "${github_repository_project.project.id}"
  count  =  "${length(var.project_columns)}" 
  name = "${element(var.project_columns, count.index)}" 

}