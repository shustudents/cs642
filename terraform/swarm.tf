resource "aws_launch_configuration" "swarm" {
  name_prefix   = "swarm_config"
  image_id      = "ami-618fab04"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.provisioner.key_name}"
#  iam_instance_profile = "updatedns"
  security_groups = ["${aws_security_group.access.name}","default"]
  user_data = "${file("swarm.tpl")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "swarm_scale" {
  name                 = "swarm_config"
  launch_configuration = "${aws_launch_configuration.swarm.name}"
  min_size             = 2
  max_size             = 2
  availability_zones   = ["us-east-2a","us-east-2b"]

  tag {
    key                 = "Name"
    value               = "swarm"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
