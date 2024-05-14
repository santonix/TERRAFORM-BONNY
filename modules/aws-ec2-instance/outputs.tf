output "instance_id" {
  description = "the id of the created instane"
  value       = aws_instance.example_instance.id
}

output "public_ip" {
  description = "the  public ip address of the ec2 instance"
  value       = aws_instance.example_instance.public_ip
}
