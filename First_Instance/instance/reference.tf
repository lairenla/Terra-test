provider "aws" {

 region = "ap-south-1"
}

resource "aws_instance" "imobi_test" {
    ami = "ami-0f1fb91a596abf28d"
    instance_type = "t2.micro"
  
}

resource "aws_eip" "lb" {
  vpc = true
   
}

output "eip" {
  
  value = aws_eip.lb.public_ip

}

resource "aws_s3_bucket" "mys3" {
    bucket = "imobi-test-s3"
  
}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.imobi_test.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"]
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
}
