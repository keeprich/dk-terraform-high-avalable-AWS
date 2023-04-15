#Using the data source to pull all avalability zone to use
data "aws_availability_zones" "all" {
  all_availability_zones = true
}

#Now you can create the ASG itself using the aws_autoscaling_group resource:
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  # availability_zones   = ["${data.aws_availability_zones.all.names[]}"]
  availability_zones = data.aws_availability_zones.all.group_names
  load_balancers    = ["${aws_elb.example.name}"]
  health_check_type = "ELB"
  
  #How does the ELB know which EC2 Instances to send requests to? You can attach a
  # static list of EC2 Instances to an ELB using the ELB’s instances parameter, but with
  # an ASG, Instances may launch or terminate at any time, so a static list won’t work.
  # Instead, you can go back to the aws_autoscaling_group resource and set its
  # load_balancers parameter to tell the ASG to register each Instance in the ELB when
  #that instance is booting

  min_size = 2
  max_size = 10
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}