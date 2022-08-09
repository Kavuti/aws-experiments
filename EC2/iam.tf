data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "christian_role" {
  name                = "christian_role"

  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json

  tags = {
    service = "ec2"
  }

  inline_policy {
    name = "christian-policy-080822"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ec2:Describe*"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

  lifecycle {
    ignore_changes = [tags, ]
  }
}
