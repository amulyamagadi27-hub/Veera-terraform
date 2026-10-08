variable "ami_id" {
  description = "This is the ami id to use for EC2 instance"
  default     = "ami-08e3b3155fc937a94"
}

variable "instance_type" {
  description = "This is the instance type to use for EC2 instance"
  default     = "t3.micro"
}
