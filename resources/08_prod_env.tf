# the security group
module "prod_server_sg" {
  source = "../modules/firewall"
  environment = "prod"
  project = "${var.project}"
  ssh_cidr_block = "${var.no_ip}"
  vpc_id = "${data.aws_vpc.aws_default_vpc.id}"
}

# the server
module "prod_server" {
  source = "../modules/compute"
  ami = "${data.aws_ami.server_ami.id}"
  delete_volume_on_termination_enabled = true
  environment = "prod"
  instance_type = "t2.micro"
  project = "${var.project}"
  public_key_path = "${file("~/.ssh/server_key.pub")}"
  monitoring_enabled = true
  volume_size = 8
  volume_type = "gp2"
  vpc_security_group_ids = ["${module.prod_server_sg.id}"] 
}

# attach an elastic ip to the server
module "prod_server_static_ip" {
  source = "../modules/elasticip"
  environment = "prod"
  instance_id = "${module.prod_server.instance_id}"
  project = "${var.project}" 
}

# monitoring and recoverying the server
module "monitor_prod_server" {
  source = "../modules/monitoring"
  environment = "staging"
  instance_id = "${module.prod_server.instance_id}"
  project = "${var.project}"
  region = "${var.region}"
}