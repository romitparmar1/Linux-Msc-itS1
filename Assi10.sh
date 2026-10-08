#!/bin/bash

for ext in txt jpg sh
do
    count=$(ls *.$ext 2>/dev/null | wc -l)
    echo "$ext = $count"
done
