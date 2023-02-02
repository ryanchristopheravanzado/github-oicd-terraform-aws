resource "aws_ssm_parameter" "Test" {
  name  = "Test"
  type  = "String"
  value = "Lorem ipsum dolor sit amet"
}