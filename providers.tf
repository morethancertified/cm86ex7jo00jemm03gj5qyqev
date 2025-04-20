terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0, != 5.0.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}