# Create Team
resource "github_team" "team" {
  name        = "${var.team_name}"
  description = "${var.description}"
  privacy     = "${var.privacy_status}"
}
# Assign Members to Team
resource "github_team_membership" "team_members" {
  team_id  = "${github_team.team.id}"
  count  =  "${length(var.github_users)}" 
  username = "${element(var.github_users, count.index)}"
  role     = "${element(var.github_users, count.index) == "${var.github_administrator}" ? "maintainer" : "member"}"
}

# Assign a Repositories to Team
resource "github_team_repository" "team_repo" {
  team_id  = "${github_team.team.id}"
  count  =  "${length(var.repo_names)}" 
  repository = "${element(var.repo_names, count.index)}" 
  permission = "push"
}