
provider "aws" {

}  

# create VPC
resource "aws_vpc" "vpc-geo" {
  cidr_block = var.vpc-geo
  tags = {
    Name = "${var.env_prefix}-vpc-geo"
  }
}


module geo-vpc {
source = "./modules/VPC"
vpc-geo = var.vpc-geo 
private_subnets = var.private_subnets
public_subnets = var.public_subnets
env_prefix = var.env_prefix
avail_zone = var.avail_zone
my-ip = var.my-ip
}

module geo-EC2 {
source =  "./modules/EC2"  
vpc-geo = var.vpc-geo
private_subnets = var.private_subnets
avail_zone = var.avail_zone
instance_type = var.instance_type
my-ip = var.my-ip
public_key_location = var.public_key_location
}

module geo-S3 {
source =  "./modules/S3"  
env_prefix = var.env_prefix
}

module geo-Route53 {
source =  "./modules/Route53"  
env_prefix = var.env_prefix
vpc-geo = var.vpc-geo
private_subnets = var.private_subnets
Route53-geo = var.Route53-geo
Route53-instance-geo = var.Route53-instance-geo
}










