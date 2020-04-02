provider "aws" {
    region = "${var.region}"
}

resource "aws_instance" "MyTerraform" {
    ami = "ami-0a313d6098716f372"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
    key_name = "terraform"
    tags = {
        Name = "Hello World"
    }
}

resource "aws_security_group" "webserver_sg" {
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["18.217.147.82/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
output "public_id" {
  value = "${aws_instance.hello World.public.ip}"
}