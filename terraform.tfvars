
vpc-geo = "192.168.0.0/16"
private_subnets = ["192.168.60.0/24", "192.168.70.0/24"]
public_subnets = ["192.168.80.0/24", "192.168.90.0/24" ]
env_prefix = "geo"
avail_zone = "ap-southeast-1"
my-ip = "103.251.19.230/32" # my public IP 
instance_type = "t3.nano"
public_key_location = "C:/Users/Nilesh Mishra/.ssh/id_rsa.pub"
private_key_location = "C:/Users/Nilesh Mishra/.ssh/id_rsa"
Route53-geo = "geo-terraform-test.com"
Route53-instance-geo = "instance-test.geo-terraform-test.com"