resource "aws_route_table" "public_route_table_a" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.public_subnet_a["name"]}-rt"
  }
}

resource "aws_route_table" "public_route_table_c" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.public_subnet_c["name"]}-rt"
  }
}

resource "aws_route_table_association" "public_table_association_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table_a.id
}

resource "aws_route_table_association" "public_table_association_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public_route_table_c.id
}

resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.private_subnet_a["name"]}-rt"
  }
}

resource "aws_route_table" "private_route_table_c" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.private_subnet_c["name"]}-rt"
  }
}

resource "aws_route_table_association" "private_table_association_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_route_table_association" "private_table_association_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private_route_table_c.id
}
