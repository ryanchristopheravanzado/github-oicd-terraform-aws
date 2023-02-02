resource "aws_ssm_parameter" "Foo1" {
  name  = "Foo1"
  type  = "String"
  value = "Barr1"
}

resource "aws_ssm_parameter" "Foo2" {
  name  = "Foo2"
  type  = "String"
  value = "Barr2"
}

resource "aws_ssm_parameter" "Foo3" {
  name  = "Foo3"
  type  = "String"
  value = "Barr3"
}