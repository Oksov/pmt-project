output "ec2_public_ip" {
    value = aws_instance.nodejs_ec2[*].public_ip
}

output "ec2_tags" {
    value = aws_instance.nodejs_ec2[*].tags_all
}
