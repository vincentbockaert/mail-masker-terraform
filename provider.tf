terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1" # Ireland
  # uses environment variables in Terraform Cloud
}

provider "cloudflare" {
  #  CLOUDFLARE_API_TOKEN env var
}
