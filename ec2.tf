provider "aws" {
    region = "us-east-1"
}
variable "az" {
    type = list
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
  resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = var.az
 
  access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }
 
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
