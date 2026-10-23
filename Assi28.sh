#!/bin/bash

read -p "Enter hostname or IP address: " host

if ping -c 4 "$host" > /dev/null 2>&1
then
    echo "Network is Connected"
else
    echo "Network is Not Connected"
fi
