output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "eks_private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_ip" {
   value = aws_instance.ubuntu.public_ip
}