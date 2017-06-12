resource "aws_launch_configuration" "consul" {
  name_prefix   = "consul_config"
  image_id      = "ami-618fab04"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.provisioner.key_name}"
#  iam_instance_profile = "updatedns"
  security_groups = ["${aws_security_group.access.name}","default"]
  user_data = "${file("consul.tpl")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "consul_scale" {
  name                 = "consul_config"
  launch_configuration = "${aws_launch_configuration.consul.name}"
  min_size             = 1
  max_size             = 1
  availability_zones   = ["us-east-2a"]

  tag {
    key                 = "Name"
    value               = "consul"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
