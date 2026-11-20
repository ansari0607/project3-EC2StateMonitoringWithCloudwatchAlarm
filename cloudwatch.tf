resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {

  alarm_name          = "HighCPUUsage"
  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 60

  statistic = "Average"

  threshold = var.alarm_threshold

  alarm_description = "Alarm when CPU exceeds threshold"

  dimensions = {
    InstanceId = aws_instance.monitor_server.id
  }

  tags = {
    Name = "HighCPUUsage"
  }
}
