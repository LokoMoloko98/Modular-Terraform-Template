output "ec2-vm-ip" {
  value = aws_instance.modular-template-node.public_ip
}

output "connection_script" {
  value = templatefile("${var.host_os}-ssh-config.tpl", {
    hostname = aws_instance.modular-template-node.public_ip,
    user     = "ec2-user",
  identityfile = "~/.ssh/'${var.ssh-key-pair}'.pem" })
}