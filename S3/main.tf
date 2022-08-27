resource "aws_s3_bucket" "christian_bucket" {
  bucket = "christian-cavuti-bucket-2708221829"

  tags = {
    Name        = "Christian Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_object" "christian_bucket_index" {
  bucket       = aws_s3_bucket.christian_bucket.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"

  etag = filemd5("./index.html")
}

data "aws_iam_policy_document" "public_access_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = [
      aws_s3_bucket.christian_bucket.arn,
      "${aws_s3_bucket.christian_bucket.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "christian_bucket_policy" {
  bucket = aws_s3_bucket.christian_bucket.id
  policy = data.aws_iam_policy_document.public_access_policy.json
}

resource "aws_s3_bucket_versioning" "christian_bucket_versioning" {
  bucket = aws_s3_bucket.christian_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "christian_website" {
  bucket = aws_s3_bucket.christian_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}
