#!/bin/bash

if [ $# -eq 0 ]
then
    dir="."
else
    dir="$1"
fi

for file in "$dir"/*
do
    if [ -f "$file" ] && file "$file" | grep -q "text"
    then
        echo "$file"
    fi
done


