#!/bin/bash

echo "Linux Services Status"
echo "====================="

for service in ssh cron NetworkManager ufw
do
    if systemctl is-active --quiet "$service"
    then
        echo "$service : Active"
    else
        echo "$service : Inactive"
    fi
done
