resource "aws_instance" "this" {

  tags = {
    Name = var.ec2_name
  }

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file(var.user_data)

  vpc_security_group_ids = [aws_security_group.this.id, ]

  iam_instance_profile = aws_iam_instance_profile.this.name

  subnet_id = var.subnet_id

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
  }

  volume_tags = {
    Name = "${var.ec2_name}-vol"
  }

  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

}