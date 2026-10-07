output "instance_publicip" {
  value = aws_instance.name.public_ip
  description = "The public IP address of EC2 instance"
}

output "instance_privateip" {
  value = aws_instance.name.private_ip
  description = "The private IP address of EC2 instance"
}

output "instance_id" {
  value = aws_instance.name.id
  description = "The ID of EC2 instance"
}