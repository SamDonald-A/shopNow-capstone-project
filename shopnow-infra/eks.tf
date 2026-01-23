module "eks" {
  source = "github.com/SamDonald-A/Terraform-Ansible//Terraform/EKS/tf-code/modules/eks?ref=main"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Pass the required arguments
  account     = var.account
  environment = var.environment

  vpc_cni_role_name = var.vpc_cni_role_name
  aws_lbc_role_name = var.aws_lbc_role_name
  region            = var.region
  tags              = var.tags
}
