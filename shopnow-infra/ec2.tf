resource "aws_instance" "ubuntu"{
  ami           =  var.ami
  instance_type =  var.instance_type
  subnet_id     =  module.vpc.public_subnets[0]
  key_name      =  var.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = var.tag_name
  }
}