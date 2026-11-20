variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "instance_type" {
  description = "EC2 Type"
  type        = string
}

variable "alarm_threshold" {
  description = "CPU threshold"
  type        = number
}
