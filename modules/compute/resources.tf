### Collect Existing Resources Data ###
# Get Samuel Nwoye Website Golden Image
data "aws_ami" "server_ami" {
  
  filter {
    name   = "name"
    values = ["${var.ami_name}-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  most_recent = true
  owners      = ["self"]
  tags = {
    Name   = "${var.ami_name}-${var.ami_tag}"
  }
}

### Create Server Resources ###
# Create the Server Key
resource "aws_key_pair" "server_key" {
  key_name   = "${var.project}-${var.environment}-server-key"
  public_key = "${var.public_key_path}"
}

# Create the Server Machine
resource "aws_instance" "server" {
  ami                    = "${data.aws_ami.server_ami.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.server_key.key_name}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  monitoring             = "${var.monitoring_enabled}"

  root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "${var.volume_type}"
    delete_on_termination = "${var.delete_volume_on_termination_enabled}"
  }

  lifecycle { 
    create_before_destroy = true
  }

  tags {
    Name        = "${var.project}-${var.environment}-server"
  }
}