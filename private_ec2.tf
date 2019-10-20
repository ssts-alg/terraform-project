resource "aws_instance" "private" {
  ami                    = "ami-02913db388613c3e1"
  instance_type          = "t2.micro"
  count                  = 1
  subnet_id              = "${aws_subnet.private.*.id[0]}"
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = "suresh"
  tags = {
    Name = "Private_SERVER"
  }
}
