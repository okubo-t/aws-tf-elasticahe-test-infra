output "instance_id" {
  value = aws_instance.this.id
}

output "instance_eip" {
  value = aws_eip.this.public_ip
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.this.name
}

output "security_group_id" {
  value = aws_security_group.this.id
}

