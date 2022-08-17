data "aws_ami" "amazon_linux_ami" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-02d0b1ffa5f16402d"] # Amazon Linux with kernel 5.0 x86
  }
}

resource "aws_instance" "christian_volume_instance" {
  availability_zone = "eu-west-3a"
  ami               = data.aws_ami.amazon_linux_ami.id
  instance_type     = "t2.micro"

  tags = {
    Name = "Christian Volume Instance"
  }

  root_block_device {
    volume_size = aws_ebs_volume.christian_volume.size
    volume_type = aws_ebs_volume.christian_volume.type
    tags        = aws_ebs_volume.christian_volume.tags
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

output "aws_instance_ip" {
  value = aws_instance.christian_volume_instance.public_ip
}
