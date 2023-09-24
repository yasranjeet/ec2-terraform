resource "aws_instance" "example" {
  ami           = "ami-0fc9e52ba2aedb00d"
  instance_type = "t2.micro"
}