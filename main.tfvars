variable "region" {
    description = "define a região da instância"
    default = "us-east-1"
}

variable "name" {
    description = "nome da aplicação"
    default = "server01"
}

variable "env" {
    description = "ambiente da aplicação"
    default = "prod"
}

variable "instance_type" {
    description = "AWS Instance type define configuração de hardware"
    default = "t2.micro"
}

variable "ami" {
    description = "imagem"
    default = "ami-08c40ec9ead489470"
}

variable "src" {
    description = "repo da aplicação"
    default = "github.com/tainagotgithub/NODEJS"
}
