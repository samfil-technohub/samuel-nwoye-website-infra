# Create the Server Security Group
resource "aws_security_group" "server_sg" {
  name        = "${var.project}-${var.environment}-server-sg"
  description = "The Server Security Group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port       = "${var.http_port}"
    to_port         = "${var.http_port}"
    protocol        = "tcp"
    cidr_blocks = ["${var.any_ip}"]
  }

  ingress {
    from_port   = "${var.ssh_port}"
    to_port     = "${var.ssh_port}"
    protocol    = "tcp"
    cidr_blocks = ["${var.ssh_cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.any_ip}"]
  }

  tags {
    Name  = "${var.project}-${var.environment}-server-sg"
  }
}