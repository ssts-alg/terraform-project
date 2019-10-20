resource "aws_key_pair" "key" {
  key_name   = "suresh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAxMoyFTpTENLqxOGztLMv3ehFe9DWX/WAUed4pSUXapTgVVHu4GrQO8mnioHw+/+XQRc+HaqMJqZIWhm9cSwX9TuTFl3WfoAtFkLUkGgHei4jjYdmOQk4nPdjbOv147r2WWL8PjE6XZrbQLfocqQYxzz5eL6OJ57CEeK7arRpeSHnsuUpdEg6MhwdHdjX3YQdRejlF32lUmUt3+0wBN8ISOnWK067V5LMN+LpvOzHu7kcUvyLRsRvlbhXjAw1M2rZM6bYP/fDGsasaH27XIk5jVr6J/V96wf3ARcvYilo9xgvt/GIMNrKls+pYAIMGuLm58bgK08Uva8xVjEBWGF98hClqW5pqWxnFohK3KQ9DPGdvHKSL8dlUaJoiRiQ8Wt0ev/XozWHKOTLWVTc6RmWCSmIfndpjQF5ypOgEyVXoc2J+7xt3uNKppsvpquy5QjaO7sYnk/uJCwGmJI90qQxWZ8cCYFBP46Q4aK+135NqH9BabZ1u3CGhLokG6Cj25E= User@DESKTOP-R8UM0U4"
}



resource "aws_instance" "public" {
  ami                         = "ami-02913db388613c3e1"
  instance_type               = "t2.micro"
  count                       = 1
  subnet_id                   = "${aws_subnet.public.*.id[0]}"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "suresh"
  tags = {
    Name = "Public_SERVER"
  }
}
