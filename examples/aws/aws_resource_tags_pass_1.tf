resource "aws_s3_bucket" "test-aws-1" {
  bucket = "aws-tfsec-demo-bucket1-e5f7e696-6efc-11ec-90d6-0242ac120003"
  acl    = "private"
  tags   = {
    Environment = "environment",
    CreatedBy   = "terraform",
    Project     = "tfsec-custom-tests"
  }
  
  versioning {
    mfa_delete = true
  }
}

resource "aws_cloudtrail" "test-aws-2" {
  name           = "cloudtrail"
  s3_bucket_name = "bucket"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.yada.arn}:*"
  tags           = var.tags
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"
  tags = var.tags
}

variable "tags" {
  default = {
    Environment = "environment",
    CreatedBy   = "terraform",
    Project     = "tfsec-custom-tests"
  }
}
