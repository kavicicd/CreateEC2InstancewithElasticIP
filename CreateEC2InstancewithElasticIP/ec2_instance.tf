resource "aws_instance" "ec2_instance" {
  ami           = "ami-0a5ac53f63249fba0" # Need to change AMI ID as per your aws region, bcoz AMI ID are different in each region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "terraform_ec2_jenkins" # Update with the key pair name

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = "MyEC2Instance"
  }
}
