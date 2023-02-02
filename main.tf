resource "aws_ssm_parameter" "Foo1" {
  name  = "Foo1"
  type  = "String"
  value = "BarrA"
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