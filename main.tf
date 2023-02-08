resource "aws_ecr_repository" "x2con-dev" {
  name = "x2con-dev"
}

data "aws_ecr_repository" "x2con-dev" {
  name = aws_ecr_repository.x2con-dev.name
}

provider "aws" {
  region = "ap-southeast-1"
}

locals {
  repository_uri = data.aws_ecr_repository.x2con-dev.repository_uri
}

resource "aws_ecs_task_definition" "x2con" {
  family = "x2con-dev-webapps"

  container_definitions = <<DEFINITION
  [
    {
      "name": "example",
      "image": "${local.repository_uri}:latest",
      "memory": 128,
      "cpu": 128
    }
  ]
DEFINITION
}