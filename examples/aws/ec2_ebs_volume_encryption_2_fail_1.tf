#tfsec:ignore:cus-aws-resource-tags
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#tfsec:ignore:cus-aws-resource-tags
resource "aws_instance" "ec2" {
  instance_type = "t2.nano"
  ami           = data.aws_ami.ubuntu.id
  ebs_block_device {
    device_name = "device"
  }
}