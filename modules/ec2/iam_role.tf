resource "aws_iam_role" "this" {
  name               = "${var.ec2_name}-role"
  assume_role_policy = file(var.ec2_trust_policy)
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.this.id
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.ec2_name}-prof"
  role = aws_iam_role.this.name
}