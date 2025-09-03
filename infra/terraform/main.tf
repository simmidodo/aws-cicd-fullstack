resource "aws_s3_bucket" "dummy" {
  bucket        = "${var.project}-bucket-demo"
  force_destroy = true
  tags = {
    Project = var.project
  }
}
