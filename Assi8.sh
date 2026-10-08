#!/bin/bash


output="store.txt"
> "$output"

for file in "$@";
do
    if [ -f "$file" ]; then
        echo "*** filename:$file ***" >> "$output"
        cat "$file" >> "$output"
        echo >> "$output"
    else
        echo "Warning: '$file' is not a regular file, skipping." >&2
    fi
done
echo "$output"

