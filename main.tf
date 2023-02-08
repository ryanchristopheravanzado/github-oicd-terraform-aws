resource "aws_ecr_repository" "x2con-dev" {
  name = "x2con-dev"
}

data "aws_ecr_repository" "x2con-dev" {
  name = aws_ecr_repository.x2con-dev.name
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "docker" {

}

locals {
  repository_uri = data.aws_ecr_repository.x2con-dev.repository_uri
}

resource "null_resource" "example_image" {
  provisioner "local-exec" {
    command = <<EOT
      docker build -t ${local.repository_uri}:latest .
      $(aws ecr get-login --no-include-email --region us-west-2)
      docker push ${local.repository_uri}:latest
    EOT
  }
}