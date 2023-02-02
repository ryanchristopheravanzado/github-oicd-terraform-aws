resource "aws_ssm_parameter" "Foo" {
  name  = "Foo"
  type  = "String"
  value = "Barr"
}

resource "aws_ssm_parameter" "Foo2" {
  name  = "Foo2"
  type  = "String"
  value = "BarrB"
}

resource "aws_ssm_parameter" "Foo3" {
  name  = "Foo3"
  type  = "String"
  value = "BarrC"
}

resource "aws_iam_user" "userdata" {
  name = "testdata"
}

resource "aws_iam_user" "userdata1" {
  name = "testdata1"
}