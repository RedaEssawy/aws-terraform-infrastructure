# Create a public EC2 instance
resource "aws_instance" "public_instance" {
  ami = var.public_instance_ami
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_id
  tags = {
    
    Name = var.public_instance_ec2_tags
  }
  
}   
# Create a private EC2 instance
resource "aws_instance" "private_instance" {
  ami = var.private_instance_ami
  subnet_id = var.private_subnet_id
  instance_type = "t2.micro"

  tags = {
    
    Name = var.private_instance_ec2_tags
  }
  
}