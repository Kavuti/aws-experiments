resource "aws_iam_user" "christian_user" {
  name = "christian"
  path = "/users/"
  tags = {
    tool = "terraform"
  }
}

resource "aws_iam_group" "developers_group" {
  name = "developers"
  path = "/users/"
}

resource "aws_iam_user_group_membership" "christian_membership" {
  user = aws_iam_user.christian_user.name

  groups = [
    aws_iam_group.developers_group.name,
  ]
}

resource "aws_iam_account_alias" "alias" {
  account_alias = "christiancavuti"
}

resource "aws_iam_group_policy" "developers_policy" {
  name  = "developers_policy"
  group = aws_iam_group.developers_group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["iam:ChangePassword", ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
