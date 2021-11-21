provider "aws" {

    region = "ap-south-1"
  
}

variable  "elb_names" {
    type = list
    default = ["dev-loadbalacer", "stage-loadbalancer", "prod-loadbalancer", "test-loadbalancer" ]

  
}

resource "aws_iam_user" "lb" {
    name = var.elb_names[count.index]
    count = 4
    
  
}