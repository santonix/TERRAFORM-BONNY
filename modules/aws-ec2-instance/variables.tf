variable "ami" {
  description = "the id of the ami to use for ec2 inatance"
}
variable "instance_type" {
  description = "the of ec2 instance to create"
}

variable "subnet_id" {
  description = "the id of the subnet where the ec2 instance will be launched"
}

variable "security_group_id" {
  description = "the id of the sg to attach to the ec2 instance"
}