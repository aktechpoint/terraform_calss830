output "vpc_id" {
  value = aws_vpc.vpctest.id
  sensitive = true
}
# output "aws_dns_name" {
#   value = aws_vpc.vpctest.dns_name
# }

output "aws_instance_bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.testing_db.endpoint
}

# output "db_name" {
#   value = aws_db_instance.testing_db.name
# }