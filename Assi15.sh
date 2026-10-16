#!/bin/bash

read -p "Enter The Path : " path

if [ -L "$path" ];
then
    echo "Symbolic Link"
elif [ -d "$path" ];
then
    echo "This Is Directory"
elif [ -f "$path" ];
then
    echo "This Is File"
else
    echo "Does Not Exist"
fi
