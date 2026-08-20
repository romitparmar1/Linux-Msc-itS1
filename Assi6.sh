#!/bin/bash

date 

	echo "Date Is ......................................: $(date '+%d-%m-%y')"
	echo "Date Is ......................................: $(date '+%m/%d/%y')"
	echo "Time Is ......................................: $(date '+%I-%M-%S')"
	echo "Time Is ......................................: $(date '+%I:%M:%S')"
	echo "No. of days elapsed in this year is : $(date '+%j')"
	echo "Serial no. of day(of week) is ......: $(date '+%W')"
	echo "Day and Date is ....................: $(date '+%a %h %d,%Y')"
	echo "Time in the from AM/PM..............: $(date '+%I:%M:%S %p')"

hours="$(date +%H)"

if [ $hours -ge 5 ] && [ $hours -le 12 ];
then
	echo "Good Morning"

elif [ $hours -ge 13 ] && [ $hours -le 20 ];
then
	echo "Good AfterNoon"

elif [ $hours -ge 17 ] && [ $hours -le 22 ];
then
	echo "Good Evening"

else
	echo "Good Night"
fi
