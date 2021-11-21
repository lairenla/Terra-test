provider "aws" {

    region = var.region
  
}


locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ",timestamp())
}

variable "region" {
    default = "ap-south-1"
  
}

variable "tags" {

    type = list
    default = ["firstec2", "secondec2"]
  
}

variable "ami" {
    type = map
    default = {

        "us-east-1" = "ami-0108d6a82a783b352"
        "ap-south-1" = "ami-0108d6a82a783b352"
    }
  
}

resource "aws_key_pair" "login" {
    key_name = "deploy-new"
    public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "imobi" {
    ami = lookup(var.ami,var.region)
    instance_type = "t2.micro"
    key_name = aws_key_pair.login.key_name
    count = 2
    
    tags = {
      Name = element(var.tags, count.index)
    }
}

output "timestamp" {

    value = local.time
  
}



