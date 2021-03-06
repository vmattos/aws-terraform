module "dockerhub" {
    source = "../modules/dockerhub"

    image_type = "t2.micro"
    cluster_desired_capacity = 1
    root_volume_size =  8
    docker_volume_size =  12
    keypair = "dockerhub"
    allow_ssh_cidr="0.0.0.0/0"

    # aws
    aws_account_id="${var.aws_account.id}"
    aws_region = "us-west-2"
    ami = "${lookup(var.amis, "us-west-2")}"

    # vpc
    vpc_id = "${module.vpc.vpc_id}"
    vpc_cidr = "${module.vpc.vpc_cidr}"
    dockerhub_subnet_a_id = "${module.vpc.admiral_subnet_a_id}"
    dockerhub_subnet_b_id = "${module.vpc.admiral_subnet_b_id}"
    dockerhub_subnet_c_id = "${module.vpc.admiral_subnet_c_id}"
    dockerhub_subnet_az_a = "${module.vpc.admiral_subnet_az_a}"
    dockerhub_subnet_az_b = "${module.vpc.admiral_subnet_az_b}"
    dockerhub_subnet_az_c = "${module.vpc.admiral_subnet_az_c}"
}