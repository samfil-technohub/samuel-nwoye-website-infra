# Create Repo
resource "github_repository" "repository" {
  name = "${var.repo_name}"
  auto_init = true
  default_branch = "${var.default_branch}"
  description = "${var.description}"
  has_issues = "${var.has_issues}"
  has_projects = "${var.has_projects}"
  license_template = "mit"
  private = "${var.private_enabled}"
}

# Create Branches in Repo
resource "github_branch" "branches" {
  count  =  "${length(var.create_branches)}"
  repository = "${github_repository.repository.name}"
  branch     = "${element(var.create_branches, count.index)}"
}

# Protection Release and Master Branches
resource "github_branch_protection" "branch_protection" {
  count  =  "${length(var.protect_branches)}"
  repository     = "${github_repository.repository.name}"
  branch         = "${element(var.protect_branches, count.index)}"
  enforce_admins = true

  # required_status_checks {
  #   strict   = false
  #   contexts = ["continuous-integration/jenkinsci"]
  # }

  depends_on = ["github_branch.branches"]
}

# Define a Webhook for this Repository
resource "github_repository_webhook" "repository_webhook" {
  repository = "${github_repository.repository.name}"

  configuration {
    url          = "http://${var.automation_server_uri}/github-webhook/"
    content_type = "form"
    insecure_ssl = false
    secret       = "${var.github_webhook_secret}"
  }

  active = true
  events = "${var.events_trigger}"
}
