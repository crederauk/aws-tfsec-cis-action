resource "aws_cloudtrail" "cloudtrail" {
  name                       = "cloudtrail"
  s3_bucket_name             = "bucket"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.yada.arn}:*"
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"
}