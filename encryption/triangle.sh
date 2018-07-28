#!/bin/bash

alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
tri=(001 002 010 011 012 020 021 022 100 101 102 110 111 112 120 121 122 200 201 202 210 211 212 220 221 222)

function char () {
	c=" "
	c=${tri[$1]}
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
echo -n "your encrypted message: "

len=${#msg}
x=0

while [ $x -lt $len ]
do
	if [ ! ${msg:x:1} == " " ]
	then
		num ${msg:x:1}
		char $n
		echo -n $c
		echo -n " "
	fi
	x=`expr $x + 1`
done
echo " "
