output "ec2-vm-ip" {
  value = aws_instance.modular-template-node.public_ip
}

output "private_key" {
  value     = tls_private_key.modular-template-ssh-key.private_key_pem
  sensitive = true
}