terraform {
  required_version = "~> 1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83"
    }
  }

  cloud {}
}

provider "aws" {
  region = "ap-northeast-1"
}
