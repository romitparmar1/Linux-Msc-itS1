#!/bin/bash

read -p "Enter Directory: " dir

if [ -d "$dir" ]; then
    date=$(date +"%Y%m%d_%H%M%S")
    tar -czf "backup_$date.tar.gz" "$dir"
    echo "Backup Created Successfully"
else
    echo "Directory Not Found"
fi

