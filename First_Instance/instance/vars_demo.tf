
provider "aws" {

    region = "ap-south-1"
  
}


resource "aws_security_group" "allow_tls" {
  name        = "Created by for testing"
  description = "Allow TLS inbound traffic"
  
  

  ingress {
    description      = "TLS-1"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.vpn_ip]
    
  }

    ingress {
    description      = "TLS-2"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpn_ip]
   
  }
}