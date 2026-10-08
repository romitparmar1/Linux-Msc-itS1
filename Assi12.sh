#!/bin/bash

dir=$1

find "$dir" -type f \( -name "*.obj" -o -name "*.lst" -o -size 0 \) -delete
