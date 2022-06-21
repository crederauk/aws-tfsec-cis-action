#tfsec:ignore:cus-aws-resource-tags
resource "aws_s3_bucket" "demo_bucket1" {
  bucket = "aws-tfsec-demo-bucket1-e5f7e696-6efc-11ec-90d6-0242ac120003"
  acl    = "private"
}