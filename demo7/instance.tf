resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.main-private-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name               = aws_key_pair.nirbhay_mykey.key_name
}

resource "aws_ebs_volume" "ebs_volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs_volume-1.id
  instance_id = aws_instance.example.id
}