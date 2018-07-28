#!/bin/bash

echo -n "enter your message: "
read msg
echo -n "your encrypted message: "

msg=${msg//" "/""}

len=${#msg}
x=0

while [ $x -lt $len ]
do
	first=$first${msg:x:1}
	x=`expr $x + 1`

	if [ $x -lt $len ]
	then
		second=$second${msg:x:1}
	fi
	x=`expr $x + 1`
done

echo $first$second
