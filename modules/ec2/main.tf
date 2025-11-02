# -------------------------------
# Security Group
# -------------------------------
resource "aws_security_group" "ec2_sg" {
  name        = "${var.env}-ec2-sg"
  description = "Allow EC2 inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.env}-ec2-sg" })
}

# -------------------------------
# Key Pair Creation
# -------------------------------
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.env}-keypair"
  public_key = tls_private_key.ec2_key.public_key_openssh

  tags = merge(var.tags, { Name = "${var.env}-keypair" })
}


# Save private key locally (DO NOT COMMIT)
resource "local_file" "private_key_pem" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/${var.env}-key.pem"
}

# -------------------------------
# EC2 Instance
# -------------------------------
resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = element(var.subnet_ids, 0)
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.env}-ec2" })
}

