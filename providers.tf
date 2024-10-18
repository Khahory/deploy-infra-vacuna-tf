terraform {
  cloud {
    organization = "vacuna-test"

    workspaces {
      tags = [
        "vacunas"
      ]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.43.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}