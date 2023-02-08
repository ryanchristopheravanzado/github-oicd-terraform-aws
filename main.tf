resource "aws_ecr_repository" "x2con-dev" {
  name = "x2con-dev"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "x2con"{
  repository = aws_ecr_repository.x2con-dev.name
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "*"
      }
    ]
  }
  EOF
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
      "image": "sampleimage:latest",
      "memory": 128,
      "cpu": 128
    }
  ]
DEFINITION
}