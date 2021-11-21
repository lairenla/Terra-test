provider "aws" {

 region = "ap-south-1"
}

resource "aws_instance" "imobi_test" {
    ami = "ami-0f1fb91a596abf28d"
    instance_type = "t2.micro"
  
}

