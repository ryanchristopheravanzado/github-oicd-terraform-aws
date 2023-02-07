resource "aws_ecr_repository" "x2con" {
  name = "x2con-dev"
}

locals {
  image_name = "${data.docker_image.example.name}"
  image_tag = "latest"
  repository_uri = "${aws_ecr_repository.x2con.name}"
}

data "docker_image" "example" {
  name = "example_image:${local.image_tag}"
}
resource "docker_image" "example" {
  name = "${local.image_name}"
  push = true

  build {
    context = "."
  }

  image_name = "${local.repository_uri}:${local.image_tag}"
}