provider "aws" {
  region = "ap-southeast-1"
}

locals {
  image_tag = "latest"
  image_name = "${data.docker_image.example.name}"
  repository_uri = "${aws_ecr_repository.example_repository.repository_url}"
}

data "docker_image" "example" {
  name = "example_image:${local.image_tag}"
}

resource "aws_ecr_repository" "example_repository" {
  name = "example_repository"
}

data "aws_ecr_login" "this" {}


resource "docker_image" "example" {
  name = "${local.image_name}"
  push = true

  build {
    context = "."
  }

  image_name = "${local.repository_uri}:${local.image_tag}"
}
