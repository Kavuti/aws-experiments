data "aws_ami" "amazon_linux_ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-02d0b1ffa5f16402d"] # Amazon Linux with kernel 5.0 x86
  }
}

resource "aws_iam_instance_profile" "christian_instance_profile" {
  name = "christian_instance_profile"
  role = aws_iam_role.christian_role.name
}

resource "aws_instance" "christian_instance" {
  ami           = data.aws_ami.amazon_linux_ami.id
  instance_type = "t2.micro"
  
  iam_instance_profile = aws_iam_instance_profile.christian_instance_profile.name

  security_groups = [aws_security_group.christian_security_group.name, ]

  tags = {
    Name = "Christian Machine"
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
