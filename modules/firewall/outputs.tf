# The Security Group ID
output "id" {
  value = "${aws_security_group.server_sg.id}"
}