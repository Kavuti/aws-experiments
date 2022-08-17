resource "aws_launch_template" "christian_launch_template" {
  name          = "christian_launch_template"
  instance_type = "t2.micro"
}

resource "aws_security_group" "christian_lb_sg" {
  name        = "christian_lb_sg"
  description = "Security group for Christian Load Balancer"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Christian Load Balancer Security Group"
  }

  lifecycle {
    ignore_changes = [tags, ]
  }
}

resource "aws_lb" "christian_load_balancer" {
  name               = "christian-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.christian_lb_sg.id]
  subnets            = data.aws_subnets.default_subnets.ids
}

resource "aws_lb_target_group" "christian_lb_target_group" {
  name     = "christian-lb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default_vpc.id
}

resource "aws_lb_target_group_attachment" "christian_lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.christian_lb_target_group.arn
  target_id        = aws_instance.christian_instance.id
  port             = 80
}
