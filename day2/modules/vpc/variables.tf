variable "vpc_varaibles" {
    description = "VPC related variables"
    type        = map(string)
    default     = {
        vpc_name = "day2_vpc"
        cidr     = "192.168.0.0/16"
        public_subnet_cidr = "192.168.0.0/24"
        private_subnet_cidr = "192.168.1.0/24"
        region  = "us-east-1"

    }
  
}