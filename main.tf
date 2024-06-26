provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "bastion1" {
  ami           = "ami-0551ce4d67096d606"
  instance_type = "t2.micro"
  tags = {
    Name = "Jenkins-Instance"
  }
}
