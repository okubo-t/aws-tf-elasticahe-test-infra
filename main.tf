module "network" {
  source = "./modules/network"

  vpc = {
    name = "${var.prefix}-${var.env}-vpc"
    cidr = "10.0.0.0/16"
  }

  igw_name = "${var.prefix}-${var.env}-igw"

  public_subnet_a = {
    name = "${var.prefix}-${var.env}-public-a"
    cidr = "10.0.1.0/24"
  }

  public_subnet_c = {
    name = "${var.prefix}-${var.env}-public-c"
    cidr = "10.0.2.0/24"
  }

  private_subnet_a = {
    name = "${var.prefix}-${var.env}-private-a"
    cidr = "10.0.10.0/24"
  }

  private_subnet_c = {
    name = "${var.prefix}-${var.env}-private-c"
    cidr = "10.0.20.0/24"
  }
}

# get latest ami Id for amazonlinux2
data "aws_ssm_parameter" "amzn2_ami_latest" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
module "ec2" {
  source = "./modules/ec2"

  ## network
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_a_id
  remote_ip = var.remote_ip

  ## base
  ec2_name      = "${var.prefix}-${var.env}-ec2"
  ami_id        = data.aws_ssm_parameter.amzn2_ami_latest.value
  instance_type = "t3.micro"
  volume_size   = 30
  key_name      = var.key_name

}

module "elasticahe" {
  source = "./modules/elasticahe"

  ## network
  vpc_id         = module.network.vpc_id
  vpc_cidr_block = module.network.vpc_cidr_block
  subnet_ids = [
    module.network.private_subnet_a_id,
    module.network.private_subnet_c_id,
  ]

  ## base for redis(cluster mode disabled)
  cluster_name          = "${var.prefix}-${var.env}-redis"
  node_type             = "cache.t3.micro"
  engine_version        = "5.0.6"
  family                = "redis5.0"
  number_cache_clusters = 2

  ## not available for t1/t2 instances
  automatic_failover_enabled = true

  ## automatic Failover must also be enabled
  multi_az_enabled = true

}
