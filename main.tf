resource "aws_instance" "ec2" {
    ami = "ami-0521cb2d60cfbb1a6"
    instance_type = "t3.micro"

    security_groups = [aws_security_group.inline_sg.id]

    tags = {
        Name = "terraform-demo-1"
        Project = "Roboshop"
        Environment = "dev"
    }
}

resource "aws_security_group" "inline_sg" {
    name        = "roboshop-sg"
    description = "Managed entirely inline"
    #vpc_id      = "vpc-0123456789abcdef0"

    ingress {
        description = "Allow HTTPS"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}