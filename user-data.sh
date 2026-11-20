#!/bin/bash

yum update -y

yum install -y httpd stress

systemctl start httpd
systemctl enable httpd

echo "<h1>Project 3 CloudWatch Monitoring</h1>" > /var/www/html/index.html

sleep 180

for i in {1..4}
do
  yes > /dev/null &
done

sleep 900

pkill yes
