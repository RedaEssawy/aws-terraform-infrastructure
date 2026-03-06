
module "ec2_web" {
    source = "./modules/ec2"
    public_subnet_id = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
    
  
}
module "s3_bucket" {
    source = "./modules/s3"
  
}
module "vpc" {
    source = "./modules/vpc"
  
}