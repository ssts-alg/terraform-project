output "Public_Instance_Public_IP" {
  value = aws_instance.public.*.public_ip
}


output "Instace_ID" {
  value = aws_instance.public.*.id
}


output "Private_Instance_Private_IP" {
  value = aws_instance.private.*.private_ip
}


output "Private_Instance_Private_IP" {
  value = aws_instance.private.*.private_ip
}

output "Private_Instance_Private_IP" {
  value = aws_instance.private.*.private_ip
}
