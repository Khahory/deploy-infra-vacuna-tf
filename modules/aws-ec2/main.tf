# Create a new EC2 instance
resource "aws_instance" "this" {
  ami                         = local.ami
  instance_type               = local.instance_type
  subnet_id                   = "subnet-xxxxxxxxxxxxx"
  vpc_security_group_ids      = [aws_security_group.this.id]
  key_name                    = local.key_name
  associate_public_ip_address = true
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    tags = merge(var.tags, local.tags_ec2)
  }

  tags = merge(var.tags, local.tags_ec2)
}

# Create a new security group
resource "aws_security_group" "this" {
  name        = local.tags_sg.Name
  description = "Allow inbound traffic on port 22"

  vpc_id = "vpc-xxxxxxxxxxxxx"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  ingress {
    from_port   = 21
    to_port     = 21
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, local.tags_sg)
}
