# resource "aws_iam_policy" "christian_policy" {
#   name = "christian-policy-080822"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = ["ec2:Describe*"]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }

# resource "aws_iam_role" "christian_role" {
#   name                = "christian_role"
#   assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json # (not shown)
#   managed_policy_arns = [aws_iam_policy.christian_policy.arn, ]

#   tags = {
#     service = "ec2"
#   }

#   lifecycle {
#     ignore_changes = [tags, ]
#   }
# }
