#!/bin/sh
yum update -y
amazon-linux-extras install epel -y
yum install gcc jemalloc-devel openssl-devel tcl tcl-devel -y
cd /home/ec2-user
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make BUILD_TLS=yes