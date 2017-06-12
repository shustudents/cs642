resource "aws_security_group" "access" {
  name        = "access"
  description = "Allow ssh inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["204.148.20.206/32"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["204.148.20.206/32"]
  }
  tags {
    Name = "access"
  }
}
