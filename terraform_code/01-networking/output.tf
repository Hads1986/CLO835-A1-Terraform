output "subnet_id" {
  value = aws_subnet.public_SN1.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}