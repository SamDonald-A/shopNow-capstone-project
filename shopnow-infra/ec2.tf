resource "aws_instance" "ubuntu"{
  ami           =  var.ami
  instance_type =  var.instance_type
  subnet_id     =  module.vpc.public_subnets[0]
  key_name      =  var.key_name

  tags = {
    Name = var.tag_name
  }
}