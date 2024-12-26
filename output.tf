output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_example.id
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2_example.public_ip
}

output "subnet_id" {
  value = aws_subnet.subnet_aws.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}