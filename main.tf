resource "aws_ecr_repository" "x2con-dev" {
  name = "x2con-dev"
}

data "aws_ecr_repository" "x2condev" {
  name = aws_ecr_repository.x2con-dev.name
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_ecs_task_definition" "x2con" {
  family = "x2con-dev-webapps"

  container_definitions = <<DEFINITION
  [
    {
      "name": "example",
      "image": "${data.aws_ecr_repository.x2condev.repository_uri}:latest",
      "memory": 128,
      "cpu": 128
    }
  ]
DEFINITION
}