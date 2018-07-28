#!/bin/bash

alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

function char () {
	c=" "
	c=${alpha[$1]}
}

function num () {
	n=0
	for i in {0..25}
	do
		if [ $1 == ${alpha[$i]} ]
		then
			n=$i
		fi
	done
}

echo -n "enter your message: "
read msg
echo -n "enter amount of shift: "
read shift
echo -n "your encrypted message: "

len=${#msg}
x=0

while [ $x -lt $len ]
do
	if [ ! ${msg:x:1} == " " ]
	then
		num ${msg:x:1}
		n=$((($n + shift) % 26))
		char $n
		echo -n $c
	else
		echo -n " "
	fi
	x=`expr $x + 1`
done
echo " "
