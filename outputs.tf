output "first_instance_public_ip" {
  value = aws_instance.first_instance.public_ip
}

output "second_instance_public_ip" {
  value = aws_instance.second_instance.public_ip
}
