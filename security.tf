
resource "aws_security_group" "test-poc-security"{
  vpc_id      = aws_vpc.test-vpc.id
  name        = "test-poc-security"
  description = "Sec Grp for test ssh"
  egress{
    from_port = 0
    to_port =   0
    protocol ="tcp"
    cidr_blocks =["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.test_ip]
  }
  tags ={
    Name = "allow-ssh"
  }
}