resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  value = "sampleval"
  path = "/system/"
}