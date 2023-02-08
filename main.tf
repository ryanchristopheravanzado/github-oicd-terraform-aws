resource "aws_ecr_repository" "x2con-dev" {
  name = "x2con-dev"
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "docker" {
  
}