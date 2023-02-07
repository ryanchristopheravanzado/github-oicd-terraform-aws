resource "aws_ecr_repository" "x2con" {
  name = "x2con-dev"
}

locals {
  image_tag = "latest"
}

data "docker_image" "example" {
  name = "example_image:${local.image_tag}"
}

locals {
  image_name = "${data.docker_image.example.name}"
  image_tag = "${local.image_tag}"
  repository_uri = "${aws_ecr_repository.example_repository.repository_url}"
}

resource "docker_image" "example" {
  name = "${local.image_name}"
  push = true

  build {
    context = "."
  }

  image_name = "${local.repository_uri}:${local.image_tag}"
}