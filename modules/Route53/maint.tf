resource "aws_route53_zone" "intrenal_zone" {
  name = var.Route53-geo

  vpc {
    vpc_id = "var.vpc-geo.id"
  }
}


resource "aws_route53_zone" "geo_zone" {
  name = var.Route53-instance-geo

  vpc {
    vpc_id = "var.vpc-geo.id"
  }
}


resource "aws_route53_record" "geo_record" {
 allow_overwrite = true
  name            = var.Route53-instance-geo
  ttl             = 172800
   type            = "A"
 zone_id         = aws_route53_zone.geo_zone.id

  records = [
    var.private_subnets[0]

  ]
    
}