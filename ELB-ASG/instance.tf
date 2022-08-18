data "aws_ami" "amazon_linux_ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-02d0b1ffa5f16402d"] # Amazon Linux with kernel 5.0 x86
  }
}

resource "aws_security_group" "christian_security_group" {
  name        = "christian_security_group"
  description = "This security group allows HTTP/S traffic and SSH"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "All"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Tests"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_launch_template" "christian_launch_template" {
  image_id             = data.aws_ami.amazon_linux_ami.id
  name                 = "christian_launch_template"
  instance_type        = "t2.micro"
  user_data            = filebase64("${path.module}/ec2-user-data.sh")
  security_group_names = [aws_security_group.christian_security_group.name, ]
}

resource "aws_autoscaling_group" "christian_auto_scaling" {
  name               = "christian-auto-scaling"
  availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  max_size           = 3
  min_size           = 1
  desired_capacity   = 2
  target_group_arns  = [aws_lb_target_group.christian_lb_target_group.arn]


  launch_template {
    id      = aws_launch_template.christian_launch_template.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}
