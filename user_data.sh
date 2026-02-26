#!/bin/bash

sudo su
yum update -y
yum install docker -y
service docker start
usermed -a -G docker ec2-user

docker run -d -p 80:80 --name webserver nginx