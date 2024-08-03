output "ec2-vm-ip" {
  value = aws_instance.modular-template-node.public_ip
}

output "private_key" {
  value     = tls_private_key.modular-template-ssh-key.private_key_pem
}

output "connection_script" {
  value = templatefile("${var.host_os}-ssh-config.tpl", {
    hostname = aws_instance.modular-template-node.public_ip,
    user     = "ec2-user",
  identityfile = "~/.ssh/'${var.ssh-key-pair}'.pem" })
}