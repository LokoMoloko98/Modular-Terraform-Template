output "ec2-vm-ip" {
  value = aws_instance.modular-template-node.public_ip
}
