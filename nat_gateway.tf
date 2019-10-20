resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "${var.eip_name}"
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id     = "${aws_subnet.public.*.id[1]}"
  tags = {
    Name = "${var.nat_name}"
  }
}
