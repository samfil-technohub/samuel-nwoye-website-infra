# Create Elastic IP 
resource "aws_eip" "elastic_ip" {
  tags {
    Name = "${var.project}-${var.environment}-staticip"
  }
}

# Associate Elastic IP to Server
resource "aws_eip_association" "associate_elastic_ip" {
  instance_id   = "${var.instance_id }"
  allocation_id = "${aws_eip.elastic_ip.id}"
}

