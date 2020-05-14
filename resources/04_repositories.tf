### Create Repositories ###
# Samuel Nwoye Website Repo, Webhook and Branch Protection
module "samuel_nwoye_website" {
  source = "../modules/githubrepo"
  automation_server_uri = "${var.automation_server_uri}"
  create_branches = ["develop","release"]
  default_branch = "master"
  description = "The Codebase for Samuel Nwoye Website Application"
  events_trigger = ["push", "pull_request", "release"]
  github_webhook_secret = "${local.github_webhook_secret}"
  has_issues = true
  has_projects = true
  protect_branches = ["master","release"]
  private_enabled = false
  repo_name = "${var.project}" 
}

# Define Project Management Board for a Repository
module "samuel_nwoye_website_project" {
  source = "../modules/githubproject"
  project_columns = ["${var.project_columns}"]
  repo_name = "${module.samuel_nwoye_website.repo_name}" 
}

# Samuel Nwoye Website Configuration Repo, Webhook and Branch Protection
module "samuel_nwoye_website_config" {
  source = "../modules/githubrepo"
  automation_server_uri = "${var.automation_server_uri}"
  create_branches = ["develop","release"]
  default_branch = "master"
  description = "The Codebase for Samuel Nwoye Website Server Configuration"
  events_trigger = ["push", "pull_request", "release"]
  github_webhook_secret = "${local.github_webhook_secret}"
  protect_branches = ["master","release"]
  private_enabled = false
  repo_name = "${var.project}-config"
}

# Samuel Nwoye Website Infrastructure Repo, Webhook and Branch Protection
module "samuel_nwoye_website_infra" {
  source = "../modules/githubrepo"
  automation_server_uri = "${var.automation_server_uri}"
  create_branches = ["develop","release"]
  default_branch = "master"
  description = "The Codebase for Samuel Nwoye Website Infrastructure"
  events_trigger = ["push", "pull_request", "release"]
  github_webhook_secret = "${local.github_webhook_secret}"
  repo_name = "${var.project}-infra"
  protect_branches = []   # branch protection for private repo needs upgrade to pro
  private_enabled = true
}

# The Developers Team and Assigned Resources
module "samuel_nwoye_website_dev_resource" {
  source = "../modules/githubteam"
  description = "The Dev Team and their Repository"
  github_administrator = "knoxknot"
  github_users = ["samfiltechnohub"]
  privacy_status = "closed"
  repo_names = ["${module.samuel_nwoye_website.repo_name}"]
  team_name  = "${var.project}-dev"
}

# The Operators Team and Assigned Resources
module "samuel_nwoye_website_op_resource" {
  source = "../modules/githubteam"
  description = "The Dev Team and their Repository"
  github_administrator = "knoxknot"
  github_users = ["knoxknot"]
  privacy_status = "secret"
  repo_names = ["${module.samuel_nwoye_website_config.repo_name}","${module.samuel_nwoye_website_infra.repo_name}"]
  team_name  = "${var.project}-op"
}
