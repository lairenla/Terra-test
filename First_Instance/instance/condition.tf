provider "aws" {
    region = "ap-south-1"

  
}

variable "istest" {
  
}



resource "aws_instance" "dev" {
    ami = "ami-0108d6a82a783b352"
    instance_type = "t2.micro"
    count = var.istest == true ? 1 : 0
}


resource "aws_instance" "prod" {
    ami = "ami-0f1fb91a596abf28d"
    instance_type = "t2.micro"
    count = var.istest == false ? 2 : 0 
}