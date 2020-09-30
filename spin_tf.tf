provider aws {
  profile = "default"
  region  = "us-east-2"
}
terraform {
  backend "s3" {
    bucket = "first-del-devops-bucket"
    key    = "mtyfile.tfstate"
    region = "us-east-2"
  }
}

resource "aws_instance" "my_ec2" {
  ami                    = "ami-04cd019702b8c27b8"
  instance_type          = "t2.micro"
  key_name               = "devops_key"
  vpc_security_group_ids = [aws_security_group.demo_1.id]

  tags = {
    Name        = "My First Terraform node_1"
    Provisioner = "Terraform"
  }
}
