data "aws_vpc" "default_vpc" {
  filter {
    name   = "is-default"
    values = ["true", ]
  }
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

output "subnets" {
  value = data.aws_subnets.default_subnets
}
