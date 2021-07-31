resource "aws_security_group" "this" {
  name        = "${var.ec2_name}-sg"
  description = "Security Group for EC2"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.ec2_name}-sg"
  }

  ## Rule
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      var.remote_ip,
    ]

  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}