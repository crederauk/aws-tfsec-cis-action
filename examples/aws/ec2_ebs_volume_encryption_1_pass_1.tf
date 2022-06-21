#tfsec:ignore:cus-aws-resource-tags
data "aws_ebs_volume" "ebs" {
  encrypted = true
}