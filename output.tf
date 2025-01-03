output "instance_ips" {
  value = [
    aws_instance.example_us_east_1.public_ip,
    aws_instance.example_us_west_1.public_ip
  ]
}
