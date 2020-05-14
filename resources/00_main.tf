### Set the State File Storage Backend ###
# # S3 Backend
# terraform {
#   required_version = ">= 0.11"

#   backend "s3" {
#     encrypt        = true
#     bucket         = "samfil-technohub-resources"
#     dynamodb_table = "samfil-technohub-resources-statelock"
#     key            = "projects/ireland/samuel-nwoye-website/terraform.tfstate"
#     region         = "eu-west-1"
#   }
# }

### Set a Provider ###
# AWS
provider "aws" {
  region                  = "${var.region}"
  profile                 = "${var.profile}"
}

# HTTP
provider "http" {
  version = "~> 1.0"
}

# Github
provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}

### Collect Existing Resources Data ###
# Get the Availability Zones
data "aws_availability_zones" "available" {}

# Get the VPC Data
data "aws_vpc" "aws_default_vpc" {
  tags = { 
    Name = "aws-default" 
  }
}

# Get the Caller IP Address
data "http" "caller_ip" {
  url = "http://ipv4.icanhazip.com"
}

# generate a secret for github webhook
resource "random_string" "github_webhook_secret" {
  length = 32
  special = true
  override_special = "#?/*"
}

# make certain values locally available
locals {
  github_webhook_secret = "${random_string.github_webhook_secret.result}"
}
