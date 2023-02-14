provider "aws" {
region = "us-west-1"
access_key = "AKIA46VRXQNHQAORQRM2"
secret_key = "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"
}
resource "aws_instance" "web" {
 ami = "ami-0d50e5e845c552faf"
 instance_type = "t2.micro"
 vpc_security_group_ids=["sg-02e61fe31274fd53e"]
 user_data = <<-EOF
 #!/bin/bash
 wget -O - https://gist.githubusercontent.com/kdk2933/69cb1744eedc930b8bd1efd9f2b3a0b3/raw/a3b5e3441a675287d9b84489ec35a6d16da49382/ubuntudockerCEinstall.sh | bash
 sudo apt install docker-compose -y
 EOF
 tags={
 Name="nodemongodockterra"
 }
}
