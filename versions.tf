terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.27.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 1.2.5"
}
