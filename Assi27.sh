#!/bin/bash

limit=80

usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -gt "$limit" ]
then
    echo "Alert! Disk usage is too high: $usage%"
else
    echo "Disk usage is normal: $usage%"
fi
