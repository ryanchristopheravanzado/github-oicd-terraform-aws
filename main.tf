provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_ecr_repository" "example" {
  name = "example-repo"
}

data "template_file" "docker_image_tag" {
  template = "{{timestamp}}"

  vars = {
    timestamp = timestamp()
  }
}

locals {
  image_name = "${aws_ecr_repository.example.name}:${data.template_file.docker_image_tag.rendered}"
}

resource "aws_ecr_image" "example" {
  name        = local.image_name
  repository  = aws_ecr_repository.example.name
  image_tag   = data.template_file.docker_image_tag.rendered
}
