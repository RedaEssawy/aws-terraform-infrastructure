# ami variable for the public EC2 instance
variable "public_instance_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ecb62995f68bb549"
  
}
# tags variable for the public EC2 instance
variable "public_instance_ec2_tags" {
  description = "Tags for the EC2 instance"
  type        = string
  default     = "public-ec2-instance"
  
}
# subnet ID variable for the public EC2 instance
variable "public_subnet_id" {
  description = "Subnet ID for the public EC2 instance"
  type        = string
  default     = "subnet-0bb1c79de3EXAMPLE"
  
}
# ami variable for the private EC2 instance
variable "private_instance_ami" {
  description = "AMI ID for the private EC2 instance"
  type        = string
  default     = "ami-0ecb62995f68bb549"
  
}
# tags variable for the private EC2 instance
variable "private_instance_ec2_tags" {
  description = "Tags for the private EC2 instance"
  type        = string
  default     = "private-ec2-instance"
  
}
# subnet ID variable for the private EC2 instance
variable "private_subnet_id" {
  description = "Subnet ID for the private EC2 instance"
  type        = string
  default     = "subnet-0bb1c79de3EXAMPLE"
  
}