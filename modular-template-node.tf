data "aws_ssm_parameter" "route_53_hostzone_id" {
  name            = "route_53_hostzone_id"
  with_decryption = true
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh")
  vars = {
    region   = var.region
    hostzone = data.aws_ssm_parameter.route_53_hostzone_id.value
  }
}

resource "tls_private_key" "modular-template-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "modular-template_auth" {
  key_name   = var.ssh-key-pair
  public_key = tls_private_key.modular-template-ssh-key.public_key_openssh
}

resource "aws_instance" "modular-template-node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.modular-template_auth.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.id
  user_data              = data.template_file.user_data.rendered
  vpc_security_group_ids = [aws_security_group.security_group.id]
  subnet_id              = aws_subnet.public_subnet_az1.id

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "30"
    delete_on_termination = "true"
    encrypted             = "true"
  }

  # provisioner "local-exec" {
  #   command = templatefile("${var.host_os}-ssh-config.tpl", {
  #     hostname = self.public_ip,
  #     user     = "ec2-user",
  #   identityfile = "~/.ssh/'${var.ssh-key-pair}'.pem" })
  #   interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  # }
}
