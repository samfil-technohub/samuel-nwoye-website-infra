# Monitor the Server with Cloud Watch for Failure
resource "aws_cloudwatch_metric_alarm" "server_recovery" {
  alarm_name          = "${var.project}-${var.environment}-server-recovery"    
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Minimum"
  threshold           = "1.0"
  alarm_description   = "Server Recovery"
  alarm_actions       = ["arn:aws:automate:${var.region}:ec2:recover"]
  dimensions {
    InstanceId = "${var.instance_id}"
  }
}
