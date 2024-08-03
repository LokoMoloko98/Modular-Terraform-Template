terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "tls" {
  proxy {
    url = "https://corporate.proxy.service"
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "Automation" = "terraform"
      "Project"    = var.project_name
    }
  }
}