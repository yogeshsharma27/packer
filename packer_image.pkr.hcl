packer {

  required_plugins {

    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }

  }

}

source "amazon-ebs" "linux" {


  ami_name      = "linux-packer-ansible-test1"

  instance_type = "t2.micro"

  region        = "ap-south-1"

  ssh_username = "ec2-user"

  source_ami   =  "ami-0d951b011aa0b2c19"  #for linux

  associate_public_ip_address  = true

  subnet_id       ="subnet-07c83fc3bd10d7f51"

  vpc_id         = "vpc-0e2ee9e43862b30c1"

  }

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.linux"
  ]

provisioner "shell" {
  script = "playbook.sh"
    #"amazon-linux-extras install ansible2"
  
}

#communicator = ""

}
