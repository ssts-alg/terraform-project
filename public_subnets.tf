resource "aws_subnet" "public" {
  count             = "${length(var.public_subnet_cidrs)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${var.public_subnet_cidrs[count.index]}"
  availability_zone = "${var.azs[count.index]}"

  tags = {
    Name = "${var.pubic_subnet_name}-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "${var.igw_name}"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "${var.cidr}"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.public_rt_name}"
  }
}


resource "aws_route_table_association" "ac" {
  count          = "${length(var.public_subnet_cidrs)}"
  subnet_id      = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_route_table.rt.id}"
}
