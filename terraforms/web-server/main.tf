terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-3"
}

resource "aws_instance" "instance" {
  count         = var.instance_count
  ami           = "ami-09b7cbc7de5c95f63"
  instance_type = "c5d.2xlarge"
  subnet_id = "subnet-130aaf5e"
  vpc_security_group_ids = [ "sg-0803dfbfc0c77a2f4" ]
  key_name = "r-goto_osaka_ed25519"
  tags = {
    Owner = "r-goto"
    Name = format("RHEL8-${var.policy_name}%02d-demo", count.index + 1)
    Project = "chef-demo"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.policy_name}",  # AWS-node_`uuidgen | grep -o '..$'`",
    ]
    connection {
      host = self.public_ip
      user = "ec2-user"
      type = "ssh"
      private_key = file(var.ssh_key_file)
      timeout = "10m"
    }
  }
  provisioner "local-exec" {
    command = <<-LOCAL
      knife bootstrap ${var.user_name}@${self.public_ip} -N ${self.tags.Name} -i ${var.ssh_key_file} --sudo --policy-group ${var.policy_group} --policy-name ${var.policy_name} -y
    LOCAL
  }
}

output "instance_public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = aws_instance.instance.*.public_ip
}
