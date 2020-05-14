
# Samfil Nwoye Website Production Static IPs
# output "samuel_nwoye_website_server_static_ip" {
#   value = "${module.monitor_staging_server}"
# }


# Samfil Nwoye Website Repo URLS
output "samuel_nwoye_website_html_url" {
  value = "${module.samuel_nwoye_website.html_url}"
}

output "samuel_nwoye_website_http_clone_url" {
  value = "${module.samuel_nwoye_website.http_clone_url}"
}

output "samuel_nwoye_website_ssh_clone_url" {
  value = "${module.samuel_nwoye_website.ssh_clone_url}"
}

# Samfil Nwoye Website Config Repo URLS
output "samuel_nwoye_website_config_html_url" {
  value = "${module.samuel_nwoye_website_config.html_url}"
}

output "samuel_nwoye_website_config_http_clone_url" {
  value = "${module.samuel_nwoye_website_config.http_clone_url}"
}

output "samuel_nwoye_website_config_ssh_clone_url" {
  value = "${module.samuel_nwoye_website_config.ssh_clone_url}"
}

# Samfil Nwoye Website Infra Repo URLS
output "samuel_nwoye_website_infra_html_url" {
  value = "${module.samuel_nwoye_website_infra.html_url}"
}

output "samuel_nwoye_website_infra_http_clone_url" {
  value = "${module.samuel_nwoye_website_infra.http_clone_url}"
}

output "samuel_nwoye_website_infra_ssh_clone_url" {
  value = "${module.samuel_nwoye_website_infra.ssh_clone_url}"
}
