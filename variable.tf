#variable vpc-geo{}
variable "vpc-geo" {
  type        = string  
}

#priavte subnetes
variable "private_subnets" {
  type        =  list(string)  
}

#public subnetes
variable "public_subnets" {
  type        =  list(string)  
}

variable env_prefix{}
variable avail_zone{}
variable my-ip{}
variable instance_type{}
variable public_key_location{}
variable private_key_location{}

variable "Route53-geo" {
  type        = string  
}

variable "Route53-instance-geo" {
  type        = string  
}