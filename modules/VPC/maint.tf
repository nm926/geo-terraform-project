
#create geo-subnet-private
resource "aws_subnet" "private1" {
   vpc_id = var.vpc-geo_id
   cidr_block = var.private_subnets[0]
  
   tags = {
    Name ="${var.env_prefix}-private"
  }
}


#create geo-subnet-private
resource "aws_subnet" "private2" {
  vpc_id = var.vpc-geo_id
  cidr_block = var.private_subnets[1]
   tags = {
    Name ="${var.env_prefix}-private1"
  }
}


#create geo-subnet-public
resource "aws_subnet" "public1" {

  vpc_id = var.vpc-geo_id
  cidr_block = var.public_subnets[0]
  
   tags = {
    Name ="${var.env_prefix}-public"
  }
}


#create geo-subnet-public
resource "aws_subnet" "public2" {
  vpc_id = var.vpc-geo_id
  cidr_block = var.public_subnets[1]
   tags = {
    Name ="${var.env_prefix}-public1"
  }
}






#aws_internet_gateway
resource "aws_internet_gateway" "geo-igw" {  
vpc_id = var.vpc-geo_id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
  }


resource "aws_default_route_table" "d-route-1" {
  default_route_table_id =  var.vpc-geo_id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.geo-igw.id
  }

}

