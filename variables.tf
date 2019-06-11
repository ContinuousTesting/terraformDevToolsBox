variable "aws_region" {
  description = "AWS region"
  default = "us-west-2"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is AWS Base Image"
  default = "ami-0e63f50857fdc1f9f"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "devhost"
}
variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = "true"
}

variable "key_name" {
  description = "Name the key you will use to access the instance "
  default     = "devopslab"
  }




