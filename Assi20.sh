#!/bin/bash

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: " $2 "%, System: " $4 "%, Idle: " $8 "%"}'

echo "Memory Usage:"
free -h

echo "Directory Usage:"
df -h

echo "System Uptime:"
uptime -p

echo "Login User:"
who

echo "Running Processes:"
ps aux
