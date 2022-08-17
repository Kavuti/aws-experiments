resource "aws_ebs_volume" "christian_volume" {
  availability_zone = "eu-west-3a"
  size              = 8

  type = "gp2"

  tags = {
    Name = "ChristianVolume"
  }
}
