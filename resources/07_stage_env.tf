# the security group
module "staging_server_sg" {
  source = "../modules/firewall"
  environment = "staging"
  project = "${var.project}"
  ssh_cidr_block = "197.210.28.0/23" #"${var.any_ip}"
  vpc_id = "${data.aws_vpc.aws_default_vpc.id}"
}

# the server
module "staging_server" {
  source = "../modules/compute"
  ami = "${data.aws_ami.server_ami.id}"
  delete_volume_on_termination_enabled = true
  environment = "staging"
  instance_type = "t2.micro"
  project = "${var.project}"
  public_key_path = "${file("~/.ssh/server_key.pub")}"
  monitoring_enabled = true
  volume_size = 8
  volume_type = "gp2"
  vpc_security_group_ids = ["${module.staging_server_sg.id}"] 
}

# monitoring and recoverying the server
module "monitor_staging_server" {
  source = "../modules/monitoring"
  environment = "staging"
  instance_id = "${module.staging_server.instance_id}"
  project = "${var.project}"
  region = "${var.region}"
}