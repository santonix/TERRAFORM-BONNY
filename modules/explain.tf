/*with module , we can create an ec2 instance by calling it in our root terraform configuration...
provider "aws" {
    region = "us-east-2"
}

module "ec2_instances" {
    source = "./path/to/module"(local path)
    ami = "ami-*
    instance_type = "t2.micro"
    subnet_id = "subnet-*"
    security_group_id = "sg-*"

}

output "instance_id" {
    description = "the id of the created instane"
    value = aws_instance.example_instance.id 
}

output "public_ip" {
    description = "the  public ip address of the ec2 instance"
    value = aws_instance.example_instance.public_ip
}

modules can be stored in :  local paths
                            terraform registry
                            git repository

####### local path:
      we  store modules directly in our terraform project directory or in subdirectory
      a local directory must begin with either ./ or ../ to indicate the local  path
        module "instance" {
            source = "../modules/aws-ec2-instance"
        }
        ##### when stored in terraform registry:
        module "instance" {
            source = "hashicorp/ec2-instance/aws"
            version = "0.1.0"
        }

        #### when stored in git repository
        module "instance" {
            source = "github.com/aws-modules/aws-ec2-instance"
            version = "0.1.0"(git tag)
        }
        module "instance" {
            source = "git@github.com:aws-modules/aws-ec2-instance.git"
        }
*/                                    