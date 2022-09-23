# aws ami data
data "aws_ami" "latest-amazon-linux-image" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


######## key-pair, public & private ############################

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file (var.public_key_location)

}

########## Create T2 instancne #####################
resource "aws_instance" "ami-instance" {
  ami           = "data.aws_ami.latest-amazon-linux-image"
  instance_type = var.instance_type
  subnet_id = var.private_subnets[0]
  availability_zone = var.avail_zone
  associate_public_ip_address = true
  key_name = aws_key_pair.deployer.key_name

 }

 