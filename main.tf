resource "aws_ssm_parameter" "Testname" {
  name  = "Testname"
  type  = "String"
  value = "barr"
}