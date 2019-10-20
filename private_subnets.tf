resource "aws_subnet" "private" {
  count             = "${length(var.private_subnet_cidrs)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${var.private_subnet_cidrs[count.index]}"
  availability_zone = "${var.azs[count.index]}"

  tags = {
    Name = "${var.private_subnet_name}-${count.index + 1}"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = "${aws_vpc.myvpc.id}"
  route {
    cidr_block     = "${var.cidr}"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }

  tags = {
    Name = "${var.private_rt_name}"
  }
}


resource "aws_route_table_association" "ac1" {
  count          = "${length(var.private_subnet_cidrs)}"
  subnet_id      = "${aws_subnet.private.*.id[count.index]}"
  route_table_id = "${aws_route_table.rt1.id}"
}
