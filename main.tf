
resource "aws_instance" "test-web" {
  count                  = var.instance_count
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.test-public-1.id
  vpc_security_group_ids = [aws_security_group.test-poc-security.id]
  tags = {
    Name = "my-test-web-${count.index + 1}"
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
  count = var.count_attachment
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.test-volume.id
  instance_id = aws_instance.test-web[count.index].id
}

# output "PublicIP" {
#   value = aws_instance.test-web[count.index].public_ip
# }
