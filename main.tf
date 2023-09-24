
resource "aws_instance" "test-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.test-public-1.id
  vpc_security_group_ids = [aws_security_group.test-poc-security.id]
  tags = {
    Name = "my-test-web"
  }
}

resource "aws_ebs_volume" "test-volume" {
  availability_zone = var.ZONE1
  size              = 20
  tags = {
    Name = "test-volume-20"
  }
}

resource "aws_volume_attachment" "test-volume-attach" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.test-volume.id
  instance_id = aws_instance.test-web.id
}

output "PublicIP" {
  value = aws_instance.test-web.public_ip
}
