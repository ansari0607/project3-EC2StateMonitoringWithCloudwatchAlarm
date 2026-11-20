#!/bin/bash

yum update -y

yum install -y httpd stress

systemctl start httpd
systemctl enable httpd

echo "<h1>Project 3 CloudWatch Monitoring</h1>" > /var/www/html/index.html

# Wait for instance startup
sleep 120

# Generate high CPU load for 15 minutes
stress --cpu 2 --timeout 900 &
