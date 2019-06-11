terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
  access_key = "AKIATFJCZQ5LRVIPZZOA"
  secret_key = "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"
}

resource "aws_instance" "awslinux" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"
  user_data = "${data.template_file.user_data.rendered}"
  key_name = "${var.key_name}"
 tags {
    Name = "${var.name}"
  }
}

data "template_file" "user_data" {
  template = "${file("user_data/user_data.sh")}"   
  vars {
     name = "${var.name}"
      }
   }
