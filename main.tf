variable "project" {
  type    = string
  default = "infrastructure"
}

variable "env" {
  type    = string
  default = "dev"
}

resource "aws_s3_bucket" "infra_docs" {
  bucket = "${var.project}-docs-${var.env}"
}

resource "aws_s3_object" "gitignore" {
  bucket  = aws_s3_bucket.infra_docs.id
  key     = ".gitignore"
  content = "Add gitignore content here"
}

resource "aws_s3_object" "readme" {
  bucket  = aws_s3_bucket.infra_docs.id
  key     = "README.md"
  content = "Add README content here"
}