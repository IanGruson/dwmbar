#!/bin/bash

#Set the delimiter character 
delimiter="|"

status() { \
	#get the date 
	date | tr 'CEST' ' ' | tr '\t*' ' '
	echo $delimiter

	#get the volume of the sound
	echo ♫ && echo $(amixer get Master | grep -o "[0-9]*%") 
	echo $delimiter

	#get the battery level percentage
	upower -i $(upower -e | grep 'BAT') | grep 'percentage' | tr '\t*' ' '
	echo $delimiter 
}

while :; do 
	xsetroot -name "$(status | tr '\n' ' ')"
	sleep 1m
done

