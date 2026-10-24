#!/bin/bash

echo "Linux Distribution:"
cat /etc/os-release | grep PRETTY_NAME

echo "Linux Kernel Version:"
uname -r

echo "Linux Hostname:"
hostname

echo "CPU Architecture:"
uname -m

echo "Memory Information:"
free -h

echo "System Uptime:"
uptime -p
