#!/bin/bash

read -p "Enter The Number = " num

sum=0 

for ((i=1;i<=$num;i++))
do
	sum=$((sum+i))
done

echo "Sum Of N Number Is : $sum "
 
