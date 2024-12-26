resource "aws_instance" "ec2_example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_aws.id
  key_name = var.key_name
  tags = {
    Name = var.instance_name
  }
}
