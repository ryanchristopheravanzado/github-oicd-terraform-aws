resource "aws_ssm_parameter" "TestData" {
  name  = "TestData"
  type  = "String"
  value = "Lorem"
}