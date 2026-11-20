data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

resource "aws_security_group" "monitor_sg" {

  name        = "project3-monitor-sg"
  description = "Allow HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project3-monitor-sg"
  }
}

resource "aws_instance" "monitor_server" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.monitor_sg.id]

  user_data = file("user-data.sh")

  tags = {
    Name = "project3-monitor-server"
  }
}
