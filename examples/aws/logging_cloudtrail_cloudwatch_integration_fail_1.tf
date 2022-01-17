resource "aws_cloudtrail" "cloudtrail" {
  name           = "cloudtrail"
  s3_bucket_name = "bucket"
}