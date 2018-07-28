#!/bin/bash

alpha=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
encry=(11 555 333 33 3 44 55 66 8 77 88 99 777 666 9 0 1 4 22 5 7 444 2 222 6 111)

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
		echo -n ${encry[n]}
		echo -n " "
	fi
	x=`expr $x + 1`
done
echo " "
