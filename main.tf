#subindo máquinas para o cluster swarm

provider "aws"{
    version = "4.32.0"
    region = var.region
}

resource "aws_security_group" "k8s-sg" {

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }

    ingress {
        from_port = 22
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3000
        to_port = 3000 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}

resource "aws_instance" "kubernetes_worker"{
    ami = var.ami
    instance_type = var.instance_type
    count = 2
    tags = {
        Name = "k8s"
        Type = "worker"
    }
    security_groups = ["${aws_security_group.k8s-sg.name}"]
}

resource "aws_instance" "kubernetes_master"{
    ami = var.ami
    instance_type = var.instance_type
    count = 1
    tags = {
        Name = "k8s"
        Type = "master"
    }
    security_groups = ["${aws_security_group.k8s-sg.name}"]
}
