/* differents varaibles types and theirs arguments:
    type : specifies the type of value accepted by the variable(e.g  string, number, bool, list, obvject, map, and any)
    default: sets the default value for the variable...
    description: a human friendly descrription of the variable
    validation: defines the validation rules
    sesnsitive: makes sure that the value is not display in plaintext if set to true..
*/

#    **********TYPE *****************
#        string type examples:
variable "environment" {
  description = "Rnvironment name(e.g dev, staging,prod)"
  type        = string

}

variable "ami_id" {
  description = "EC2 instance AMI ID"
  type        = string
}

variable "database_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

#multi-line string variable
variable "public_key" {
  type    = string
  default = <<E0F
this is a long key.
several lines.
E0F    
}

# number 
variable "instance_count" {
  description = " the number of instance to be created"
  type        = number
  default     = " the chosen integer"
}

# bool: represents boolean values which can be either true or false...
variable "enable_monitoring" {
  description = " enable monitoring for nresources"
  type        = bool
  default     = "true or false"
}

# list
variable "availability_zones" {
  description = "list of availability zones"
  type        = list(string)
}

# object
variable "network settings" {
  type = object({
    subnet_id         = string
    security_group_id = string
    vpc_id            = string
  })

}

# map
variable "instance_tags" {
  description = "map of instance tags"
  type        = map(string)
}

# variable validation
variable "instance_count" {
  description = "number of instances to create"
  type        = number
  default     = 1

  validation {
    condition     = var.instance_count < 5
    error_message = "the instance count must be less than 5"
  }
}

variable "environment" {
  description = "Environment name(e.g dev, staging, prod)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+", var.environment))
    error_message = "invalid environment name. use lowercase letters, numbers, and hyphens only"

  }
}

variable "bucket_name" {
  description = "s3 bucket name"
  type        = string

  validation {
    condition     = lenght(var.bucket_name) >= 5 && lenght(var.name) <= 30
    error_message = "Name must be between 5 and 30 characters long"
  }
}