resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidir}"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidir}"

  tags = {
    Name = "${var.vpc_name}"
  }
}
