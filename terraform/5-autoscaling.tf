## Criar um Grupo de Auto Scaling
resource "aws_autoscaling_group" "main" {
  name_prefix = format("%s-autoscaling-group", var.project_name)
  vpc_zone_identifier = [
    aws_subnet.private-1a.id,
    aws_subnet.private-1b.id,
    aws_subnet.private-1c.id
  ]

  desired_capacity = 2
  max_size         = 5
  min_size         = 1

  launch_template {
    id      = aws_launch_template.main.id
    version = aws_launch_template.main.latest_version
  }
  tag {
    key                 = "Name"
    value               = format("%s-autoscaling-group", var.project_name)
    propagate_at_launch = true
  }
}


## Criar uma Politica de Auto Scaling
resource "aws_autoscaling_policy" "avg_cpu_scaling" {
  name                   = "avg_cpu_scaling"
  autoscaling_group_name = aws_autoscaling_group.main.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 20.0
  }
  estimated_instance_warmup = 180
}
