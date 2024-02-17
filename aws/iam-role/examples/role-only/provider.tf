terraform {
  required_version = "1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }
  }

  cloud {}
}

provider "aws" {
  region = "ap-northeast-1"
}
