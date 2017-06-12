resource "aws_key_pair" "provisioner" {
  key_name = "terransible_provisioner"
  public_key = "${file("~/.ssh/terransible_provisioner.pub")}"
}
