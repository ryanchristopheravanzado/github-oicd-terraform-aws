resource "aws_ssm_parameter" "Foo" {
  name  = "Foo"
  type  = "String"
  value = "Barr"
}